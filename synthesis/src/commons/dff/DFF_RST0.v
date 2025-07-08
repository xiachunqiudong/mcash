module DFF_RST0 #(
  parameter WIDTH = 32
) (
  input  wire          CLK,
  input  wire          RST,
  input  wire          WEN,
  input  wire [WIDTH-1:0] D,
  output reg  [WIDTH-1:0] Q
);

  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      Q[WIDTH-1:0] <= {WIDTH{1'b0}};
    end else if (WEN) begin
      Q[WIDTH-1:0] <= D[WIDTH-1:0];
    end
  end

endmodule