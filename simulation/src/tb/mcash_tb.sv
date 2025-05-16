module mcash_tb;
  parameter NUM_MASTER = 4;                   // should not be changed
  parameter NUM_SLAVE  = 4;                   // should not be changed
  parameter WIDTH_CID  = $clog2(NUM_MASTER);  // Channel ID width in bits
  parameter WIDTH_ID   = 6;                   // ID width in bits
  parameter WIDTH_AD   = 32;                  // address width
  parameter WIDTH_DA   = 256;                 // data width
  parameter WIDTH_DS   =(WIDTH_DA/8);         // data strobe width
  parameter WIDTH_SID  =(WIDTH_CID+WIDTH_ID); // ID for slave

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
  parameter N = 100;

  reg [163:0] code_list [N-1:0];

  initial begin
    i = 0;
    $readmemb(code_file, code_list);
  end

  reg [63:0] cycle_cnt_Q;

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      cycle_cnt_Q <= 'd0;
    end
    else begin
      cycle_cnt_Q <= cycle_cnt_Q + 'd1;
    end
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
  wire                 bank0_biu_axi3_arvalid;
  wire                 bank0_biu_axi3_arready;
  wire [5:0]           bank0_biu_axi3_arid;
  wire [31:0]          bank0_biu_axi3_araddr;
  wire [2:0]           bank0_biu_axi3_arsize;
  wire [3:0]           bank0_biu_axi3_arlen;
  wire [1:0]           bank0_biu_axi3_arburst;
  wire                 bank0_biu_axi3_rvalid;
  wire                 bank0_biu_axi3_rready;
  wire [5:0]           bank0_biu_axi3_rid;
  wire [255:0]         bank0_biu_axi3_rdata;
  wire [1:0]           bank0_biu_axi3_rresp;
  wire                 bank0_biu_axi3_rlast;
  wire                 bank0_biu_axi3_awvalid;
  wire                 bank0_biu_axi3_awready;
  wire [5:0]           bank0_biu_axi3_awid;
  wire [31:0]          bank0_biu_axi3_awaddr;
  wire [3:0]           bank0_biu_axi3_awlen;
  wire [2:0]           bank0_biu_axi3_awsize;
  wire [1:0]           bank0_biu_axi3_awburst;
  wire                 bank0_biu_axi3_wvalid;
  wire                 bank0_biu_axi3_wready;
  wire [5:0]           bank0_biu_axi3_wid;
  wire [255:0]         bank0_biu_axi3_wdata;
  wire [31:0]          bank0_biu_axi3_wstrb;
  wire                 bank0_biu_axi3_wlast;
  wire                 bank0_biu_axi3_bvalid;
  wire                 bank0_biu_axi3_bready;
  wire [5:0]           bank0_biu_axi3_bid;
  wire [1:0]           bank0_biu_axi3_bresp;
  // bank1 AXI3 
  wire                 bank1_biu_axi3_arvalid;
  wire                 bank1_biu_axi3_arready;
  wire [5:0]           bank1_biu_axi3_arid;
  wire [31:0]          bank1_biu_axi3_araddr;
  wire [2:0]           bank1_biu_axi3_arsize;
  wire [3:0]           bank1_biu_axi3_arlen;
  wire [1:0]           bank1_biu_axi3_arburst;
  wire                 bank1_biu_axi3_rvalid;
  wire                 bank1_biu_axi3_rready;
  wire [5:0]           bank1_biu_axi3_rid;
  wire [255:0]         bank1_biu_axi3_rdata;
  wire [1:0]           bank1_biu_axi3_rresp;
  wire                 bank1_biu_axi3_rlast;
  wire                 bank1_biu_axi3_awvalid;
  wire                 bank1_biu_axi3_awready;
  wire [5:0]           bank1_biu_axi3_awid;
  wire [31:0]          bank1_biu_axi3_awaddr;
  wire [3:0]           bank1_biu_axi3_awlen;
  wire [2:0]           bank1_biu_axi3_awsize;
  wire [1:0]           bank1_biu_axi3_awburst;
  wire                 bank1_biu_axi3_wvalid;
  wire                 bank1_biu_axi3_wready;
  wire [5:0]           bank1_biu_axi3_wid;
  wire [255:0]         bank1_biu_axi3_wdata;
  wire [31:0]          bank1_biu_axi3_wstrb;
  wire                 bank1_biu_axi3_wlast;
  wire                 bank1_biu_axi3_bvalid;
  wire                 bank1_biu_axi3_bready;
  wire [5:0]           bank1_biu_axi3_bid;
  wire [1:0]           bank1_biu_axi3_bresp;
  // bank2 AXI3 
  wire                 bank2_biu_axi3_arvalid;
  wire                 bank2_biu_axi3_arready;
  wire [5:0]           bank2_biu_axi3_arid;
  wire [31:0]          bank2_biu_axi3_araddr;
  wire [2:0]           bank2_biu_axi3_arsize;
  wire [3:0]           bank2_biu_axi3_arlen;
  wire [1:0]           bank2_biu_axi3_arburst;
  wire                 bank2_biu_axi3_rvalid;
  wire                 bank2_biu_axi3_rready;
  wire [5:0]           bank2_biu_axi3_rid;
  wire [255:0]         bank2_biu_axi3_rdata;
  wire [1:0]           bank2_biu_axi3_rresp;
  wire                 bank2_biu_axi3_rlast;
  wire                 bank2_biu_axi3_awvalid;
  wire                 bank2_biu_axi3_awready;
  wire [5:0]           bank2_biu_axi3_awid;
  wire [31:0]          bank2_biu_axi3_awaddr;
  wire [3:0]           bank2_biu_axi3_awlen;
  wire [2:0]           bank2_biu_axi3_awsize;
  wire [1:0]           bank2_biu_axi3_awburst;
  wire                 bank2_biu_axi3_wvalid;
  wire                 bank2_biu_axi3_wready;
  wire [5:0]           bank2_biu_axi3_wid;
  wire [255:0]         bank2_biu_axi3_wdata;
  wire [31:0]          bank2_biu_axi3_wstrb;
  wire                 bank2_biu_axi3_wlast;
  wire                 bank2_biu_axi3_bvalid;
  wire                 bank2_biu_axi3_bready;
  wire [5:0]           bank2_biu_axi3_bid;
  wire [1:0]           bank2_biu_axi3_bresp;
  // bank3 AXI3
  wire                 bank3_biu_axi3_arvalid;
  wire                 bank3_biu_axi3_arready;
  wire [5:0]           bank3_biu_axi3_arid;
  wire [31:0]          bank3_biu_axi3_araddr;
  wire [2:0]           bank3_biu_axi3_arsize;
  wire [3:0]           bank3_biu_axi3_arlen;
  wire [1:0]           bank3_biu_axi3_arburst;
  wire                 bank3_biu_axi3_rvalid;
  wire                 bank3_biu_axi3_rready;
  wire [5:0]           bank3_biu_axi3_rid;
  wire [255:0]         bank3_biu_axi3_rdata;
  wire [1:0]           bank3_biu_axi3_rresp;
  wire                 bank3_biu_axi3_rlast;
  wire                 bank3_biu_axi3_awvalid;
  wire                 bank3_biu_axi3_awready;
  wire [5:0]           bank3_biu_axi3_awid;
  wire [31:0]          bank3_biu_axi3_awaddr;
  wire [3:0]           bank3_biu_axi3_awlen;
  wire [2:0]           bank3_biu_axi3_awsize;
  wire [1:0]           bank3_biu_axi3_awburst;
  wire                 bank3_biu_axi3_wvalid;
  wire                 bank3_biu_axi3_wready;
  wire [5:0]           bank3_biu_axi3_wid;
  wire [255:0]         bank3_biu_axi3_wdata;
  wire [31:0]          bank3_biu_axi3_wstrb;
  wire                 bank3_biu_axi3_wlast;
  wire                 bank3_biu_axi3_bvalid;
  wire                 bank3_biu_axi3_bready;
  wire [5:0]           bank3_biu_axi3_bid;
  wire [1:0]           bank3_biu_axi3_bresp;
  //----------------------------------
  wire                 S0_axi3_awvalid;
  wire                 S0_axi3_awready;
  wire [WIDTH_SID-1:0] S0_axi3_awid;
  wire [31:0]          S0_axi3_awaddr;
  wire [3:0]           S0_axi3_awlen;
  wire [2:0]           S0_axi3_awsize;
  wire [1:0]           S0_axi3_awburst;
  wire                 S0_axi3_wvalid;
  wire                 S0_axi3_wready;
  wire [WIDTH_SID-1:0] S0_axi3_wid;
  wire [255:0]         S0_axi3_wdata;
  wire [31:0]          S0_axi3_wstrb;
  wire                 S0_axi3_wlast;
  wire                 S0_axi3_bvalid;
  wire                 S0_axi3_bready;
  wire [WIDTH_SID-1:0] S0_axi3_bid;
  wire [1:0]           S0_axi3_bresp;
  wire                 S0_axi3_arvalid;
  wire                 S0_axi3_arready;
  wire [WIDTH_SID-1:0] S0_axi3_arid;
  wire [31:0]          S0_axi3_araddr;
  wire [2:0]           S0_axi3_arsize;
  wire [3:0]           S0_axi3_arlen;
  wire [1:0]           S0_axi3_arburst;
  wire                 S0_axi3_rvalid;
  wire                 S0_axi3_rready;
  wire [WIDTH_SID-1:0] S0_axi3_rid;
  wire [255:0]         S0_axi3_rdata;
  wire [1:0]           S0_axi3_rresp;
  wire                 S0_axi3_rlast;
  //----------------------------------
  wire                 S1_axi3_awvalid;
  wire                 S1_axi3_awready;
  wire [WIDTH_SID-1:0] S1_axi3_awid;
  wire [31:0]          S1_axi3_awaddr;
  wire [3:0]           S1_axi3_awlen;
  wire [2:0]           S1_axi3_awsize;
  wire [1:0]           S1_axi3_awburst;
  wire                 S1_axi3_wvalid;
  wire                 S1_axi3_wready;
  wire [WIDTH_SID-1:0] S1_axi3_wid;
  wire [255:0]         S1_axi3_wdata;
  wire [31:0]          S1_axi3_wstrb;
  wire                 S1_axi3_wlast;
  wire                 S1_axi3_bvalid;
  wire                 S1_axi3_bready;
  wire [WIDTH_SID-1:0] S1_axi3_bid;
  wire [1:0]           S1_axi3_bresp;
  wire                 S1_axi3_arvalid;
  wire                 S1_axi3_arready;
  wire [WIDTH_SID-1:0] S1_axi3_arid;
  wire [31:0]          S1_axi3_araddr;
  wire [2:0]           S1_axi3_arsize;
  wire [3:0]           S1_axi3_arlen;
  wire [1:0]           S1_axi3_arburst;
  wire                 S1_axi3_rvalid;
  wire                 S1_axi3_rready;
  wire [WIDTH_SID-1:0] S1_axi3_rid;
  wire [255:0]         S1_axi3_rdata;
  wire [1:0]           S1_axi3_rresp;
  wire                 S1_axi3_rlast;
  //----------------------------------
  wire                 S2_axi3_awvalid;
  wire                 S2_axi3_awready;
  wire [WIDTH_SID-1:0] S2_axi3_awid;
  wire [31:0]          S2_axi3_awaddr;
  wire [3:0]           S2_axi3_awlen;
  wire [2:0]           S2_axi3_awsize;
  wire [1:0]           S2_axi3_awburst;
  wire                 S2_axi3_wvalid;
  wire                 S2_axi3_wready;
  wire [WIDTH_SID-1:0] S2_axi3_wid;
  wire [255:0]         S2_axi3_wdata;
  wire [31:0]          S2_axi3_wstrb;
  wire                 S2_axi3_wlast;
  wire                 S2_axi3_bvalid;
  wire                 S2_axi3_bready;
  wire [WIDTH_SID-1:0] S2_axi3_bid;
  wire [1:0]           S2_axi3_bresp;
  wire                 S2_axi3_arvalid;
  wire                 S2_axi3_arready;
  wire [WIDTH_SID-1:0] S2_axi3_arid;
  wire [31:0]          S2_axi3_araddr;
  wire [2:0]           S2_axi3_arsize;
  wire [3:0]           S2_axi3_arlen;
  wire [1:0]           S2_axi3_arburst;
  wire                 S2_axi3_rvalid;
  wire                 S2_axi3_rready;
  wire [WIDTH_SID-1:0] S2_axi3_rid;
  wire [255:0]         S2_axi3_rdata;
  wire [1:0]           S2_axi3_rresp;
  wire                 S2_axi3_rlast;
  //----------------------------------
  wire                 S3_axi3_awvalid;
  wire                 S3_axi3_awready;
  wire [WIDTH_SID-1:0] S3_axi3_awid;
  wire [31:0]          S3_axi3_awaddr;
  wire [3:0]           S3_axi3_awlen;
  wire [2:0]           S3_axi3_awsize;
  wire [1:0]           S3_axi3_awburst;
  wire                 S3_axi3_wvalid;
  wire                 S3_axi3_wready;
  wire [WIDTH_SID-1:0] S3_axi3_wid;
  wire [255:0]         S3_axi3_wdata;
  wire [31:0]          S3_axi3_wstrb;
  wire                 S3_axi3_wlast;
  wire                 S3_axi3_bvalid;
  wire                 S3_axi3_bready;
  wire [WIDTH_SID-1:0] S3_axi3_bid;
  wire [1:0]           S3_axi3_bresp;
  wire                 S3_axi3_arvalid;
  wire                 S3_axi3_arready;
  wire [WIDTH_SID-1:0] S3_axi3_arid;
  wire [31:0]          S3_axi3_araddr;
  wire [2:0]           S3_axi3_arsize;
  wire [3:0]           S3_axi3_arlen;
  wire [1:0]           S3_axi3_arburst;
  wire                 S3_axi3_rvalid;
  wire                 S3_axi3_rready;
  wire [WIDTH_SID-1:0] S3_axi3_rid;
  wire [255:0]         S3_axi3_rdata;
  wire [1:0]           S3_axi3_rresp;
  wire                 S3_axi3_rlast;


  initial begin
    mcash_ch0_req_valid = 1'b0;
    mcash_ch0_req_addr  = 28'b0;
    mcash_ch0_req_op    = 2'b0;
    mcash_ch1_req_valid = 1'b0;
    mcash_ch1_req_addr  = 28'b0;
    mcash_ch2_req_valid = 1'b0;
    mcash_ch2_req_addr  = 28'b0;
  end

  always @(posedge clk) begin
    
    if (i < 32) begin
      if (mcash_ch0_req_allowIn) begin
        mcash_ch0_req_valid       <= code_list[i][163];
        mcash_ch0_req_op[2:0]     <= code_list[i][162:160];
        mcash_ch0_req_data[127:0] <= code_list[i][159:32];
        mcash_ch0_req_addr[31:4]  <= code_list[i][31:4];
        i++;
      end
    end
    else begin
      mcash_ch0_req_valid       <= '0;
      mcash_ch0_req_op[2:0]     <= '0;
      mcash_ch0_req_data[127:0] <= '0;
      mcash_ch0_req_addr[31:4]  <= '0;
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
    .clk_i                   (clk                         ),
    .rst_i                   (rst                         ),
    // channel0
    .mcash_ch0_req_valid_i   (mcash_ch0_req_valid         ),
    .mcash_ch0_req_allowIn_o (mcash_ch0_req_allowIn       ),
    .mcash_ch0_req_op_i      (mcash_ch0_req_op[2:0]       ),
    .mcash_ch0_req_addr_i    (mcash_ch0_req_addr[31:4]    ),
    .mcash_ch0_req_data_i    (mcash_ch0_req_data[127:0]   ),
    .mcash_ch0_rtn_valid_o   (mcash_ch0_rtn_valid         ),
    .mcash_ch0_rtn_ready_i   (mcash_ch0_rtn_ready         ),
    .mcash_ch0_rtn_data_o    (mcash_ch0_rtn_data[127:0]   ),
    // channel1
    .mcash_ch1_req_valid_i   (mcash_ch1_req_valid         ),
    .mcash_ch1_req_allowIn_o (mcash_ch1_req_allowIn       ),
    .mcash_ch1_req_op_i      (mcash_ch1_req_op[2:0]       ),
    .mcash_ch1_req_addr_i    (mcash_ch1_req_addr[31:4]    ),
    .mcash_ch1_req_data_i    (mcash_ch1_req_data[127:0]   ),
    .mcash_ch1_rtn_valid_o   (mcash_ch1_rtn_valid         ),
    .mcash_ch1_rtn_ready_i   (mcash_ch1_rtn_ready         ),
    .mcash_ch1_rtn_data_o    (mcash_ch1_rtn_data[127:0]   ),
    // channel2
    .mcash_ch2_req_valid_i   (mcash_ch2_req_valid         ),
    .mcash_ch2_req_allowIn_o (mcash_ch2_req_allowIn       ),
    .mcash_ch2_req_op_i      (mcash_ch2_req_op[2:0]       ),
    .mcash_ch2_req_addr_i    (mcash_ch2_req_addr[31:4]    ),
    .mcash_ch2_req_data_i    (mcash_ch2_req_data[127:0]   ),
    .mcash_ch2_rtn_valid_o   (mcash_ch2_rtn_valid         ),
    .mcash_ch2_rtn_ready_i   (mcash_ch2_rtn_ready         ),
    .mcash_ch2_rtn_data_o    (mcash_ch2_rtn_data[127:0]   ),
    // bank0 AXI3 
    .bank0_biu_axi3_arvalid_o(bank0_biu_axi3_arvalid      ),
    .bank0_biu_axi3_arready_i(bank0_biu_axi3_arready      ),
    .bank0_biu_axi3_arid_o   (bank0_biu_axi3_arid[5:0]    ),
    .bank0_biu_axi3_araddr_o (bank0_biu_axi3_araddr[31:0] ),
    .bank0_biu_axi3_arsize_o (bank0_biu_axi3_arsize[2:0]  ),
    .bank0_biu_axi3_arlen_o  (bank0_biu_axi3_arlen[3:0]   ),
    .bank0_biu_axi3_arburst_o(bank0_biu_axi3_arburst[1:0] ),
    .bank0_biu_axi3_rvalid_i (bank0_biu_axi3_rvalid       ),
    .bank0_biu_axi3_rready_o (bank0_biu_axi3_rready       ),
    .bank0_biu_axi3_rid_i    (bank0_biu_axi3_rid[5:0]     ),
    .bank0_biu_axi3_rdata_i  (bank0_biu_axi3_rdata[255:0] ),
    .bank0_biu_axi3_rresp_i  (bank0_biu_axi3_rresp[1:0]   ),
    .bank0_biu_axi3_rlast_i  (bank0_biu_axi3_rlast        ),
    .bank0_biu_axi3_awvalid_o(bank0_biu_axi3_awvalid      ),
    .bank0_biu_axi3_awready_i(bank0_biu_axi3_awready      ),
    .bank0_biu_axi3_awid_o   (bank0_biu_axi3_awid[5:0]    ),
    .bank0_biu_axi3_awaddr_o (bank0_biu_axi3_awaddr[31:0] ),
    .bank0_biu_axi3_awlen_o  (bank0_biu_axi3_awlen[3:0]   ),
    .bank0_biu_axi3_awsize_o (bank0_biu_axi3_awsize[2:0]  ),
    .bank0_biu_axi3_awburst_o(bank0_biu_axi3_awburst[1:0] ),
    .bank0_biu_axi3_wvalid_o (bank0_biu_axi3_wvalid       ),
    .bank0_biu_axi3_wready_i (bank0_biu_axi3_wready       ),
    .bank0_biu_axi3_wid_o    (bank0_biu_axi3_wid[5:0]     ),
    .bank0_biu_axi3_wdata_o  (bank0_biu_axi3_wdata[255:0] ),
    .bank0_biu_axi3_wstrb_o  (bank0_biu_axi3_wstrb[31:0]  ),
    .bank0_biu_axi3_wlast_o  (bank0_biu_axi3_wlast        ),
    .bank0_biu_axi3_bvalid_i (bank0_biu_axi3_bvalid       ),
    .bank0_biu_axi3_bready_o (bank0_biu_axi3_bready       ),
    .bank0_biu_axi3_bid_i    (bank0_biu_axi3_bid[5:0]     ),
    .bank0_biu_axi3_bresp_i  (bank0_biu_axi3_bresp[1:0]   ),
    // bank1 AXI3 
    .bank1_biu_axi3_arvalid_o(bank1_biu_axi3_arvalid      ),
    .bank1_biu_axi3_arready_i(bank1_biu_axi3_arready      ),
    .bank1_biu_axi3_arid_o   (bank1_biu_axi3_arid[5:0]    ),
    .bank1_biu_axi3_araddr_o (bank1_biu_axi3_araddr[31:0] ),
    .bank1_biu_axi3_arsize_o (bank1_biu_axi3_arsize[2:0]  ),
    .bank1_biu_axi3_arlen_o  (bank1_biu_axi3_arlen[3:0]   ),
    .bank1_biu_axi3_arburst_o(bank1_biu_axi3_arburst[1:0] ),
    .bank1_biu_axi3_rvalid_i (bank1_biu_axi3_rvalid       ),
    .bank1_biu_axi3_rready_o (bank1_biu_axi3_rready       ),
    .bank1_biu_axi3_rid_i    (bank1_biu_axi3_rid[5:0]     ),
    .bank1_biu_axi3_rdata_i  (bank1_biu_axi3_rdata[255:0] ),
    .bank1_biu_axi3_rresp_i  (bank1_biu_axi3_rresp[1:0]   ),
    .bank1_biu_axi3_rlast_i  (bank1_biu_axi3_rlast        ),
    .bank1_biu_axi3_awvalid_o(bank1_biu_axi3_awvalid      ),
    .bank1_biu_axi3_awready_i(bank1_biu_axi3_awready      ),
    .bank1_biu_axi3_awid_o   (bank1_biu_axi3_awid[5:0]    ),
    .bank1_biu_axi3_awaddr_o (bank1_biu_axi3_awaddr[31:0] ),
    .bank1_biu_axi3_awlen_o  (bank1_biu_axi3_awlen[3:0]   ),
    .bank1_biu_axi3_awsize_o (bank1_biu_axi3_awsize[2:0]  ),
    .bank1_biu_axi3_awburst_o(bank1_biu_axi3_awburst[1:0] ),
    .bank1_biu_axi3_wvalid_o (bank1_biu_axi3_wvalid       ),
    .bank1_biu_axi3_wready_i (bank1_biu_axi3_wready       ),
    .bank1_biu_axi3_wid_o    (bank1_biu_axi3_wid[5:0]     ),
    .bank1_biu_axi3_wdata_o  (bank1_biu_axi3_wdata[255:0] ),
    .bank1_biu_axi3_wstrb_o  (bank1_biu_axi3_wstrb[31:0]  ),
    .bank1_biu_axi3_wlast_o  (bank1_biu_axi3_wlast        ),
    .bank1_biu_axi3_bvalid_i (bank1_biu_axi3_bvalid       ),
    .bank1_biu_axi3_bready_o (bank1_biu_axi3_bready       ),
    .bank1_biu_axi3_bid_i    (bank1_biu_axi3_bid[5:0]     ),
    .bank1_biu_axi3_bresp_i  (bank1_biu_axi3_bresp[1:0]   ),
    // bank2 AXI3 
    .bank2_biu_axi3_arvalid_o(bank2_biu_axi3_arvalid      ),
    .bank2_biu_axi3_arready_i(bank2_biu_axi3_arready      ),
    .bank2_biu_axi3_arid_o   (bank2_biu_axi3_arid[5:0]    ),
    .bank2_biu_axi3_araddr_o (bank2_biu_axi3_araddr[31:0] ),
    .bank2_biu_axi3_arsize_o (bank2_biu_axi3_arsize[2:0]  ),
    .bank2_biu_axi3_arlen_o  (bank2_biu_axi3_arlen[3:0]   ),
    .bank2_biu_axi3_arburst_o(bank2_biu_axi3_arburst[1:0] ),
    .bank2_biu_axi3_rvalid_i (bank2_biu_axi3_rvalid       ),
    .bank2_biu_axi3_rready_o (bank2_biu_axi3_rready       ),
    .bank2_biu_axi3_rid_i    (bank2_biu_axi3_rid[5:0]     ),
    .bank2_biu_axi3_rdata_i  (bank2_biu_axi3_rdata[255:0] ),
    .bank2_biu_axi3_rresp_i  (bank2_biu_axi3_rresp[1:0]   ),
    .bank2_biu_axi3_rlast_i  (bank2_biu_axi3_rlast        ),
    .bank2_biu_axi3_awvalid_o(bank2_biu_axi3_awvalid      ),
    .bank2_biu_axi3_awready_i(bank2_biu_axi3_awready      ),
    .bank2_biu_axi3_awid_o   (bank2_biu_axi3_awid[5:0]    ),
    .bank2_biu_axi3_awaddr_o (bank2_biu_axi3_awaddr[31:0] ),
    .bank2_biu_axi3_awlen_o  (bank2_biu_axi3_awlen[3:0]   ),
    .bank2_biu_axi3_awsize_o (bank2_biu_axi3_awsize[2:0]  ),
    .bank2_biu_axi3_awburst_o(bank2_biu_axi3_awburst[1:0] ),
    .bank2_biu_axi3_wvalid_o (bank2_biu_axi3_wvalid       ),
    .bank2_biu_axi3_wready_i (bank2_biu_axi3_wready       ),
    .bank2_biu_axi3_wid_o    (bank2_biu_axi3_wid[5:0]     ),
    .bank2_biu_axi3_wdata_o  (bank2_biu_axi3_wdata[255:0] ),
    .bank2_biu_axi3_wstrb_o  (bank2_biu_axi3_wstrb[31:0]  ),
    .bank2_biu_axi3_wlast_o  (bank2_biu_axi3_wlast        ),
    .bank2_biu_axi3_bvalid_i (bank2_biu_axi3_bvalid       ),
    .bank2_biu_axi3_bready_o (bank2_biu_axi3_bready       ),
    .bank2_biu_axi3_bid_i    (bank2_biu_axi3_bid[5:0]     ),
    .bank2_biu_axi3_bresp_i  (bank2_biu_axi3_bresp[1:0]   ),
    // bank3 AXI3 
    .bank3_biu_axi3_arvalid_o(bank3_biu_axi3_arvalid      ),
    .bank3_biu_axi3_arready_i(bank3_biu_axi3_arready      ),
    .bank3_biu_axi3_arid_o   (bank3_biu_axi3_arid[5:0]    ),
    .bank3_biu_axi3_araddr_o (bank3_biu_axi3_araddr[31:0] ),
    .bank3_biu_axi3_arsize_o (bank3_biu_axi3_arsize[2:0]  ),
    .bank3_biu_axi3_arlen_o  (bank3_biu_axi3_arlen[3:0]   ),
    .bank3_biu_axi3_arburst_o(bank3_biu_axi3_arburst[1:0] ),
    .bank3_biu_axi3_rvalid_i (bank3_biu_axi3_rvalid       ),
    .bank3_biu_axi3_rready_o (bank3_biu_axi3_rready       ),
    .bank3_biu_axi3_rid_i    (bank3_biu_axi3_rid[5:0]     ),
    .bank3_biu_axi3_rdata_i  (bank3_biu_axi3_rdata[255:0] ),
    .bank3_biu_axi3_rresp_i  (bank3_biu_axi3_rresp[1:0]   ),
    .bank3_biu_axi3_rlast_i  (bank3_biu_axi3_rlast        ),
    .bank3_biu_axi3_awvalid_o(bank3_biu_axi3_awvalid      ),
    .bank3_biu_axi3_awready_i(bank3_biu_axi3_awready      ),
    .bank3_biu_axi3_awid_o   (bank3_biu_axi3_awid[5:0]    ),
    .bank3_biu_axi3_awaddr_o (bank3_biu_axi3_awaddr[31:0] ),
    .bank3_biu_axi3_awlen_o  (bank3_biu_axi3_awlen[3:0]   ),
    .bank3_biu_axi3_awsize_o (bank3_biu_axi3_awsize[2:0]  ),
    .bank3_biu_axi3_awburst_o(bank3_biu_axi3_awburst[1:0] ),
    .bank3_biu_axi3_wvalid_o (bank3_biu_axi3_wvalid       ),
    .bank3_biu_axi3_wready_i (bank3_biu_axi3_wready       ),
    .bank3_biu_axi3_wid_o    (bank3_biu_axi3_wid[5:0]     ),
    .bank3_biu_axi3_wdata_o  (bank3_biu_axi3_wdata[255:0] ),
    .bank3_biu_axi3_wstrb_o  (bank3_biu_axi3_wstrb[31:0]  ),
    .bank3_biu_axi3_wlast_o  (bank3_biu_axi3_wlast        ),
    .bank3_biu_axi3_bvalid_i (bank3_biu_axi3_bvalid       ),
    .bank3_biu_axi3_bready_o (bank3_biu_axi3_bready       ),
    .bank3_biu_axi3_bid_i    (bank3_biu_axi3_bid[5:0]     ),
    .bank3_biu_axi3_bresp_i  (bank3_biu_axi3_bresp[1:0]   )
  );

