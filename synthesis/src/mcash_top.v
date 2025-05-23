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
  output wire [127:0] mcash_ch2_rtn_data_o,
  // bank0 AXI3 
  output wire         bank0_biu_axi3_arvalid_o,
  input  wire         bank0_biu_axi3_arready_i,
  output wire [5:0]   bank0_biu_axi3_arid_o,
  output wire [31:0]  bank0_biu_axi3_araddr_o,
  output wire [2:0]   bank0_biu_axi3_arsize_o,
  output wire [3:0]   bank0_biu_axi3_arlen_o,
  output wire [1:0]   bank0_biu_axi3_arburst_o,
  input  wire         bank0_biu_axi3_rvalid_i,
  output wire         bank0_biu_axi3_rready_o,
  input  wire [5:0]   bank0_biu_axi3_rid_i,
  input  wire [255:0] bank0_biu_axi3_rdata_i,
  input  wire [1:0]   bank0_biu_axi3_rresp_i,
  input  wire         bank0_biu_axi3_rlast_i,
  output wire         bank0_biu_axi3_awvalid_o,
  input  wire         bank0_biu_axi3_awready_i,
  output wire [5:0]   bank0_biu_axi3_awid_o,
  output wire [31:0]  bank0_biu_axi3_awaddr_o,
  output wire [3:0]   bank0_biu_axi3_awlen_o,
  output wire [2:0]   bank0_biu_axi3_awsize_o,
  output wire [1:0]   bank0_biu_axi3_awburst_o,
  output wire         bank0_biu_axi3_wvalid_o,
  input  wire         bank0_biu_axi3_wready_i,
  output wire [5:0]   bank0_biu_axi3_wid_o,
  output wire [255:0] bank0_biu_axi3_wdata_o,
  output wire [31:0]  bank0_biu_axi3_wstrb_o,
  output wire         bank0_biu_axi3_wlast_o,
  input  wire         bank0_biu_axi3_bvalid_i,
  output wire         bank0_biu_axi3_bready_o,
  input  wire [5:0]   bank0_biu_axi3_bid_i,
  input  wire [1:0]   bank0_biu_axi3_bresp_i,
  // bank1 AXI3 
  output wire         bank1_biu_axi3_arvalid_o,
  input  wire         bank1_biu_axi3_arready_i,
  output wire [5:0]   bank1_biu_axi3_arid_o,
  output wire [31:0]  bank1_biu_axi3_araddr_o,
  output wire [2:0]   bank1_biu_axi3_arsize_o,
  output wire [3:0]   bank1_biu_axi3_arlen_o,
  output wire [1:0]   bank1_biu_axi3_arburst_o,
  input  wire         bank1_biu_axi3_rvalid_i,
  output wire         bank1_biu_axi3_rready_o,
  input  wire [5:0]   bank1_biu_axi3_rid_i,
  input  wire [255:0] bank1_biu_axi3_rdata_i,
  input  wire [1:0]   bank1_biu_axi3_rresp_i,
  input  wire         bank1_biu_axi3_rlast_i,
  output wire         bank1_biu_axi3_awvalid_o,
  input  wire         bank1_biu_axi3_awready_i,
  output wire [5:0]   bank1_biu_axi3_awid_o,
  output wire [31:0]  bank1_biu_axi3_awaddr_o,
  output wire [3:0]   bank1_biu_axi3_awlen_o,
  output wire [2:0]   bank1_biu_axi3_awsize_o,
  output wire [1:0]   bank1_biu_axi3_awburst_o,
  output wire         bank1_biu_axi3_wvalid_o,
  input  wire         bank1_biu_axi3_wready_i,
  output wire [5:0]   bank1_biu_axi3_wid_o,
  output wire [255:0] bank1_biu_axi3_wdata_o,
  output wire [31:0]  bank1_biu_axi3_wstrb_o,
  output wire         bank1_biu_axi3_wlast_o,
  input  wire         bank1_biu_axi3_bvalid_i,
  output wire         bank1_biu_axi3_bready_o,
  input  wire [5:0]   bank1_biu_axi3_bid_i,
  input  wire [1:0]   bank1_biu_axi3_bresp_i,
  // bank2 AXI3 
  output wire         bank2_biu_axi3_arvalid_o,
  input  wire         bank2_biu_axi3_arready_i,
  output wire [5:0]   bank2_biu_axi3_arid_o,
  output wire [31:0]  bank2_biu_axi3_araddr_o,
  output wire [2:0]   bank2_biu_axi3_arsize_o,
  output wire [3:0]   bank2_biu_axi3_arlen_o,
  output wire [1:0]   bank2_biu_axi3_arburst_o,
  input  wire         bank2_biu_axi3_rvalid_i,
  output wire         bank2_biu_axi3_rready_o,
  input  wire [5:0]   bank2_biu_axi3_rid_i,
  input  wire [255:0] bank2_biu_axi3_rdata_i,
  input  wire [1:0]   bank2_biu_axi3_rresp_i,
  input  wire         bank2_biu_axi3_rlast_i,
  output wire         bank2_biu_axi3_awvalid_o,
  input  wire         bank2_biu_axi3_awready_i,
  output wire [5:0]   bank2_biu_axi3_awid_o,
  output wire [31:0]  bank2_biu_axi3_awaddr_o,
  output wire [3:0]   bank2_biu_axi3_awlen_o,
  output wire [2:0]   bank2_biu_axi3_awsize_o,
  output wire [1:0]   bank2_biu_axi3_awburst_o,
  output wire         bank2_biu_axi3_wvalid_o,
  input  wire         bank2_biu_axi3_wready_i,
  output wire [5:0]   bank2_biu_axi3_wid_o,
  output wire [255:0] bank2_biu_axi3_wdata_o,
  output wire [31:0]  bank2_biu_axi3_wstrb_o,
  output wire         bank2_biu_axi3_wlast_o,
  input  wire         bank2_biu_axi3_bvalid_i,
  output wire         bank2_biu_axi3_bready_o,
  input  wire [5:0]   bank2_biu_axi3_bid_i,
  input  wire [1:0]   bank2_biu_axi3_bresp_i,
  // bank3 AXI3 
  output wire         bank3_biu_axi3_arvalid_o,
  input  wire         bank3_biu_axi3_arready_i,
  output wire [5:0]   bank3_biu_axi3_arid_o,
  output wire [31:0]  bank3_biu_axi3_araddr_o,
  output wire [2:0]   bank3_biu_axi3_arsize_o,
  output wire [3:0]   bank3_biu_axi3_arlen_o,
  output wire [1:0]   bank3_biu_axi3_arburst_o,
  input  wire         bank3_biu_axi3_rvalid_i,
  output wire         bank3_biu_axi3_rready_o,
  input  wire [5:0]   bank3_biu_axi3_rid_i,
  input  wire [255:0] bank3_biu_axi3_rdata_i,
  input  wire [1:0]   bank3_biu_axi3_rresp_i,
  input  wire         bank3_biu_axi3_rlast_i,
  output wire         bank3_biu_axi3_awvalid_o,
  input  wire         bank3_biu_axi3_awready_i,
  output wire [5:0]   bank3_biu_axi3_awid_o,
  output wire [31:0]  bank3_biu_axi3_awaddr_o,
  output wire [3:0]   bank3_biu_axi3_awlen_o,
  output wire [2:0]   bank3_biu_axi3_awsize_o,
  output wire [1:0]   bank3_biu_axi3_awburst_o,
  output wire         bank3_biu_axi3_wvalid_o,
  input  wire         bank3_biu_axi3_wready_i,
  output wire [5:0]   bank3_biu_axi3_wid_o,
  output wire [255:0] bank3_biu_axi3_wdata_o,
  output wire [31:0]  bank3_biu_axi3_wstrb_o,
  output wire         bank3_biu_axi3_wlast_o,
  input  wire         bank3_biu_axi3_bvalid_i,
  output wire         bank3_biu_axi3_bready_o,
  input  wire [5:0]   bank3_biu_axi3_bid_i,
  input  wire [1:0]   bank3_biu_axi3_bresp_i
);

  wire         xbar_bank0_htu_valid;
  wire         xbar_bank0_htu_allowIn;
  wire [1:0]   xbar_bank0_htu_ch_id;
  wire [1:0]   xbar_bank0_htu_opcode;
  wire [31:4]  xbar_bank0_htu_addr;
  wire [127:0] xbar_bank0_htu_data;
  wire [7:0]   xbar_bank0_htu_wbuffer_id;
  wire         bank0_sc_xbar_valid;
  wire [1:0]   bank0_sc_xbar_ch_id;
  wire [2:0]   bank0_sc_xbar_rob_num;
  wire [127:0] bank0_sc_xbar_data;
  wire         xbar_bank1_htu_valid;
  wire         xbar_bank1_htu_allowIn;
  wire [1:0]   xbar_bank1_htu_ch_id;
  wire [1:0]   xbar_bank1_htu_opcode;
  wire [31:4]  xbar_bank1_htu_addr;
  wire [127:0] xbar_bank1_htu_data;
  wire [7:0]   xbar_bank1_htu_wbuffer_id;
  wire         bank1_sc_xbar_valid;
  wire         bank1_sc_xbar_allowIn;
  wire [1:0]   bank1_sc_xbar_ch_id;
  wire [2:0]   bank1_sc_xbar_rob_num;
  wire [127:0] bank1_sc_xbar_data;
  wire         xbar_bank2_htu_valid;
  wire         xbar_bank2_htu_allowIn;
  wire [1:0]   xbar_bank2_htu_ch_id;
  wire [1:0]   xbar_bank2_htu_opcode;
  wire [31:4]  xbar_bank2_htu_addr;
  wire [127:0] xbar_bank2_htu_data;
  wire [7:0]   xbar_bank2_htu_wbuffer_id;
  wire         bank2_sc_xbar_valid;
  wire         bank2_sc_xbar_allowIn;
  wire [1:0]   bank2_sc_xbar_ch_id;
  wire [2:0]   bank2_sc_xbar_rob_num;
  wire [127:0] bank2_sc_xbar_data;
  wire         xbar_bank3_htu_valid;
  wire         xbar_bank3_htu_allowIn;
  wire [1:0]   xbar_bank3_htu_ch_id;
  wire [1:0]   xbar_bank3_htu_opcode;
  wire [31:4]  xbar_bank3_htu_addr;
  wire [127:0] xbar_bank3_htu_data;
  wire [7:0]   xbar_bank3_htu_wbuffer_id;
  wire         bank3_sc_xbar_valid;
  wire         bank3_sc_xbar_allowIn;
  wire [1:0]   bank3_sc_xbar_ch_id;
  wire [2:0]   bank3_sc_xbar_rob_num;
  wire [127:0] bank3_sc_xbar_data;
  wire [2:0]   bank0_spw_buffer_pop;
  wire [2:0]   bank1_spw_buffer_pop;
  wire [2:0]   bank2_spw_buffer_pop;
  wire [2:0]   bank3_spw_buffer_pop;

