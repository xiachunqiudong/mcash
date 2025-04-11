module bank_isu_iq #(
  parameter PTR_WIDTH = 6
)(
  input  wire         clk_i,
  input  wire         rst_i,
  input  wire         req_valid_i,
  output wire         req_allowIn_o,
  input  wire         req_cacheline_inflight_i,
  input  wire         req_need_linefill_i,
  input  wire [2:0]   req_rob_id_i,
  input  wire [1:0]   req_ch_id_i,
  input  wire [1:0]   req_opcode_i,
  input  wire [6:0]   req_set_way_offset_i,
  input  wire [7:0]   req_wbuffer_id_i,
  input  wire [1:0]   req_cacheline_offset0_state_i,
  input  wire [1:0]   req_cacheline_offset1_state_i,
  input  wire         biu_isu_rvalid_i,
  input  wire [5:0]   biu_isu_rid_i,
  output wire [5:0]   iq_linefill_buffer_raddr_o,
  input  wire [255:0] linefill_buffer_data_i,
  output wire         iq_sc_valid_o,
  input  wire         iq_sc_ready_i,
  output wire [1:0]   iq_sc_channel_id_o,
  output wire [2:0]   iq_sc_opcode_o,
  output wire [6:0]   iq_sc_set_way_offset_o,
  output wire [7:0]   iq_sc_wbuffer_id_o,
  output wire [2:0]   iq_sc_xbar_rob_num_o,
  output wire [1:0]   iq_sc_cacheline_state_offset0_o,
  output wire [1:0]   iq_sc_cacheline_state_offset1_o,
  output wire [127:0] iq_sc_linefill_data_offset0_o,
  output wire [127:0] iq_sc_linefill_data_offset1_o
);

  parameter DEPTH = 1 << PTR_WIDTH;

  reg  [PTR_WIDTH:0]   queue_size_Q;
  wire                 issue_kickoff;
  wire [PTR_WIDTH-1:0] readPtr_In;
  reg  [PTR_WIDTH-1:0] readPtr_Q;
  wire                 writePtr_kickoff;
  wire [PTR_WIDTH-1:0] writePtr_In;
  reg  [PTR_WIDTH-1:0] writePtr_Q;
  reg  [DEPTH-1:0]     valid_array_In;
  reg  [DEPTH-1:0]     valid_array_Q;
  reg  [2:0]           rob_id_array_In          [DEPTH-1:0];
  reg  [2:0]           rob_id_array_Q           [DEPTH-1:0];
  reg  [1:0]           ch_id_array_In           [DEPTH-1:0];
  reg  [1:0]           ch_id_array_Q            [DEPTH-1:0];
  reg                  iq_op_is_write_array_In  [DEPTH-1:0];
  reg                  iq_op_is_write_array_Q   [DEPTH-1:0];
  reg                  iq_need_evit_array_In    [DEPTH-1:0];
  reg                  iq_need_evit_array_Q     [DEPTH-1:0];
  reg                  iq_need_linefill_array_In[DEPTH-1:0];
  reg                  iq_need_linefill_array_Q [DEPTH-1:0];
  reg [6:0]            set_way_offset_array_In  [DEPTH-1:0];
  reg [6:0]            set_way_offset_array_Q   [DEPTH-1:0];
  reg [6:0]            wbuffer_id_array_In      [DEPTH-1:0];
  reg [6:0]            wbuffer_id_array_Q       [DEPTH-1:0];
  reg [3:0]            cacheline_state_array_In [DEPTH-1:0];
  reg [3:0]            cacheline_state_array_Q  [DEPTH-1:0];
  reg [DEPTH-1:0]      mshr_allow_array_validate;
  reg [DEPTH-1:0]      mshr_allow_array_In;
  reg [DEPTH-1:0]      mshr_allow_array_Q;
  reg [DEPTH-1:0]      credit_allow_array_In;
  reg [DEPTH-1:0]      credit_allow_array_Q;
  wire [DEPTH-1:0]     execute_array;
  reg  [PTR_WIDTH-1:0] bottom_ptr_In;
  reg  [PTR_WIDTH-1:0] bottom_ptr_Q;
  wire [PTR_WIDTH-1:0] select_ptr;
  wire                 select_need_linefill;
  wire                 select_need_evit;
  wire                 select_is_write;


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
//                    iq valid array
//--------------------------------------------------------------
  assign issue_kickoff = iq_sc_valid_o & iq_sc_ready_i;

  always @(*) begin
    valid_array_In = valid_array_Q;
    if (writePtr_kickoff) begin
      valid_array_In[writePtr_Q] = 1'b1;
    end
    if (issue_kickoff) begin
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
    set_way_offset_array_In              = set_way_offset_array_Q;
    wbuffer_id_array_In                  = wbuffer_id_array_Q;
    cacheline_state_array_In             = cacheline_state_array_Q;
    // update value
    rob_id_array_In[writePtr_Q]          = req_rob_id_i;
    ch_id_array_In[writePtr_Q]           = req_ch_id_i;
    set_way_offset_array_In[writePtr_Q]  = req_set_way_offset_i;
    wbuffer_id_array_In[writePtr_Q]      = req_wbuffer_id_i;
    cacheline_state_array_In[writePtr_Q] = {req_cacheline_offset1_state_i[1:0],
                                            req_cacheline_offset0_state_i[1:0]};
  end

  always @(*) begin
    // default value
    iq_op_is_write_array_In   = iq_op_is_write_array_Q;
    iq_need_linefill_array_In = iq_need_linefill_array_Q;
    // update value
    iq_op_is_write_array_In[writePtr_Q]   = req_opcode_i[0];
    iq_need_linefill_array_In[writePtr_Q] = req_need_linefill_i;
    
  end

  always @(*) begin
    // default value
    iq_need_evit_array_In = iq_need_evit_array_Q;
    // update value
    iq_need_evit_array_In[writePtr_Q] = req_opcode_i[1];
  end

  always @(posedge clk_i) begin
    if (writePtr_kickoff) begin // update array when write
      iq_need_evit_array_Q <= iq_need_evit_array_In;
    end
  end

  always @(posedge clk_i) begin
    if (writePtr_kickoff) begin // update array when write
      iq_op_is_write_array_Q   <= iq_op_is_write_array_In;
      iq_need_linefill_array_Q <= iq_need_linefill_array_In;
      rob_id_array_Q           <= rob_id_array_In;
      ch_id_array_Q            <= ch_id_array_In;
      set_way_offset_array_Q   <= set_way_offset_array_In;
      wbuffer_id_array_Q       <= wbuffer_id_array_In;
      cacheline_state_array_Q  <= cacheline_state_array_In;
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

