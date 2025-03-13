module bank_htu(
  input  wire        clk_i,
  input  wire        rst_i,
  input  wire        xbar_bank0_htu_valid_i,
  output wire        xbar_bank0_htu_ready_o,
  input  wire [1:0]  xbar_bank0_htu_ch_id_i,
  input  wire [1:0]  xbar_bank0_htu_opcode_i,
  input  wire [31:0] xbar_bank0_htu_addr_i,
  input  wire [7:0]  xbar_bank0_htu_wbuffer_id_i
);











endmodule