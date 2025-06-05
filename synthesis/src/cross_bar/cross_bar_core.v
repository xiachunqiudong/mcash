module cross_bar_core(
  input wire          clk_i,
  input wire          rst_i,
  // channel0
  input  wire         mcash_ch0_req_valid_i,
  output wire         mcash_ch0_req_allowIn_o,
  input  wire [1:0]   mcash_ch0_req_op_i,
  input  wire [31:4]  mcash_ch0_req_addr_i,
  input  wire [127:0] mcash_ch0_req_data_i,
  // channel1
  input  wire         mcash_ch1_req_valid_i,
  output wire         mcash_ch1_req_allowIn_o,
  input  wire [1:0]   mcash_ch1_req_op_i,
  input  wire [31:4]  mcash_ch1_req_addr_i,
  input  wire [127:0] mcash_ch1_req_data_i,
  // channel2
  input  wire         mcash_ch2_req_valid_i,
  output wire         mcash_ch2_req_allowIn_o,
  input  wire [1:0]   mcash_ch2_req_op_i,
  input  wire [31:4]  mcash_ch2_req_addr_i,
  input  wire [127:0] mcash_ch2_req_data_i,
  // xbar >> bank0 htu
  output wire         xbar_bank0_htu_valid_o,
  input  wire         xbar_bank0_htu_allowIn_i,
  output wire [1:0]   xbar_bank0_htu_ch_id_o,
  output wire [1:0]   xbar_bank0_htu_opcode_o,
  output wire [31:4]  xbar_bank0_htu_addr_o,
  output wire [127:0] xbar_bank0_htu_data_o,
  output wire [7:0]   xbar_bank0_htu_wbuffer_id_o,
  // xbar >> bank1 htu
  output wire         xbar_bank1_htu_valid_o,
  input  wire         xbar_bank1_htu_allowIn_i,
  output wire [1:0]   xbar_bank1_htu_ch_id_o,
  output wire [1:0]   xbar_bank1_htu_opcode_o,
  output wire [31:4]  xbar_bank1_htu_addr_o,
  output wire [127:0] xbar_bank1_htu_data_o,
  output wire [7:0]   xbar_bank1_htu_wbuffer_id_o,
  // xbar >> bank2 htu
  output wire         xbar_bank2_htu_valid_o,
  input  wire         xbar_bank2_htu_allowIn_i,
  output wire [1:0]   xbar_bank2_htu_ch_id_o,
  output wire [1:0]   xbar_bank2_htu_opcode_o,
  output wire [31:4]  xbar_bank2_htu_addr_o,
  output wire [127:0] xbar_bank2_htu_data_o,
  output wire [7:0]   xbar_bank2_htu_wbuffer_id_o,
  // xbar >> bank3 htu
  output wire         xbar_bank3_htu_valid_o,
  input  wire         xbar_bank3_htu_allowIn_i,
  output wire [1:0]   xbar_bank3_htu_ch_id_o,
  output wire [1:0]   xbar_bank3_htu_opcode_o,
  output wire [31:4]  xbar_bank3_htu_addr_o,
  output wire [127:0] xbar_bank3_htu_data_o,
  output wire [7:0]   xbar_bank3_htu_wbuffer_id_o
);

  wire         ch0_has_entry_want_send_to_bank0;
  wire         ch1_has_entry_want_send_to_bank0;
  wire         ch2_has_entry_want_send_to_bank0;
  wire         ch0_has_entry_want_send_to_bank1;
  wire         ch1_has_entry_want_send_to_bank1;
  wire         ch2_has_entry_want_send_to_bank1;
  wire         ch0_has_entry_want_send_to_bank2;
  wire         ch1_has_entry_want_send_to_bank2;
  wire         ch2_has_entry_want_send_to_bank2;
  wire         ch0_has_entry_want_send_to_bank3;
  wire         ch1_has_entry_want_send_to_bank3;
  wire         ch2_has_entry_want_send_to_bank3;
  wire         bank0_req_can_go;
  wire         bank1_req_can_go;
  wire         bank2_req_can_go;
  wire         bank3_req_can_go;
  wire [2:0]   bank0_ch0to2_req_valid;
  wire [2:0]   bank0_channel_grant;
  wire [2:0]   bank1_ch0to2_req_valid;
  wire [2:0]   bank1_channel_grant;
  wire [2:0]   bank2_ch0to2_req_valid;
  wire [2:0]   bank2_channel_grant;
  wire [2:0]   bank3_ch0to2_req_valid;
  wire [2:0]   bank3_channel_grant;
  wire [1:0]   ch0_send_to_bank0_op;
  wire [1:0]   ch0_send_to_bank1_op;
  wire [1:0]   ch0_send_to_bank2_op;
  wire [1:0]   ch0_send_to_bank3_op;
  wire [31:4]  ch0_send_to_bank0_addr;
  wire [31:4]  ch0_send_to_bank1_addr;
  wire [31:4]  ch0_send_to_bank2_addr;
  wire [31:4]  ch0_send_to_bank3_addr;
  wire [127:0] ch0_send_to_bank0_data;
  wire [127:0] ch0_send_to_bank1_data;
  wire [127:0] ch0_send_to_bank2_data;
  wire [127:0] ch0_send_to_bank3_data;
  wire [1:0]   ch1_send_to_bank0_op;
  wire [1:0]   ch1_send_to_bank1_op;
  wire [1:0]   ch1_send_to_bank2_op;
  wire [1:0]   ch1_send_to_bank3_op;
  wire [31:4]  ch1_send_to_bank0_addr;
  wire [31:4]  ch1_send_to_bank1_addr;
  wire [31:4]  ch1_send_to_bank2_addr;
  wire [31:4]  ch1_send_to_bank3_addr;
  wire [127:0] ch1_send_to_bank0_data;
  wire [127:0] ch1_send_to_bank1_data;
  wire [127:0] ch1_send_to_bank2_data;
  wire [127:0] ch1_send_to_bank3_data;
  wire [1:0]   ch2_send_to_bank0_op;
  wire [1:0]   ch2_send_to_bank1_op;
  wire [1:0]   ch2_send_to_bank2_op;
  wire [1:0]   ch2_send_to_bank3_op;
  wire [31:4]  ch2_send_to_bank0_addr;
  wire [31:4]  ch2_send_to_bank1_addr;
  wire [31:4]  ch2_send_to_bank2_addr;
  wire [31:4]  ch2_send_to_bank3_addr;
  wire [127:0] ch2_send_to_bank0_data;
  wire [127:0] ch2_send_to_bank1_data;
  wire [127:0] ch2_send_to_bank2_data;
  wire [127:0] ch2_send_to_bank3_data;

