module bank_isu_iq #(
  parameter PTR_WIDTH = 8
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
  output wire         iq_sc_valid_o,
  input  wire         iq_sc_ready_i,
  output wire [1:0]   iq_sc_channel_id_o,
  output wire [2:0]   iq_sc_opcode_o,
  output wire [6:0]   iq_sc_set_way_offset_o,
  output wire [7:0]   iq_sc_wbuffer_id_o,
  output wire [2:0]   iq_sc_xbar_rob_num_o,
  output wire [1:0]   iq_sc_cacheline_state_offset0_o,
  output wire [1:0]   iq_sc_cacheline_state_offset1_o,
  input  wire [2:0]   channel_spw_pop_i
);

  parameter DEPTH = 1 << PTR_WIDTH;

  wire                 queue_size_wen;
  wire [PTR_WIDTH:0]   queue_size_In;
  reg  [PTR_WIDTH:0]   queue_size_Q;
  wire                 issue_kickoff;
  wire                 iq_allocate;
  wire [PTR_WIDTH-1:0] writePtr_In;
  reg  [PTR_WIDTH-1:0] writePtr_Q;
  reg  [DEPTH-1:0]     valid_array_In;
  reg  [DEPTH-1:0]     valid_array_Q;;
  wire [DEPTH-1:0]     iq_entry_req_from_ch0;
  wire [DEPTH-1:0]     iq_entry_req_from_ch1;
  wire [DEPTH-1:0]     iq_entry_req_from_ch2;
  reg [DEPTH-1:0]      iq_need_evit_array_In;
  reg [DEPTH-1:0]      iq_need_evit_array_Q;
  reg  [DEPTH-1:0]     mshr_allow_array_validate;
  reg  [DEPTH-1:0]     mshr_allow_array_In;
  reg  [DEPTH-1:0]     mshr_allow_array_Q;
  wire [DEPTH-1:0]     credit_allow_array;
  wire [DEPTH-1:0]     execute_array;
  wire                 bottom_ptr_kickoff;
  reg  [PTR_WIDTH-1:0] bottom_ptr_In;
  reg  [PTR_WIDTH-1:0] bottom_ptr_Q;
  wire [PTR_WIDTH-1:0] select_ptr;
  wire                 select_need_linefill;
  wire                 select_need_evit;
  wire                 select_is_write;

  wire [3:0]       iq_array_cacheline_state_In;
  wire             iq_array_op_is_write_rdata;
  wire             iq_array_op_need_linefill_rdata;
  wire [3:0]       iq_array_cacheline_state_rdata;
  wire [DEPTH-1:0] iq_biu_id_match_array;

  assign iq_array_cacheline_state_In[3:0] = {req_cacheline_offset1_state_i[1:0],
                                             req_cacheline_offset0_state_i[1:0]};

  bank_isu_iq_array
  iq_array(
    .clk                                     (clk_i                              ),
    .biu_rid_In                              (biu_isu_rid_i[5:0]                 ),
    .read_ptr                                (select_ptr[PTR_WIDTH-1:0]          ),
    .wen                                     (iq_allocate                   ),
    .write_ptr                               (writePtr_Q[PTR_WIDTH-1:0]          ),
    .bank_isu_iq_array_rob_id_In             (req_rob_id_i[2:0]                  ),
    .bank_isu_iq_array_ch_id_In              (req_ch_id_i[1:0]                   ),
    .bank_isu_iq_array_op_is_write_In        (req_opcode_i[0]                    ),
    .bank_isu_iq_array_op_need_linefill_In   (req_need_linefill_i                ),
    .bank_isu_iq_array_set_way_offset_In     (req_set_way_offset_i[6:0]          ),
    .bank_isu_iq_array_wbuffer_id_In         (req_wbuffer_id_i[7:0]              ),
    .bank_isu_iq_array_cacheline_state_In    (iq_array_cacheline_state_In[3:0]   ),
    .bank_isu_iq_array_rob_id_rdata          (iq_sc_xbar_rob_num_o[2:0]          ),
    .bank_isu_iq_array_ch_id_rdata           (iq_sc_channel_id_o[1:0]            ),
    .bank_isu_iq_array_op_is_write_rdata     (iq_array_op_is_write_rdata         ),
    .bank_isu_iq_array_op_need_linefill_rdata(iq_array_op_need_linefill_rdata    ),
    .bank_isu_iq_array_set_way_offset_rdata  (iq_sc_set_way_offset_o[6:0]        ),
    .bank_isu_iq_array_wbuffer_id_rdata      (iq_sc_wbuffer_id_o[7:0]            ),
    .bank_isu_iq_array_cacheline_state_rdata (iq_array_cacheline_state_rdata[3:0]),
    .biu_id_match_array                      (iq_biu_id_match_array[DEPTH-1:0]   ),
    .entry_req_from_ch0_array                (iq_entry_req_from_ch0[DEPTH-1:0]   ),
    .entry_req_from_ch1_array                (iq_entry_req_from_ch1[DEPTH-1:0]   ),
    .entry_req_from_ch2_array                (iq_entry_req_from_ch2[DEPTH-1:0]   )
  );

  assign iq_sc_cacheline_state_offset0_o[1:0] = iq_array_cacheline_state_rdata[1:0];
  assign iq_sc_cacheline_state_offset1_o[1:0] = iq_array_cacheline_state_rdata[3:2];

