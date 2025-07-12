// This RTL code is generate by RTL generator, please do not modify!
module iq_entry (
  input  wire                        clk,
  input  wire                        rst,
  input  wire                        validate,
  input  wire                        inValidate,
  input  wire                        cacheline_inflight_In,
  input  wire                        op_need_evit_In,
  input  wire                        biu_rvalid_In,
  input  wire        [5:0]           biu_rid_In,
  input  wire        [2:0]           rob_id_In,
  input  wire        [1:0]           ch_id_In,
  input  wire                        op_is_write_In,
  input  wire                        op_need_linefill_In,
  input  wire        [6:0]           set_way_offset_In,
  input  wire        [7:0]           wbuffer_id_In,
  input  wire        [3:0]           cacheline_state_In,
  output wire                        valid_Q,
  output wire                        mshr_allow_Q,
  output wire                        need_evit_Q,
  output wire        [2:0]           rob_id_Q,
  output wire        [1:0]           ch_id_Q,
  output wire                        op_is_write_Q,
  output wire                        op_need_linefill_Q,
  output wire        [6:0]           set_way_offset_Q,
  output wire        [7:0]           wbuffer_id_Q,
  output wire        [3:0]           cacheline_state_Q,
  output wire                        entry_req_from_ch0,
  output wire                        entry_req_from_ch1,
  output wire                        entry_req_from_ch2
);

//--------------------------------------------------------------------------------
//                              Wire declaration
//--------------------------------------------------------------------------------
  wire                        biu_id_match;
  wire                        valid_wen;
  wire                        valid_In;
  wire                        mshr_allow_wen;
  wire                        mshr_allow_In;
  wire                        need_evit_wen;
  wire                        need_evit_In;

//--------------------------------------------------------------------------------
//                              LOGIC START
//--------------------------------------------------------------------------------
assign valid_In = (valid_Q & ~inValidate) | validate | need_evit_Q;
assign valid_wen = validate | inValidate;

assign mshr_allow_wen = (valid_Q & biu_id_match) | validate;
assign mshr_allow_In = (validate & ~(op_need_linefill_In | cacheline_inflight_In)) | (valid_Q & biu_id_match);

assign need_evit_wen = validate | inValidate;
assign need_evit_In = (validate & op_need_evit_In) & ~inValidate;

assign biu_id_match = biu_rvalid_In & (set_way_offset_Q[6:1] == biu_rid_In[5:0]);

assign entry_req_from_ch0 = ch_id_Q[1:0] == 2'd0;
assign entry_req_from_ch1 = ch_id_Q[1:0] == 2'd1;
assign entry_req_from_ch2 = ch_id_Q[1:0] == 2'd2;


//--------------------------------------------------------------------------------
//                              Module instance
//--------------------------------------------------------------------------------
  DFF_RST0 #(.WIDTH(1)) valid_reg (
    .CLK (clk      ),
    .RST (rst      ),
    .WEN (valid_wen),
    .D   (valid_In ),
    .Q   (valid_Q  )
  );

  DFF #(.WIDTH(1)) mshr_allow_reg (
    .CLK (clk           ),
    .WEN (mshr_allow_wen),
    .D   (mshr_allow_In ),
    .Q   (mshr_allow_Q  )
  );

  DFF #(.WIDTH(1)) need_evit_reg (
    .CLK (clk          ),
    .WEN (need_evit_wen),
    .D   (need_evit_In ),
    .Q   (need_evit_Q  )
  );

  DFF #(.WIDTH(3)) rob_id_reg (
    .CLK (clk           ),
    .WEN (validate      ),
    .D   (rob_id_In[2:0]),
    .Q   (rob_id_Q[2:0] )
  );

  DFF #(.WIDTH(2)) ch_id_reg (
    .CLK (clk          ),
    .WEN (validate     ),
    .D   (ch_id_In[1:0]),
    .Q   (ch_id_Q[1:0] )
  );

  DFF #(.WIDTH(1)) op_is_write_reg (
    .CLK (clk           ),
    .WEN (validate      ),
    .D   (op_is_write_In),
    .Q   (op_is_write_Q )
  );

  DFF #(.WIDTH(1)) op_need_linefill_reg (
    .CLK (clk                ),
    .WEN (validate           ),
    .D   (op_need_linefill_In),
    .Q   (op_need_linefill_Q )
  );

  DFF #(.WIDTH(7)) set_way_offset_reg (
    .CLK (clk                   ),
    .WEN (validate              ),
    .D   (set_way_offset_In[6:0]),
    .Q   (set_way_offset_Q[6:0] )
  );

  DFF #(.WIDTH(8)) wbuffer_id_reg (
    .CLK (clk               ),
    .WEN (validate          ),
    .D   (wbuffer_id_In[7:0]),
    .Q   (wbuffer_id_Q[7:0] )
  );

  DFF #(.WIDTH(4)) cacheline_state_reg (
    .CLK (clk                    ),
    .WEN (validate               ),
    .D   (cacheline_state_In[3:0]),
    .Q   (cacheline_state_Q[3:0] )
  );

endmodule
