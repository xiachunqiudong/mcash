module top;

  reg clk;
  reg rst;

  initial begin
    clk = 1'b0;
    rst = 1'b1;
  end

  always begin
    #5 clk = ~clk;
    #5 rst = 1'b0;
  end

  mcash_top
  u_mcash_top(
    .clk_i(clk),
    .rst_i(rst)
  );

  initial begin
    $fsdbDumpfile("tb.fsdb");
    $fsdbDumpvars(0, top);
    $fsdbDumpvars("+struct");
    $fsdbDumpvars("+mda");
    $fsdbDumpon;
    #10000
    $fsdbDumpoff;
    $finish;
  end

endmodule