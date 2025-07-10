// This RTL code is generate by RTL generator, please do not modify!
module bank_isu_iq_entry (
  input  wire                        clk,
  input  wire                        wen,
  input  wire        [5:0]           biu_rid_In,
  input  wire        [2:0]           rob_id_In,
  input  wire        [1:0]           ch_id_In,
  input  wire                        op_is_write_In,
  input  wire                        op_need_linefill_In,
  input  wire        [6:0]           set_way_offset_In,
  input  wire        [7:0]           wbuffer_id_In,
  input  wire        [3:0]           cacheline_state_In,
  output wire        [2:0]           rob_id_Q,
  output wire        [1:0]           ch_id_Q,
  output wire                        op_is_write_Q,
  output wire                        op_need_linefill_Q,
  output wire        [6:0]           set_way_offset_Q,
  output wire        [7:0]           wbuffer_id_Q,
  output wire        [3:0]           cacheline_state_Q,
  output wire                        biu_id_match,
  output wire                        entry_req_from_ch0,
  output wire                        entry_req_from_ch1,
  output wire                        entry_req_from_ch2
);

//--------------------------------------------------------------------------------
//                              LOGIC START
//--------------------------------------------------------------------------------
assign biu_id_match = set_way_offset_Q[6:1] == biu_rid_In[5:0];

assign entry_req_from_ch0 = ch_id_Q[1:0] == 2'd0;
assign entry_req_from_ch1 = ch_id_Q[1:0] == 2'd1;
assign entry_req_from_ch2 = ch_id_Q[1:0] == 2'd2;

// ROB_ID DFF: 3 bits
  DFF #(.WIDTH(3)) rob_id_reg (
  .CLK(clk      ),
  .WEN(wen      ),
  .D  (rob_id_In),
  .Q  (rob_id_Q ));

// CH_ID DFF: 2 bits
  DFF #(.WIDTH(2)) ch_id_reg (
  .CLK(clk     ),
  .WEN(wen     ),
  .D  (ch_id_In),
  .Q  (ch_id_Q ));

// OP_IS_WRITE DFF: 1 bits
  DFF #(.WIDTH(1)) op_is_write_reg (
  .CLK(clk           ),
  .WEN(wen           ),
  .D  (op_is_write_In),
  .Q  (op_is_write_Q ));

// OP_NEED_LINEFILL DFF: 1 bits
  DFF #(.WIDTH(1)) op_need_linefill_reg (
  .CLK(clk                ),
  .WEN(wen                ),
  .D  (op_need_linefill_In),
  .Q  (op_need_linefill_Q ));

// SET_WAY_OFFSET DFF: 7 bits
  DFF #(.WIDTH(7)) set_way_offset_reg (
  .CLK(clk              ),
  .WEN(wen              ),
  .D  (set_way_offset_In),
  .Q  (set_way_offset_Q ));

// WBUFFER_ID DFF: 8 bits
  DFF #(.WIDTH(8)) wbuffer_id_reg (
  .CLK(clk          ),
  .WEN(wen          ),
  .D  (wbuffer_id_In),
  .Q  (wbuffer_id_Q ));

// CACHELINE_STATE DFF: 4 bits
  DFF #(.WIDTH(4)) cacheline_state_reg (
  .CLK(clk               ),
  .WEN(wen               ),
  .D  (cacheline_state_In),
  .Q  (cacheline_state_Q ));


//--------------------------------------------------------------------------------
//                              Module instance
//--------------------------------------------------------------------------------
endmodule