// queue size
  assign queue_size_wen = iq_allocate ^ bottom_ptr_kickoff;

  assign queue_size_In[PTR_WIDTH:0] = iq_allocate
                                    ? queue_size_Q[PTR_WIDTH:0] + 'd1
                                    : queue_size_Q[PTR_WIDTH:0] - 'd1;

  DFF_RST0 #(.WIDTH(PTR_WIDTH+1)) 
  queue_size_reg (
    .CLK(clk_i                     ),
    .RST(rst_i                     ),
    .WEN(queue_size_wen            ),
    .D  (queue_size_In[PTR_WIDTH:0]),
    .Q  (queue_size_Q[PTR_WIDTH:0] )
  );

  assign req_allowIn_o = queue_size_Q[PTR_WIDTH:0] != DEPTH[PTR_WIDTH:0];

//-----------------------------------------------------------------
//                   issue queue enqueue
//-----------------------------------------------------------------
  assign iq_allocate = req_valid_i & req_allowIn_o;

  assign writePtr_In[PTR_WIDTH-1:0] = writePtr_Q[PTR_WIDTH-1:0] + 'd1;

  DFF_RST0 #(.WIDTH(PTR_WIDTH))
  write_ptr_reg (
    .CLK(clk_i                     ),
    .RST(rst_i                     ),
    .WEN(iq_allocate               ),
    .D  (writePtr_In[PTR_WIDTH-1:0]),
    .Q  (writePtr_Q[PTR_WIDTH-1:0] )
  );

//--------------------------------------------------------------
//                    iq valid array
//--------------------------------------------------------------
  assign issue_kickoff = iq_sc_valid_o & iq_sc_ready_i;

  always @(*) begin
    valid_array_In = valid_array_Q;
    if (iq_allocate) begin
      valid_array_In[writePtr_Q] = 1'b1;
    end
    if (issue_kickoff) begin
      valid_array_In[select_ptr] = iq_need_evit_array_Q[select_ptr];
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
    iq_need_evit_array_In = iq_need_evit_array_Q;
    if (iq_allocate) begin
      iq_need_evit_array_In[writePtr_Q] = req_opcode_i[1];
    end
    if (issue_kickoff) begin
      iq_need_evit_array_In[select_ptr] = 1'b0;
    end
  end

  always @(posedge clk_i) begin
    iq_need_evit_array_Q <= iq_need_evit_array_In;
  end

//--------------------------------------------------------------
//                    MSHR allow array
//--------------------------------------------------------------
  assign mshr_allow_array_validate[DEPTH-1:0] = valid_array_Q[DEPTH-1:0] & iq_biu_id_match_array[DEPTH-1:0] & {DEPTH{biu_isu_rvalid_i}};

  always @(*) begin
    // set mshr allow array valid when receive linefill data
    mshr_allow_array_In[DEPTH-1:0] = mshr_allow_array_Q[DEPTH-1:0] | mshr_allow_array_validate[DEPTH-1:0];
    if (iq_allocate) begin
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
//                    Credit allow array
//--------------------------------------------------------------
  bank_isu_credit_manage #(
    .PTR_WIDTH(PTR_WIDTH)
  ) u_bank_isu_credit_manage(
    .clk                    (clk_i                           ),
    .rst                    (rst_i                           ),
    .iq_enqueue             (iq_allocate                ),
    .iq_write_ptr           (writePtr_Q                      ),
    .htu_op_is_read         (~req_opcode_i[0]                ),
    .htu_ch_id              (req_ch_id_i[1:0]                ),
    .iq_bottom_ptr          (bottom_ptr_Q                    ),
    .iq_valid_array         (valid_array_Q[DEPTH-1:0]        ),
    .credit_allow_array     (credit_allow_array[DEPTH-1:0]   ),
    .entry_req_from_ch0     (iq_entry_req_from_ch0[DEPTH-1:0]),
    .entry_req_from_ch1     (iq_entry_req_from_ch1[DEPTH-1:0]),
    .entry_req_from_ch2     (iq_entry_req_from_ch2[DEPTH-1:0]),
    .channels_credit_release(channel_spw_pop_i[2:0]          )
  );

//--------------------------------------------------------------
//                     Dequeue
//--------------------------------------------------------------
  assign bottom_ptr_kickoff = queue_size_Q != 'd0
                            & ~valid_array_Q[bottom_ptr_Q];

  always @(posedge clk_i or rst_i) begin
    if (rst_i) begin
      bottom_ptr_Q[PTR_WIDTH-1:0] <= 'd0;
    end
    else if (bottom_ptr_kickoff) begin
      bottom_ptr_Q[PTR_WIDTH-1:0] <= bottom_ptr_Q[PTR_WIDTH-1:0] + 'd1;
    end
  end

  assign execute_array[DEPTH-1:0] = valid_array_Q[DEPTH-1:0]
                                  & (  (mshr_allow_array_Q[DEPTH-1:0] & credit_allow_array[DEPTH-1:0])
                                      | iq_need_evit_array_Q[DEPTH-1:0]); // evit inst do not need mash allow and credit allow

  shift_priority_arb_64
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
  assign select_is_write      = iq_array_op_is_write_rdata;
  assign select_need_linefill = iq_array_op_need_linefill_rdata;
  assign select_need_evit     = iq_need_evit_array_Q[select_ptr];

  assign iq_sc_opcode_o[1:0] = {2{(~select_need_evit & select_is_write)                         }} & 2'b00
                             | {2{(~select_need_evit & ~select_need_linefill & ~select_is_write)}} & 2'b01
                             | {2{(~select_need_evit &  select_need_linefill)                   }} & 2'b10
                             | {2{ select_need_evit                                             }} & 2'b11;

  assign iq_sc_opcode_o[2] = 1'b0;

  assign iq_sc_valid_o               = |execute_array[DEPTH-1:0];

endmodule