//--------------------------------------------------------------
//                    channel0 Buffer
//--------------------------------------------------------------
cross_bar_core_buffer
u_cross_bar_core_buffer_ch0(
  .clk_i                            (clk_i                           ),
  .rst_i                            (rst_i                           ),
  .mcash_ch_req_valid_i             (mcash_ch0_req_valid_i           ),
  .mcash_ch_req_allowIn_o           (mcash_ch0_req_allowIn_o         ),
  .mcash_ch_req_op_i                (mcash_ch0_req_op_i[1:0]         ),
  .mcash_ch_req_addr_i              (mcash_ch0_req_addr_i[31:4]      ),
  .mcash_ch_req_data_i              (mcash_ch0_req_data_i[127:0]     ),
  .ch_has_entry_want_send_to_bank0_o(ch0_has_entry_want_send_to_bank0),
  .ch_has_entry_want_send_to_bank1_o(ch0_has_entry_want_send_to_bank1),
  .ch_has_entry_want_send_to_bank2_o(ch0_has_entry_want_send_to_bank2),
  .ch_has_entry_want_send_to_bank3_o(ch0_has_entry_want_send_to_bank3),
  .bank0_channel_grant_i            (bank0_channel_grant[0]          ),
  .bank1_channel_grant_i            (bank1_channel_grant[0]          ),
  .bank2_channel_grant_i            (bank2_channel_grant[0]          ),
  .bank3_channel_grant_i            (bank3_channel_grant[0]          ),
  .bank0_req_can_go_i               (bank0_req_can_go                ),
  .bank1_req_can_go_i               (bank1_req_can_go                ),
  .bank2_req_can_go_i               (bank2_req_can_go                ),
  .bank3_req_can_go_i               (bank3_req_can_go                ),
  .ch_send_to_bank0_op_o            (ch0_send_to_bank0_op[1:0]       ),
  .ch_send_to_bank1_op_o            (ch0_send_to_bank1_op[1:0]       ),
  .ch_send_to_bank2_op_o            (ch0_send_to_bank2_op[1:0]       ),
  .ch_send_to_bank3_op_o            (ch0_send_to_bank3_op[1:0]       ),
  .ch_send_to_bank0_addr_o          (ch0_send_to_bank0_addr[31:4]    ),
  .ch_send_to_bank1_addr_o          (ch0_send_to_bank1_addr[31:4]    ),
  .ch_send_to_bank2_addr_o          (ch0_send_to_bank2_addr[31:4]    ),
  .ch_send_to_bank3_addr_o          (ch0_send_to_bank3_addr[31:4]    ),
  .ch_send_to_bank0_data_o          (ch0_send_to_bank0_data[127:0]   ),
  .ch_send_to_bank1_data_o          (ch0_send_to_bank1_data[127:0]   ),
  .ch_send_to_bank2_data_o          (ch0_send_to_bank2_data[127:0]   ),
  .ch_send_to_bank3_data_o          (ch0_send_to_bank3_data[127:0]   )
);

