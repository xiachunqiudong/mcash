module bank_htu(
  input  wire        clk_i,
  input  wire        rst_i,
  input  wire        xbar_bank_htu_valid_i,
  output wire        xbar_bank_htu_ready_o,
  input  wire [1:0]  xbar_bank_htu_ch_id_i,
  input  wire [1:0]  xbar_bank_htu_opcode_i,
  input  wire [31:4] xbar_bank_htu_addr_i,
  input  wire [7:0]  xbar_bank_htu_wbuffer_id_i
);

  bank_htu_set_status
  u_bank_htu_set0_status(
    .clk_i(clk_i),
    .rst_i(rst_i),
    .set_hit_i(),
    .set_tag_i(),
    .offset_i()
  );









endmodule