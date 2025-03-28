module bank_isu_linefill_buffer(
  input  wire         clk_i,
  input  wire         wen_i,
  input  wire [5:0]   waddr_i,
  input  wire [255:0] wdata_i,
  input  wire         ren_i,
  input  wire [5:0]   raddr_i,
  output wire [255:0] rdata_o
);

  reg [255:0] mem [63:0];

  always @(posedge clk_i) begin
    if (wen_i) begin
      mem[waddr_i] <= wdata_i[255:0];
    end
  end

  assign rdata_o[255:0] = mem[raddr_i];

endmodule