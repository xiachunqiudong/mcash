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

    wire        xbar_bank0_htu_valid;
    wire        xbar_bank0_htu_ready;
    wire [1:0]  xbar_bank0_htu_ch_id;
    wire [1:0]  xbar_bank0_htu_opcode;
    wire [31:4] xbar_bank0_htu_addr;
    wire [7:0]  xbar_bank0_htu_wbuffer_id;

    wire        xbar_bank1_htu_valid;
    wire        xbar_bank1_htu_ready;
    wire [1:0]  xbar_bank1_htu_ch_id;
    wire [1:0]  xbar_bank1_htu_opcode;
    wire [31:4] xbar_bank1_htu_addr;
    wire [7:0]  xbar_bank1_htu_wbuffer_id;

    wire        xbar_bank2_htu_valid;
    wire        xbar_bank2_htu_ready;
    wire [1:0]  xbar_bank2_htu_ch_id;
    wire [1:0]  xbar_bank2_htu_opcode;
    wire [31:4] xbar_bank2_htu_addr;
    wire [7:0]  xbar_bank2_htu_wbuffer_id;

    wire        xbar_bank3_htu_valid;
    wire        xbar_bank3_htu_ready;
    wire [1:0]  xbar_bank3_htu_ch_id;
    wire [1:0]  xbar_bank3_htu_opcode;
    wire [31:4] xbar_bank3_htu_addr;
    wire [7:0]  xbar_bank3_htu_wbuffer_id;

//------------------------------------------------------------------
//                        Cross Bar
// Receive channel request and router to different bank
//------------------------------------------------------------------
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
    // bank 0
    .xbar_bank0_htu_valid_o     (xbar_bank0_htu_valid          ),
    .xbar_bank0_htu_ready_i     (xbar_bank0_htu_ready          ),
    .xbar_bank0_htu_ch_id_o     (xbar_bank0_htu_ch_id[1:0]     ),
    .xbar_bank0_htu_opcode_o    (xbar_bank0_htu_opcode[1:0]    ),
    .xbar_bank0_htu_addr_o      (xbar_bank0_htu_addr[31:4]     ),
    .xbar_bank0_htu_wbuffer_id_o(xbar_bank0_htu_wbuffer_id[7:0]),
    // bank 1
    .xbar_bank1_htu_valid_o     (xbar_bank1_htu_valid          ),
    .xbar_bank1_htu_ready_i     (xbar_bank1_htu_ready          ),
    .xbar_bank1_htu_ch_id_o     (xbar_bank1_htu_ch_id[1:0]     ),
    .xbar_bank1_htu_opcode_o    (xbar_bank1_htu_opcode[1:0]    ),
    .xbar_bank1_htu_addr_o      (xbar_bank1_htu_addr[31:4]     ),
    .xbar_bank1_htu_wbuffer_id_o(xbar_bank1_htu_wbuffer_id[7:0]),
    // bank 2
    .xbar_bank2_htu_valid_o     (xbar_bank2_htu_valid          ),
    .xbar_bank2_htu_ready_i     (xbar_bank2_htu_ready          ),
    .xbar_bank2_htu_ch_id_o     (xbar_bank2_htu_ch_id[1:0]     ),
    .xbar_bank2_htu_opcode_o    (xbar_bank2_htu_opcode[1:0]    ),
    .xbar_bank2_htu_addr_o      (xbar_bank2_htu_addr[31:4]     ),
    .xbar_bank2_htu_wbuffer_id_o(xbar_bank2_htu_wbuffer_id[7:0]),
    // bank 3
    .xbar_bank3_htu_valid_o     (xbar_bank3_htu_valid          ),
    .xbar_bank3_htu_ready_i     (xbar_bank3_htu_ready          ),
    .xbar_bank3_htu_ch_id_o     (xbar_bank3_htu_ch_id[1:0]     ),
    .xbar_bank3_htu_opcode_o    (xbar_bank3_htu_opcode[1:0]    ),
    .xbar_bank3_htu_addr_o      (xbar_bank3_htu_addr[31:4]     ),
    .xbar_bank3_htu_wbuffer_id_o(xbar_bank3_htu_wbuffer_id[7:0]),
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

//------------------------------------------------------------------
//                        Bank Wrapper
// Bank0 ~ Bank3
//------------------------------------------------------------------
  bank_top_wrapper
  u_bank_top_wrapper(
    // bank 0
    .xbar_bank0_htu_valid_i     (xbar_bank0_htu_valid          ),
    .xbar_bank0_htu_ready_o     (xbar_bank0_htu_ready          ),
    .xbar_bank0_htu_ch_id_i     (xbar_bank0_htu_ch_id[1:0]     ),
    .xbar_bank0_htu_opcode_i    (xbar_bank0_htu_opcode[1:0]    ),
    .xbar_bank0_htu_addr_i      (xbar_bank0_htu_addr[31:4]     ),
    .xbar_bank0_htu_wbuffer_id_i(xbar_bank0_htu_wbuffer_id[7:0]),
    // bank 1
    .xbar_bank1_htu_valid_i     (xbar_bank1_htu_valid          ),
    .xbar_bank1_htu_ready_o     (xbar_bank1_htu_ready          ),
    .xbar_bank1_htu_ch_id_i     (xbar_bank1_htu_ch_id[1:0]     ),
    .xbar_bank1_htu_opcode_i    (xbar_bank1_htu_opcode[1:0]    ),
    .xbar_bank1_htu_addr_i      (xbar_bank1_htu_addr[31:4]     ),
    .xbar_bank1_htu_wbuffer_id_i(xbar_bank1_htu_wbuffer_id[7:0]),
    // bank 2
    .xbar_bank2_htu_valid_i     (xbar_bank2_htu_valid          ),
    .xbar_bank2_htu_ready_o     (xbar_bank2_htu_ready          ),
    .xbar_bank2_htu_ch_id_i     (xbar_bank2_htu_ch_id[1:0]     ),
    .xbar_bank2_htu_opcode_i    (xbar_bank2_htu_opcode[1:0]    ),
    .xbar_bank2_htu_addr_i      (xbar_bank2_htu_addr[31:4]     ),
    .xbar_bank2_htu_wbuffer_id_i(xbar_bank2_htu_wbuffer_id[7:0]),
    // bank 3
    .xbar_bank3_htu_valid_i     (xbar_bank3_htu_valid          ),
    .xbar_bank3_htu_ready_o     (xbar_bank3_htu_ready          ),
    .xbar_bank3_htu_ch_id_i     (xbar_bank3_htu_ch_id[1:0]     ),
    .xbar_bank3_htu_opcode_i    (xbar_bank3_htu_opcode[1:0]    ),
    .xbar_bank3_htu_addr_i      (xbar_bank3_htu_addr[31:4]     ),
    .xbar_bank3_htu_wbuffer_id_i(xbar_bank3_htu_wbuffer_id[7:0])
  );

endmodule