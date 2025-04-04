//----------------------------------------------------------------------
// Instruction Scheduling Unit
//----------------------------------------------------------------------

module bank_isu_top (
  input  wire         clk_i,
  input  wire         rst_i,
  // htu >> isu
  input  wire         htu_isu_valid_i,
  output wire         htu_isu_allowIn_o,
  input  wire         htu_isu_need_linefill_i,
  input  wire [2:0]   htu_isu_linefill_set_i,
  input  wire [2:0]   htu_isu_linefill_way_i,
  input  wire [1:0]   htu_isu_ch_id_i,
  input  wire [1:0]   htu_isu_opcode_i,
  input  wire [6:0]   htu_isu_set_way_offset_i,
  input  wire [7:0]   htu_isu_wbuffer_id_i,
  input  wire [1:0]   htu_isu_cacheline_offset0_state_i,
  input  wire [1:0]   htu_isu_cacheline_offset1_state_i,
  // bui >> isu
  input  wire         biu_isu_rvalid_i,
  output wire         biu_isu_rready_o,
  input  wire [255:0] biu_isu_rdata_i,
  input  wire [5:0]   biu_isu_rid_i,
  // isu >> sc
  output wire         isu_sc_valid_o,
  input  wire         isu_sc_ready_i,
  output wire [1:0]   isu_sc_channel_id_o,
  output wire [2:0]   isu_sc_opcode_o,
  output wire [6:0]   isu_sc_set_way_offset_o,
  output wire [7:0]   isu_sc_wbuffer_id_o,
  output wire [2:0]   isu_sc_xbar_rob_num_o,
  output wire [1:0]   isu_sc_cacheline_dirty_offset0_o,
  output wire [1:0]   isu_sc_cacheline_dirty_offset1_o,
  output wire [127:0] isu_sc_linefill_data_offset0_o,
  output wire [127:0] isu_sc_linefill_data_offset1_o,
  input  wire [2:0]   xbar_isu_ch0_credit,
  input  wire [2:0]   xbar_isu_ch1_credit,
  input  wire [2:0]   xbar_isu_ch2_credit
);

  wire       htu_req_cacheline_inflight;
  wire       htu_req_need_linefill_WV;

  wire       htu_isu_kickoff;
  wire [2:0] isu_rob_id;

  wire [7:0] htu_isu_linefill_set_dcd;
  wire [7:0] htu_isu_linefill_way_dcd;

  wire [7:0] biu_isu_set_dcd;
  wire [7:0] biu_isu_way_dcd;

