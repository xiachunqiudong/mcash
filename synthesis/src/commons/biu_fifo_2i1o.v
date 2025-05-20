module biu_fifo_2i1o #(
  parameter AW = 4,
  parameter DW = 32
)(
  input  wire          clk,
  input  wire          rst,
  input  wire          din0_valid,
  input  wire          din1_valid,
  input  wire          pop,
  input  wire [DW-1:0] din0,
  input  wire [DW-1:0] din1,
  output wire          allowIn,
  output wire          dout_valid,
  output wire [DW-1:0] dout
);

  parameter DEPTH = 1 << AW;

  wire          single_valid;
  wire          double_valid;
  wire          push;
  reg  [AW:0]   size_In;
  reg  [AW:0]   size_Q;
  reg  [AW-1:0] rd_ptr;
  reg  [AW-1:0] wr_ptr0_Q;
  wire [AW-1:0] wr_ptr1;
  reg  [DW-1:0] mem [DEPTH-1:0];

  assign single_valid = din0_valid | din1_valid;

  assign double_valid = din0_valid & din1_valid;

  always @(*) begin
    size_In = size_Q;
    // push
    if      (double_valid & allowIn) size_In = size_In + 'd2;
    else if (single_valid & allowIn) size_In = size_In + 'd1;
  
    if (pop)          size_In = size_In - 'd1;
  end

  assign empry = size_Q == 'd0;

  assign allowIn = double_valid
                 ? size_Q < DEPTH - 'd1
                 : size_Q < DEPTH;

  assign push = single_valid & allowIn;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      size_Q <= 'd0;
    end
    else if (push | pop) begin
      size_Q <= size_In;
    end
  end

  assign dout_valid = size_Q != 'd0;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      wr_ptr0_Q <= 'd0;
    end
    else if (double_valid & allowIn) begin
      wr_ptr0_Q <= wr_ptr0_Q + 'd2;
    end
    else if (single_valid & allowIn) begin
      wr_ptr0_Q <= wr_ptr0_Q + 'd1;
    end
  end

  assign wr_ptr1 = wr_ptr0_Q + 'd1;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      rd_ptr <= 'd0;
    end
    else if (pop) begin
      rd_ptr <= rd_ptr + 'd1;
    end
  end

  always @(posedge clk) begin
    if (double_valid & allowIn) begin
      mem[wr_ptr0_Q] <= din0;
      mem[wr_ptr1]   <= din1;
    end
    else if (single_valid & allowIn) begin
      mem[wr_ptr0_Q] <= din0_valid ? din0 : din1;
    end
  end

  assign dout = mem[rd_ptr];

endmodule