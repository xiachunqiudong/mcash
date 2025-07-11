module DFF #(
  parameter WIDTH = 32
) (
  input  wire             CLK,
  input  wire             WEN,
  input  wire [WIDTH-1:0] D,
  output reg  [WIDTH-1:0] Q
);

  always @(posedge CLK) begin
    if (WEN) begin
      Q[WIDTH-1:0] <= D[WIDTH-1:0];
    end
  end

  `ifndef SYNTHESIS //{
    dff_xchecker #(.WIDTH(WIDTH)) xchecker(
      .CLK(CLK         ),
      .WEN(WEN         ),
      .D  (D[WIDTH-1:0])
    );
  `endif //}

endmodule