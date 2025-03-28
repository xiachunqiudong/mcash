module bank_top_wrapper(
  input  wire        clk_i,
  input  wire        rst_i,
  // bank0 request
  input  wire        xbar_bank0_htu_valid_i,
  output wire        xbar_bank0_htu_allowIn_o,
  input  wire [1:0]  xbar_bank0_htu_ch_id_i,
  input  wire [1:0]  xbar_bank0_htu_opcode_i,
  input  wire [31:4] xbar_bank0_htu_addr_i,
  input  wire [7:0]  xbar_bank0_htu_wbuffer_id_i,
  // bank1 request
  input  wire        xbar_bank1_htu_valid_i,
  output wire        xbar_bank1_htu_allowIn_o,
  input  wire [1:0]  xbar_bank1_htu_ch_id_i,
  input  wire [1:0]  xbar_bank1_htu_opcode_i,
  input  wire [31:4] xbar_bank1_htu_addr_i,
  input  wire [7:0]  xbar_bank1_htu_wbuffer_id_i,
  // bank2 request
  input  wire        xbar_bank2_htu_valid_i,
  output wire        xbar_bank2_htu_allowIn_o,
  input  wire [1:0]  xbar_bank2_htu_ch_id_i,
  input  wire [1:0]  xbar_bank2_htu_opcode_i,
  input  wire [31:4] xbar_bank2_htu_addr_i,
  input  wire [7:0]  xbar_bank2_htu_wbuffer_id_i,
  // bank3 request
  input  wire        xbar_bank3_htu_valid_i,
  output wire        xbar_bank3_htu_allowIn_o,
  input  wire [1:0]  xbar_bank3_htu_ch_id_i,
  input  wire [1:0]  xbar_bank3_htu_opcode_i,
  input  wire [31:4] xbar_bank3_htu_addr_i,
  input  wire [7:0]  xbar_bank3_htu_wbuffer_id_i,
  // bank0 AXI3 
  output wire         bank0_biu_axi3_arvalid_o,
  input  wire         bank0_biu_axi3_arready_i,
  output wire [7:0]   bank0_biu_axi3_arid_o,
  output wire [31:0]  bank0_biu_axi3_araddr_o,
  output wire [2:0]   bank0_biu_axi3_arsize_o,
  output wire [3:0]   bank0_biu_axi3_arlen_o,
  output wire [1:0]   bank0_biu_axi3_arburst_o,
  input  wire         bank0_biu_axi3_rvalid_i,
  output wire         bank0_biu_axi3_rready_o,
  input  wire [7:0]   bank0_biu_axi3_rid_i,
  input  wire [255:0] bank0_biu_axi3_rdata_i,
  input  wire [1:0]   bank0_biu_axi3_rresp_i,
  input  wire         bank0_biu_axi3_rlast_i,
  output wire         bank0_biu_axi3_awvalid_o,
  input  wire         bank0_biu_axi3_awready_i,
  output wire [7:0]   bank0_biu_axi3_wid_o,
  output wire [31:0]  bank0_biu_axi3_awaddr_o,
  output wire [3:0]   bank0_biu_axi3_awlen_o,
  output wire [2:0]   bank0_biu_axi3_awsize_o,
  output wire [1:0]   bank0_biu_axi3_awburst_o,
  output wire         bank0_biu_axi3_wvalid_o,
  input  wire         bank0_biu_axi3_wready_i,
  output wire [255:0] bank0_biu_axi3_wdata_o,
  output wire [31:0]  bank0_biu_axi3_wstrb_o,
  output wire         bank0_biu_axi3_wlast_o,
  input  wire         bank0_biu_axi3_bvalid_i,
  output wire         bank0_biu_axi3_bready_o,
  input  wire [7:0]   bank0_biu_axi3_bid_i,
  input  wire [1:0]   bank0_biu_axi3_bresp_i,
  // bank1 AXI3 
  output wire         bank1_biu_axi3_arvalid_o,
  input  wire         bank1_biu_axi3_arready_i,
  output wire [7:0]   bank1_biu_axi3_arid_o,
  output wire [31:0]  bank1_biu_axi3_araddr_o,
  output wire [2:0]   bank1_biu_axi3_arsize_o,
  output wire [3:0]   bank1_biu_axi3_arlen_o,
  output wire [1:0]   bank1_biu_axi3_arburst_o,
  input  wire         bank1_biu_axi3_rvalid_i,
  output wire         bank1_biu_axi3_rready_o,
  input  wire [7:0]   bank1_biu_axi3_rid_i,
  input  wire [255:0] bank1_biu_axi3_rdata_i,
  input  wire [1:0]   bank1_biu_axi3_rresp_i,
  input  wire         bank1_biu_axi3_rlast_i,
  output wire         bank1_biu_axi3_awvalid_o,
  input  wire         bank1_biu_axi3_awready_i,
  output wire [7:0]   bank1_biu_axi3_wid_o,
  output wire [31:0]  bank1_biu_axi3_awaddr_o,
  output wire [3:0]   bank1_biu_axi3_awlen_o,
  output wire [2:0]   bank1_biu_axi3_awsize_o,
  output wire [1:0]   bank1_biu_axi3_awburst_o,
  output wire         bank1_biu_axi3_wvalid_o,
  input  wire         bank1_biu_axi3_wready_i,
  output wire [255:0] bank1_biu_axi3_wdata_o,
  output wire [31:0]  bank1_biu_axi3_wstrb_o,
  output wire         bank1_biu_axi3_wlast_o,
  input  wire         bank1_biu_axi3_bvalid_i,
  output wire         bank1_biu_axi3_bready_o,
  input  wire [7:0]   bank1_biu_axi3_bid_i,
  input  wire [1:0]   bank1_biu_axi3_bresp_i,
  // bank2 AXI3 
  output wire         bank2_biu_axi3_arvalid_o,
  input  wire         bank2_biu_axi3_arready_i,
  output wire [7:0]   bank2_biu_axi3_arid_o,
  output wire [31:0]  bank2_biu_axi3_araddr_o,
  output wire [2:0]   bank2_biu_axi3_arsize_o,
  output wire [3:0]   bank2_biu_axi3_arlen_o,
  output wire [1:0]   bank2_biu_axi3_arburst_o,
  input  wire         bank2_biu_axi3_rvalid_i,
  output wire         bank2_biu_axi3_rready_o,
  input  wire [7:0]   bank2_biu_axi3_rid_i,
  input  wire [255:0] bank2_biu_axi3_rdata_i,
  input  wire [1:0]   bank2_biu_axi3_rresp_i,
  input  wire         bank2_biu_axi3_rlast_i,
  output wire         bank2_biu_axi3_awvalid_o,
  input  wire         bank2_biu_axi3_awready_i,
  output wire [7:0]   bank2_biu_axi3_wid_o,
  output wire [31:0]  bank2_biu_axi3_awaddr_o,
  output wire [3:0]   bank2_biu_axi3_awlen_o,
  output wire [2:0]   bank2_biu_axi3_awsize_o,
  output wire [1:0]   bank2_biu_axi3_awburst_o,
  output wire         bank2_biu_axi3_wvalid_o,
  input  wire         bank2_biu_axi3_wready_i,
  output wire [255:0] bank2_biu_axi3_wdata_o,
  output wire [31:0]  bank2_biu_axi3_wstrb_o,
  output wire         bank2_biu_axi3_wlast_o,
  input  wire         bank2_biu_axi3_bvalid_i,
  output wire         bank2_biu_axi3_bready_o,
  input  wire [7:0]   bank2_biu_axi3_bid_i,
  input  wire [1:0]   bank2_biu_axi3_bresp_i,
  // bank3 AXI3 
  output wire         bank3_biu_axi3_arvalid_o,
  input  wire         bank3_biu_axi3_arready_i,
  output wire [7:0]   bank3_biu_axi3_arid_o,
  output wire [31:0]  bank3_biu_axi3_araddr_o,
  output wire [2:0]   bank3_biu_axi3_arsize_o,
  output wire [3:0]   bank3_biu_axi3_arlen_o,
  output wire [1:0]   bank3_biu_axi3_arburst_o,
  input  wire         bank3_biu_axi3_rvalid_i,
  output wire         bank3_biu_axi3_rready_o,
  input  wire [7:0]   bank3_biu_axi3_rid_i,
  input  wire [255:0] bank3_biu_axi3_rdata_i,
  input  wire [1:0]   bank3_biu_axi3_rresp_i,
  input  wire         bank3_biu_axi3_rlast_i,
  output wire         bank3_biu_axi3_awvalid_o,
  input  wire         bank3_biu_axi3_awready_i,
  output wire [7:0]   bank3_biu_axi3_wid_o,
  output wire [31:0]  bank3_biu_axi3_awaddr_o,
  output wire [3:0]   bank3_biu_axi3_awlen_o,
  output wire [2:0]   bank3_biu_axi3_awsize_o,
  output wire [1:0]   bank3_biu_axi3_awburst_o,
  output wire         bank3_biu_axi3_wvalid_o,
  input  wire         bank3_biu_axi3_wready_i,
  output wire [255:0] bank3_biu_axi3_wdata_o,
  output wire [31:0]  bank3_biu_axi3_wstrb_o,
  output wire         bank3_biu_axi3_wlast_o,
  input  wire         bank3_biu_axi3_bvalid_i,
  output wire         bank3_biu_axi3_bready_o,
  input  wire [7:0]   bank3_biu_axi3_bid_i,
  input  wire [1:0]   bank3_biu_axi3_bresp_i
);

