// single port sram model

module ram_sp # (
  parameter AW = 4,
  parameter DW = 8
) (
  input  wire          CLK,
  input  wire          ME,
  input  wire          WE,
  input  wire [AW-1:0] ADR,
  input  wire [DW-1:0] D,
  output reg  [DW-1:0] Q
);

  // Memory Array
  reg [DW-1:0] mem [(1<<DW)-1:0];

  // WRITE
  always @(posedge CLK) begin
    if (ME & WE) begin
      mem[ADR] <= D;
    end
  end

  // READ
  always @(posedge CLK) begin
    if (ME) begin
      Q <= mem[ADR];
    end
  end

endmodule