module bank_isu_iq_entry (
  input  wire       clk,
  input  wire       wen,
  input  wire [2:0] rob_id_In,
  input  wire [1:0] ch_id_In,
  input  wire       op_is_write_In,
  input  wire       op_need_evit_In,
  input  wire       op_need_linefill_In,
  input  wire [6:0] set_way_offset_In,
  input  wire [7:0] wbuffer_id_In,
  input  wire [3:0] cacheline_state_In,
  output wire [2:0] rob_id_Q,
  output wire [1:0] ch_id_Q,
  output wire       op_is_write_Q,
  output wire       op_need_evit_Q,
  output wire       op_need_linefill_Q,
  output wire [6:0] set_way_offset_Q,
  output wire [7:0] wbuffer_id_Q,
  output wire [3:0] cacheline_state_Q
);

// rob_id dff: 3 bits
  DFF #(.WIDTH(3)) rob_id_reg (
  .CLK(clk      ),
  .WEN(wen      ),
  .D  (rob_id_In),
  .Q  (rob_id_Q ));

// ch_id dff: 2 bits
  DFF #(.WIDTH(2)) ch_id_reg (
  .CLK(clk     ),
  .WEN(wen     ),
  .D  (ch_id_In),
  .Q  (ch_id_Q ));

// op_is_write dff: 1 bits
  DFF #(.WIDTH(1)) op_is_write_reg (
  .CLK(clk           ),
  .WEN(wen           ),
  .D  (op_is_write_In),
  .Q  (op_is_write_Q ));

// op_need_evit dff: 1 bits
  DFF #(.WIDTH(1)) op_need_evit_reg (
  .CLK(clk            ),
  .WEN(wen            ),
  .D  (op_need_evit_In),
  .Q  (op_need_evit_Q ));

// op_need_linefill dff: 1 bits
  DFF #(.WIDTH(1)) op_need_linefill_reg (
  .CLK(clk                ),
  .WEN(wen                ),
  .D  (op_need_linefill_In),
  .Q  (op_need_linefill_Q ));

// set_way_offset dff: 7 bits
  DFF #(.WIDTH(7)) set_way_offset_reg (
  .CLK(clk              ),
  .WEN(wen              ),
  .D  (set_way_offset_In),
  .Q  (set_way_offset_Q ));

// wbuffer_id dff: 8 bits
  DFF #(.WIDTH(8)) wbuffer_id_reg (
  .CLK(clk          ),
  .WEN(wen          ),
  .D  (wbuffer_id_In),
  .Q  (wbuffer_id_Q ));

// cacheline_state dff: 4 bits
  DFF #(.WIDTH(4)) cacheline_state_reg (
  .CLK(clk               ),
  .WEN(wen               ),
  .D  (cacheline_state_In),
  .Q  (cacheline_state_Q ));

endmodule