//------------------------------------------------------------------
//                        Cross Bar
//
//  ch0 ---|++++| -- bank0
//  ch1 ---|++++| -- bank1
//  ch2 ---|++++| -- bank2
//         |++++| -- bank3
//------------------------------------------------------------------
  cross_bar_top
  u_cross_bar_top(
    .clk_i                  (clk_i                      ),
    .rst_i                  (rst_i                      ),
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
    .xbar_bank0_htu_allowIn_i   (xbar_bank0_htu_allowIn        ),
    .xbar_bank0_htu_ch_id_o     (xbar_bank0_htu_ch_id[1:0]     ),
    .xbar_bank0_htu_opcode_o    (xbar_bank0_htu_opcode[1:0]    ),
    .xbar_bank0_htu_addr_o      (xbar_bank0_htu_addr[31:4]     ),
    .xbar_bank0_htu_data_o      (xbar_bank0_htu_data[127:0]    ),
    .xbar_bank0_htu_wbuffer_id_o(xbar_bank0_htu_wbuffer_id[7:0]),
    .bank0_sc_xbar_valid_i      (bank0_sc_xbar_valid           ),
    .bank0_sc_xbar_ch_id_i      (bank0_sc_xbar_ch_id[1:0]      ),
    .bank0_sc_xbar_rob_num_i    (bank0_sc_xbar_rob_num[2:0]    ),
    .bank0_sc_xbar_data_i       (bank0_sc_xbar_data[127:0]     ),
    // bank 1
    .xbar_bank1_htu_valid_o     (xbar_bank1_htu_valid          ),
    .xbar_bank1_htu_allowIn_i   (xbar_bank1_htu_allowIn        ),
    .xbar_bank1_htu_ch_id_o     (xbar_bank1_htu_ch_id[1:0]     ),
    .xbar_bank1_htu_opcode_o    (xbar_bank1_htu_opcode[1:0]    ),
    .xbar_bank1_htu_addr_o      (xbar_bank1_htu_addr[31:4]     ),
    .xbar_bank1_htu_data_o      (xbar_bank1_htu_data[127:0]    ),
    .xbar_bank1_htu_wbuffer_id_o(xbar_bank1_htu_wbuffer_id[7:0]),
    .bank1_sc_xbar_valid_i      (bank1_sc_xbar_valid           ),
    .bank1_sc_xbar_ch_id_i      (bank1_sc_xbar_ch_id[1:0]      ),
    .bank1_sc_xbar_rob_num_i    (bank1_sc_xbar_rob_num[2:0]    ),
    .bank1_sc_xbar_data_i       (bank1_sc_xbar_data[127:0]     ),
    // bank 2
    .xbar_bank2_htu_valid_o     (xbar_bank2_htu_valid          ),
    .xbar_bank2_htu_allowIn_i   (xbar_bank2_htu_allowIn        ),
    .xbar_bank2_htu_ch_id_o     (xbar_bank2_htu_ch_id[1:0]     ),
    .xbar_bank2_htu_opcode_o    (xbar_bank2_htu_opcode[1:0]    ),
    .xbar_bank2_htu_addr_o      (xbar_bank2_htu_addr[31:4]     ),
    .xbar_bank2_htu_data_o      (xbar_bank2_htu_data[127:0]    ),
    .xbar_bank2_htu_wbuffer_id_o(xbar_bank2_htu_wbuffer_id[7:0]),
    .bank2_sc_xbar_valid_i      (bank2_sc_xbar_valid           ),
    .bank2_sc_xbar_ch_id_i      (bank2_sc_xbar_ch_id[1:0]      ),
    .bank2_sc_xbar_rob_num_i    (bank2_sc_xbar_rob_num[2:0]    ),
    .bank2_sc_xbar_data_i       (bank2_sc_xbar_data[127:0]     ),
    // bank 3
    .xbar_bank3_htu_valid_o     (xbar_bank3_htu_valid          ),
    .xbar_bank3_htu_allowIn_i   (xbar_bank3_htu_allowIn        ),
    .xbar_bank3_htu_ch_id_o     (xbar_bank3_htu_ch_id[1:0]     ),
    .xbar_bank3_htu_opcode_o    (xbar_bank3_htu_opcode[1:0]    ),
    .xbar_bank3_htu_addr_o      (xbar_bank3_htu_addr[31:4]     ),
    .xbar_bank3_htu_data_o      (xbar_bank3_htu_data[127:0]    ),
    .xbar_bank3_htu_wbuffer_id_o(xbar_bank3_htu_wbuffer_id[7:0]),
    .bank3_sc_xbar_valid_i      (bank3_sc_xbar_valid           ),
    .bank3_sc_xbar_ch_id_i      (bank3_sc_xbar_ch_id[1:0]      ),
    .bank3_sc_xbar_rob_num_i    (bank3_sc_xbar_rob_num[2:0]    ),
    .bank3_sc_xbar_data_i       (bank3_sc_xbar_data[127:0]     ),
    .bank0_channel_spw_pop_o    (bank0_spw_buffer_pop[2:0]     ),
    .bank1_channel_spw_pop_o    (bank1_spw_buffer_pop[2:0]     ),
    .bank2_channel_spw_pop_o    (bank2_spw_buffer_pop[2:0]     ),
    .bank3_channel_spw_pop_o    (bank3_spw_buffer_pop[2:0]     )
  );