//--------------------------------------------------------------
//  SLAVE0: ram0
//--------------------------------------------------------------
  axi_slave_ram
  ram0 (
    .pad_cpu_rst    (rst                         ),
    .pll_core_cpuclk(clk                         ),
    // RAM0 AR
    .arvalid_s0     (S0_axi3_arvalid             ),
    .arready_s0     (S0_axi3_arready             ),
    .araddr_s0      (S0_axi3_araddr[WIDTH_AD-1:0]),
    .arburst_s0     (S0_axi3_arburst[1:0]        ),
    .arcache_s0     (                            ),
    .arid_s0        (S0_axi3_arid[WIDTH_SID-1:0] ),
    .arlen_s0       ({4'b0, S0_axi3_arlen[3:0]}  ),
    .arprot_s0      (                            ),
    .arsize_s0      (S0_axi3_arsize[2:0]         ),
    // RAM0 AW
    .awvalid_s0     (S0_axi3_awvalid             ),
    .awready_s0     (S0_axi3_awready             ),
    .awburst_s0     (S0_axi3_awburst[ 1:0]       ),
    .awcache_s0     (),
    .awid_s0        (S0_axi3_awid[WIDTH_SID-1:0] ),
    .awaddr_s0      (S0_axi3_awaddr[WIDTH_AD-1:0]),
    .awlen_s0       ({4'b0, S0_axi3_awlen[3:0]}  ),
    .awprot_s0      (),
    .awsize_s0      (S0_axi3_awsize[ 2:0]        ),
    // RAM0 W
    .wvalid_s0      (S0_axi3_wvalid              ),
    .wready_s0      (S0_axi3_wready              ),
    .wdata_s0       (S0_axi3_wdata[255:0]        ),
    .wid_s0         (S0_axi3_wid[WIDTH_SID-1:0]  ),
    .wlast_s0       (S0_axi3_wlast               ),
    .wstrb_s0       (S0_axi3_wstrb[31:0]         ),
    // RAM0 B
    .bvalid_s0      (                            ),
    .bready_s0      (1'b1                        ),
    .bid_s0         (                            ),
    .bresp_s0       (                            ),
    // RAM0 R
    .rvalid_s0      (S0_axi3_rvalid              ),
    .rready_s0      (S0_axi3_rready              ),
    .rdata_s0       (S0_axi3_rdata[WIDTH_DA-1:0] ),
    .rid_s0         (S0_axi3_rid[WIDTH_SID-1:0]  ),
    .rlast_s0       (S0_axi3_rlast               ),
    .rresp_s0       (                            )
  );

  axi_slave_ram
  ram1 (
    .araddr_s0      (S1_axi3_araddr[WIDTH_AD-1:0]),
    .arburst_s0     (S1_axi3_arburst[1:0]),
    .arcache_s0     (),
    .arid_s0        (S1_axi3_arid[WIDTH_SID-1:0]),
    .arlen_s0       ({4'b0, S1_axi3_arlen[3:0]}),
    .arprot_s0      (),
    .arsize_s0      (S1_axi3_arsize[2:0]),
    .arvalid_s0     (S1_axi3_arvalid),
    .awaddr_s0      (),
    .awburst_s0     (),
    .awcache_s0     (),
    .awid_s0        (),
    .awlen_s0       (),
    .awprot_s0      (),
    .awsize_s0      (),
    .awvalid_s0     (),
    .bready_s0      (),
    .pad_cpu_rst    (rst),
    .pll_core_cpuclk(clk),
    .rready_s0      (S1_axi3_rready),
    .wdata_s0       (),
    .wid_s0         (),
    .wlast_s0       (),
    .wstrb_s0       (),
    .wvalid_s0      (),
    .arready_s0     (S1_axi3_arready),
    .awready_s0     (),
    .bid_s0         (),
    .bresp_s0       (),
    .bvalid_s0      (),
    .rdata_s0       (S1_axi3_rdata[WIDTH_DA-1:0]),
    .rid_s0         (S1_axi3_rid[WIDTH_SID-1:0]),
    .rlast_s0       (S1_axi3_rlast),
    .rresp_s0       (),
    .rvalid_s0      (S1_axi3_rvalid),
    .wready_s0      ()
  );

  axi_slave_ram
  ram2 (
    .araddr_s0      (S2_axi3_araddr[WIDTH_AD-1:0]),
    .arburst_s0     (S2_axi3_arburst[1:0]),
    .arcache_s0     (),
    .arid_s0        (S2_axi3_arid[WIDTH_SID-1:0]),
    .arlen_s0       ({4'b0, S2_axi3_arlen[3:0]}),
    .arprot_s0      (),
    .arsize_s0      (S2_axi3_arsize[2:0]),
    .arvalid_s0     (S2_axi3_arvalid),
    .awaddr_s0      (),
    .awburst_s0     (),
    .awcache_s0     (),
    .awid_s0        (),
    .awlen_s0       (),
    .awprot_s0      (),
    .awsize_s0      (),
    .awvalid_s0     (),
    .bready_s0      (),
    .pad_cpu_rst    (rst),
    .pll_core_cpuclk(clk),
    .rready_s0      (S2_axi3_rready),
    .wdata_s0       (),
    .wid_s0         (),
    .wlast_s0       (),
    .wstrb_s0       (),
    .wvalid_s0      (),
    .arready_s0     (S2_axi3_arready),
    .awready_s0     (),
    .bid_s0         (),
    .bresp_s0       (),
    .bvalid_s0      (),
    .rdata_s0       (S2_axi3_rdata[WIDTH_DA-1:0]),
    .rid_s0         (S2_axi3_rid[WIDTH_SID-1:0]),
    .rlast_s0       (S2_axi3_rlast),
    .rresp_s0       (),
    .rvalid_s0      (S2_axi3_rvalid),
    .wready_s0      ()
  );

  axi_slave_ram
  ram3 (
    .araddr_s0      (S3_axi3_araddr[WIDTH_AD-1:0]),
    .arburst_s0     (S3_axi3_arburst[1:0]),
    .arcache_s0     (),
    .arid_s0        (S3_axi3_arid[WIDTH_SID-1:0]),
    .arlen_s0       ({4'b0, S3_axi3_arlen[3:0]}),
    .arprot_s0      (),
    .arsize_s0      (S3_axi3_arsize[2:0]),
    .arvalid_s0     (S3_axi3_arvalid),
    .awaddr_s0      (),
    .awburst_s0     (),
    .awcache_s0     (),
    .awid_s0        (),
    .awlen_s0       (),
    .awprot_s0      (),
    .awsize_s0      (),
    .awvalid_s0     (),
    .bready_s0      (),
    .pad_cpu_rst    (rst),
    .pll_core_cpuclk(clk),
    .rready_s0      (S3_axi3_rready),
    .wdata_s0       (),
    .wid_s0         (),
    .wlast_s0       (),
    .wstrb_s0       (),
    .wvalid_s0      (),
    .arready_s0     (S3_axi3_arready),
    .awready_s0     (),
    .bid_s0         (),
    .bresp_s0       (),
    .bvalid_s0      (),
    .rdata_s0       (S3_axi3_rdata[WIDTH_DA-1:0]),
    .rid_s0         (S3_axi3_rid[WIDTH_SID-1:0]),
    .rlast_s0       (S3_axi3_rlast),
    .rresp_s0       (),
    .rvalid_s0      (S3_axi3_rvalid),
    .wready_s0      ()
  );

  amba_axi_m4s4 #(
    .NUM_MASTER(4),    // should not be changed
    .NUM_SLAVE(4),     // should not be changed
    .WIDTH_ID(WIDTH_ID),      // ID width in bits
    .WIDTH_AD(WIDTH_AD),     // address width
    .WIDTH_DA(WIDTH_DA),    // data width
    .SLAVE_EN0(1),
    .SLAVE_EN1(0),
    .SLAVE_EN2(0),
    .SLAVE_EN3(0),
    .ADDR_LENGTH0(26), // effective address bits-widgh
    .ADDR_LENGTH1(12), // effective address bits-widgh
    .ADDR_LENGTH2(12), // effective address bits-widgh
    .ADDR_LENGTH3(12), // effective address bits-widgh
    .ADDR_BASE0('h0),
    .ADDR_BASE1('h20000),
    .ADDR_BASE2('h40000),
    .ADDR_BASE3('h60000)
  )
  u_amba_axi_m4s4(
    .ACLK      (clk                                  ),
    .ARESETn   (~rst                                 ),
    //---------------------------------------------------------------------------
    .M0_AWID   (bank0_biu_axi3_awid[WIDTH_ID-1:0]    ),
    .M0_AWADDR (bank0_biu_axi3_awaddr[WIDTH_AD-1:0]  ),
    .M0_AWLEN  (bank0_biu_axi3_awlen[ 3:0]           ),
    .M0_AWLOCK (),
    .M0_AWSIZE (bank0_biu_axi3_awsize[ 2:0]          ),
    .M0_AWBURST(bank0_biu_axi3_awburst[ 1:0]         ),
    .M0_AWVALID(bank0_biu_axi3_awvalid               ),
    .M0_AWREADY(bank0_biu_axi3_awready               ),
    .M0_WID    (bank0_biu_axi3_wid[WIDTH_ID-1:0]     ),
    .M0_WDATA  (bank0_biu_axi3_wdata[WIDTH_DA-1:0]   ),
    .M0_WSTRB  (bank0_biu_axi3_wstrb[WIDTH_DS-1:0]   ),
    .M0_WLAST  (bank0_biu_axi3_wlast                 ),
    .M0_WVALID (bank0_biu_axi3_wvalid                ),
    .M0_WREADY (bank0_biu_axi3_wready                ),
    .M0_BID    (bank0_biu_axi3_bid[WIDTH_ID-1:0]     ),
    .M0_BRESP  (bank0_biu_axi3_bresp[ 1:0]           ),
    .M0_BVALID (bank0_biu_axi3_bvalid                ),
    .M0_BREADY (bank0_biu_axi3_bready                ),
    .M0_ARID   (bank0_biu_axi3_arid[WIDTH_ID-1:0]    ),
    .M0_ARADDR (bank0_biu_axi3_araddr[WIDTH_AD-1:0]  ),
    .M0_ARLEN  (bank0_biu_axi3_arlen[ 3:0]           ),
    .M0_ARLOCK (),
    .M0_ARSIZE (bank0_biu_axi3_arsize[ 2:0]          ),
    .M0_ARBURST(bank0_biu_axi3_arburst[ 1:0]         ),
    .M0_ARVALID(bank0_biu_axi3_arvalid               ),
    .M0_ARREADY(bank0_biu_axi3_arready               ),
    .M0_RID    (bank0_biu_axi3_rid[WIDTH_ID-1:0]     ),
    .M0_RDATA  (bank0_biu_axi3_rdata[WIDTH_DA-1:0]   ),
    .M0_RRESP  (bank0_biu_axi3_rresp[ 1:0]           ),
    .M0_RLAST  (bank0_biu_axi3_rlast                 ),
    .M0_RVALID (bank0_biu_axi3_rvalid                ),
    .M0_RREADY (bank0_biu_axi3_rready                ),
    //---------------------------------------------------------------------------
    .M1_AWID   (bank1_biu_axi3_awid[WIDTH_ID-1:0]    ),
    .M1_AWADDR (bank1_biu_axi3_awaddr[WIDTH_AD-1:0]  ),
    .M1_AWLEN  (bank1_biu_axi3_awlen[ 3:0]           ),
    .M1_AWLOCK (),
    .M1_AWSIZE (bank1_biu_axi3_awsize[ 2:0]          ),
    .M1_AWBURST(bank1_biu_axi3_awburst[ 1:0]         ),
    .M1_AWVALID(bank1_biu_axi3_awvalid               ),
    .M1_AWREADY(bank1_biu_axi3_awready               ),
    .M1_WID    (bank1_biu_axi3_wid[WIDTH_ID-1:0]     ),
    .M1_WDATA  (bank1_biu_axi3_wdata[WIDTH_DA-1:0]   ),
    .M1_WSTRB  (bank1_biu_axi3_wstrb[WIDTH_DS-1:0]   ),
    .M1_WLAST  (bank1_biu_axi3_wlast                 ),
    .M1_WVALID (bank1_biu_axi3_wvalid                ),
    .M1_WREADY (bank1_biu_axi3_wready                ),
    .M1_BID    (bank1_biu_axi3_bid[WIDTH_ID-1:0]     ),
    .M1_BRESP  (bank1_biu_axi3_bresp[ 1:0]           ),
    .M1_BVALID (bank1_biu_axi3_bvalid                ),
    .M1_BREADY (bank1_biu_axi3_bready                ),
    .M1_ARID   (bank1_biu_axi3_arid[WIDTH_ID-1:0]    ),
    .M1_ARADDR (bank1_biu_axi3_araddr[WIDTH_AD-1:0]  ),
    .M1_ARLEN  (bank1_biu_axi3_arlen[ 3:0]           ),
    .M1_ARLOCK (),
    .M1_ARSIZE (bank1_biu_axi3_arsize[ 2:0]          ),
    .M1_ARBURST(bank1_biu_axi3_arburst[ 1:0]         ),
    .M1_ARVALID(bank1_biu_axi3_arvalid               ),
    .M1_ARREADY(bank1_biu_axi3_arready               ),
    .M1_RID    (bank1_biu_axi3_rid[WIDTH_ID-1:0]     ),
    .M1_RDATA  (bank1_biu_axi3_rdata[WIDTH_DA-1:0]   ),
    .M1_RRESP  (bank1_biu_axi3_rresp[ 1:0]           ),
    .M1_RLAST  (bank1_biu_axi3_rlast                 ),
    .M1_RVALID (bank1_biu_axi3_rvalid                ),
    .M1_RREADY (bank1_biu_axi3_rready                ),
    //---------------------------------------------------------------------------
    .M2_AWID   (bank2_biu_axi3_awid[WIDTH_ID-1:0]    ),
    .M2_AWADDR (bank2_biu_axi3_awaddr[WIDTH_AD-1:0]  ),
    .M2_AWLEN  (bank2_biu_axi3_awlen[ 3:0]           ),
    .M2_AWLOCK (),
    .M2_AWSIZE (bank2_biu_axi3_awsize[ 2:0]          ),
    .M2_AWBURST(bank2_biu_axi3_awburst[ 1:0]         ),
    .M2_AWVALID(bank2_biu_axi3_awvalid               ),
    .M2_AWREADY(bank2_biu_axi3_awready               ),
    .M2_WID    (bank2_biu_axi3_wid[WIDTH_ID-1:0]     ),
    .M2_WDATA  (bank2_biu_axi3_wdata[WIDTH_DA-1:0]   ),
    .M2_WSTRB  (bank2_biu_axi3_wstrb[WIDTH_DS-1:0]   ),
    .M2_WLAST  (bank2_biu_axi3_wlast                 ),
    .M2_WVALID (bank2_biu_axi3_wvalid                ),
    .M2_WREADY (bank2_biu_axi3_wready                ),
    .M2_BID    (bank2_biu_axi3_bid[WIDTH_ID-1:0]     ),
    .M2_BRESP  (bank2_biu_axi3_bresp[ 1:0]           ),
    .M2_BVALID (bank2_biu_axi3_bvalid                ),
    .M2_BREADY (bank2_biu_axi3_bready                ),
    .M2_ARID   (bank2_biu_axi3_arid[WIDTH_ID-1:0]    ),
    .M2_ARADDR (bank2_biu_axi3_araddr[WIDTH_AD-1:0]  ),
    .M2_ARLEN  (bank2_biu_axi3_arlen[ 3:0]           ),
    .M2_ARLOCK (),
    .M2_ARSIZE (bank2_biu_axi3_arsize[ 2:0]          ),
    .M2_ARBURST(bank2_biu_axi3_arburst[ 1:0]         ),
    .M2_ARVALID(bank2_biu_axi3_arvalid               ),
    .M2_ARREADY(bank2_biu_axi3_arready               ),
    .M2_RID    (bank2_biu_axi3_rid[WIDTH_ID-1:0]     ),
    .M2_RDATA  (bank2_biu_axi3_rdata[WIDTH_DA-1:0]   ),
    .M2_RRESP  (bank2_biu_axi3_rresp[ 1:0]           ),
    .M2_RLAST  (bank2_biu_axi3_rlast                 ),
    .M2_RVALID (bank2_biu_axi3_rvalid                ),
    .M2_RREADY (bank2_biu_axi3_rready                ),
    //---------------------------------------------------------------------------
    .M3_AWID   (bank3_biu_axi3_awid[WIDTH_ID-1:0]    ),
    .M3_AWADDR (bank3_biu_axi3_awaddr[WIDTH_AD-1:0]  ),
    .M3_AWLEN  (bank3_biu_axi3_awlen[ 3:0]           ),
    .M3_AWLOCK (),
    .M3_AWSIZE (bank3_biu_axi3_awsize[ 2:0]          ),
    .M3_AWBURST(bank3_biu_axi3_awburst[ 1:0]         ),
    .M3_AWVALID(bank3_biu_axi3_awvalid               ),
    .M3_AWREADY(bank3_biu_axi3_awready               ),
    .M3_WID    (bank3_biu_axi3_wid[WIDTH_ID-1:0]     ),
    .M3_WDATA  (bank3_biu_axi3_wdata[WIDTH_DA-1:0]   ),
    .M3_WSTRB  (bank3_biu_axi3_wstrb[WIDTH_DS-1:0]   ),
    .M3_WLAST  (bank3_biu_axi3_wlast                 ),
    .M3_WVALID (bank3_biu_axi3_wvalid                ),
    .M3_WREADY (bank3_biu_axi3_wready                ),
    .M3_BID    (bank3_biu_axi3_bid[WIDTH_ID-1:0]     ),
    .M3_BRESP  (bank3_biu_axi3_bresp[ 1:0]           ),
    .M3_BVALID (bank3_biu_axi3_bvalid                ),
    .M3_BREADY (bank3_biu_axi3_bready                ),
    .M3_ARID   (bank3_biu_axi3_arid[WIDTH_ID-1:0]    ),
    .M3_ARADDR (bank3_biu_axi3_araddr[WIDTH_AD-1:0]  ),
    .M3_ARLEN  (bank3_biu_axi3_arlen[ 3:0]           ),
    .M3_ARLOCK (),
    .M3_ARSIZE (bank3_biu_axi3_arsize[ 2:0]          ),
    .M3_ARBURST(bank3_biu_axi3_arburst[ 1:0]         ),
    .M3_ARVALID(bank3_biu_axi3_arvalid               ),
    .M3_ARREADY(bank3_biu_axi3_arready               ),
    .M3_RID    (bank3_biu_axi3_rid[WIDTH_ID-1:0]     ),
    .M3_RDATA  (bank3_biu_axi3_rdata[WIDTH_DA-1:0]   ),
    .M3_RRESP  (bank3_biu_axi3_rresp[ 1:0]           ),
    .M3_RLAST  (bank3_biu_axi3_rlast                 ),
    .M3_RVALID (bank3_biu_axi3_rvalid                ),
    .M3_RREADY (bank3_biu_axi3_rready                ),
    //---------------------------------------------------------------------------
    .S0_AWID   (S0_axi3_awid[WIDTH_SID-1:0] ),
    .S0_AWADDR (S0_axi3_awaddr[WIDTH_AD-1:0]),
    .S0_AWLEN  (S0_axi3_awlen[ 3:0]         ),
    .S0_AWLOCK (),
    .S0_AWSIZE (S0_axi3_awsize[ 2:0]        ),
    .S0_AWBURST(S0_axi3_awburst[ 1:0]       ),
    .S0_AWVALID(S0_axi3_awvalid             ),
    .S0_AWREADY(S0_axi3_awready             ),
    .S0_WID    (S0_axi3_wid[WIDTH_SID-1:0]  ),
    .S0_WDATA  (S0_axi3_wdata[WIDTH_DA-1:0] ),
    .S0_WSTRB  (S0_axi3_wstrb[WIDTH_DS-1:0] ),
    .S0_WLAST  (S0_axi3_wlast               ),
    .S0_WVALID (S0_axi3_wvalid              ),
    .S0_WREADY (S0_axi3_wready              ),
    .S0_BID    (S0_axi3_bid[WIDTH_SID-1:0]  ),
    .S0_BRESP  (S0_axi3_bresp[ 1:0]         ),
    .S0_BVALID (S0_axi3_bvalid              ),
    .S0_BREADY (S0_axi3_bready              ),
    .S0_ARID   (S0_axi3_arid[WIDTH_SID-1:0] ),
    .S0_ARADDR (S0_axi3_araddr[WIDTH_AD-1:0]),
    .S0_ARLEN  (S0_axi3_arlen[ 3:0]         ),
    .S0_ARLOCK (),
    .S0_ARSIZE (S0_axi3_arsize[ 2:0]        ),
    .S0_ARBURST(S0_axi3_arburst[ 1:0]       ),
    .S0_ARVALID(S0_axi3_arvalid             ),
    .S0_ARREADY(S0_axi3_arready             ),
    .S0_RID    (S0_axi3_rid[WIDTH_SID-1:0]  ),
    .S0_RDATA  (S0_axi3_rdata[WIDTH_DA-1:0] ),
    .S0_RRESP  (S0_axi3_rresp[ 1:0]         ),
    .S0_RLAST  (S0_axi3_rlast               ),
    .S0_RVALID (S0_axi3_rvalid              ),
    .S0_RREADY (S0_axi3_rready              ),
    //---------------------------------------------------------------------------
    .S1_AWID   (S1_axi3_awid[WIDTH_SID-1:0] ),
    .S1_AWADDR (S1_axi3_awaddr[WIDTH_AD-1:0]),
    .S1_AWLEN  (S1_axi3_awlen[ 3:0]         ),
    .S1_AWLOCK (),
    .S1_AWSIZE (S1_axi3_awsize[ 2:0]        ),
    .S1_AWBURST(S1_axi3_awburst[ 1:0]       ),
    .S1_AWVALID(S1_axi3_awvalid             ),
    .S1_AWREADY(S1_axi3_awready             ),
    .S1_WID    (S1_axi3_wid[WIDTH_SID-1:0]  ),
    .S1_WDATA  (S1_axi3_wdata[WIDTH_DA-1:0] ),
    .S1_WSTRB  (S1_axi3_wstrb[WIDTH_DS-1:0] ),
    .S1_WLAST  (S1_axi3_wlast               ),
    .S1_WVALID (S1_axi3_wvalid              ),
    .S1_WREADY (S1_axi3_wready              ),
    .S1_BID    (S1_axi3_bid[WIDTH_SID-1:0]  ),
    .S1_BRESP  (S1_axi3_bresp[ 1:0]         ),
    .S1_BVALID (S1_axi3_bvalid              ),
    .S1_BREADY (S1_axi3_bready              ),
    .S1_ARID   (S1_axi3_arid[WIDTH_SID-1:0] ),
    .S1_ARADDR (S1_axi3_araddr[WIDTH_AD-1:0]),
    .S1_ARLEN  (S1_axi3_arlen[ 3:0]         ),
    .S1_ARLOCK (),
    .S1_ARSIZE (S1_axi3_arsize[ 2:0]        ),
    .S1_ARBURST(S1_axi3_arburst[ 1:0]       ),
    .S1_ARVALID(S1_axi3_arvalid             ),
    .S1_ARREADY(S1_axi3_arready             ),
    .S1_RID    (S1_axi3_rid[WIDTH_SID-1:0]  ),
    .S1_RDATA  (S1_axi3_rdata[WIDTH_DA-1:0] ),
    .S1_RRESP  (S1_axi3_rresp[ 1:0]         ),
    .S1_RLAST  (S1_axi3_rlast               ),
    .S1_RVALID (S1_axi3_rvalid              ),
    .S1_RREADY (S1_axi3_rready              ),
    //---------------------------------------------------------------------------
    .S2_AWID   (S2_axi3_awid[WIDTH_SID-1:0] ),
    .S2_AWADDR (S2_axi3_awaddr[WIDTH_AD-1:0]),
    .S2_AWLEN  (S2_axi3_awlen[ 3:0]         ),
    .S2_AWLOCK (),
    .S2_AWSIZE (S2_axi3_awsize[ 2:0]        ),
    .S2_AWBURST(S2_axi3_awburst[ 1:0]       ),
    .S2_AWVALID(S2_axi3_awvalid             ),
    .S2_AWREADY(S2_axi3_awready             ),
    .S2_WID    (S2_axi3_wid[WIDTH_SID-1:0]  ),
    .S2_WDATA  (S2_axi3_wdata[WIDTH_DA-1:0] ),
    .S2_WSTRB  (S2_axi3_wstrb[WIDTH_DS-1:0] ),
    .S2_WLAST  (S2_axi3_wlast               ),
    .S2_WVALID (S2_axi3_wvalid              ),
    .S2_WREADY (S2_axi3_wready              ),
    .S2_BID    (S2_axi3_bid[WIDTH_SID-1:0]  ),
    .S2_BRESP  (S2_axi3_bresp[ 1:0]         ),
    .S2_BVALID (S2_axi3_bvalid              ),
    .S2_BREADY (S2_axi3_bready              ),
    .S2_ARID   (S2_axi3_arid[WIDTH_SID-1:0] ),
    .S2_ARADDR (S2_axi3_araddr[WIDTH_AD-1:0]),
    .S2_ARLEN  (S2_axi3_arlen[ 3:0]         ),
    .S2_ARLOCK (),
    .S2_ARSIZE (S2_axi3_arsize[ 2:0]        ),
    .S2_ARBURST(S2_axi3_arburst[ 1:0]       ),
    .S2_ARVALID(S2_axi3_arvalid             ),
    .S2_ARREADY(S2_axi3_arready             ),
    .S2_RID    (S2_axi3_rid[WIDTH_SID-1:0]  ),
    .S2_RDATA  (S2_axi3_rdata[WIDTH_DA-1:0] ),
    .S2_RRESP  (S2_axi3_rresp[ 1:0]         ),
    .S2_RLAST  (S2_axi3_rlast               ),
    .S2_RVALID (S2_axi3_rvalid              ),
    .S2_RREADY (S2_axi3_rready              ),
    //---------------------------------------------------------------------------
    .S3_AWID   (S3_axi3_awid[WIDTH_SID-1:0] ),
    .S3_AWADDR (S3_axi3_awaddr[WIDTH_AD-1:0]),
    .S3_AWLEN  (S3_axi3_awlen[ 3:0]         ),
    .S3_AWLOCK (),
    .S3_AWSIZE (S3_axi3_awsize[ 2:0]        ),
    .S3_AWBURST(S3_axi3_awburst[ 1:0]       ),
    .S3_AWVALID(S3_axi3_awvalid             ),
    .S3_AWREADY(S3_axi3_awready             ),
    .S3_WID    (S3_axi3_wid[WIDTH_SID-1:0]  ),
    .S3_WDATA  (S3_axi3_wdata[WIDTH_DA-1:0] ),
    .S3_WSTRB  (S3_axi3_wstrb[WIDTH_DS-1:0] ),
    .S3_WLAST  (S3_axi3_wlast               ),
    .S3_WVALID (S3_axi3_wvalid              ),
    .S3_WREADY (S3_axi3_wready              ),
    .S3_BID    (S3_axi3_bid[WIDTH_SID-1:0]  ),
    .S3_BRESP  (S3_axi3_bresp[ 1:0]         ),
    .S3_BVALID (S3_axi3_bvalid              ),
    .S3_BREADY (S3_axi3_bready              ),
    .S3_ARID   (S3_axi3_arid[WIDTH_SID-1:0] ),
    .S3_ARADDR (S3_axi3_araddr[WIDTH_AD-1:0]),
    .S3_ARLEN  (S3_axi3_arlen[ 3:0]         ),
    .S3_ARLOCK (),
    .S3_ARSIZE (S3_axi3_arsize[ 2:0]        ),
    .S3_ARBURST(S3_axi3_arburst[ 1:0]       ),
    .S3_ARVALID(S3_axi3_arvalid             ),
    .S3_ARREADY(S3_axi3_arready             ),
    .S3_RID    (S3_axi3_rid[WIDTH_SID-1:0]  ),
    .S3_RDATA  (S3_axi3_rdata[WIDTH_DA-1:0] ),
    .S3_RRESP  (S3_axi3_rresp[ 1:0]         ),
    .S3_RLAST  (S3_axi3_rlast               ),
    .S3_RVALID (S3_axi3_rvalid              ),
    .S3_RREADY (S3_axi3_rready              )
  );


  initial begin
    $fsdbDumpfile(fsdb_file, 1024);
    $fsdbDumpvars(0, mcash_tb);
    $fsdbDumpvars("+struct");
    $fsdbDumpvars("+mda");
    $fsdbDumpon;
  end

  initial begin
    #100000
    $fsdbDumpoff;
    $finish;
  end


endmodule

bind mcash_tb mcash_dumper u_mcash_dumper(clk);
