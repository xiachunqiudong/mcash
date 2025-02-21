module REG_WITH_RESET0 #(
  parameter WIDTH = 1
) (
  input wire             CLK,
  input wire             RST,
  input wire             WEN,
  input wire [WIDTH-1:0] D,
  output reg [WIDTH-1:0] Q
);

  always @(posedge CLK) begin
    if (RST) begin
      Q[WIDTH-1:0] <= {WIDTH{1'b0}};
    end
    else begin
      Q[WIDTH-1:0] <= D[WIDTH-1:0];
    end
  end

endmodule