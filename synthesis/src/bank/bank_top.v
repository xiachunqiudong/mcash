module bank_top(
  input  wire         clk_i,
  input  wire         rst_i,
  input  wire         xbar_bank_htu_valid_i,
  output wire         xbar_bank_htu_allowIn_o,
  input  wire [1:0]   xbar_bank_htu_ch_id_i,
  input  wire [1:0]   xbar_bank_htu_opcode_i,
  input  wire [31:4]  xbar_bank_htu_addr_i,
  input  wire [7:0]   xbar_bank_htu_wbuffer_id_i,
  output wire         biu_axi3_arvalid_o,
  input  wire         biu_axi3_arready_i,
  output wire [7:0]   biu_axi3_arid_o,
  output wire [31:0]  biu_axi3_araddr_o,
  output wire [2:0]   biu_axi3_arsize_o,
  output wire [3:0]   biu_axi3_arlen_o,
  output wire [1:0]   biu_axi3_arburst_o,
  input  wire         biu_axi3_rvalid_i,
  output wire         biu_axi3_rready_o,
  input  wire [7:0]   biu_axi3_rid_i,
  input  wire [255:0] biu_axi3_rdata_i,
  input  wire [1:0]   biu_axi3_rresp_i,
  input  wire         biu_axi3_rlast_i,
  output wire         biu_axi3_awvalid_o,
  input  wire         biu_axi3_awready_i,
  output wire [7:0]   biu_axi3_wid_o,
  output wire [31:0]  biu_axi3_awaddr_o,
  output wire [3:0]   biu_axi3_awlen_o,
  output wire [2:0]   biu_axi3_awsize_o,
  output wire [1:0]   biu_axi3_awburst_o,
  output wire         biu_axi3_wvalid_o,
  input  wire         biu_axi3_wready_i,
  output wire [255:0] biu_axi3_wdata_o,
  output wire [31:0]  biu_axi3_wstrb_o,
  output wire         biu_axi3_wlast_o,
  input  wire         biu_axi3_bvalid_i,
  output wire         biu_axi3_bready_o,
  input  wire [7:0]   biu_axi3_bid_i,
  input  wire [1:0]   biu_axi3_bresp_i
);

  wire        htu_isu_need_linefill;
  wire [2:0]  htu_isu_linefill_set;
  wire [2:0]  htu_isu_linefill_way;
  wire        htu_isu_valid;
  wire        htu_isu_allowIn;
  wire [1:0]  htu_isu_ch_id;
  wire [1:0]  htu_isu_opcode;
  wire [6:0]  htu_isu_set_way_offset;
  wire [7:0]  htu_isu_wbuffer_id;
  wire [1:0]  htu_isu_cacheline_offset0_state;
  wire [1:0]  htu_isu_cacheline_offset1_state;
  wire        htu_biu_arvalid;
  wire        htu_biu_arready;
  wire [31:5] htu_biu_araddr;
  wire        htu_biu_awvalid;
  wire        htu_biu_awready;
  wire [31:5] htu_biu_awaddr;
  wire [5:0]  htu_biu_set_way;
 

  wire         isu_sc_valid;
  wire         isu_sc_ready;
  wire [1:0]   isu_sc_channel_id;
  wire [2:0]   isu_sc_opcode;
  wire [6:0]   isu_sc_set_way_offset;
  wire [7:0]   isu_sc_wbuffer_id;
  wire [2:0]   isu_sc_xbar_rob_num;
  wire [1:0]   isu_sc_cacheline_dirty_offset0;
  wire [1:0]   isu_sc_cacheline_dirty_offset1;
  wire [127:0] isu_sc_linefill_data_offset0;
  wire [127:0] isu_sc_linefill_data_offset1;

  wire         sc_xbar_valid;
  wire         sc_xbar_ready;
  wire [1:0]   sc_xbar_channel_id;
  wire [2:0]   sc_xbar_rob_num;
  wire [127:0] sc_xbar_data;
  wire         sc_biu_valid;
  wire         sc_biu_ready;
  wire [127:0] sc_biu_data;
  wire         sc_biu_offset;
  wire         sc_biu_all_offset;
  wire [6:0]   sc_biu_set_way_offset;
  wire         sc_wbuf_req_valid;
  wire         sc_wbuf_req_ready;
  wire [1:0]   sc_wbuf_req_channel_id;
  wire [7:0]   sc_wbuf_req_wbuffer_id;
  wire         sc_wbuf_rtn_valid;
  wire         sc_wbuf_rtn_ready;
  wire [127:0] sc_wbuf_rtn_data;
  // biu signals
  wire         biu_isu_rvalid;
  wire         biu_isu_rready;
  wire [255:0] biu_isu_rdata;
  wire [5:0]   biu_isu_rid;
  

