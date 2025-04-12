module sync_fifo #(
  parameter AW = 4,
  parameter DW = 3
)(
    input  wire          clk,
    input  wire          rst,
    input  wire          push,
    input  wire [DW-1:0] din,
    input  wire          pop,
    output wire [DW-1:0] dout,
    output wire          empry,
    output wire          full        
);

  parameter DEPTH = 1 << AW;
  
  reg [AW:0]   size_In;
  reg [AW:0]   size_Q;
  reg [AW-1:0] rd_ptr;
  reg [AW-1:0] wr_ptr;
  reg [DW-1:0] mem [DEPTH-1:0];

  assign size_In = push ? size_Q + 'd1 : size_Q - 'd1;

  assign empry = size_Q == 'd0;
  assign full = size_Q == DEPTH;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      size_Q <= 'd0;
    end
    else if (push ^ pop) begin
      size_Q <= size_In;
    end
  end

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      wr_ptr <= 'd0;
    end
    else if (push) begin
      wr_ptr <= wr_ptr + 'd1;
    end
  end

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      rd_ptr <= 'd0;
    end
    else if (pop) begin
      rd_ptr <= rd_ptr + 'd1;
    end
  end

  always @(posedge clk) begin
    if (push) mem[wr_ptr] <= din;
  end

  assign dout = mem[rd_ptr];


endmodule