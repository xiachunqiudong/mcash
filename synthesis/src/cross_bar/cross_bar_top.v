module cross_bar_top(
  input wire          clk_i,
  input wire          rst_i,
  // channel0
  input  wire         mcash_ch0_req_valid_i,
  output wire         mcash_ch0_req_allowIn_o,
  input  wire [2:0]   mcash_ch0_req_op_i,
  input  wire [31:4]  mcash_ch0_req_addr_i,
  input  wire [127:0] mcash_ch0_req_data_i,
  output wire         mcash_ch0_rtn_valid_o,
  input  wire         mcash_ch0_rtn_ready_i,
  output wire [127:0] mcash_ch0_rtn_data_o,
  // channel1
  input  wire         mcash_ch1_req_valid_i,
  output wire         mcash_ch1_req_allowIn_o,
  input  wire [2:0]   mcash_ch1_req_op_i,
  input  wire [31:4]  mcash_ch1_req_addr_i,
  input  wire [127:0] mcash_ch1_req_data_i,
  output wire         mcash_ch1_rtn_valid_o,
  input  wire         mcash_ch1_rtn_ready_i,
  output wire [127:0] mcash_ch1_rtn_data_o,
  // channel2
  input  wire         mcash_ch2_req_valid_i,
  output wire         mcash_ch2_req_allowIn_o,
  input  wire [2:0]   mcash_ch2_req_op_i,
  input  wire [31:4]  mcash_ch2_req_addr_i,
  input  wire [127:0] mcash_ch2_req_data_i,
  output wire         mcash_ch2_rtn_valid_o,
  input  wire         mcash_ch2_rtn_ready_i,
  output wire [127:0] mcash_ch2_rtn_data_o,
  // xbar >> bank0 htu
  output wire         xbar_bank0_htu_valid_o,
  input  wire         xbar_bank0_htu_allowIn_i,
  output wire [1:0]   xbar_bank0_htu_ch_id_o,
  output wire [1:0]   xbar_bank0_htu_opcode_o,
  output wire [31:4]  xbar_bank0_htu_addr_o,
  output wire [7:0]   xbar_bank0_htu_wbuffer_id_o,
  // xbar >> bank1 htu
  output wire         xbar_bank1_htu_valid_o,
  input  wire         xbar_bank1_htu_allowIn_i,
  output wire [1:0]   xbar_bank1_htu_ch_id_o,
  output wire [1:0]   xbar_bank1_htu_opcode_o,
  output wire [31:4]  xbar_bank1_htu_addr_o,
  output wire [7:0]   xbar_bank1_htu_wbuffer_id_o,
  // xbar >> bank2 htu
  output wire         xbar_bank2_htu_valid_o,
  input  wire         xbar_bank2_htu_allowIn_i,
  output wire [1:0]   xbar_bank2_htu_ch_id_o,
  output wire [1:0]   xbar_bank2_htu_opcode_o,
  output wire [31:4]  xbar_bank2_htu_addr_o,
  output wire [7:0]   xbar_bank2_htu_wbuffer_id_o,
  // xbar >> bank3 htu
  output wire         xbar_bank3_htu_valid_o,
  input  wire         xbar_bank3_htu_allowIn_i,
  output wire [1:0]   xbar_bank3_htu_ch_id_o,
  output wire [1:0]   xbar_bank3_htu_opcode_o,
  output wire [31:4]  xbar_bank3_htu_addr_o,
  output wire [7:0]   xbar_bank3_htu_wbuffer_id_o,
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

  cross_bar_core
  u_cross_bar_core(
    .clk_i                  (clk_i                     ),
    .rst_i                  (rst_i                     ),
    .mcash_ch0_req_valid_i  (mcash_ch0_req_valid_i     ),
    .mcash_ch0_req_allowIn_o(mcash_ch0_req_allowIn_o   ),
    .mcash_ch0_req_addr_i   (mcash_ch0_req_addr_i[31:4]),
    .mcash_ch0_req_op_i     (mcash_ch0_req_op_i[1:0]   ),
    .mcash_ch1_req_valid_i  (mcash_ch1_req_valid_i     ),
    .mcash_ch1_req_allowIn_o(mcash_ch1_req_allowIn_o   ),
    .mcash_ch1_req_op_i     (mcash_ch1_req_op_i[1:0]   ),
    .mcash_ch1_req_addr_i   (mcash_ch1_req_addr_i[31:4]),
    .mcash_ch2_req_valid_i  (mcash_ch2_req_valid_i     ),
    .mcash_ch2_req_op_i     (mcash_ch2_req_op_i[1:0]   ),
    .mcash_ch2_req_allowIn_o(mcash_ch2_req_allowIn_o   ),
    .mcash_ch2_req_addr_i   (mcash_ch2_req_addr_i[31:4]),
    // bank 0
    .xbar_bank0_htu_valid_o     (xbar_bank0_htu_valid_o          ),
    .xbar_bank0_htu_allowIn_i   (xbar_bank0_htu_allowIn_i        ),
    .xbar_bank0_htu_ch_id_o     (xbar_bank0_htu_ch_id_o[1:0]     ),
    .xbar_bank0_htu_opcode_o    (xbar_bank0_htu_opcode_o[1:0]    ),
    .xbar_bank0_htu_addr_o      (xbar_bank0_htu_addr_o[31:4]     ),
    .xbar_bank0_htu_wbuffer_id_o(xbar_bank0_htu_wbuffer_id_o[7:0]),
    // bank 1
    .xbar_bank1_htu_valid_o     (xbar_bank1_htu_valid_o          ),
    .xbar_bank1_htu_allowIn_i   (xbar_bank1_htu_allowIn_i        ),
    .xbar_bank1_htu_ch_id_o     (xbar_bank1_htu_ch_id_o[1:0]     ),
    .xbar_bank1_htu_opcode_o    (xbar_bank1_htu_opcode_o[1:0]    ),
    .xbar_bank1_htu_addr_o      (xbar_bank1_htu_addr_o[31:4]     ),
    .xbar_bank1_htu_wbuffer_id_o(xbar_bank1_htu_wbuffer_id_o[7:0]),
    // bank 2
    .xbar_bank2_htu_valid_o     (xbar_bank2_htu_valid_o          ),
    .xbar_bank2_htu_allowIn_i   (xbar_bank2_htu_allowIn_i        ),
    .xbar_bank2_htu_ch_id_o     (xbar_bank2_htu_ch_id_o[1:0]     ),
    .xbar_bank2_htu_opcode_o    (xbar_bank2_htu_opcode_o[1:0]    ),
    .xbar_bank2_htu_addr_o      (xbar_bank2_htu_addr_o[31:4]     ),
    .xbar_bank2_htu_wbuffer_id_o(xbar_bank2_htu_wbuffer_id_o[7:0]),
    // bank 3
    .xbar_bank3_htu_valid_o     (xbar_bank3_htu_valid_o          ),
    .xbar_bank3_htu_allowIn_i   (xbar_bank3_htu_allowIn_i        ),
    .xbar_bank3_htu_ch_id_o     (xbar_bank3_htu_ch_id_o[1:0]     ),
    .xbar_bank3_htu_opcode_o    (xbar_bank3_htu_opcode_o[1:0]    ),
    .xbar_bank3_htu_addr_o      (xbar_bank3_htu_addr_o[31:4]     ),
    .xbar_bank3_htu_wbuffer_id_o(xbar_bank3_htu_wbuffer_id_o[7:0])
  );



endmodule