//------------------------------------------------------------------
//                        Bank0 Instance
//------------------------------------------------------------------
  bank_top
  u_bank0_top (
    .clk_i                     (clk_i                           ),
    .rst_i                     (rst_i                           ),
    .xbar_bank_htu_valid_i     (xbar_bank0_htu_valid_i          ),
    .xbar_bank_htu_allowIn_o   (xbar_bank0_htu_allowIn_o        ),
    .xbar_bank_htu_ch_id_i     (xbar_bank0_htu_ch_id_i[1:0]     ),
    .xbar_bank_htu_opcode_i    (xbar_bank0_htu_opcode_i[1:0]    ),
    .xbar_bank_htu_addr_i      (xbar_bank0_htu_addr_i[31:4]     ),
    .xbar_bank_htu_wbuffer_id_i(xbar_bank0_htu_wbuffer_id_i[7:0]),
    .biu_axi3_arvalid_o        (bank0_biu_axi3_arvalid_o        ),
    .biu_axi3_arready_i        (bank0_biu_axi3_arready_i        ),
    .biu_axi3_arid_o           (bank0_biu_axi3_arid_o[7:0]      ),
    .biu_axi3_araddr_o         (bank0_biu_axi3_araddr_o[31:0]   ),
    .biu_axi3_arsize_o         (bank0_biu_axi3_arsize_o[2:0]    ),
    .biu_axi3_arlen_o          (bank0_biu_axi3_arlen_o[3:0]     ),
    .biu_axi3_arburst_o        (bank0_biu_axi3_arburst_o[1:0]   ),
    .biu_axi3_rvalid_i         (bank0_biu_axi3_rvalid_i         ),
    .biu_axi3_rready_o         (bank0_biu_axi3_rready_o         ),
    .biu_axi3_rid_i            (bank0_biu_axi3_rid_i[7:0]       ),
    .biu_axi3_rdata_i          (bank0_biu_axi3_rdata_i[255:0]   ),
    .biu_axi3_rresp_i          (bank0_biu_axi3_rresp_i[1:0]     ),
    .biu_axi3_rlast_i          (bank0_biu_axi3_rlast_i          ),
    .biu_axi3_awvalid_o        (bank0_biu_axi3_awvalid_o        ),
    .biu_axi3_awready_i        (bank0_biu_axi3_awready_i        ),
    .biu_axi3_wid_o            (bank0_biu_axi3_wid_o[7:0]       ),
    .biu_axi3_awaddr_o         (bank0_biu_axi3_awaddr_o[31:0]   ),
    .biu_axi3_awlen_o          (bank0_biu_axi3_awlen_o[3:0]     ),
    .biu_axi3_awsize_o         (bank0_biu_axi3_awsize_o[2:0]    ),
    .biu_axi3_awburst_o        (bank0_biu_axi3_awburst_o[1:0]   ),
    .biu_axi3_wvalid_o         (bank0_biu_axi3_wvalid_o         ),
    .biu_axi3_wready_i         (bank0_biu_axi3_wready_i         ),
    .biu_axi3_wdata_o          (bank0_biu_axi3_wdata_o[255:0]   ),
    .biu_axi3_wstrb_o          (bank0_biu_axi3_wstrb_o[31:0]    ),
    .biu_axi3_wlast_o          (bank0_biu_axi3_wlast_o          ),
    .biu_axi3_bvalid_i         (bank0_biu_axi3_bvalid_i         ),
    .biu_axi3_bready_o         (bank0_biu_axi3_bready_o         ),
    .biu_axi3_bid_i            (bank0_biu_axi3_bid_i[7:0]       ),
    .biu_axi3_bresp_i          (bank0_biu_axi3_bresp_i[1:0]     )
  );

//------------------------------------------------------------------
//                        Bank1 Instance
//------------------------------------------------------------------

//------------------------------------------------------------------
//                        Bank2 Instance
//------------------------------------------------------------------

//------------------------------------------------------------------
//                        Bank3 Instance
//------------------------------------------------------------------

endmodule