//--------------------------------------------------------------
//                    channel1 Buffer
//--------------------------------------------------------------
cross_bar_core_buffer
u_cross_bar_core_buffer_ch1(
  .clk_i                            (clk_i                           ),
  .rst_i                            (rst_i                           ),
  .mcash_ch_req_valid_i             (mcash_ch1_req_valid_i           ),
  .mcash_ch_req_allowIn_o           (mcash_ch1_req_allowIn_o         ),
  .mcash_ch_req_op_i                (mcash_ch1_req_op_i[1:0]         ),
  .mcash_ch_req_addr_i              (mcash_ch1_req_addr_i[31:4]      ),
  .mcash_ch_req_data_i              (mcash_ch1_req_data_i[127:0]     ),
  .ch_has_entry_want_send_to_bank0_o(ch1_has_entry_want_send_to_bank0),
  .ch_has_entry_want_send_to_bank1_o(ch1_has_entry_want_send_to_bank1),
  .ch_has_entry_want_send_to_bank2_o(ch1_has_entry_want_send_to_bank2),
  .ch_has_entry_want_send_to_bank3_o(ch1_has_entry_want_send_to_bank3),
  .bank0_channel_grant_i            (bank0_channel_grant[1]          ),
  .bank1_channel_grant_i            (bank1_channel_grant[1]          ),
  .bank2_channel_grant_i            (bank2_channel_grant[1]          ),
  .bank3_channel_grant_i            (bank3_channel_grant[1]          ),
  .bank0_req_can_go_i               (bank0_req_can_go                ),
  .bank1_req_can_go_i               (bank1_req_can_go                ),
  .bank2_req_can_go_i               (bank2_req_can_go                ),
  .bank3_req_can_go_i               (bank3_req_can_go                ),
  .ch_send_to_bank0_op_o            (ch1_send_to_bank0_op[1:0]       ),
  .ch_send_to_bank1_op_o            (ch1_send_to_bank1_op[1:0]       ),
  .ch_send_to_bank2_op_o            (ch1_send_to_bank2_op[1:0]       ),
  .ch_send_to_bank3_op_o            (ch1_send_to_bank3_op[1:0]       ),
  .ch_send_to_bank0_addr_o          (ch1_send_to_bank0_addr[31:4]    ),
  .ch_send_to_bank1_addr_o          (ch1_send_to_bank1_addr[31:4]    ),
  .ch_send_to_bank2_addr_o          (ch1_send_to_bank2_addr[31:4]    ),
  .ch_send_to_bank3_addr_o          (ch1_send_to_bank3_addr[31:4]    ),
  .ch_send_to_bank0_data_o          (ch1_send_to_bank0_data[127:0]   ),
  .ch_send_to_bank1_data_o          (ch1_send_to_bank1_data[127:0]   ),
  .ch_send_to_bank2_data_o          (ch1_send_to_bank2_data[127:0]   ),
  .ch_send_to_bank3_data_o          (ch1_send_to_bank3_data[127:0]   )
);

