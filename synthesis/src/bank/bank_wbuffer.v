module bank_wbuffer #(
  parameter AW = 5,
  parameter DW = 128
)(
  input  wire          clk_i,
  input  wire          rst_i,
  input  wire          wbuf_wr_req_i,
  input  wire [AW-1:0] wbuf_wr_id_i,
  input  wire [DW-1:0] wbuf_wdata_i,
  input  wire          wbuf_rd_req_i,
  input  wire [AW-1:0] wbuf_rd_id_i,
  output wire          wbuf_rd_data_valid_o,
  output wire [DW-1:0] wbuf_rd_data_o
);

//------------------------------------------------------------
//                     Write data buffer
// Entry size : 128 bit
// Entry num  : 32
// Total size : 512B
//------------------------------------------------------------
  parameter DEPTH = 1 << AW;

  reg           read_data_valid_Q;
  reg  [DW-1:0] data_array_Q [DEPTH-1:0];
  wire [DW-1:0] read_data_In;
  reg  [DW-1:0] read_data_Q;

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      read_data_valid_Q <= 1'b0;
    end
    else begin
      read_data_valid_Q <= wbuf_rd_req_i;
    end
  end

  assign read_data_In = data_array_Q[wbuf_rd_id_i];

  always @(posedge clk_i) begin
    read_data_Q <= read_data_In;
  end

  assign wbuf_rd_data_valid_o = read_data_valid_Q;

  assign wbuf_rd_data_o = read_data_Q;

//------------------------------------------------------------------
//                         write buffer
//------------------------------------------------------------------
  always @(posedge clk_i) begin
    if (wbuf_wr_req_i) begin
      data_array_Q[wbuf_wr_id_i] <= wbuf_wdata_i;
    end
  end

endmodule 
