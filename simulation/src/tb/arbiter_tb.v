module arbiter_tb;

  parameter N = 8;

  reg          clk;
  reg          rst;
  reg  [N-1:0] req;
  wire [N-1:0] grant;

  initial begin
    clk = 1'b0;
    rst = 1'b1;
    #10 rst = 1'b0;
  end

  always begin
    #5 clk = ~clk;
  end

  initial begin
    req = 'b0;
    #5  req = 'b0010;
    #10 req = 'b0110;
    #10 req = 'b0110;
  end


  round_robin_arbiter #(
    .N(N)
  ) u_round_robin_arbiter(
    .clk_i(clk),
    .rst_i(rst),
    .req_i(req),
    .grant_o(grant)
  );

  initial begin
    $fsdbDumpfile("arbiter.fsdb");
    $fsdbDumpvars(0, arbiter_tb);
    $fsdbDumpvars("+struct");
    $fsdbDumpvars("+mda");
    $fsdbDumpon;
    #10000
    $fsdbDumpoff;
    $finish;
  end


endmodule