//--------------------------------------------------------------
//                    channel2 Buffer
//--------------------------------------------------------------
cross_bar_core_buffer
u_cross_bar_core_buffer_ch2(
  .clk_i                            (clk_i),
  .rst_i                            (rst_i),
  .mcash_ch_req_valid_i             (mcash_ch2_req_valid_i           ),
  .mcash_ch_req_allowIn_o           (mcash_ch2_req_allowIn_o         ),
  .mcash_ch_req_op_i                (mcash_ch2_req_op_i[1:0]         ),
  .mcash_ch_req_addr_i              (mcash_ch2_req_addr_i[31:4]      ),
  .mcash_ch_req_data_i              (mcash_ch2_req_data_i[127:0]     ),
  .ch_has_entry_want_send_to_bank0_o(ch2_has_entry_want_send_to_bank0),
  .ch_has_entry_want_send_to_bank1_o(ch2_has_entry_want_send_to_bank1),
  .ch_has_entry_want_send_to_bank2_o(ch2_has_entry_want_send_to_bank2),
  .ch_has_entry_want_send_to_bank3_o(ch2_has_entry_want_send_to_bank3),
  .bank0_req_can_go_i               (bank0_req_can_go                ),
  .bank1_req_can_go_i               (bank1_req_can_go                ),
  .bank2_req_can_go_i               (bank2_req_can_go                ),
  .bank3_req_can_go_i               (bank3_req_can_go                ),
  .bank0_channel_grant_i            (bank0_channel_grant[2]          ),
  .bank1_channel_grant_i            (bank1_channel_grant[2]          ),
  .bank2_channel_grant_i            (bank2_channel_grant[2]          ),
  .bank3_channel_grant_i            (bank3_channel_grant[2]          ),
  .ch_send_to_bank0_op_o            (ch2_send_to_bank0_op[1:0]       ),
  .ch_send_to_bank1_op_o            (ch2_send_to_bank1_op[1:0]       ),
  .ch_send_to_bank2_op_o            (ch2_send_to_bank2_op[1:0]       ),
  .ch_send_to_bank3_op_o            (ch2_send_to_bank3_op[1:0]       ),
  .ch_send_to_bank0_addr_o          (ch2_send_to_bank0_addr[31:4]    ),
  .ch_send_to_bank1_addr_o          (ch2_send_to_bank1_addr[31:4]    ),
  .ch_send_to_bank2_addr_o          (ch2_send_to_bank2_addr[31:4]    ),
  .ch_send_to_bank3_addr_o          (ch2_send_to_bank3_addr[31:4]    ),
  .ch_send_to_bank0_data_o          (ch2_send_to_bank0_data[127:0]   ),
  .ch_send_to_bank1_data_o          (ch2_send_to_bank1_data[127:0]   ),
  .ch_send_to_bank2_data_o          (ch2_send_to_bank2_data[127:0]   ),
  .ch_send_to_bank3_data_o          (ch2_send_to_bank3_data[127:0]   )
);

