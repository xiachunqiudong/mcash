module mcash_tb;

  string fsdb_file;
  string code_file;

  initial begin
    if(!$value$plusargs("FSDB_FILE=%s", fsdb_file)) begin
      fsdb_file = "mcash_tb.fsdb";
    end
    if(!$value$plusargs("CODE_FILE=%s", code_file)) begin
      code_file = "code.hex";
    end
  end

  reg clk;
  reg rst;

  initial begin
    clk = 1'b0;
    rst = 1'b1;
  end

  always begin
    #5 clk = ~clk;
    #5 rst = 1'b0;
  end

  integer i;
  reg [162:0] code_list [99:0];

  initial begin
    i = 0;
    $readmemb(code_file, code_list);
  end

  reg          mcash_ch0_req_valid;
  wire         mcash_ch0_req_allowIn;
  reg  [2:0]   mcash_ch0_req_op;
  reg  [31:4]  mcash_ch0_req_addr;
  reg  [127:0] mcash_ch0_req_data;
  wire         mcash_ch0_rtn_valid;
  reg          mcash_ch0_rtn_ready;
  wire [127:0] mcash_ch0_rtn_data;

  reg          mcash_ch1_req_valid;
  wire         mcash_ch1_req_allowIn;
  reg  [2:0]   mcash_ch1_req_op;
  reg  [31:4]  mcash_ch1_req_addr;
  reg  [127:0] mcash_ch1_req_data;
  wire         mcash_ch1_rtn_valid;
  reg          mcash_ch1_rtn_ready;
  wire [127:0] mcash_ch1_rtn_data;

  reg          mcash_ch2_req_valid;
  wire         mcash_ch2_req_allowIn;
  reg  [2:0]   mcash_ch2_req_op;
  reg  [31:4]  mcash_ch2_req_addr;
  reg  [127:0] mcash_ch2_req_data;
  wire         mcash_ch2_rtn_valid;
  reg          mcash_ch2_rtn_ready;
  wire [127:0] mcash_ch2_rtn_data;

  // bank0 AXI3 
  wire         bank0_biu_axi3_arvalid;
  wire         bank0_biu_axi3_arready;
  wire [7:0]   bank0_biu_axi3_arid;
  wire [31:0]  bank0_biu_axi3_araddr;
  wire [2:0]   bank0_biu_axi3_arsize;
  wire [3:0]   bank0_biu_axi3_arlen;
  wire [1:0]   bank0_biu_axi3_arburst;
  wire         bank0_biu_axi3_rvalid;
  wire         bank0_biu_axi3_rready;
  wire [7:0]   bank0_biu_axi3_rid;
  wire [255:0] bank0_biu_axi3_rdata;
  wire [1:0]   bank0_biu_axi3_rresp;
  wire         bank0_biu_axi3_rlast;
  wire         bank0_biu_axi3_awvalid;
  wire         bank0_biu_axi3_awready;
  wire [7:0]   bank0_biu_axi3_wid;
  wire [31:0]  bank0_biu_axi3_awaddr;
  wire [3:0]   bank0_biu_axi3_awlen;
  wire [2:0]   bank0_biu_axi3_awsize;
  wire [1:0]   bank0_biu_axi3_awburst;
  wire         bank0_biu_axi3_wvalid;
  wire         bank0_biu_axi3_wready;
  wire [255:0] bank0_biu_axi3_wdata;
  wire [31:0]  bank0_biu_axi3_wstrb;
  wire         bank0_biu_axi3_wlast;
  wire         bank0_biu_axi3_bvalid;
  wire         bank0_biu_axi3_bready;
  wire [7:0]   bank0_biu_axi3_bid;
  wire [1:0]   bank0_biu_axi3_bresp;
  // bank1 AXI3 
  wire         bank1_biu_axi3_arvalid;
  wire         bank1_biu_axi3_arready;
  wire [7:0]   bank1_biu_axi3_arid;
  wire [31:0]  bank1_biu_axi3_araddr;
  wire [2:0]   bank1_biu_axi3_arsize;
  wire [3:0]   bank1_biu_axi3_arlen;
  wire [1:0]   bank1_biu_axi3_arburst;
  wire         bank1_biu_axi3_rvalid;
  wire         bank1_biu_axi3_rready;
  wire [7:0]   bank1_biu_axi3_rid;
  wire [255:0] bank1_biu_axi3_rdata;
  wire [1:0]   bank1_biu_axi3_rresp;
  wire         bank1_biu_axi3_rlast;
  wire         bank1_biu_axi3_awvalid;
  wire         bank1_biu_axi3_awready;
  wire [7:0]   bank1_biu_axi3_wid;
  wire [31:0]  bank1_biu_axi3_awaddr;
  wire [3:0]   bank1_biu_axi3_awlen;
  wire [2:0]   bank1_biu_axi3_awsize;
  wire [1:0]   bank1_biu_axi3_awburst;
  wire         bank1_biu_axi3_wvalid;
  wire         bank1_biu_axi3_wready;
  wire [255:0] bank1_biu_axi3_wdata;
  wire [31:0]  bank1_biu_axi3_wstrb;
  wire         bank1_biu_axi3_wlast;
  wire         bank1_biu_axi3_bvalid;
  wire         bank1_biu_axi3_bready;
  wire [7:0]   bank1_biu_axi3_bid;
  wire [1:0]   bank1_biu_axi3_bresp;
  // bank2 AXI3 
  wire         bank2_biu_axi3_arvalid;
  wire         bank2_biu_axi3_arready;
  wire [7:0]   bank2_biu_axi3_arid;
  wire [31:0]  bank2_biu_axi3_araddr;
  wire [2:0]   bank2_biu_axi3_arsize;
  wire [3:0]   bank2_biu_axi3_arlen;
  wire [1:0]   bank2_biu_axi3_arburst;
  wire         bank2_biu_axi3_rvalid;
  wire         bank2_biu_axi3_rready;
  wire [7:0]   bank2_biu_axi3_rid;
  wire [255:0] bank2_biu_axi3_rdata;
  wire [1:0]   bank2_biu_axi3_rresp;
  wire         bank2_biu_axi3_rlast;
  wire         bank2_biu_axi3_awvalid;
  wire         bank2_biu_axi3_awready;
  wire [7:0]   bank2_biu_axi3_wid;
  wire [31:0]  bank2_biu_axi3_awaddr;
  wire [3:0]   bank2_biu_axi3_awlen;
  wire [2:0]   bank2_biu_axi3_awsize;
  wire [1:0]   bank2_biu_axi3_awburst;
  wire         bank2_biu_axi3_wvalid;
  wire         bank2_biu_axi3_wready;
  wire [255:0] bank2_biu_axi3_wdata;
  wire [31:0]  bank2_biu_axi3_wstrb;
  wire         bank2_biu_axi3_wlast;
  wire         bank2_biu_axi3_bvalid;
  wire         bank2_biu_axi3_bready;
  wire [7:0]   bank2_biu_axi3_bid;
  wire [1:0]   bank2_biu_axi3_bresp;
  // bank3 AXI3 
  wire         bank3_biu_axi3_arvalid;
  wire         bank3_biu_axi3_arready;
  wire [7:0]   bank3_biu_axi3_arid;
  wire [31:0]  bank3_biu_axi3_araddr;
  wire [2:0]   bank3_biu_axi3_arsize;
  wire [3:0]   bank3_biu_axi3_arlen;
  wire [1:0]   bank3_biu_axi3_arburst;
  wire         bank3_biu_axi3_rvalid;
  wire         bank3_biu_axi3_rready;
  wire [7:0]   bank3_biu_axi3_rid;
  wire [255:0] bank3_biu_axi3_rdata;
  wire [1:0]   bank3_biu_axi3_rresp;
  wire         bank3_biu_axi3_rlast;
  wire         bank3_biu_axi3_awvalid;
  wire         bank3_biu_axi3_awready;
  wire [7:0]   bank3_biu_axi3_wid;
  wire [31:0]  bank3_biu_axi3_awaddr;
  wire [3:0]   bank3_biu_axi3_awlen;
  wire [2:0]   bank3_biu_axi3_awsize;
  wire [1:0]   bank3_biu_axi3_awburst;
  wire         bank3_biu_axi3_wvalid;
  wire         bank3_biu_axi3_wready;
  wire [255:0] bank3_biu_axi3_wdata;
  wire [31:0]  bank3_biu_axi3_wstrb;
  wire         bank3_biu_axi3_wlast;
  wire         bank3_biu_axi3_bvalid;
  wire         bank3_biu_axi3_bready;
  wire [7:0]   bank3_biu_axi3_bid;
  wire [1:0]   bank3_biu_axi3_bresp;

  initial begin
    mcash_ch0_req_valid = 1'b1;
    mcash_ch0_req_addr = 28'b0;
    mcash_ch1_req_valid = 1'b0;
    mcash_ch1_req_addr = 28'b0;
    mcash_ch2_req_valid = 1'b0;
    mcash_ch2_req_addr = 28'b0;
  end

  always @(posedge clk) begin
    if (mcash_ch0_req_valid & mcash_ch0_req_allowIn) begin
      mcash_ch0_req_op[2:0]     <= code_list[i][162:160];
      mcash_ch0_req_data[127:0] <= code_list[i][159:32];
      mcash_ch0_req_addr[31:4]  <= code_list[i][31:4];
      i++;
    end
    if (mcash_ch1_req_valid & mcash_ch1_req_allowIn) begin
      mcash_ch1_req_addr[31:4] <= 28'b10;
    end
    if (mcash_ch2_req_valid & mcash_ch2_req_allowIn) begin
      mcash_ch2_req_addr[31:4] <= 28'b10;
    end
  end


  mcash_top
  u_mcash_top(
    .clk_i                   (clk                      ),
    .rst_i                   (rst                      ),
    // channel0
    .mcash_ch0_req_valid_i   (mcash_ch0_req_valid      ),
    .mcash_ch0_req_allowIn_o (mcash_ch0_req_allowIn    ),
    .mcash_ch0_req_op_i      (mcash_ch0_req_op[2:0]    ),
    .mcash_ch0_req_addr_i    (mcash_ch0_req_addr[31:4] ),
    .mcash_ch0_req_data_i    (mcash_ch0_req_data[127:0]),
    .mcash_ch0_rtn_valid_o   (mcash_ch0_rtn_valid      ),
    .mcash_ch0_rtn_ready_i   (mcash_ch0_rtn_ready      ),
    .mcash_ch0_rtn_data_o    (mcash_ch0_rtn_data[127:0]),
    // channel1
    .mcash_ch1_req_valid_i   (mcash_ch1_req_valid      ),
    .mcash_ch1_req_allowIn_o (mcash_ch1_req_allowIn    ),
    .mcash_ch1_req_op_i      (mcash_ch1_req_op[2:0]    ),
    .mcash_ch1_req_addr_i    (mcash_ch1_req_addr[31:4] ),
    .mcash_ch1_req_data_i    (mcash_ch1_req_data[127:0]),
    .mcash_ch1_rtn_valid_o   (mcash_ch1_rtn_valid      ),
    .mcash_ch1_rtn_ready_i   (mcash_ch1_rtn_ready      ),
    .mcash_ch1_rtn_data_o    (mcash_ch1_rtn_data[127:0]),
    // channel2
    .mcash_ch2_req_valid_i   (mcash_ch2_req_valid      ),
    .mcash_ch2_req_allowIn_o (mcash_ch2_req_allowIn    ),
    .mcash_ch2_req_op_i      (mcash_ch2_req_op[2:0]    ),
    .mcash_ch2_req_addr_i    (mcash_ch2_req_addr[31:4] ),
    .mcash_ch2_req_data_i    (mcash_ch2_req_data[127:0]),
    .mcash_ch2_rtn_valid_o   (mcash_ch2_rtn_valid      ),
    .mcash_ch2_rtn_ready_i   (mcash_ch2_rtn_ready      ),
    .mcash_ch2_rtn_data_o    (mcash_ch2_rtn_data[127:0]),
    // bank0 AXI3 
    .bank0_biu_axi3_arvalid_o(bank0_biu_axi3_arvalid      ),
    .bank0_biu_axi3_arready_i(bank0_biu_axi3_arready      ),
    .bank0_biu_axi3_arid_o   (bank0_biu_axi3_arid[7:0]    ),
    .bank0_biu_axi3_araddr_o (bank0_biu_axi3_araddr[31:0] ),
    .bank0_biu_axi3_arsize_o (bank0_biu_axi3_arsize[2:0]  ),
    .bank0_biu_axi3_arlen_o  (bank0_biu_axi3_arlen[3:0]   ),
    .bank0_biu_axi3_arburst_o(bank0_biu_axi3_arburst[1:0] ),
    .bank0_biu_axi3_rvalid_i (bank0_biu_axi3_rvalid       ),
    .bank0_biu_axi3_rready_o (bank0_biu_axi3_rready       ),
    .bank0_biu_axi3_rid_i    (bank0_biu_axi3_rid[7:0]     ),
    .bank0_biu_axi3_rdata_i  (bank0_biu_axi3_rdata[255:0] ),
    .bank0_biu_axi3_rresp_i  (bank0_biu_axi3_rresp[1:0]   ),
    .bank0_biu_axi3_rlast_i  (bank0_biu_axi3_rlast        ),
    .bank0_biu_axi3_awvalid_o(bank0_biu_axi3_awvalid      ),
    .bank0_biu_axi3_awready_i(bank0_biu_axi3_awready      ),
    .bank0_biu_axi3_wid_o    (bank0_biu_axi3_wid[7:0]     ),
    .bank0_biu_axi3_awaddr_o (bank0_biu_axi3_awaddr[31:0] ),
    .bank0_biu_axi3_awlen_o  (bank0_biu_axi3_awlen[3:0]   ),
    .bank0_biu_axi3_awsize_o (bank0_biu_axi3_awsize[2:0]  ),
    .bank0_biu_axi3_awburst_o(bank0_biu_axi3_awburst[1:0] ),
    .bank0_biu_axi3_wvalid_o (bank0_biu_axi3_wvalid       ),
    .bank0_biu_axi3_wready_i (bank0_biu_axi3_wready       ),
    .bank0_biu_axi3_wdata_o  (bank0_biu_axi3_wdata[255:0] ),
    .bank0_biu_axi3_wstrb_o  (bank0_biu_axi3_wstrb[31:0]  ),
    .bank0_biu_axi3_wlast_o  (bank0_biu_axi3_wlast        ),
    .bank0_biu_axi3_bvalid_i (bank0_biu_axi3_bvalid       ),
    .bank0_biu_axi3_bready_o (bank0_biu_axi3_bready       ),
    .bank0_biu_axi3_bid_i    (bank0_biu_axi3_bid[7:0]     ),
    .bank0_biu_axi3_bresp_i  (bank0_biu_axi3_bresp[1:0]   ),
    // bank1 AXI3 
    .bank1_biu_axi3_arvalid_o(bank1_biu_axi3_arvalid      ),
    .bank1_biu_axi3_arready_i(bank1_biu_axi3_arready      ),
    .bank1_biu_axi3_arid_o   (bank1_biu_axi3_arid[7:0]    ),
    .bank1_biu_axi3_araddr_o (bank1_biu_axi3_araddr[31:0] ),
    .bank1_biu_axi3_arsize_o (bank1_biu_axi3_arsize[2:0]  ),
    .bank1_biu_axi3_arlen_o  (bank1_biu_axi3_arlen[3:0]   ),
    .bank1_biu_axi3_arburst_o(bank1_biu_axi3_arburst[1:0] ),
    .bank1_biu_axi3_rvalid_i (bank1_biu_axi3_rvalid       ),
    .bank1_biu_axi3_rready_o (bank1_biu_axi3_rready       ),
    .bank1_biu_axi3_rid_i    (bank1_biu_axi3_rid[7:0]     ),
    .bank1_biu_axi3_rdata_i  (bank1_biu_axi3_rdata[255:0] ),
    .bank1_biu_axi3_rresp_i  (bank1_biu_axi3_rresp[1:0]   ),
    .bank1_biu_axi3_rlast_i  (bank1_biu_axi3_rlast        ),
    .bank1_biu_axi3_awvalid_o(bank1_biu_axi3_awvalid      ),
    .bank1_biu_axi3_awready_i(bank1_biu_axi3_awready      ),
    .bank1_biu_axi3_wid_o    (bank1_biu_axi3_wid[7:0]     ),
    .bank1_biu_axi3_awaddr_o (bank1_biu_axi3_awaddr[31:0] ),
    .bank1_biu_axi3_awlen_o  (bank1_biu_axi3_awlen[3:0]   ),
    .bank1_biu_axi3_awsize_o (bank1_biu_axi3_awsize[2:0]  ),
    .bank1_biu_axi3_awburst_o(bank1_biu_axi3_awburst[1:0] ),
    .bank1_biu_axi3_wvalid_o (bank1_biu_axi3_wvalid       ),
    .bank1_biu_axi3_wready_i (bank1_biu_axi3_wready       ),
    .bank1_biu_axi3_wdata_o  (bank1_biu_axi3_wdata[255:0] ),
    .bank1_biu_axi3_wstrb_o  (bank1_biu_axi3_wstrb[31:0]  ),
    .bank1_biu_axi3_wlast_o  (bank1_biu_axi3_wlast        ),
    .bank1_biu_axi3_bvalid_i (bank1_biu_axi3_bvalid       ),
    .bank1_biu_axi3_bready_o (bank1_biu_axi3_bready       ),
    .bank1_biu_axi3_bid_i    (bank1_biu_axi3_bid[7:0]     ),
    .bank1_biu_axi3_bresp_i  (bank1_biu_axi3_bresp[1:0]   ),
    // bank2 AXI3 
    .bank2_biu_axi3_arvalid_o(bank2_biu_axi3_arvalid      ),
    .bank2_biu_axi3_arready_i(bank2_biu_axi3_arready      ),
    .bank2_biu_axi3_arid_o   (bank2_biu_axi3_arid[7:0]    ),
    .bank2_biu_axi3_araddr_o (bank2_biu_axi3_araddr[31:0] ),
    .bank2_biu_axi3_arsize_o (bank2_biu_axi3_arsize[2:0]  ),
    .bank2_biu_axi3_arlen_o  (bank2_biu_axi3_arlen[3:0]   ),
    .bank2_biu_axi3_arburst_o(bank2_biu_axi3_arburst[1:0] ),
    .bank2_biu_axi3_rvalid_i (bank2_biu_axi3_rvalid       ),
    .bank2_biu_axi3_rready_o (bank2_biu_axi3_rready       ),
    .bank2_biu_axi3_rid_i    (bank2_biu_axi3_rid[7:0]     ),
    .bank2_biu_axi3_rdata_i  (bank2_biu_axi3_rdata[255:0] ),
    .bank2_biu_axi3_rresp_i  (bank2_biu_axi3_rresp[1:0]   ),
    .bank2_biu_axi3_rlast_i  (bank2_biu_axi3_rlast        ),
    .bank2_biu_axi3_awvalid_o(bank2_biu_axi3_awvalid      ),
    .bank2_biu_axi3_awready_i(bank2_biu_axi3_awready      ),
    .bank2_biu_axi3_wid_o    (bank2_biu_axi3_wid[7:0]     ),
    .bank2_biu_axi3_awaddr_o (bank2_biu_axi3_awaddr[31:0] ),
    .bank2_biu_axi3_awlen_o  (bank2_biu_axi3_awlen[3:0]   ),
    .bank2_biu_axi3_awsize_o (bank2_biu_axi3_awsize[2:0]  ),
    .bank2_biu_axi3_awburst_o(bank2_biu_axi3_awburst[1:0] ),
    .bank2_biu_axi3_wvalid_o (bank2_biu_axi3_wvalid       ),
    .bank2_biu_axi3_wready_i (bank2_biu_axi3_wready       ),
    .bank2_biu_axi3_wdata_o  (bank2_biu_axi3_wdata[255:0] ),
    .bank2_biu_axi3_wstrb_o  (bank2_biu_axi3_wstrb[31:0]  ),
    .bank2_biu_axi3_wlast_o  (bank2_biu_axi3_wlast        ),
    .bank2_biu_axi3_bvalid_i (bank2_biu_axi3_bvalid       ),
    .bank2_biu_axi3_bready_o (bank2_biu_axi3_bready       ),
    .bank2_biu_axi3_bid_i    (bank2_biu_axi3_bid[7:0]     ),
    .bank2_biu_axi3_bresp_i  (bank2_biu_axi3_bresp[1:0]   ),
    // bank3 AXI3 
    .bank3_biu_axi3_arvalid_o(bank3_biu_axi3_arvalid      ),
    .bank3_biu_axi3_arready_i(bank3_biu_axi3_arready      ),
    .bank3_biu_axi3_arid_o   (bank3_biu_axi3_arid[7:0]    ),
    .bank3_biu_axi3_araddr_o (bank3_biu_axi3_araddr[31:0] ),
    .bank3_biu_axi3_arsize_o (bank3_biu_axi3_arsize[2:0]  ),
    .bank3_biu_axi3_arlen_o  (bank3_biu_axi3_arlen[3:0]   ),
    .bank3_biu_axi3_arburst_o(bank3_biu_axi3_arburst[1:0] ),
    .bank3_biu_axi3_rvalid_i (bank3_biu_axi3_rvalid       ),
    .bank3_biu_axi3_rready_o (bank3_biu_axi3_rready       ),
    .bank3_biu_axi3_rid_i    (bank3_biu_axi3_rid[7:0]     ),
    .bank3_biu_axi3_rdata_i  (bank3_biu_axi3_rdata[255:0] ),
    .bank3_biu_axi3_rresp_i  (bank3_biu_axi3_rresp[1:0]   ),
    .bank3_biu_axi3_rlast_i  (bank3_biu_axi3_rlast        ),
    .bank3_biu_axi3_awvalid_o(bank3_biu_axi3_awvalid      ),
    .bank3_biu_axi3_awready_i(bank3_biu_axi3_awready      ),
    .bank3_biu_axi3_wid_o    (bank3_biu_axi3_wid[7:0]     ),
    .bank3_biu_axi3_awaddr_o (bank3_biu_axi3_awaddr[31:0] ),
    .bank3_biu_axi3_awlen_o  (bank3_biu_axi3_awlen[3:0]   ),
    .bank3_biu_axi3_awsize_o (bank3_biu_axi3_awsize[2:0]  ),
    .bank3_biu_axi3_awburst_o(bank3_biu_axi3_awburst[1:0] ),
    .bank3_biu_axi3_wvalid_o (bank3_biu_axi3_wvalid       ),
    .bank3_biu_axi3_wready_i (bank3_biu_axi3_wready       ),
    .bank3_biu_axi3_wdata_o  (bank3_biu_axi3_wdata[255:0] ),
    .bank3_biu_axi3_wstrb_o  (bank3_biu_axi3_wstrb[31:0]  ),
    .bank3_biu_axi3_wlast_o  (bank3_biu_axi3_wlast        ),
    .bank3_biu_axi3_bvalid_i (bank3_biu_axi3_bvalid       ),
    .bank3_biu_axi3_bready_o (bank3_biu_axi3_bready       ),
    .bank3_biu_axi3_bid_i    (bank3_biu_axi3_bid[7:0]     ),
    .bank3_biu_axi3_bresp_i  (bank3_biu_axi3_bresp[1:0]   )
  );

  initial begin
    $fsdbDumpfile(fsdb_file);
    $fsdbDumpvars(0, mcash_tb);
    $fsdbDumpvars("+struct");
    $fsdbDumpvars("+mda");
    $fsdbDumpon;
    #10000
    $fsdbDumpoff;
    $finish;
  end

endmodule

bind mcash_tb mcash_dumper u_mcash_dumper(clk);
