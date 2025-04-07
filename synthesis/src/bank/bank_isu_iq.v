module bank_isu_iq #(
  parameter PTR_WIDTH = 6
)(
  input  wire       clk_i,
  input  wire       rst_i,
  input  wire       req_valid_i,
  output wire       req_allowIn_o,
  input  wire       req_cacheline_inflight_i,
  input  wire       req_need_linefill_i,
  input  wire [2:0] req_rob_id_i,
  input  wire [1:0] req_ch_id_i,
  input  wire [1:0] req_opcode_i,
  input  wire [6:0] req_set_way_offset_i,
  input  wire [7:0] req_wbuffer_id_i,
  input  wire [1:0] req_cacheline_offset0_state_i,
  input  wire [1:0] req_cacheline_offset1_state_i,
  input  wire       biu_isu_rvalid_i,
  input  wire [5:0] biu_isu_rid_i
);

  parameter DEPTH = 1 << PTR_WIDTH;

  reg  [PTR_WIDTH:0]   queue_size_Q;
  wire                 readPtr_kickoff;
  wire [PTR_WIDTH-1:0] readPtr_In;
  reg  [PTR_WIDTH-1:0] readPtr_Q;
  wire                 writePtr_kickoff;
  wire [PTR_WIDTH-1:0] writePtr_In;
  reg  [PTR_WIDTH-1:0] writePtr_Q;

  reg  [DEPTH-1:0]    valid_array_In;
  reg  [DEPTH-1:0]    valid_array_Q;
  reg  [2:0]          rob_id_array_In          [DEPTH-1:0];
  reg  [2:0]          rob_id_array_Q           [DEPTH-1:0];
  reg  [1:0]          ch_id_array_In           [DEPTH-1:0];
  reg  [1:0]          ch_id_array_Q            [DEPTH-1:0];
  reg                 opcode0_array_In         [DEPTH-1:0];
  reg                 opcode0_array_Q          [DEPTH-1:0];
  reg                 opcode1_array_In         [DEPTH-1:0];
  reg                 opcode1_array_Q          [DEPTH-1:0];
  reg [6:0]           set_way_offset_array_In  [DEPTH-1:0];
  reg [6:0]           set_way_offset_array_Q   [DEPTH-1:0];
  reg [6:0]           wbuffer_id_array_In      [DEPTH-1:0];
  reg [6:0]           wbuffer_id_array_Q       [DEPTH-1:0];
  reg [3:0]           cacheline_state_array_In [DEPTH-1:0];
  reg [3:0]           cacheline_state_array_Q  [DEPTH-1:0];

  reg [DEPTH-1:0]     mshr_allow_array_validate;
  reg [DEPTH-1:0]     mshr_allow_array_In;
  reg [DEPTH-1:0]     mshr_allow_array_Q;
  reg [DEPTH-1:0]     credit_allow_array_In;
  reg [DEPTH-1:0]     credit_allow_array_Q;


  reg  [PTR_WIDTH-1:0]  bottom_ptr_In;
  reg  [PTR_WIDTH-1:0]  bottom_ptr_Q;
  wire [PTR_WIDTH-1:0]  select_ptr;
  wire [DEPTH-1:0]      execute_array;


  assign req_allowIn_o = queue_size_Q[PTR_WIDTH:0] != DEPTH[PTR_WIDTH:0];

  assign writePtr_kickoff = req_valid_i & req_allowIn_o;

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      queue_size_Q[PTR_WIDTH:0] <= 'd0;
    end
    else if (writePtr_kickoff) begin
      queue_size_Q[PTR_WIDTH:0] <= queue_size_Q[PTR_WIDTH-1:0] + 'd1;
    end
  end

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      writePtr_Q[PTR_WIDTH-1:0] <= 'd0;
    end
    else if (writePtr_kickoff) begin
      writePtr_Q[PTR_WIDTH-1:0] <= writePtr_Q[PTR_WIDTH-1:0] + 'd1;
    end
  end

