module bank_top(
  input  wire        clk_i,
  input  wire        rst_i,
  input  wire        xbar_bank_htu_valid_i,
  output wire        xbar_bank_htu_ready_o,
  input  wire [1:0]  xbar_bank_htu_ch_id_i,
  input  wire [1:0]  xbar_bank_htu_opcode_i,
  input  wire [31:4] xbar_bank_htu_addr_i,
  input  wire [7:0]  xbar_bank_htu_wbuffer_id_i
);

  wire         htu_isu_linefill_valid;
  wire [2:0]   htu_isu_linefill_set;
  wire [2:0]   htu_isu_linefill_way;
  wire         htu_isu_valid;
  wire         htu_isu_ready;
  wire [1:0]   htu_isu_ch_id;
  wire [1:0]   htu_isu_opcode;
  wire [6:0]   htu_isu_set_way_offset;
  wire [7:0]   htu_isu_wbuffer_id;
  wire [1:0]   htu_isu_cacheline_offset0_state;
  wire [1:0]   htu_isu_cacheline_offset1_state;

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
  wire         sc_subm_valid;
  wire         sc_subm_ready;
  wire [127:0] sc_subm_data;
  wire         sc_subm_offset;
  wire         sc_subm_all_offset;
  wire [6:0]   sc_subm_set_way_offset;
  wire         rc_wbuf_req_valid;
  wire         rc_wbuf_req_ready;
  wire [1:0]   rc_wbuf_req_channel_id;
  wire [7:0]   rc_wbuf_req_wbuffer_id;
  wire         rc_wbuf_rtn_valid;
  wire         rc_wbuf_rtn_ready;
  wire [127:0] rc_wbuf_rtn_data;

//---------------------------------------------------------------------------------
//                            HTU (Hit test unit)
//---------------------------------------------------------------------------------
  bank_htu
  u_bank_htu (
    .clk_i                            (clk_i                               ),
    .rst_i                            (rst_i                               ),
    .xbar_bank_htu_valid_i            (xbar_bank_htu_valid_i               ),
    .xbar_bank_htu_ready_o            (xbar_bank_htu_ready_o               ),
    .xbar_bank_htu_ch_id_i            (xbar_bank_htu_ch_id_i[1:0]          ),
    .xbar_bank_htu_opcode_i           (xbar_bank_htu_opcode_i[1:0]         ),
    .xbar_bank_htu_addr_i             (xbar_bank_htu_addr_i[31:4]          ),
    .xbar_bank_htu_wbuffer_id_i       (xbar_bank_htu_wbuffer_id_i[7:0]     ),
    .htu_isu_linefill_valid_o         (htu_isu_linefill_valid              ),
    .htu_isu_linefill_set_o           (htu_isu_linefill_set[2:0]           ),
    .htu_isu_linefill_way_o           (htu_isu_linefill_way[2:0]           ),
    .htu_isu_valid_o                  (htu_isu_valid                       ),
    .htu_isu_ready_i                  (htu_isu_ready                       ),
    .htu_isu_ch_id_o                  (htu_isu_ch_id[1:0]                  ),
    .htu_isu_opcode_o                 (htu_isu_opcode[1:0]                 ),
    .htu_isu_set_way_offset_o         (htu_isu_set_way_offset[6:0]         ),
    .htu_isu_wbuffer_id_o             (htu_isu_wbuffer_id[7:0]             ),
    .htu_isu_cacheline_offset0_state_o(htu_isu_cacheline_offset0_state[1:0]),
    .htu_isu_cacheline_offset1_state_o(htu_isu_cacheline_offset1_state[1:0]),
    .isu_htu_already_done_valid_i     (),
    .isu_htu_set_way_i                (),
    .htu_submem_valid_o               (),
    .htu_submem_ready_i               (),
    .htu_submem_opcode_o              (),
    .htu_submem_set_way_o             (),
    .htu_submem_set_addr_o            ()
  );


