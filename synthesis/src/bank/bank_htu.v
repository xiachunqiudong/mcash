module bank_htu(
  input  wire        clk_i,
  input  wire        rst_i,
  // xbar >> htu
  input  wire        xbar_bank_htu_valid_i,
  output wire        xbar_bank_htu_ready_o,
  input  wire [1:0]  xbar_bank_htu_ch_id_i,
  input  wire [1:0]  xbar_bank_htu_opcode_i,
  input  wire [31:4] xbar_bank_htu_addr_i,
  input  wire [7:0]  xbar_bank_htu_wbuffer_id_i,
  // htu >> isu
  output wire        htu_isu_valid_o,
  input  wire        htu_isu_ready_i,
  output wire [1:0]  htu_isu_ch_id_o,
  output wire [2:0]  htu_isu_opcode_o,
  output wire [6:0]  htu_isu_set_way_offset_o,
  output wire [7:0]  htu_isu_wbuffer_id_o,
  output wire [1:0]  htu_isu_cacheline_offset0_state_o,
  output wire [1:0]  htu_isu_cacheline_offset1_state_o,
  // isu >> htu
  input  wire        isu_htu_already_done_valid_i,
  input  wire [5:0]  isu_htu_set_way_i,
  // htu >> sub mem
  output wire        htu_submem_valid_o,
  input  wire        htu_submem_ready_i,
  output wire [1:0]  htu_submem_opcode_o,
  output wire [1:0]  htu_submem_set_way_o,
  output wire [31:4] htu_submem_set_addr_o
);

  wire       op_is_read;
  wire       op_is_write;
  wire       op_is_flush;
  wire       op_is_invalidate;

  wire [7:0] set_hit_array;
  wire [7:0] set_hit_array_WV;

  wire [7:0] cacheline_hit_array;
  wire       cacheline_hit;

  wire [1:0] set0_cacheline_offset0_state;
  wire [1:0] set0_cacheline_offset1_state;
  wire [1:0] set1_cacheline_offset0_state;
  wire [1:0] set1_cacheline_offset1_state;
  wire [1:0] set2_cacheline_offset0_state;
  wire [1:0] set2_cacheline_offset1_state;
  wire [1:0] set3_cacheline_offset0_state;
  wire [1:0] set3_cacheline_offset1_state;
  wire [1:0] set4_cacheline_offset0_state;
  wire [1:0] set4_cacheline_offset1_state;
  wire [1:0] set5_cacheline_offset0_state;
  wire [1:0] set5_cacheline_offset1_state;
  wire [1:0] set6_cacheline_offset0_state;
  wire [1:0] set6_cacheline_offset1_state;
  wire [1:0] set7_cacheline_offset0_state;
  wire [1:0] set7_cacheline_offset1_state;

  wire [2:0] access_way;
  wire [2:0] set0_access_way;
  wire [2:0] set1_access_way;
  wire [2:0] set2_access_way;
  wire [2:0] set3_access_way;
  wire [2:0] set4_access_way;
  wire [2:0] set5_access_way;
  wire [2:0] set6_access_way;
  wire [2:0] set7_access_way;

  wire       htu_op_is_read;
  wire       htu_op_is_read_with_linefill;
  wire       htu_op_is_write;
  wire       htu_op_is_write_back;

