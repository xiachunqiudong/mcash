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
    .clk_i                  (clk                      ),
    .rst_i                  (rst                      ),
    // channel0
    .mcash_ch0_req_valid_i  (mcash_ch0_req_valid      ),
    .mcash_ch0_req_allowIn_o(mcash_ch0_req_allowIn    ),
    .mcash_ch0_req_op_i     (mcash_ch0_req_op[2:0]    ),
    .mcash_ch0_req_addr_i   (mcash_ch0_req_addr[31:4] ),
    .mcash_ch0_req_data_i   (mcash_ch0_req_data[127:0]),
    .mcash_ch0_rtn_valid_o  (mcash_ch0_rtn_valid      ),
    .mcash_ch0_rtn_ready_i  (mcash_ch0_rtn_ready      ),
    .mcash_ch0_rtn_data_o   (mcash_ch0_rtn_data[127:0]),
    // channel1
    .mcash_ch1_req_valid_i  (mcash_ch1_req_valid      ),
    .mcash_ch1_req_allowIn_o(mcash_ch1_req_allowIn    ),
    .mcash_ch1_req_op_i     (mcash_ch1_req_op[2:0]    ),
    .mcash_ch1_req_addr_i   (mcash_ch1_req_addr[31:4] ),
    .mcash_ch1_req_data_i   (mcash_ch1_req_data[127:0]),
    .mcash_ch1_rtn_valid_o  (mcash_ch1_rtn_valid      ),
    .mcash_ch1_rtn_ready_i  (mcash_ch1_rtn_ready      ),
    .mcash_ch1_rtn_data_o   (mcash_ch1_rtn_data[127:0]),
    // channel2
    .mcash_ch2_req_valid_i  (mcash_ch2_req_valid      ),
    .mcash_ch2_req_allowIn_o(mcash_ch2_req_allowIn    ),
    .mcash_ch2_req_op_i     (mcash_ch2_req_op[2:0]    ),
    .mcash_ch2_req_addr_i   (mcash_ch2_req_addr[31:4] ),
    .mcash_ch2_req_data_i   (mcash_ch2_req_data[127:0]),
    .mcash_ch2_rtn_valid_o  (mcash_ch2_rtn_valid      ),
    .mcash_ch2_rtn_ready_i  (mcash_ch2_rtn_ready      ),
    .mcash_ch2_rtn_data_o   (mcash_ch2_rtn_data[127:0])
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