//---------------------------------------------------------------------------------
//                                     ISU
//---------------------------------------------------------------------------------
  bank_isu_top
  u_bank_isu (
    .clk_i                            (clk_i                               ),
    .rst_i                            (rst_i                               ),
    .htu_isu_linefill_valid_i         (htu_isu_linefill_valid              ),
    .htu_isu_linefill_set_i           (htu_isu_linefill_set[2:0]           ),
    .htu_isu_linefill_way_i           (htu_isu_linefill_way[2:0]           ),
    .htu_isu_valid_i                  (htu_isu_valid                       ),
    .htu_isu_ready_o                  (htu_isu_ready                       ),
    .htu_isu_ch_id_i                  (htu_isu_ch_id[1:0]                  ),
    .htu_isu_opcode_i                 (htu_isu_opcode[1:0]                 ),
    .htu_isu_set_way_offset_i         (htu_isu_set_way_offset[6:0]         ),
    .htu_isu_wbuffer_id_i             (htu_isu_wbuffer_id[7:0]             ),
    .htu_isu_cacheline_offset0_state_i(htu_isu_cacheline_offset0_state[1:0]),
    .htu_isu_cacheline_offset1_state_i(htu_isu_cacheline_offset1_state[1:0]),
    .biu_isu_valid_i (),
    .biu_isu_ready_o(),
    .biu_isu_rdata_i(),
    .biu_isu_rid_i(),
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
    .xbar_isu_ch0_credit(),
    .xbar_isu_ch1_credit(),
    .xbar_isu_ch2_credit()
  );

//---------------------------------------------------------------------------------
//                              SRAM CONTROLLER
//---------------------------------------------------------------------------------
  bank_sram_controller
  u_bank_sram_controller (
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
    .sc_subm_valid_o                 (sc_subm_valid                      ),
    .sc_subm_ready_i                 (sc_subm_ready                      ),
    .sc_subm_data_o                  (sc_subm_data[127:0]                ),
    .sc_subm_offset_o                (sc_subm_offset                     ),
    .sc_subm_all_offset_o            (sc_subm_all_offset                 ),
    .sc_subm_set_way_offset_o        (sc_subm_set_way_offset[6:0]        ),
    .rc_wbuf_req_valid_o             (rc_wbuf_req_valid                  ),
    .rc_wbuf_req_ready_i             (rc_wbuf_req_ready                  ),
    .rc_wbuf_req_channel_id_o        (rc_wbuf_req_channel_id[1:0]        ),
    .rc_wbuf_req_wbuffer_id_o        (rc_wbuf_req_wbuffer_id[7:0]        ),
    .rc_wbuf_rtn_valid_i             (rc_wbuf_rtn_valid                  ),
    .rc_wbuf_rtn_ready_o             (rc_wbuf_rtn_ready                  ),
    .rc_wbuf_rtn_data_i              (rc_wbuf_rtn_data[127:0]            )
  );

//---------------------------------------------------------------------------------
//                              Write Buffer
//---------------------------------------------------------------------------------
  bank_wbuffer
  u_bank_wbuffer(
    .clk_i                   (clk_i                      ),
    .rst_i                   (rst_i                      ),
    .rc_wbuf_req_valid_i     (rc_wbuf_req_valid          ),
    .rc_wbuf_req_ready_o     (rc_wbuf_req_ready          ),
    .rc_wbuf_req_channel_id_i(rc_wbuf_req_channel_id[1:0]),
    .rc_wbuf_req_wbuffer_id_i(rc_wbuf_req_wbuffer_id[7:0]),
    .rc_wbuf_rtn_valid_o     (rc_wbuf_rtn_valid          ),
    .rc_wbuf_rtn_ready_i     (rc_wbuf_rtn_ready          ),
    .rc_wbuf_rtn_data_o      (rc_wbuf_rtn_data[127:0]    )
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
