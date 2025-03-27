module bank_htu(
  input  wire        clk_i,
  input  wire        rst_i,
  // xbar >> htu
  input  wire        xbar_bank_htu_valid_i,
  output wire        xbar_bank_htu_allowIn_o,
  input  wire [1:0]  xbar_bank_htu_ch_id_i,
  input  wire [1:0]  xbar_bank_htu_opcode_i,
  input  wire [31:4] xbar_bank_htu_addr_i,
  input  wire [7:0]  xbar_bank_htu_wbuffer_id_i,
  // htu >> isu
  output wire        htu_isu_linefill_valid_o,
  output wire [2:0]  htu_isu_linefill_set_o,
  output wire [2:0]  htu_isu_linefill_way_o,
  output wire        htu_isu_valid_o,
  input  wire        htu_isu_allowIn_i,
  output wire [1:0]  htu_isu_ch_id_o,
  output wire [1:0]  htu_isu_opcode_o,
  output wire [6:0]  htu_isu_set_way_offset_o,
  output wire [7:0]  htu_isu_wbuffer_id_o,
  output wire [1:0]  htu_isu_cacheline_offset0_state_o,
  output wire [1:0]  htu_isu_cacheline_offset1_state_o,
  // isu >> htu
  input  wire        isu_htu_already_done_valid_i,
  input  wire [5:0]  isu_htu_set_way_i,
  // htu >> sub mem
  output wire        htu_biu_valid_o,
  input  wire        htu_biu_ready_i,
  output wire [1:0]  htu_biu_opcode_o,
  output wire [5:0]  htu_biu_set_way_o,
  output wire [31:5] htu_biu_addr_o
);

  wire         op_is_read;
  wire         op_is_write;
  wire         op_is_flush;
  wire         op_is_invalidate;
  wire [2:0]   htu_cacheline_index;
  wire [7:0]   htu_cacheline_index_dcd;
  wire         htu_cacheline_offset;
  wire [31:10] htu_cacheline_tag;
  wire [7:0]   htu_cacheline_index_dcd_WV;
  wire [7:0]   cacheline_hit_array;
  wire         cacheline_hit;
  wire         cacheline_need_refill;
  wire [7:0]   cacheline_evit_WV_array;
  wire         cacheline_evit_WV;
  wire [31:10] evit_cacheline_tag;
  wire [31:10] set0_evit_cacheline_tag;
  wire [31:10] set1_evit_cacheline_tag;
  wire [31:10] set2_evit_cacheline_tag;
  wire [31:10] set3_evit_cacheline_tag;
  wire [31:10] set4_evit_cacheline_tag;
  wire [31:10] set5_evit_cacheline_tag;
  wire [31:10] set6_evit_cacheline_tag;
  wire [31:10] set7_evit_cacheline_tag;
  wire [1:0]   access_cacheline_offset_state;
  wire [1:0]   set0_cacheline_offset0_state;
  wire [1:0]   set0_cacheline_offset1_state;
  wire [1:0]   set1_cacheline_offset0_state;
  wire [1:0]   set1_cacheline_offset1_state;
  wire [1:0]   set2_cacheline_offset0_state;
  wire [1:0]   set2_cacheline_offset1_state;
  wire [1:0]   set3_cacheline_offset0_state;
  wire [1:0]   set3_cacheline_offset1_state;
  wire [1:0]   set4_cacheline_offset0_state;
  wire [1:0]   set4_cacheline_offset1_state;
  wire [1:0]   set5_cacheline_offset0_state;
  wire [1:0]   set5_cacheline_offset1_state;
  wire [1:0]   set6_cacheline_offset0_state;
  wire [1:0]   set6_cacheline_offset1_state;
  wire [1:0]   set7_cacheline_offset0_state;
  wire [1:0]   set7_cacheline_offset1_state;
  wire [2:0]   htu_access_way;
  wire [2:0]   set0_access_way;
  wire [2:0]   set1_access_way;
  wire [2:0]   set2_access_way;
  wire [2:0]   set3_access_way;
  wire [2:0]   set4_access_way;
  wire [2:0]   set5_access_way;
  wire [2:0]   set6_access_way;
  wire [2:0]   set7_access_way;