//--------------------------------------------------------
// sram controller opcode
// 0: write
// 1: read
// 2: read with linefill
// 3: write back
//--------------------------------------------------------
  assign select_need_linefill = iq_need_linefill_array_Q[select_ptr];
  assign select_need_evit     = iq_need_evit_array_Q[select_ptr];
  assign select_is_write      = iq_op_is_write_array_Q[select_ptr];

  assign iq_sc_opcode_o[1:0] = {2{(~select_need_evit & select_is_write)                         }} & 2'b00
                             | {2{(~select_need_evit & ~select_need_linefill & ~select_is_write)}} & 2'b01
                             | {2{(~select_need_evit &  select_need_linefill)                   }} & 2'b10
                             | {2{ select_need_evit                                             }} & 2'b11;

  assign iq_sc_opcode_o[2] = 1'b0;

  assign iq_sc_valid_o               = |execute_array[DEPTH-1:0];
  assign iq_sc_channel_id_o[1:0]     = ch_id_array_Q[select_ptr];
  // assign iq_sc_opcode_o = 
  assign iq_sc_set_way_offset_o[6:0]     = set_way_offset_array_Q[select_ptr];
  assign iq_sc_wbuffer_id_o[7:0]         = wbuffer_id_array_Q[select_ptr];
  assign iq_sc_xbar_rob_num_o[2:0]       = rob_id_array_Q[select_ptr];
  assign iq_sc_cacheline_state_offset0_o[1:0] = cacheline_state_array_Q[select_ptr][1:0];
  assign iq_sc_cacheline_state_offset1_o[1:0] = cacheline_state_array_Q[select_ptr][3:2];
  // assign iq_sc_linefill_data_offset0_o 
  // assign iq_sc_linefill_data_offset1_o

  assign iq_linefill_buffer_raddr_o[5:0] = set_way_offset_array_Q[select_ptr][6:1];
  assign iq_sc_linefill_data_offset0_o[127:0] = linefill_buffer_data_i[127:0];
  assign iq_sc_linefill_data_offset1_o[127:0] = linefill_buffer_data_i[255:128];


endmodule