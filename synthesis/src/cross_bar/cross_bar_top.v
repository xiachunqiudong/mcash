module cross_bar_top(
  input wire          clk_i,
  input wire          rst_i,
  // top >> xbar
  // channel0
  input wire          mcash_ch0_valid_i,
  input wire          mcash_ch0_ready_o,
  input wire [2:0]    mcash_ch0_op_i,
  input wire [31:4]   mcash_ch0_addr_i,
  input wire [127:0]  mcash_ch0_data_i,
  output wire         mcash_ch0_rtn_valid_o,
  output wire         mcash_ch0_rtn_ready_i,
  output wire [127:0] mcash_ch0_rtn_data_o,
  // channel1
  input wire          mcash_ch1_valid_i,
  input wire          mcash_ch1_ready_o,
  input wire [2:0]    mcash_ch1_op_i,
  input wire [31:4]   mcash_ch1_addr_i,
  input wire [127:0]  mcash_ch1_data_i,
  output wire         mcash_ch1_rtn_valid_o,
  output wire         mcash_ch1_rtn_ready_i,
  output wire [127:0] mcash_ch1_rtn_data_o,
  // channel2
  input wire          mcash_ch2_valid_i,
  input wire          mcash_ch2_ready_o,
  input wire [2:0]    mcash_ch2_op_i,
  input wire [31:4]   mcash_ch2_addr_i,
  input wire [127:0]  mcash_ch2_data_i,
  output wire         mcash_ch2_rtn_valid_o,
  output wire         mcash_ch2_rtn_ready_i,
  output wire [127:0] mcash_ch2_rtn_data_o,
  // xbar >> htu
  output wire         xbar_htu_valid_o,
  input  wire         xbar_htu_ready_i,
  output wire [1:0]   xbar_htu_ch_id_o,
  output wire [1:0]   xbar_htu_opcode_o,
  output wire [31:0]  xbar_htu_addr_o,
  output wire [2:0]   xbar_htu_set_o,
  output wire [7:0]   xbar_htu_wbuffer_id_o,
  // sc >> xbar
  input  wire         sc_xbar_valid_i,
  output wire         sc_xbar_ready_o,
  input  wire         sc_xbar_ch_id_i,
  input  wire         sc_xbar_rob_num_i,
  input  wire         sc_xbar_data_i,
  // xbra >> wbuffer
  output wire         xbar_wbuf_req_valid_o,
  input  wire         xbar_wbuf_req_ready_i,
  output wire [1:0]   xbar_wbuf_req_ch_id_o,
  output wire [127:0] xbar_wbuf_req_data_o,
  output wire [7:0]   xbar_wbuf_req_wbuffer_id_o,
  input  wire [255:0] xbar_wbuf_rtn_free_id_i
);

  




endmodule