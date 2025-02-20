module mcash_top (
  input wire clk_i,
  input wire rst_i
);

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

  sram_controller
  u_sram_controller (
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

endmodule