//---------------------------------------------------------------------------------
//                            HTU (Hit test unit)
//---------------------------------------------------------------------------------
  bank_htu_top
  htu_top (
    .clk_i                            (clk_i                               ),
    .rst_i                            (rst_i                               ),
    .xbar_bank_htu_valid_i            (xbar_bank_htu_valid_i               ),
    .xbar_bank_htu_allowIn_o          (xbar_bank_htu_allowIn_o             ),
    .xbar_bank_htu_ch_id_i            (xbar_bank_htu_ch_id_i[1:0]          ),
    .xbar_bank_htu_opcode_i           (xbar_bank_htu_opcode_i[1:0]         ),
    .xbar_bank_htu_addr_i             (xbar_bank_htu_addr_i[31:4]          ),
    .xbar_bank_htu_wbuffer_id_i       (xbar_bank_htu_wbuffer_id_i[7:0]     ),
    .htu_isu_need_linefill_o          (htu_isu_need_linefill               ),
    .htu_isu_linefill_set_o           (htu_isu_linefill_set[2:0]           ),
    .htu_isu_linefill_way_o           (htu_isu_linefill_way[2:0]           ),
    .htu_isu_valid_o                  (htu_isu_valid                       ),
    .htu_isu_allowIn_i                (htu_isu_allowIn                     ),
    .htu_isu_ch_id_o                  (htu_isu_ch_id[1:0]                  ),
    .htu_isu_opcode_o                 (htu_isu_opcode[1:0]                 ),
    .htu_isu_set_way_offset_o         (htu_isu_set_way_offset[6:0]         ),
    .htu_isu_wbuffer_id_o             (htu_isu_wbuffer_id[7:0]             ),
    .htu_isu_cacheline_offset0_state_o(htu_isu_cacheline_offset0_state[1:0]),
    .htu_isu_cacheline_offset1_state_o(htu_isu_cacheline_offset1_state[1:0]),
    .isu_htu_already_done_valid_i     (                                    ),
    .isu_htu_set_way_i                (                                    ),
    .htu_biu_arvalid_o                (htu_biu_arvalid                     ),
    .htu_biu_arready_i                (htu_biu_arready                     ),
    .htu_biu_araddr_o                 (htu_biu_araddr[31:5]                ),
    .htu_biu_awvalid_o                (htu_biu_awvalid                     ),
    .htu_biu_awready_i                (htu_biu_awready                     ),
    .htu_biu_awaddr_o                 (htu_biu_awaddr[31:5]                ),
    .htu_biu_set_way_o                (htu_biu_set_way[5:0]                )
  );


//---------------------------------------------------------------------------------
//                                     ISU
//---------------------------------------------------------------------------------
  bank_isu_top
  isu_top (
    .clk_i                            (clk_i                               ),
    .rst_i                            (rst_i                               ),
    .htu_isu_need_linefill_i          (htu_isu_need_linefill               ),
    .htu_isu_linefill_set_i           (htu_isu_linefill_set[2:0]           ),
    .htu_isu_linefill_way_i           (htu_isu_linefill_way[2:0]           ),
    .htu_isu_valid_i                  (htu_isu_valid                       ),
    .htu_isu_allowIn_o                (htu_isu_allowIn                     ),
    .htu_isu_ch_id_i                  (htu_isu_ch_id[1:0]                  ),
    .htu_isu_opcode_i                 (htu_isu_opcode[1:0]                 ),
    .htu_isu_set_way_offset_i         (htu_isu_set_way_offset[6:0]         ),
    .htu_isu_wbuffer_id_i             (htu_isu_wbuffer_id[7:0]             ),
    .htu_isu_cacheline_offset0_state_i(htu_isu_cacheline_offset0_state[1:0]),
    .htu_isu_cacheline_offset1_state_i(htu_isu_cacheline_offset1_state[1:0]),
    .biu_isu_rvalid_i                 (biu_isu_rvalid                      ),
    .biu_isu_rready_o                 (biu_isu_rready                      ),
    .biu_isu_rdata_i                  (biu_isu_rdata[255:0]                ),
    .biu_isu_rid_i                    (biu_isu_rid[5:0]                    ),
    .isu_sc_valid_o                   (isu_sc_valid                        ),
    .isu_sc_ready_i                   (isu_sc_ready                        ),
    .isu_sc_channel_id_o              (isu_sc_channel_id[1:0]              ),
    .isu_sc_opcode_o                  (isu_sc_opcode[2:0]                  ),
    .isu_sc_set_way_offset_o          (isu_sc_set_way_offset[6:0]          ),
    .isu_sc_wbuffer_id_o              (isu_sc_wbuffer_id[7:0]              ),
    .isu_sc_xbar_rob_num_o            (isu_sc_xbar_rob_num[2:0]            ),
    .isu_sc_cacheline_dirty_offset0_o (isu_sc_cacheline_dirty_offset0[1:0] ),
    .isu_sc_cacheline_dirty_offset1_o (isu_sc_cacheline_dirty_offset1[1:0] ),
    .isu_sc_linefill_data_offset0_o   (isu_sc_linefill_data_offset0[127:0] ),
    .isu_sc_linefill_data_offset1_o   (isu_sc_linefill_data_offset1[127:0] ),
    .xbar_isu_ch0_credit              (),
    .xbar_isu_ch1_credit              (),
    .xbar_isu_ch2_credit              ()
  );

