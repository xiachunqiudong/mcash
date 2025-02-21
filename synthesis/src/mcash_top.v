module mcash_top (
  input wire clk_i,
  input wire rst_i
);

  bank_top
  u_bank_top(
    .clk_i(clk_i),
    .rst_i(rst_i)
  );

endmodule