//-------------------------------------------------------------------------
//                            In-flight array
//-------------------------------------------------------------------------
  assign biu_isu_rready_o = 1'b1;

  assign htu_isu_linefill_set_dcd[7:0] = {htu_isu_linefill_set_i[2:0] == 3'd7,
                                          htu_isu_linefill_set_i[2:0] == 3'd6,
                                          htu_isu_linefill_set_i[2:0] == 3'd5,
                                          htu_isu_linefill_set_i[2:0] == 3'd4,
                                          htu_isu_linefill_set_i[2:0] == 3'd3,
                                          htu_isu_linefill_set_i[2:0] == 3'd2,
                                          htu_isu_linefill_set_i[2:0] == 3'd1,
                                          htu_isu_linefill_set_i[2:0] == 3'd0};

  assign htu_isu_linefill_way_dcd[7:0] = {htu_isu_linefill_way_i[2:0] == 3'd7,
                                          htu_isu_linefill_way_i[2:0] == 3'd6,
                                          htu_isu_linefill_way_i[2:0] == 3'd5,
                                          htu_isu_linefill_way_i[2:0] == 3'd4,
                                          htu_isu_linefill_way_i[2:0] == 3'd3,
                                          htu_isu_linefill_way_i[2:0] == 3'd2,
                                          htu_isu_linefill_way_i[2:0] == 3'd1,
                                          htu_isu_linefill_way_i[2:0] == 3'd0};

  assign biu_isu_set_dcd[7:0] = {biu_isu_rid_i[5:3] == 3'd7,
                                 biu_isu_rid_i[5:3] == 3'd6,
                                 biu_isu_rid_i[5:3] == 3'd5,
                                 biu_isu_rid_i[5:3] == 3'd4,
                                 biu_isu_rid_i[5:3] == 3'd3,
                                 biu_isu_rid_i[5:3] == 3'd2,
                                 biu_isu_rid_i[5:3] == 3'd1,
                                 biu_isu_rid_i[5:3] == 3'd0};

  assign biu_isu_way_dcd[7:0] = {biu_isu_rid_i[2:0] == 3'd7,
                                 biu_isu_rid_i[2:0] == 3'd6,
                                 biu_isu_rid_i[2:0] == 3'd5,
                                 biu_isu_rid_i[2:0] == 3'd4,
                                 biu_isu_rid_i[2:0] == 3'd3,
                                 biu_isu_rid_i[2:0] == 3'd2,
                                 biu_isu_rid_i[2:0] == 3'd1,
                                 biu_isu_rid_i[2:0] == 3'd0};

  assign htu_req_need_linefill_WV = htu_isu_need_linefill_i & htu_isu_valid_i;

  bank_isu_inflight_array
  isu_inflight_array (
    .clk_i                       (clk_i                        ),
    .rst_i                       (rst_i                        ),
    .htu_isu_linefill_valid_i    (htu_req_need_linefill_WV     ),
    .htu_isu_linefill_set_dcd_i  (htu_isu_linefill_set_dcd[7:0]),
    .htu_isu_linefill_way_dcd_i  (htu_isu_linefill_way_dcd[7:0]),
    .htu_isu_cacheline_inflight_o(htu_req_cacheline_inflight   ),
    .biu_isu_rvalid_i            (biu_isu_rvalid_i             ),
    .biu_isu_set_dcd_i           (biu_isu_set_dcd[7:0]         ),
    .biu_isu_way_dcd_i           (biu_isu_way_dcd[7:0]         )
  );


  reg [6:0] set_way_offset;

  reg [127:0] line_fill_data;

//-------------------------------------------------------------------------
//                            ISU: issue queue
//-------------------------------------------------------------------------

  // push req into issue queue
  assign htu_isu_kickoff = htu_isu_valid_i & htu_isu_allowIn_o;

  rob_id_gen #(
    .ID_WIDTH(3)
  ) u_isu_rob_id_gen(
    .clk_i    (clk_i               ),
    .rst_i    (rst_i               ),
    .ch_id_i  (htu_isu_ch_id_i[1:0]),
    .kickoff_i(htu_isu_kickoff     ),
    .rob_id_o (isu_rob_id[2:0]     )
  );

  bank_isu_iq #(
    .PTR_WIDTH(4)
  ) u_isu_iq (
    .clk_i                        (clk_i                                 ),
    .rst_i                        (rst_i                                 ),
    .req_valid_i                  (htu_isu_valid_i                       ),
    .req_allowIn_o                (htu_isu_allowIn_o                     ),
    .req_need_linefill_i          (htu_isu_need_linefill_i               ),
    .req_cacheline_inflight_i     (htu_req_cacheline_inflight            ),
    .req_rob_id_i                 (isu_rob_id[2:0]                       ),
    .req_ch_id_i                  (htu_isu_ch_id_i[1:0]                  ),
    .req_opcode_i                 (htu_isu_opcode_i[1:0]                 ),
    .req_set_way_offset_i         (htu_isu_set_way_offset_i[6:0]         ),
    .req_wbuffer_id_i             (htu_isu_wbuffer_id_i[7:0]             ),
    .req_cacheline_offset0_state_i(htu_isu_cacheline_offset0_state_i[1:0]),
    .req_cacheline_offset1_state_i(htu_isu_cacheline_offset1_state_i[1:0]),
    .biu_isu_rvalid_i             (biu_isu_rvalid_i                      ),
    .biu_isu_rid_i                (biu_isu_rid_i[5:0]                    )
  );


  bank_isu_linefill_buffer
  isu_linefill_buffer(
    .clk_i  (clk_i),
    .wen_i  (biu_isu_rvalid_i),
    .waddr_i(biu_isu_rid_i[5:0]),
    .wdata_i(biu_isu_rdata_i),
    .ren_i  (),
    .raddr_i(),
    .rdata_o()
  );

//-------------------------------------------------------------------------
//                              ISU >> SC
//-------------------------------------------------------------------------
  // assign isu_sc_valid_o = htu_isu_valid_i;
  assign isu_sc_valid_o = 1'b1;

  assign isu_sc_channel_id_o[1:0] = htu_isu_ch_id_i[1:0];

  // assign isu_sc_opcode_o[1:0] = htu_isu_opcode_i[1:0];
  assign isu_sc_opcode_o[2:0] = 3'b011;

  // assign htu_isu_set_way_offset_i[6:0] = htu_isu_set_way_offset_i[6:0];

  assign isu_sc_wbuffer_id_o[7:0] = 8'd0;
  assign isu_sc_xbar_rob_num_o[2:0] = 'd0;

  assign isu_sc_cacheline_dirty_offset0_o[1:0] = 'b10; // empty
  assign isu_sc_cacheline_dirty_offset1_o[1:0] = 'b10; // empty


  assign isu_sc_set_way_offset_o = set_way_offset;

  assign isu_sc_linefill_data_offset0_o = line_fill_data;
  assign isu_sc_linefill_data_offset1_o = line_fill_data + 'd1;



  always @(posedge clk_i or rst_i) begin
    if (rst_i) begin
      set_way_offset <= 'd0;
      line_fill_data <= 'd0;
    end
    else begin
      if (isu_sc_valid_o & isu_sc_ready_i) begin
        set_way_offset <= set_way_offset + 'd2;
        line_fill_data <= line_fill_data + 'd100;
      end
    end
  end

endmodule