//---------------------------------------------------------------------------------
//                                     BIU
//---------------------------------------------------------------------------------
  bank_biu_top #(
    .ADDR_WIDTH(32),
    .DATA_WIDTH(256),
    .ID_WIDTH  (8)
  )
  u_bank_biu (
    .clk_i                   (clk_i                     ),
    .rst_i                   (rst_i                     ),
    .htu_biu_arvalid_i       (htu_biu_arvalid           ),
    .htu_biu_arready_o       (htu_biu_arready           ),
    .htu_biu_araddr_i        (htu_biu_araddr[31:5]      ),
    .htu_biu_awvalid_i       (htu_biu_awvalid           ),
    .htu_biu_awready_o       (htu_biu_awready           ),
    .htu_biu_awaddr_i        (htu_biu_awaddr[31:5]      ),
    .htu_biu_set_way_i       (htu_biu_set_way[5:0]      ),
    .sc_biu_valid_i          (sc_biu_valid              ),
    .sc_biu_ready_o          (sc_biu_ready              ),
    .sc_biu_data_i           (sc_biu_data[127:0]        ),
    .sc_biu_offset_i         (sc_biu_offset             ),
    .sc_biu_all_offset_i     (sc_biu_all_offset         ),
    .sc_biu_set_way_offset_i (sc_biu_set_way_offset[6:0]),
    .biu_isu_rvalid_o        (biu_isu_rvalid            ),
    .biu_isu_rready_i        (biu_isu_rready            ),
    .biu_isu_rdata_o         (biu_isu_rdata[255:0]      ),
    .biu_isu_rid_o           (biu_isu_rid[5:0]          ),
    .biu_axi3_arvalid_o      (biu_axi3_arvalid_o        ),
    .biu_axi3_arready_i      (biu_axi3_arready_i        ),
    .biu_axi3_arid_o         (biu_axi3_arid_o[7:0]      ),
    .biu_axi3_araddr_o       (biu_axi3_araddr_o[31:0]   ),
    .biu_axi3_arsize_o       (biu_axi3_arsize_o[2:0]    ),
    .biu_axi3_arlen_o        (biu_axi3_arlen_o[3:0]     ),
    .biu_axi3_arburst_o      (biu_axi3_arburst_o[1:0]   ),
    .biu_axi3_rvalid_i       (biu_axi3_rvalid_i         ),
    .biu_axi3_rready_o       (biu_axi3_rready_o         ),
    .biu_axi3_rid_i          (biu_axi3_rid_i[7:0]       ),
    .biu_axi3_rdata_i        (biu_axi3_rdata_i[255:0]   ),
    .biu_axi3_rresp_i        (biu_axi3_rresp_i[1:0]     ),
    .biu_axi3_rlast_i        (biu_axi3_rlast_i          ),
    .biu_axi3_awvalid_o      (biu_axi3_awvalid_o        ),
    .biu_axi3_awready_i      (biu_axi3_awready_i        ),
    .biu_axi3_wid_o          (biu_axi3_wid_o[7:0]       ),
    .biu_axi3_awaddr_o       (biu_axi3_awaddr_o[31:0]   ),
    .biu_axi3_awlen_o        (biu_axi3_awlen_o[3:0]     ),
    .biu_axi3_awsize_o       (biu_axi3_awsize_o[2:0]    ),
    .biu_axi3_awburst_o      (biu_axi3_awburst_o[1:0]   ),
    .biu_axi3_wvalid_o       (biu_axi3_wvalid_o         ),
    .biu_axi3_wready_i       (biu_axi3_wready_i         ),
    .biu_axi3_wdata_o        (biu_axi3_wdata_o[255:0]   ),
    .biu_axi3_wstrb_o        (biu_axi3_wstrb_o[31:0]    ),
    .biu_axi3_wlast_o        (biu_axi3_wlast_o          ),
    .biu_axi3_bvalid_i       (biu_axi3_bvalid_i         ),
    .biu_axi3_bready_o       (biu_axi3_bready_o         ),
    .biu_axi3_bid_i          (biu_axi3_bid_i[7:0]       ),
    .biu_axi3_bresp_i        (biu_axi3_bresp_i[1:0]     )
  );