//--------------------------------------------------------------
//                    issue queue enqueue
//--------------------------------------------------------------

  assign readPtr_kickoff = |valid_array_Q[DEPTH-1:0];

  always @(*) begin
    valid_array_In = valid_array_Q;
    if (writePtr_kickoff) begin
      valid_array_In[writePtr_Q] = 1'b1;
    end
    if (readPtr_kickoff) begin
      valid_array_In[select_ptr] = 1'b0;
    end
  end

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      valid_array_Q <= 'b0;
    end
    else begin
      valid_array_Q <= valid_array_In;
    end
  end

  always @(*) begin
    // default value
    rob_id_array_In                      = rob_id_array_Q;
    ch_id_array_In                       = ch_id_array_Q;
    opcode0_array_In                     = opcode0_array_Q;
    set_way_offset_array_In              = set_way_offset_array_Q;
    wbuffer_id_array_In                  = wbuffer_id_array_Q;
    cacheline_state_array_In             = cacheline_state_array_Q;
    // update value
    rob_id_array_In[writePtr_Q]          = req_rob_id_i;
    ch_id_array_In[writePtr_Q]           = req_ch_id_i;
    opcode0_array_In[writePtr_Q]         = req_opcode_i[0];
    set_way_offset_array_In[writePtr_Q]  = req_set_way_offset_i;
    wbuffer_id_array_In[writePtr_Q]      = req_wbuffer_id_i;
    cacheline_state_array_In[writePtr_Q] = {req_cacheline_offset1_state_i[1:0],
                                            req_cacheline_offset0_state_i[1:0]};
  end

  always @(posedge clk_i) begin
    if (writePtr_kickoff) begin // update array when write
      rob_id_array_Q          <= rob_id_array_In;
      ch_id_array_Q           <= ch_id_array_In;
      opcode0_array_Q         <= opcode0_array_In;
      set_way_offset_array_Q  <= set_way_offset_array_In;
      wbuffer_id_array_Q      <= wbuffer_id_array_In;
      cacheline_state_array_Q <= cacheline_state_array_In;
    end
  end

//--------------------------------------------------------------
//                    MSHR allow array
//--------------------------------------------------------------

  genvar i;

  generate
    for (i = 0; i < DEPTH; i++) begin
      assign mshr_allow_array_validate[i] = valid_array_Q[i] & (set_way_offset_array_Q[i][6:1] == biu_isu_rid_i[5:0]) & biu_isu_rvalid_i;
    end
  endgenerate


  always @(*) begin
    // set mshr allow array valid when receive linefill data
    mshr_allow_array_In[DEPTH-1:0] = mshr_allow_array_Q[DEPTH-1:0] | mshr_allow_array_validate[DEPTH-1:0];
    if (writePtr_kickoff) begin
      // set mshr allow array invalid when:
      // 1. cacheline miss
      // 2. cacheline hit but inflight
      mshr_allow_array_In[writePtr_Q] = ~(req_need_linefill_i | req_cacheline_inflight_i);
    end
  end

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      mshr_allow_array_Q[DEPTH-1:0] <= 'd0;
    end
    else begin
      mshr_allow_array_Q[DEPTH-1:0] <= mshr_allow_array_In[DEPTH-1:0];
    end
  end

//--------------------------------------------------------------
//                     Dequeue
//--------------------------------------------------------------

  always @(posedge clk_i or rst_i) begin
    if (rst_i) begin
      bottom_ptr_Q[PTR_WIDTH-1:0] <= 'd0;
    end
  end

  assign execute_array[DEPTH-1:0] = mshr_allow_array_Q[DEPTH-1:0] & valid_array_Q[DEPTH-1:0];

  shift_priority_arb
  u_shift_priority_arb(
    .valid_array_i(execute_array[DEPTH-1:0]),
    .bottom_ptr_i(bottom_ptr_Q[PTR_WIDTH-1:0]),
    .select_ptr_o(select_ptr[PTR_WIDTH-1:0])
  );


endmodule