module mcash_top (
  input  wire         clk_i,
  input  wire         rst_i,
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
  output wire [127:0] mcash_ch2_rtn_data_o
);

  bank_top
  u_bank_top(
    .clk_i(clk_i),
    .rst_i(rst_i)
  );

  cross_bar_top
  u_cross_bar_top(
    .clk_i                  (clk_i),
    .rst_i                  (rst_i),
    // top >> xbar
    // channel0
    .mcash_ch0_req_valid_i  (mcash_ch0_req_valid_i      ),
    .mcash_ch0_req_allowIn_o(mcash_ch0_req_allowIn_o    ),
    .mcash_ch0_req_op_i     (mcash_ch0_req_op_i[2:0]    ),
    .mcash_ch0_req_addr_i   (mcash_ch0_req_addr_i[31:4] ),
    .mcash_ch0_req_data_i   (mcash_ch0_req_data_i[127:0]),
    .mcash_ch0_rtn_valid_o  (mcash_ch0_rtn_valid_o      ),
    .mcash_ch0_rtn_ready_i  (mcash_ch0_rtn_ready_i      ),
    .mcash_ch0_rtn_data_o   (mcash_ch0_rtn_data_o[127:0]),
    // channel1
    .mcash_ch1_req_valid_i  (mcash_ch1_req_valid_i      ),
    .mcash_ch1_req_allowIn_o(mcash_ch1_req_allowIn_o    ),
    .mcash_ch1_req_op_i     (mcash_ch1_req_op_i[2:0]    ),
    .mcash_ch1_req_addr_i   (mcash_ch1_req_addr_i[31:4] ),
    .mcash_ch1_req_data_i   (mcash_ch1_req_data_i[127:0]),
    .mcash_ch1_rtn_valid_o  (mcash_ch1_rtn_valid_o      ),
    .mcash_ch1_rtn_ready_i  (mcash_ch1_rtn_ready_i      ),
    .mcash_ch1_rtn_data_o   (mcash_ch1_rtn_data_o[127:0]),
    // channel2
    .mcash_ch2_req_valid_i  (mcash_ch2_req_valid_i      ),
    .mcash_ch2_req_allowIn_o(mcash_ch2_req_allowIn_o    ),
    .mcash_ch2_req_op_i     (mcash_ch2_req_op_i[2:0]    ),
    .mcash_ch2_req_addr_i   (mcash_ch2_req_addr_i[31:4] ),
    .mcash_ch2_req_data_i   (mcash_ch2_req_data_i[127:0]),
    .mcash_ch2_rtn_valid_o  (mcash_ch2_rtn_valid_o      ),
    .mcash_ch2_rtn_ready_i  (mcash_ch2_rtn_ready_i      ),
    .mcash_ch2_rtn_data_o   (mcash_ch2_rtn_data_o[127:0]),
    // xbar >> htu
    .xbar_htu_valid_o(),
    .xbar_htu_ready_i(),
    .xbar_htu_ch_id_o(),
    .xbar_htu_opcode_o(),
    .xbar_htu_addr_o(),
    .xbar_htu_set_o(),
    .xbar_htu_wbuffer_id_o(),
    // sc >> xbar
    .sc_xbar_valid_i(),
    .sc_xbar_ready_o(),
    .sc_xbar_ch_id_i(),
    .sc_xbar_rob_num_i(),
    .sc_xbar_data_i(),
    // xbra >> wbuffer
    .xbar_wbuf_req_valid_o(),
    .xbar_wbuf_req_ready_i(),
    .xbar_wbuf_req_ch_id_o(),
    .xbar_wbuf_req_data_o(),
    .xbar_wbuf_req_wbuffer_id_o(),
    .xbar_wbuf_rtn_free_id_i()
  );


endmodule