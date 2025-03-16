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
  output wire [1:0]  htu_isu_opcode_o,
  output wire [6:0]  htu_isu_set_way_offset_o,
  output wire [7:0]  htu_isu_wbuffer_id_o,
  output wire [1:0]  htu_isu_cacheline_offset0_dirty_o,
  output wire [1:0]  htu_isu_cacheline_offset1_dirty_o,
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

  wire [7:0] set_hit_array;
  wire [7:0] set_hit_arrayWV;

  assign set_hit_array[7:0] = {xbar_bank_htu_addr_i[7:5] == 3'd7,
                               xbar_bank_htu_addr_i[7:5] == 3'd6,
                               xbar_bank_htu_addr_i[7:5] == 3'd5,
                               xbar_bank_htu_addr_i[7:5] == 3'd4,
                               xbar_bank_htu_addr_i[7:5] == 3'd3,
                               xbar_bank_htu_addr_i[7:5] == 3'd2,
                               xbar_bank_htu_addr_i[7:5] == 3'd1,
                               xbar_bank_htu_addr_i[7:5] == 3'd0};

  assign set_hit_arrayWV[7:0] = {8{xbar_bank_htu_valid_i}} & set_hit_array[7:0];

  bank_htu_set_status
  u_bank_htu_set0_status (
    .clk_i(clk_i                          ),
    .rst_i(rst_i                          ),
    .set_hit_i(set_hit_arrayWV[0]         ),
    .set_tag_i(xbar_bank_htu_addr_i[31:10]),
    .offset_i(xbar_bank_htu_addr_i[4]     )
  );



endmodule