//---------------------------------------------------------------------------------
//                              SRAM CONTROLLER
//---------------------------------------------------------------------------------
  bank_sram_controller
  sc_top (
    .clk_i                           (clk_i                              ),
    .rst_i                           (rst_i                              ),
    .isu_sc_valid_i                  (isu_sc_valid                       ),
    .isu_sc_ready_o                  (isu_sc_ready                       ),
    .isu_sc_channel_id_i             (isu_sc_channel_id[1:0]             ),
    .isu_sc_opcode_i                 (isu_sc_opcode[2:0]                 ),
    .isu_sc_set_way_offset_i         (isu_sc_set_way_offset[6:0]         ),
    .isu_sc_wbuffer_id_i             (isu_sc_wbuffer_id[7:0]             ),
    .isu_sc_xbar_rob_num_i           (isu_sc_xbar_rob_num[2:0]           ),
    .isu_sc_cacheline_dirty_offset0_i(isu_sc_cacheline_dirty_offset0[1:0]),
    .isu_sc_cacheline_dirty_offset1_i(isu_sc_cacheline_dirty_offset1[1:0]),
    .isu_sc_linefill_data_offset0_i  (isu_sc_linefill_data_offset0[127:0]),
    .isu_sc_linefill_data_offset1_i  (isu_sc_linefill_data_offset1[127:0]),
    .sc_xbar_valid_o                 (sc_xbar_valid                      ),
    .sc_xbar_ready_i                 (sc_xbar_ready                      ),
    .sc_xbar_channel_id_o            (sc_xbar_channel_id[1:0]            ),
    .sc_xbar_rob_num_o               (sc_xbar_rob_num[2:0]               ),
    .sc_xbar_data_o                  (sc_xbar_data[127:0]                ),
    .sc_biu_valid_o                  (sc_biu_valid                       ),
    .sc_biu_ready_i                  (sc_biu_ready                       ),
    .sc_biu_data_o                   (sc_biu_data[127:0]                 ),
    .sc_biu_offset_o                 (sc_biu_offset                      ),
    .sc_biu_all_offset_o             (sc_biu_all_offset                  ),
    .sc_biu_set_way_offset_o         (sc_biu_set_way_offset[6:0]         ),
    .sc_wbuf_req_valid_o             (sc_wbuf_req_valid                  ),
    .sc_wbuf_req_ready_i             (sc_wbuf_req_ready                  ),
    .sc_wbuf_req_channel_id_o        (sc_wbuf_req_channel_id[1:0]        ),
    .sc_wbuf_req_wbuffer_id_o        (sc_wbuf_req_wbuffer_id[7:0]        ),
    .sc_wbuf_rtn_valid_i             (sc_wbuf_rtn_valid                  ),
    .sc_wbuf_rtn_ready_o             (sc_wbuf_rtn_ready                  ),
    .sc_wbuf_rtn_data_i              (sc_wbuf_rtn_data[127:0]            )
  );

//---------------------------------------------------------------------------------
//                              Write Buffer
//---------------------------------------------------------------------------------
  bank_wbuffer
  u_bank_wbuffer(
    .clk_i                   (clk_i                      ),
    .rst_i                   (rst_i                      ),
    .sc_wbuf_req_valid_i     (sc_wbuf_req_valid          ),
    .sc_wbuf_req_ready_o     (sc_wbuf_req_ready          ),
    .sc_wbuf_req_channel_id_i(sc_wbuf_req_channel_id[1:0]),
    .sc_wbuf_req_wbuffer_id_i(sc_wbuf_req_wbuffer_id[7:0]),
    .sc_wbuf_rtn_valid_o     (sc_wbuf_rtn_valid          ),
    .sc_wbuf_rtn_ready_i     (sc_wbuf_rtn_ready          ),
    .sc_wbuf_rtn_data_o      (sc_wbuf_rtn_data[127:0]    )
  );


// xbra fake model
  reg [1:0] xbar_cnt;

  assign sc_xbar_ready = xbar_cnt == 'd2;

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      xbar_cnt <= 'd0;
    end
    else begin
      if (xbar_cnt == 'd2) begin
        xbar_cnt <= 'd0;
      end
      else if (sc_xbar_valid) begin
        xbar_cnt <= xbar_cnt + 'd1;
      end
    end
  end

endmodule