//--------------------------------------------------------------
//            Bank channel request round robin
//
// channel0------
//              |  channel
// channel1-----------------> BANK0
//              |
// channel2------
//
//
// channel0------
//              |  channel
// channel1-----------------> BANK1
//              |
// channel2------
//
//
// channel0------
//              |  channel
// channel1-----------------> BANK2
//              |
// channel2------
//
//
// channel0------
//              |  channel
// channel1-----------------> BANK3
//              |
// channel2------
//--------------------------------------------------------------

  assign bank0_ch0to2_req_valid[2:0] = {ch2_has_entry_want_send_to_bank0,
                                        ch1_has_entry_want_send_to_bank0,
                                        ch0_has_entry_want_send_to_bank0};

  assign bank1_ch0to2_req_valid[2:0] = {ch2_has_entry_want_send_to_bank1,
                                        ch1_has_entry_want_send_to_bank1,
                                        ch0_has_entry_want_send_to_bank1};

  assign bank2_ch0to2_req_valid[2:0] = {ch2_has_entry_want_send_to_bank2,
                                        ch1_has_entry_want_send_to_bank2,
                                        ch0_has_entry_want_send_to_bank2};

  assign bank3_ch0to2_req_valid[2:0] = {ch2_has_entry_want_send_to_bank3,
                                        ch1_has_entry_want_send_to_bank3,
                                        ch0_has_entry_want_send_to_bank3};

  assign bank0_req_can_go = xbar_bank0_htu_allowIn_i;
  assign bank1_req_can_go = xbar_bank1_htu_allowIn_i;
  assign bank2_req_can_go = xbar_bank2_htu_allowIn_i;
  assign bank3_req_can_go = xbar_bank3_htu_allowIn_i;

  round_robin_arbiter #(
    .N(3)
  ) bank0_arbiter(
    .clk_i       (clk_i                      ),
    .rst_i       (rst_i                      ),
    .req_i       (bank0_ch0to2_req_valid[2:0]),
    .req_can_go_i(bank0_req_can_go           ),
    .grant_o     (bank0_channel_grant[2:0]   )
  );

  round_robin_arbiter #(
    .N(3)
  ) bank1_arbiter(
    .clk_i       (clk_i                      ),
    .rst_i       (rst_i                      ),
    .req_i       (bank1_ch0to2_req_valid[2:0]),
    .req_can_go_i(bank1_req_can_go           ),
    .grant_o     (bank1_channel_grant[2:0]   )
  );

  round_robin_arbiter #(
    .N(3)
  ) bank2_arbiter(
    .clk_i       (clk_i                      ),
    .rst_i       (rst_i                      ),
    .req_i       (bank2_ch0to2_req_valid[2:0]),
    .req_can_go_i(bank2_req_can_go           ),
    .grant_o     (bank2_channel_grant[2:0]   )
  );

  round_robin_arbiter #(
    .N(3)
  ) bank3_arbiter(
    .clk_i       (clk_i                      ),
    .rst_i       (rst_i                      ),
    .req_i       (bank3_ch0to2_req_valid[2:0]),
    .req_can_go_i(bank3_req_can_go           ),
    .grant_o     (bank3_channel_grant[2:0]   )
  );