//---------------------------------------------------------------
//  cache opcode
// 00 : read data
// 01 : write data
// 10 : flush dirty cacheline
// 11 : cache invalidate
//---------------------------------------------------------------
  assign op_is_read       = xbar_bank_htu_opcode_i[1:0] == 2'b00;
  assign op_is_write      = xbar_bank_htu_opcode_i[1:0] == 2'b01;
  assign op_is_flush      = xbar_bank_htu_opcode_i[1:0] == 2'b10;
  assign op_is_invalidate = xbar_bank_htu_opcode_i[1:0] == 2'b11;

  assign set_hit_array[7:0] = {xbar_bank_htu_addr_i[7:5] == 3'd7,
                               xbar_bank_htu_addr_i[7:5] == 3'd6,
                               xbar_bank_htu_addr_i[7:5] == 3'd5,
                               xbar_bank_htu_addr_i[7:5] == 3'd4,
                               xbar_bank_htu_addr_i[7:5] == 3'd3,
                               xbar_bank_htu_addr_i[7:5] == 3'd2,
                               xbar_bank_htu_addr_i[7:5] == 3'd1,
                               xbar_bank_htu_addr_i[7:5] == 3'd0};

  assign set_hit_array_WV[7:0] = {8{xbar_bank_htu_valid_i}} & set_hit_array[7:0];

  assign cacheline_hit = |cacheline_hit_array[7:0];

  assign access_way[2:0] = {3{set_hit_array[0]}} & set0_access_way[2:0]
                         | {3{set_hit_array[1]}} & set1_access_way[2:0]
                         | {3{set_hit_array[2]}} & set2_access_way[2:0]
                         | {3{set_hit_array[3]}} & set3_access_way[2:0]
                         | {3{set_hit_array[4]}} & set4_access_way[2:0]
                         | {3{set_hit_array[5]}} & set5_access_way[2:0]
                         | {3{set_hit_array[6]}} & set6_access_way[2:0]
                         | {3{set_hit_array[7]}} & set7_access_way[2:0];

//-------------------------------------------------------------------------
//                               HTU >> ISU
//-------------------------------------------------------------------------
  assign htu_isu_valid_o = xbar_bank_htu_valid_i;

  assign htu_isu_ch_id_o[1:0] = xbar_bank_htu_ch_id_i[1:0];

  assign htu_op_is_read = cacheline_hit & op_is_read;

  assign htu_op_is_read_with_linefill = ~cacheline_hit;

  assign htu_op_is_write = cacheline_hit & op_is_write;

  assign htu_isu_opcode_o[1:0] = xbar_bank_htu_ch_id_i[1:0];

  assign htu_isu_set_way_offset_o[6:0] = {xbar_bank_htu_addr_i[7:5],
                                          access_way[2:0],
                                          xbar_bank_htu_addr_i[4]};

  assign htu_isu_cacheline_offset0_state_o[1:0] = {2{set_hit_array[0]}} & set0_cacheline_offset0_state[1:0]
                                                | {2{set_hit_array[1]}} & set1_cacheline_offset0_state[1:0]
                                                | {2{set_hit_array[2]}} & set2_cacheline_offset0_state[1:0]
                                                | {2{set_hit_array[3]}} & set3_cacheline_offset0_state[1:0]
                                                | {2{set_hit_array[4]}} & set4_cacheline_offset0_state[1:0]
                                                | {2{set_hit_array[5]}} & set5_cacheline_offset0_state[1:0]
                                                | {2{set_hit_array[6]}} & set6_cacheline_offset0_state[1:0]
                                                | {2{set_hit_array[7]}} & set7_cacheline_offset0_state[1:0];

  assign htu_isu_cacheline_offset1_state_o[1:0] = {2{set_hit_array[0]}} & set0_cacheline_offset1_state[1:0]
                                                | {2{set_hit_array[1]}} & set1_cacheline_offset1_state[1:0]
                                                | {2{set_hit_array[2]}} & set2_cacheline_offset1_state[1:0]
                                                | {2{set_hit_array[3]}} & set3_cacheline_offset1_state[1:0]
                                                | {2{set_hit_array[4]}} & set4_cacheline_offset1_state[1:0]
                                                | {2{set_hit_array[5]}} & set5_cacheline_offset1_state[1:0]
                                                | {2{set_hit_array[6]}} & set6_cacheline_offset1_state[1:0]
                                                | {2{set_hit_array[7]}} & set7_cacheline_offset1_state[1:0];

// set0
  bank_htu_set_entry
  u_bank_htu_set_entry0 (
    .clk_i                    (clk_i                            ),
    .rst_i                    (rst_i                            ),
    .op_is_read_i             (op_is_read                       ),
    .op_is_write_i            (op_is_write                      ),
    .op_is_flush_i            (op_is_flush                      ),
    .op_is_invalidate_i       (op_is_invalidate                 ),
    .set_hit_WV_i             (set_hit_array_WV[0]              ),
    .access_tag_i             (xbar_bank_htu_addr_i[31:10]      ),
    .access_offset_i          (xbar_bank_htu_addr_i[4]          ),
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
    .set_hit_WV_i             (set_hit_array_WV[0]              ),
    .access_tag_i             (xbar_bank_htu_addr_i[31:10]      ),
    .access_offset_i          (xbar_bank_htu_addr_i[4]          ),
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
    .set_hit_WV_i             (set_hit_array_WV[0]              ),
    .access_tag_i             (xbar_bank_htu_addr_i[31:10]      ),
    .access_offset_i          (xbar_bank_htu_addr_i[4]          ),
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
    .set_hit_WV_i             (set_hit_array_WV[0]              ),
    .access_tag_i             (xbar_bank_htu_addr_i[31:10]      ),
    .access_offset_i          (xbar_bank_htu_addr_i[4]          ),
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
    .set_hit_WV_i             (set_hit_array_WV[0]              ),
    .access_tag_i             (xbar_bank_htu_addr_i[31:10]      ),
    .access_offset_i          (xbar_bank_htu_addr_i[4]          ),
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
    .set_hit_WV_i             (set_hit_array_WV[0]              ),
    .access_tag_i             (xbar_bank_htu_addr_i[31:10]      ),
    .access_offset_i          (xbar_bank_htu_addr_i[4]          ),
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
    .set_hit_WV_i             (set_hit_array_WV[0]              ),
    .access_tag_i             (xbar_bank_htu_addr_i[31:10]      ),
    .access_offset_i          (xbar_bank_htu_addr_i[4]          ),
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
    .set_hit_WV_i             (set_hit_array_WV[0]              ),
    .access_tag_i             (xbar_bank_htu_addr_i[31:10]      ),
    .access_offset_i          (xbar_bank_htu_addr_i[4]          ),
    .cacheline_hit_o          (cacheline_hit_array[7]           ),
    .cacheline_offset0_state_o(set7_cacheline_offset0_state[1:0]),
    .cacheline_offset1_state_o(set7_cacheline_offset1_state[1:0]),
    .access_way_o             (set7_access_way[2:0]             )
  );

endmodule