//---------------------------------------------------------------
//                       HTU decoder
// mcash opcode
// 00 : read data
// 01 : write data
// 10 : flush dirty cacheline
// 11 : cache invalidate
//---------------------------------------------------------------
  assign op_is_read       = xbar_bank_htu_opcode_i[1:0] == 2'b00;
  assign op_is_write      = xbar_bank_htu_opcode_i[1:0] == 2'b01;
  assign op_is_flush      = xbar_bank_htu_opcode_i[1:0] == 2'b10;
  assign op_is_invalidate = xbar_bank_htu_opcode_i[1:0] == 2'b11;

  assign htu_cacheline_index[2:0] = xbar_bank_htu_addr_i[7:5];
  assign htu_cacheline_offset     = xbar_bank_htu_addr_i[4];
  assign htu_cacheline_tag[31:10] = xbar_bank_htu_addr_i[31:10];

  assign htu_cacheline_index_dcd[7:0] = {htu_cacheline_index[2:0] == 3'd7,
                                         htu_cacheline_index[2:0] == 3'd6,
                                         htu_cacheline_index[2:0] == 3'd5,
                                         htu_cacheline_index[2:0] == 3'd4,
                                         htu_cacheline_index[2:0] == 3'd3,
                                         htu_cacheline_index[2:0] == 3'd2,
                                         htu_cacheline_index[2:0] == 3'd1,
                                         htu_cacheline_index[2:0] == 3'd0};

  assign htu_cacheline_index_dcd_WV[7:0] = {8{xbar_bank_htu_valid_i}} & htu_cacheline_index_dcd[7:0];


  assign cacheline_need_refill = xbar_bank_htu_valid_i & op_is_read
                               & (   ~cacheline_hit                               // cacheline miss
                                    | access_cacheline_offset_state[1:0] == 2'b00 // cacheline hit but empty [E, D]
                                 );

//-------------------------------------------------------------------------
//                               HTU >> ISU
//-------------------------------------------------------------------------
  assign cacheline_hit = |cacheline_hit_array[7:0];

  assign htu_access_way[2:0] = {3{htu_cacheline_index_dcd[0]}} & set0_access_way[2:0]
                             | {3{htu_cacheline_index_dcd[1]}} & set1_access_way[2:0]
                             | {3{htu_cacheline_index_dcd[2]}} & set2_access_way[2:0]
                             | {3{htu_cacheline_index_dcd[3]}} & set3_access_way[2:0]
                             | {3{htu_cacheline_index_dcd[4]}} & set4_access_way[2:0]
                             | {3{htu_cacheline_index_dcd[5]}} & set5_access_way[2:0]
                             | {3{htu_cacheline_index_dcd[6]}} & set6_access_way[2:0]
                             | {3{htu_cacheline_index_dcd[7]}} & set7_access_way[2:0];

  assign htu_isu_linefill_valid_o = cacheline_need_refill;

  assign htu_isu_linefill_set_o[2:0] = htu_cacheline_index[2:0];

  assign htu_isu_linefill_way_o[2:0] = htu_access_way[2:0];

  assign htu_isu_valid_o = xbar_bank_htu_valid_i;

  assign xbar_bank_htu_allowIn_o = htu_isu_allowIn_i;

// ISU opcode[0]: 0 => read    1 => write
// ISU opcode[1]: 0 => no evit 1 => need evit
  assign htu_isu_opcode_o[0] = op_is_write;
  assign htu_isu_opcode_o[1] = cacheline_evit_WV;

  assign htu_isu_ch_id_o[1:0] = xbar_bank_htu_ch_id_i[1:0];

  assign cacheline_evit_WV = |cacheline_evit_WV_array[7:0];

  assign htu_isu_set_way_offset_o[6:0] = {htu_cacheline_index[2:0],
                                          htu_access_way[2:0],
                                          htu_cacheline_offset};

  assign htu_isu_cacheline_offset0_state_o[1:0] = {2{htu_cacheline_index_dcd[0]}} & set0_cacheline_offset0_state[1:0]
                                                | {2{htu_cacheline_index_dcd[1]}} & set1_cacheline_offset0_state[1:0]
                                                | {2{htu_cacheline_index_dcd[2]}} & set2_cacheline_offset0_state[1:0]
                                                | {2{htu_cacheline_index_dcd[3]}} & set3_cacheline_offset0_state[1:0]
                                                | {2{htu_cacheline_index_dcd[4]}} & set4_cacheline_offset0_state[1:0]
                                                | {2{htu_cacheline_index_dcd[5]}} & set5_cacheline_offset0_state[1:0]
                                                | {2{htu_cacheline_index_dcd[6]}} & set6_cacheline_offset0_state[1:0]
                                                | {2{htu_cacheline_index_dcd[7]}} & set7_cacheline_offset0_state[1:0];

  assign htu_isu_cacheline_offset1_state_o[1:0] = {2{htu_cacheline_index_dcd[0]}} & set0_cacheline_offset1_state[1:0]
                                                | {2{htu_cacheline_index_dcd[1]}} & set1_cacheline_offset1_state[1:0]
                                                | {2{htu_cacheline_index_dcd[2]}} & set2_cacheline_offset1_state[1:0]
                                                | {2{htu_cacheline_index_dcd[3]}} & set3_cacheline_offset1_state[1:0]
                                                | {2{htu_cacheline_index_dcd[4]}} & set4_cacheline_offset1_state[1:0]
                                                | {2{htu_cacheline_index_dcd[5]}} & set5_cacheline_offset1_state[1:0]
                                                | {2{htu_cacheline_index_dcd[6]}} & set6_cacheline_offset1_state[1:0]
                                                | {2{htu_cacheline_index_dcd[7]}} & set7_cacheline_offset1_state[1:0];

  assign access_cacheline_offset_state[1:0] = htu_cacheline_offset
                                            ? htu_isu_cacheline_offset1_state_o[1:0]
                                            : htu_isu_cacheline_offset0_state_o[1:0];

//-------------------------------------------------------------------------
//                               HTU >> BIU
//-------------------------------------------------------------------------
  assign htu_biu_valid_o = cacheline_need_refill;

  assign htu_biu_opcode_o = 0;

  assign htu_biu_set_way_o[5:0] = {htu_cacheline_index[2:0],
                                   htu_access_way[2:0]};

  assign htu_biu_addr_o[31:5] = xbar_bank_htu_addr_i[31:5];

  assign evit_cacheline_tag[31:10] = {10{htu_cacheline_index_dcd[0]}} & set0_evit_cacheline_tag[31:10]
                                   | {10{htu_cacheline_index_dcd[1]}} & set1_evit_cacheline_tag[31:10]
                                   | {10{htu_cacheline_index_dcd[2]}} & set2_evit_cacheline_tag[31:10]
                                   | {10{htu_cacheline_index_dcd[3]}} & set3_evit_cacheline_tag[31:10]
                                   | {10{htu_cacheline_index_dcd[4]}} & set4_evit_cacheline_tag[31:10]
                                   | {10{htu_cacheline_index_dcd[5]}} & set5_evit_cacheline_tag[31:10]
                                   | {10{htu_cacheline_index_dcd[6]}} & set6_evit_cacheline_tag[31:10]
                                   | {10{htu_cacheline_index_dcd[7]}} & set7_evit_cacheline_tag[31:10];


//-------------------------------------------------------------------------
//                         HTU set array
// set[0-7]
//-------------------------------------------------------------------------
// set0
  bank_htu_set_entry
  u_bank_htu_set_entry0 (
    .clk_i                    (clk_i                            ),
    .rst_i                    (rst_i                            ),
    .op_is_read_i             (op_is_read                       ),
    .op_is_write_i            (op_is_write                      ),
    .op_is_flush_i            (op_is_flush                      ),
    .op_is_invalidate_i       (op_is_invalidate                 ),
    .set_hit_WV_i             (htu_cacheline_index_dcd_WV[0]    ),
    .access_tag_i             (htu_cacheline_tag[31:10]         ),
    .access_offset_i          (htu_cacheline_offset             ),
    .cacheline_need_evit_WV_o (cacheline_evit_WV_array[0]       ),
    .evit_cacheline_tag_o     (set0_evit_cacheline_tag[31:10]   ),
    .cacheline_hit_o          (cacheline_hit_array[0]           ),
    .cacheline_offset0_state_o(set0_cacheline_offset0_state[1:0]),
    .cacheline_offset1_state_o(set0_cacheline_offset1_state[1:0]),
    .access_way_o             (set0_access_way[2:0]             )
  );

// set1
  bank_htu_set_entry
  u_bank_htu_set_entry1 (
    .clk_i                    (clk_i                            ),
    .rst_i                    (rst_i                            ),
    .op_is_read_i             (op_is_read                       ),
    .op_is_write_i            (op_is_write                      ),
    .op_is_flush_i            (op_is_flush                      ),
    .op_is_invalidate_i       (op_is_invalidate                 ),
    .set_hit_WV_i             (htu_cacheline_index_dcd_WV[1]    ),
    .access_tag_i             (htu_cacheline_tag[31:10]         ),
    .access_offset_i          (htu_cacheline_offset             ),
    .cacheline_need_evit_WV_o (cacheline_evit_WV_array[1]       ),
    .evit_cacheline_tag_o     (set1_evit_cacheline_tag[31:10]   ),
    .cacheline_hit_o          (cacheline_hit_array[1]           ),
    .cacheline_offset0_state_o(set1_cacheline_offset0_state[1:0]),
    .cacheline_offset1_state_o(set1_cacheline_offset1_state[1:0]),
    .access_way_o             (set1_access_way[2:0]             )
  );

// set2
  bank_htu_set_entry
  u_bank_htu_set_entry2 (
    .clk_i                    (clk_i                            ),
    .rst_i                    (rst_i                            ),
    .op_is_read_i             (op_is_read                       ),
    .op_is_write_i            (op_is_write                      ),
    .op_is_flush_i            (op_is_flush                      ),
    .op_is_invalidate_i       (op_is_invalidate                 ),
    .set_hit_WV_i             (htu_cacheline_index_dcd_WV[2]    ),
    .access_tag_i             (htu_cacheline_tag[31:10]         ),
    .access_offset_i          (htu_cacheline_offset             ),
    .cacheline_need_evit_WV_o (cacheline_evit_WV_array[2]       ),
    .evit_cacheline_tag_o     (set2_evit_cacheline_tag[31:10]   ),
    .cacheline_hit_o          (cacheline_hit_array[2]           ),
    .cacheline_offset0_state_o(set2_cacheline_offset0_state[1:0]),
    .cacheline_offset1_state_o(set2_cacheline_offset1_state[1:0]),
    .access_way_o             (set2_access_way[2:0]             )
  );

// set3
  bank_htu_set_entry
  u_bank_htu_set_entry3 (
    .clk_i                    (clk_i                            ),
    .rst_i                    (rst_i                            ),
    .op_is_read_i             (op_is_read                       ),
    .op_is_write_i            (op_is_write                      ),
    .op_is_flush_i            (op_is_flush                      ),
    .op_is_invalidate_i       (op_is_invalidate                 ),
    .set_hit_WV_i             (htu_cacheline_index_dcd_WV[3]    ),
    .access_tag_i             (htu_cacheline_tag[31:10]         ),
    .access_offset_i          (htu_cacheline_offset             ),
    .cacheline_need_evit_WV_o (cacheline_evit_WV_array[3]       ),
    .evit_cacheline_tag_o     (set3_evit_cacheline_tag[31:10]   ),
    .cacheline_hit_o          (cacheline_hit_array[3]           ),
    .cacheline_offset0_state_o(set3_cacheline_offset0_state[1:0]),
    .cacheline_offset1_state_o(set3_cacheline_offset1_state[1:0]),
    .access_way_o             (set3_access_way[2:0]             )
  );

// set4
  bank_htu_set_entry
  u_bank_htu_set_entry4 (
    .clk_i                    (clk_i                            ),
    .rst_i                    (rst_i                            ),
    .op_is_read_i             (op_is_read                       ),
    .op_is_write_i            (op_is_write                      ),
    .op_is_flush_i            (op_is_flush                      ),
    .op_is_invalidate_i       (op_is_invalidate                 ),
    .set_hit_WV_i             (htu_cacheline_index_dcd_WV[4]    ),
    .access_tag_i             (htu_cacheline_tag[31:10]         ),
    .access_offset_i          (htu_cacheline_offset             ),
    .cacheline_need_evit_WV_o (cacheline_evit_WV_array[4]       ),
    .evit_cacheline_tag_o     (set4_evit_cacheline_tag[31:10]   ),
    .cacheline_hit_o          (cacheline_hit_array[4]           ),
    .cacheline_offset0_state_o(set4_cacheline_offset0_state[1:0]),
    .cacheline_offset1_state_o(set4_cacheline_offset1_state[1:0]),
    .access_way_o             (set4_access_way[2:0]             )
  );

// set5
  bank_htu_set_entry
  u_bank_htu_set_entry5 (
    .clk_i                    (clk_i                            ),
    .rst_i                    (rst_i                            ),
    .op_is_read_i             (op_is_read                       ),
    .op_is_write_i            (op_is_write                      ),
    .op_is_flush_i            (op_is_flush                      ),
    .op_is_invalidate_i       (op_is_invalidate                 ),
    .set_hit_WV_i             (htu_cacheline_index_dcd_WV[5]    ),
    .access_tag_i             (htu_cacheline_tag[31:10]         ),
    .access_offset_i          (htu_cacheline_offset             ),
    .cacheline_need_evit_WV_o (cacheline_evit_WV_array[5]       ),
    .evit_cacheline_tag_o     (set5_evit_cacheline_tag[31:10]   ),
    .cacheline_hit_o          (cacheline_hit_array[5]           ),
    .cacheline_offset0_state_o(set5_cacheline_offset0_state[1:0]),
    .cacheline_offset1_state_o(set5_cacheline_offset1_state[1:0]),
    .access_way_o             (set5_access_way[2:0]             )
  );

// set6
  bank_htu_set_entry
  u_bank_htu_set_entry6 (
    .clk_i                    (clk_i                            ),
    .rst_i                    (rst_i                            ),
    .op_is_read_i             (op_is_read                       ),
    .op_is_write_i            (op_is_write                      ),
    .op_is_flush_i            (op_is_flush                      ),
    .op_is_invalidate_i       (op_is_invalidate                 ),
    .set_hit_WV_i             (htu_cacheline_index_dcd_WV[6]    ),
    .access_tag_i             (htu_cacheline_tag[31:10]         ),
    .access_offset_i          (htu_cacheline_offset             ),
    .cacheline_need_evit_WV_o (cacheline_evit_WV_array[6]       ),
    .evit_cacheline_tag_o     (set6_evit_cacheline_tag[31:10]   ),
    .cacheline_hit_o          (cacheline_hit_array[6]           ),
    .cacheline_offset0_state_o(set6_cacheline_offset0_state[1:0]),
    .cacheline_offset1_state_o(set6_cacheline_offset1_state[1:0]),
    .access_way_o             (set6_access_way[2:0]             )
  );

// set7
  bank_htu_set_entry
  u_bank_htu_set_entry7 (
    .clk_i                    (clk_i                            ),
    .rst_i                    (rst_i                            ),
    .op_is_read_i             (op_is_read                       ),
    .op_is_write_i            (op_is_write                      ),
    .op_is_flush_i            (op_is_flush                      ),
    .op_is_invalidate_i       (op_is_invalidate                 ),
    .set_hit_WV_i             (htu_cacheline_index_dcd_WV[7]    ),
    .access_tag_i             (htu_cacheline_tag[31:10]         ),
    .access_offset_i          (xbar_bank_htu_addr_i[7]          ),
    .cacheline_need_evit_WV_o (cacheline_evit_WV_array[7]       ),
    .evit_cacheline_tag_o     (set7_evit_cacheline_tag[31:10]   ),
    .cacheline_hit_o          (cacheline_hit_array[7]           ),
    .cacheline_offset0_state_o(set7_cacheline_offset0_state[1:0]),
    .cacheline_offset1_state_o(set7_cacheline_offset1_state[1:0]),
    .access_way_o             (set7_access_way[2:0]             )
  );

endmodule