//-------------------------------------------------------------------------
//                            Wbuffer freelist
//-------------------------------------------------------------------------
  wire       bank0_allocate_req;
  wire       bank0_allocate_allowIn;
  wire [4:0] bank0_allocate_wbufferID;
  wire       bank1_allocate_req;
  wire       bank1_allocate_allowIn;
  wire [4:0] bank1_allocate_wbufferID;
  wire       bank2_allocate_req;
  wire       bank2_allocate_allowIn;
  wire [4:0] bank2_allocate_wbufferID;
  wire       bank3_allocate_req;
  wire       bank3_allocate_allowIn;
  wire [4:0] bank3_allocate_wbufferID;

  assign bank0_allocate_req = xbar_bank0_htu_valid_o & xbar_bank0_htu_allowIn_i
                            & xbar_bank0_htu_opcode_o[1:0] == 2'b01;

  assign bank1_allocate_req = xbar_bank1_htu_valid_o & xbar_bank1_htu_allowIn_i
                            & xbar_bank1_htu_opcode_o[1:0] == 2'b01;

  assign bank2_allocate_req = xbar_bank2_htu_valid_o & xbar_bank2_htu_allowIn_i
                            & xbar_bank2_htu_opcode_o[1:0] == 2'b01;

  assign bank3_allocate_req = xbar_bank3_htu_valid_o & xbar_bank3_htu_allowIn_i
                            & xbar_bank3_htu_opcode_o[1:0] == 2'b01;


  wbuffer_freelist#(
    .WBUFFER_AW (5)
  ) bank0_wbuffer_freelist(
      .clk               (clk_i                   ),
      .rst               (rst_i                   ),
      .allocate_req      (bank0_allocate_req      ),
      .allocate_allowIn  (bank0_allocate_allowIn  ),
      .allocate_wbufferID(bank0_allocate_wbufferID),
      .free_req          (1'b0),
      .free_wbufferID    ()
  );

  wbuffer_freelist#(
    .WBUFFER_AW (5)
  ) bank1_wbuffer_freelist(
      .clk               (clk_i                   ),
      .rst               (rst_i                   ),
      .allocate_req      (bank1_allocate_req      ),
      .allocate_allowIn  (bank1_allocate_allowIn  ),
      .allocate_wbufferID(bank1_allocate_wbufferID),
      .free_req          (1'b0),
      .free_wbufferID    ()
  );

  wbuffer_freelist#(
    .WBUFFER_AW (5)
  ) bank2_wbuffer_freelist(
      .clk               (clk_i                   ),
      .rst               (rst_i                   ),
      .allocate_req      (bank2_allocate_req      ),
      .allocate_allowIn  (bank2_allocate_allowIn  ),
      .allocate_wbufferID(bank2_allocate_wbufferID),
      .free_req          (1'b0),
      .free_wbufferID    ()
  );

  wbuffer_freelist#(
    .WBUFFER_AW (5)
  ) bank3_wbuffer_freelist(
      .clk               (clk_i                   ),
      .rst               (rst_i                   ),
      .allocate_req      (bank3_allocate_req      ),
      .allocate_allowIn  (bank3_allocate_allowIn  ),
      .allocate_wbufferID(bank3_allocate_wbufferID),
      .free_req          (1'b0),
      .free_wbufferID    ()
  );

  assign xbar_bank0_htu_wbuffer_id_o[7:0] = {3'b0, bank0_allocate_wbufferID[4:0]};
  assign xbar_bank1_htu_wbuffer_id_o[7:0] = {3'b0, bank1_allocate_wbufferID[4:0]};
  assign xbar_bank2_htu_wbuffer_id_o[7:0] = {3'b0, bank2_allocate_wbufferID[4:0]};
  assign xbar_bank3_htu_wbuffer_id_o[7:0] = {3'b0, bank3_allocate_wbufferID[4:0]};

//--------------------------------------------------------------
//           Corss Bar send request to Bank
//--------------------------------------------------------------

// send request to bank0
  assign xbar_bank0_htu_valid_o      = |bank0_ch0to2_req_valid[2:0];

  assign xbar_bank0_htu_ch_id_o[1:0] = {2{bank0_channel_grant[0]}} & 2'd0
                                     | {2{bank0_channel_grant[1]}} & 2'd1
                                     | {2{bank0_channel_grant[2]}} & 2'd2;

  assign xbar_bank0_htu_opcode_o[1:0] = {2{bank0_channel_grant[0]}} & ch0_send_to_bank0_op[1:0]
                                      | {2{bank0_channel_grant[1]}} & ch1_send_to_bank0_op[1:0]
                                      | {2{bank0_channel_grant[2]}} & ch2_send_to_bank0_op[1:0];

  assign xbar_bank0_htu_addr_o[31:4] = {28{bank0_channel_grant[0]}} & ch0_send_to_bank0_addr[31:4]
                                     | {28{bank0_channel_grant[1]}} & ch1_send_to_bank0_addr[31:4]
                                     | {28{bank0_channel_grant[2]}} & ch2_send_to_bank0_addr[31:4];

  assign xbar_bank0_htu_data_o[127:0] = {128{bank0_channel_grant[0]}} & ch0_send_to_bank0_data[127:0]
                                      | {128{bank0_channel_grant[1]}} & ch1_send_to_bank0_data[127:0]
                                      | {128{bank0_channel_grant[2]}} & ch2_send_to_bank0_data[127:0];

// send request to bank1
  assign xbar_bank1_htu_valid_o      = |bank1_ch0to2_req_valid[2:0];

  assign xbar_bank1_htu_ch_id_o[1:0] = {2{bank1_channel_grant[0]}} & 2'd0
                                     | {2{bank1_channel_grant[1]}} & 2'd1
                                     | {2{bank1_channel_grant[2]}} & 2'd2;

  assign xbar_bank1_htu_opcode_o[1:0] = {2{bank1_channel_grant[0]}} & ch0_send_to_bank1_op[1:0]
                                      | {2{bank1_channel_grant[1]}} & ch1_send_to_bank1_op[1:0]
                                      | {2{bank1_channel_grant[2]}} & ch2_send_to_bank1_op[1:0];

  assign xbar_bank1_htu_addr_o[31:4] = {28{bank1_channel_grant[0]}} & ch0_send_to_bank1_addr[31:4]
                                     | {28{bank1_channel_grant[1]}} & ch1_send_to_bank1_addr[31:4]
                                     | {28{bank1_channel_grant[2]}} & ch2_send_to_bank1_addr[31:4];

  assign xbar_bank1_htu_data_o[127:0] = {128{bank1_channel_grant[0]}} & ch0_send_to_bank1_data[127:0]
                                      | {128{bank1_channel_grant[1]}} & ch1_send_to_bank1_data[127:0]
                                      | {128{bank1_channel_grant[2]}} & ch2_send_to_bank1_data[127:0];

// send request to bank2
  assign xbar_bank2_htu_valid_o      = |bank2_ch0to2_req_valid[2:0];

  assign xbar_bank2_htu_ch_id_o[1:0] = {2{bank2_channel_grant[0]}} & 2'd0
                                     | {2{bank2_channel_grant[1]}} & 2'd1
                                     | {2{bank2_channel_grant[2]}} & 2'd2;

  assign xbar_bank2_htu_opcode_o[1:0] = {2{bank2_channel_grant[0]}} & ch0_send_to_bank2_op[1:0]
                                      | {2{bank2_channel_grant[1]}} & ch1_send_to_bank2_op[1:0]
                                      | {2{bank2_channel_grant[2]}} & ch2_send_to_bank2_op[1:0];

  assign xbar_bank2_htu_addr_o[31:4] = {28{bank2_channel_grant[0]}} & ch0_send_to_bank2_addr[31:4]
                                     | {28{bank2_channel_grant[1]}} & ch1_send_to_bank2_addr[31:4]
                                     | {28{bank2_channel_grant[2]}} & ch2_send_to_bank2_addr[31:4];

  assign xbar_bank2_htu_data_o[127:0] = {128{bank2_channel_grant[0]}} & ch0_send_to_bank2_data[127:0]
                                      | {128{bank2_channel_grant[1]}} & ch1_send_to_bank2_data[127:0]
                                      | {128{bank2_channel_grant[2]}} & ch2_send_to_bank2_data[127:0];

// send request to bank3
  assign xbar_bank3_htu_valid_o      = |bank3_ch0to2_req_valid[2:0];

  assign xbar_bank3_htu_ch_id_o[1:0] = {2{bank3_channel_grant[0]}} & 2'd0
                                     | {2{bank3_channel_grant[1]}} & 2'd1
                                     | {2{bank3_channel_grant[2]}} & 2'd2;

  assign xbar_bank3_htu_opcode_o[1:0] = {2{bank3_channel_grant[0]}} & ch0_send_to_bank3_op[1:0]
                                      | {2{bank3_channel_grant[1]}} & ch1_send_to_bank3_op[1:0]
                                      | {2{bank3_channel_grant[2]}} & ch2_send_to_bank3_op[1:0];

  assign xbar_bank3_htu_addr_o[31:4] = {28{bank3_channel_grant[0]}} & ch0_send_to_bank3_addr[31:4]
                                     | {28{bank3_channel_grant[1]}} & ch1_send_to_bank3_addr[31:4]
                                     | {28{bank3_channel_grant[2]}} & ch2_send_to_bank3_addr[31:4];

  assign xbar_bank3_htu_data_o[127:0] = {128{bank3_channel_grant[0]}} & ch0_send_to_bank3_data[127:0]
                                      | {128{bank3_channel_grant[1]}} & ch1_send_to_bank3_data[127:0]
                                      | {128{bank3_channel_grant[2]}} & ch2_send_to_bank3_data[127:0];

endmodule