//------------------------------------------------------------------
//                        Bank Wrapper
// Bank0 ~ Bank3
//------------------------------------------------------------------
  bank_top_wrapper
  u_bank_top_wrapper(
    .clk_i                      (clk_i                         ),
    .rst_i                      (rst_i                         ),
    .xbar_bank0_htu_valid_i     (xbar_bank0_htu_valid          ),
    .xbar_bank0_htu_allowIn_o   (xbar_bank0_htu_allowIn        ),
    .xbar_bank0_htu_ch_id_i     (xbar_bank0_htu_ch_id[1:0]     ),
    .xbar_bank0_htu_opcode_i    (xbar_bank0_htu_opcode[1:0]    ),
    .xbar_bank0_htu_addr_i      (xbar_bank0_htu_addr[31:4]     ),
    .xbar_bank0_htu_data_i      (xbar_bank0_htu_data[127:0]    ),
    .xbar_bank0_htu_wbuffer_id_i(xbar_bank0_htu_wbuffer_id[7:0]),
    .bank0_sc_xbar_valid_o      (bank0_sc_xbar_valid           ),
    .bank0_sc_xbar_ch_id_o      (bank0_sc_xbar_ch_id[1:0]      ),
    .bank0_sc_xbar_rob_num_o    (bank0_sc_xbar_rob_num[2:0]    ),
    .bank0_sc_xbar_data_o       (bank0_sc_xbar_data[127:0]     ),
    .xbar_bank1_htu_valid_i     (xbar_bank1_htu_valid          ),
    .xbar_bank1_htu_allowIn_o   (xbar_bank1_htu_allowIn        ),
    .xbar_bank1_htu_ch_id_i     (xbar_bank1_htu_ch_id[1:0]     ),
    .xbar_bank1_htu_opcode_i    (xbar_bank1_htu_opcode[1:0]    ),
    .xbar_bank1_htu_addr_i      (xbar_bank1_htu_addr[31:4]     ),
    .xbar_bank1_htu_data_i      (xbar_bank1_htu_data[127:0]    ),
    .xbar_bank1_htu_wbuffer_id_i(xbar_bank1_htu_wbuffer_id[7:0]),
    .bank1_sc_xbar_valid_o      (bank1_sc_xbar_valid           ),
    .bank1_sc_xbar_ch_id_o      (bank1_sc_xbar_ch_id[1:0]      ),
    .bank1_sc_xbar_rob_num_o    (bank1_sc_xbar_rob_num[2:0]    ),
    .bank1_sc_xbar_data_o       (bank1_sc_xbar_data[127:0]     ),
    .xbar_bank2_htu_valid_i     (xbar_bank2_htu_valid          ),
    .xbar_bank2_htu_allowIn_o   (xbar_bank2_htu_allowIn        ),
    .xbar_bank2_htu_ch_id_i     (xbar_bank2_htu_ch_id[1:0]     ),
    .xbar_bank2_htu_opcode_i    (xbar_bank2_htu_opcode[1:0]    ),
    .xbar_bank2_htu_addr_i      (xbar_bank2_htu_addr[31:4]     ),
    .xbar_bank2_htu_data_i      (xbar_bank2_htu_data[127:0]    ),
    .xbar_bank2_htu_wbuffer_id_i(xbar_bank2_htu_wbuffer_id[7:0]),
    .bank2_sc_xbar_valid_o      (bank2_sc_xbar_valid           ),
    .bank2_sc_xbar_ch_id_o      (bank2_sc_xbar_ch_id[1:0]      ),
    .bank2_sc_xbar_rob_num_o    (bank2_sc_xbar_rob_num[2:0]    ),
    .bank2_sc_xbar_data_o       (bank2_sc_xbar_data[127:0]     ),
    .xbar_bank3_htu_valid_i     (xbar_bank3_htu_valid          ),
    .xbar_bank3_htu_allowIn_o   (xbar_bank3_htu_allowIn        ),
    .xbar_bank3_htu_ch_id_i     (xbar_bank3_htu_ch_id[1:0]     ),
    .xbar_bank3_htu_opcode_i    (xbar_bank3_htu_opcode[1:0]    ),
    .xbar_bank3_htu_addr_i      (xbar_bank3_htu_addr[31:4]     ),
    .xbar_bank3_htu_data_i      (xbar_bank3_htu_data[127:0]    ),
    .xbar_bank3_htu_wbuffer_id_i(xbar_bank3_htu_wbuffer_id[7:0]),
    .bank3_sc_xbar_valid_o      (bank3_sc_xbar_valid           ),
    .bank3_sc_xbar_ch_id_o      (bank3_sc_xbar_ch_id[1:0]      ),
    .bank3_sc_xbar_rob_num_o    (bank3_sc_xbar_rob_num[2:0]    ),
    .bank3_sc_xbar_data_o       (bank3_sc_xbar_data[127:0]     ),
    .bank0_spw_buffer_pop_i     (bank0_spw_buffer_pop[2:0]     ),
    .bank1_spw_buffer_pop_i     (bank1_spw_buffer_pop[2:0]     ),
    .bank2_spw_buffer_pop_i     (bank2_spw_buffer_pop[2:0]     ),
    .bank3_spw_buffer_pop_i     (bank3_spw_buffer_pop[2:0]     ),
    // bank0 AXI3 
    .bank0_biu_axi3_arvalid_o   (bank0_biu_axi3_arvalid_o      ),
    .bank0_biu_axi3_arready_i   (bank0_biu_axi3_arready_i      ),
    .bank0_biu_axi3_arid_o      (bank0_biu_axi3_arid_o[5:0]    ),
    .bank0_biu_axi3_araddr_o    (bank0_biu_axi3_araddr_o[31:0] ),
    .bank0_biu_axi3_arsize_o    (bank0_biu_axi3_arsize_o[2:0]  ),
    .bank0_biu_axi3_arlen_o     (bank0_biu_axi3_arlen_o[3:0]   ),
    .bank0_biu_axi3_arburst_o   (bank0_biu_axi3_arburst_o[1:0] ),
    .bank0_biu_axi3_rvalid_i    (bank0_biu_axi3_rvalid_i       ),
    .bank0_biu_axi3_rready_o    (bank0_biu_axi3_rready_o       ),
    .bank0_biu_axi3_rid_i       (bank0_biu_axi3_rid_i[5:0]     ),
    .bank0_biu_axi3_rdata_i     (bank0_biu_axi3_rdata_i[255:0] ),
    .bank0_biu_axi3_rresp_i     (bank0_biu_axi3_rresp_i[1:0]   ),
    .bank0_biu_axi3_rlast_i     (bank0_biu_axi3_rlast_i        ),
    .bank0_biu_axi3_awvalid_o   (bank0_biu_axi3_awvalid_o      ),
    .bank0_biu_axi3_awready_i   (bank0_biu_axi3_awready_i      ),
    .bank0_biu_axi3_awid_o      (bank0_biu_axi3_awid_o[5:0]    ),
    .bank0_biu_axi3_awaddr_o    (bank0_biu_axi3_awaddr_o[31:0] ),
    .bank0_biu_axi3_awlen_o     (bank0_biu_axi3_awlen_o[3:0]   ),
    .bank0_biu_axi3_awsize_o    (bank0_biu_axi3_awsize_o[2:0]  ),
    .bank0_biu_axi3_awburst_o   (bank0_biu_axi3_awburst_o[1:0] ),
    .bank0_biu_axi3_wvalid_o    (bank0_biu_axi3_wvalid_o       ),
    .bank0_biu_axi3_wready_i    (bank0_biu_axi3_wready_i       ),
    .bank0_biu_axi3_wid_o       (bank0_biu_axi3_wid_o[5:0]     ),
    .bank0_biu_axi3_wdata_o     (bank0_biu_axi3_wdata_o[255:0] ),
    .bank0_biu_axi3_wstrb_o     (bank0_biu_axi3_wstrb_o[31:0]  ),
    .bank0_biu_axi3_wlast_o     (bank0_biu_axi3_wlast_o        ),
    .bank0_biu_axi3_bvalid_i    (bank0_biu_axi3_bvalid_i       ),
    .bank0_biu_axi3_bready_o    (bank0_biu_axi3_bready_o       ),
    .bank0_biu_axi3_bid_i       (bank0_biu_axi3_bid_i[5:0]    ),
    .bank0_biu_axi3_bresp_i     (bank0_biu_axi3_bresp_i[1:0]   ),
    // bank1 AXI3 
    .bank1_biu_axi3_arvalid_o   (bank1_biu_axi3_arvalid_o      ),
    .bank1_biu_axi3_arready_i   (bank1_biu_axi3_arready_i      ),
    .bank1_biu_axi3_arid_o      (bank1_biu_axi3_arid_o[5:0]    ),
    .bank1_biu_axi3_araddr_o    (bank1_biu_axi3_araddr_o[31:0] ),
    .bank1_biu_axi3_arsize_o    (bank1_biu_axi3_arsize_o[2:0]  ),
    .bank1_biu_axi3_arlen_o     (bank1_biu_axi3_arlen_o[3:0]   ),
    .bank1_biu_axi3_arburst_o   (bank1_biu_axi3_arburst_o[1:0] ),
    .bank1_biu_axi3_rvalid_i    (bank1_biu_axi3_rvalid_i       ),
    .bank1_biu_axi3_rready_o    (bank1_biu_axi3_rready_o       ),
    .bank1_biu_axi3_rid_i       (bank1_biu_axi3_rid_i[5:0]     ),
    .bank1_biu_axi3_rdata_i     (bank1_biu_axi3_rdata_i[255:0] ),
    .bank1_biu_axi3_rresp_i     (bank1_biu_axi3_rresp_i[1:0]   ),
    .bank1_biu_axi3_rlast_i     (bank1_biu_axi3_rlast_i        ),
    .bank1_biu_axi3_awvalid_o   (bank1_biu_axi3_awvalid_o      ),
    .bank1_biu_axi3_awready_i   (bank1_biu_axi3_awready_i      ),
    .bank1_biu_axi3_awid_o      (bank1_biu_axi3_awid_o[5:0]    ),
    .bank1_biu_axi3_awaddr_o    (bank1_biu_axi3_awaddr_o[31:0] ),
    .bank1_biu_axi3_awlen_o     (bank1_biu_axi3_awlen_o[3:0]   ),
    .bank1_biu_axi3_awsize_o    (bank1_biu_axi3_awsize_o[2:0]  ),
    .bank1_biu_axi3_awburst_o   (bank1_biu_axi3_awburst_o[1:0] ),
    .bank1_biu_axi3_wvalid_o    (bank1_biu_axi3_wvalid_o       ),
    .bank1_biu_axi3_wready_i    (bank1_biu_axi3_wready_i       ),
    .bank1_biu_axi3_wid_o       (bank1_biu_axi3_wid_o[5:0]     ),
    .bank1_biu_axi3_wdata_o     (bank1_biu_axi3_wdata_o[255:0] ),
    .bank1_biu_axi3_wstrb_o     (bank1_biu_axi3_wstrb_o[31:0]  ),
    .bank1_biu_axi3_wlast_o     (bank1_biu_axi3_wlast_o        ),
    .bank1_biu_axi3_bvalid_i    (bank1_biu_axi3_bvalid_i       ),
    .bank1_biu_axi3_bready_o    (bank1_biu_axi3_bready_o       ),
    .bank1_biu_axi3_bid_i       (bank1_biu_axi3_bid_i[5:0]    ),
    .bank1_biu_axi3_bresp_i     (bank1_biu_axi3_bresp_i[1:0]   ),
    // bank2 AXI3 
    .bank2_biu_axi3_arvalid_o   (bank2_biu_axi3_arvalid_o      ),
    .bank2_biu_axi3_arready_i   (bank2_biu_axi3_arready_i      ),
    .bank2_biu_axi3_arid_o      (bank2_biu_axi3_arid_o[5:0]    ),
    .bank2_biu_axi3_araddr_o    (bank2_biu_axi3_araddr_o[31:0] ),
    .bank2_biu_axi3_arsize_o    (bank2_biu_axi3_arsize_o[2:0]  ),
    .bank2_biu_axi3_arlen_o     (bank2_biu_axi3_arlen_o[3:0]   ),
    .bank2_biu_axi3_arburst_o   (bank2_biu_axi3_arburst_o[1:0] ),
    .bank2_biu_axi3_rvalid_i    (bank2_biu_axi3_rvalid_i       ),
    .bank2_biu_axi3_rready_o    (bank2_biu_axi3_rready_o       ),
    .bank2_biu_axi3_rid_i       (bank2_biu_axi3_rid_i[5:0]     ),
    .bank2_biu_axi3_rdata_i     (bank2_biu_axi3_rdata_i[255:0] ),
    .bank2_biu_axi3_rresp_i     (bank2_biu_axi3_rresp_i[1:0]   ),
    .bank2_biu_axi3_rlast_i     (bank2_biu_axi3_rlast_i        ),
    .bank2_biu_axi3_awvalid_o   (bank2_biu_axi3_awvalid_o      ),
    .bank2_biu_axi3_awready_i   (bank2_biu_axi3_awready_i      ),
    .bank2_biu_axi3_awid_o      (bank2_biu_axi3_awid_o[5:0]    ),
    .bank2_biu_axi3_awaddr_o    (bank2_biu_axi3_awaddr_o[31:0] ),
    .bank2_biu_axi3_awlen_o     (bank2_biu_axi3_awlen_o[3:0]   ),
    .bank2_biu_axi3_awsize_o    (bank2_biu_axi3_awsize_o[2:0]  ),
    .bank2_biu_axi3_awburst_o   (bank2_biu_axi3_awburst_o[1:0] ),
    .bank2_biu_axi3_wvalid_o    (bank2_biu_axi3_wvalid_o       ),
    .bank2_biu_axi3_wready_i    (bank2_biu_axi3_wready_i       ),
    .bank2_biu_axi3_wid_o       (bank2_biu_axi3_wid_o[5:0]     ),
    .bank2_biu_axi3_wdata_o     (bank2_biu_axi3_wdata_o[255:0] ),
    .bank2_biu_axi3_wstrb_o     (bank2_biu_axi3_wstrb_o[31:0]  ),
    .bank2_biu_axi3_wlast_o     (bank2_biu_axi3_wlast_o        ),
    .bank2_biu_axi3_bvalid_i    (bank2_biu_axi3_bvalid_i       ),
    .bank2_biu_axi3_bready_o    (bank2_biu_axi3_bready_o       ),
    .bank2_biu_axi3_bid_i       (bank2_biu_axi3_bid_i[5:0]    ),
    .bank2_biu_axi3_bresp_i     (bank2_biu_axi3_bresp_i[1:0]   ),
    // bank3 AXI3 
    .bank3_biu_axi3_arvalid_o   (bank3_biu_axi3_arvalid_o      ),
    .bank3_biu_axi3_arready_i   (bank3_biu_axi3_arready_i      ),
    .bank3_biu_axi3_arid_o      (bank3_biu_axi3_arid_o[5:0]    ),
    .bank3_biu_axi3_araddr_o    (bank3_biu_axi3_araddr_o[31:0] ),
    .bank3_biu_axi3_arsize_o    (bank3_biu_axi3_arsize_o[2:0]  ),
    .bank3_biu_axi3_arlen_o     (bank3_biu_axi3_arlen_o[3:0]   ),
    .bank3_biu_axi3_arburst_o   (bank3_biu_axi3_arburst_o[1:0] ),
    .bank3_biu_axi3_rvalid_i    (bank3_biu_axi3_rvalid_i       ),
    .bank3_biu_axi3_rready_o    (bank3_biu_axi3_rready_o       ),
    .bank3_biu_axi3_rid_i       (bank3_biu_axi3_rid_i[5:0]     ),
    .bank3_biu_axi3_rdata_i     (bank3_biu_axi3_rdata_i[255:0] ),
    .bank3_biu_axi3_rresp_i     (bank3_biu_axi3_rresp_i[1:0]   ),
    .bank3_biu_axi3_rlast_i     (bank3_biu_axi3_rlast_i        ),
    .bank3_biu_axi3_awvalid_o   (bank3_biu_axi3_awvalid_o      ),
    .bank3_biu_axi3_awready_i   (bank3_biu_axi3_awready_i      ),
    .bank3_biu_axi3_awid_o      (bank3_biu_axi3_awid_o[5:0]    ),
    .bank3_biu_axi3_awaddr_o    (bank3_biu_axi3_awaddr_o[31:0] ),
    .bank3_biu_axi3_awlen_o     (bank3_biu_axi3_awlen_o[3:0]   ),
    .bank3_biu_axi3_awsize_o    (bank3_biu_axi3_awsize_o[2:0]  ),
    .bank3_biu_axi3_awburst_o   (bank3_biu_axi3_awburst_o[1:0] ),
    .bank3_biu_axi3_wvalid_o    (bank3_biu_axi3_wvalid_o       ),
    .bank3_biu_axi3_wready_i    (bank3_biu_axi3_wready_i       ),
    .bank3_biu_axi3_wid_o       (bank3_biu_axi3_wid_o[5:0]     ),
    .bank3_biu_axi3_wdata_o     (bank3_biu_axi3_wdata_o[255:0] ),
    .bank3_biu_axi3_wstrb_o     (bank3_biu_axi3_wstrb_o[31:0]  ),
    .bank3_biu_axi3_wlast_o     (bank3_biu_axi3_wlast_o        ),
    .bank3_biu_axi3_bvalid_i    (bank3_biu_axi3_bvalid_i       ),
    .bank3_biu_axi3_bready_o    (bank3_biu_axi3_bready_o       ),
    .bank3_biu_axi3_bid_i       (bank3_biu_axi3_bid_i[5:0]    ),
    .bank3_biu_axi3_bresp_i     (bank3_biu_axi3_bresp_i[1:0]   )
  );

endmodule