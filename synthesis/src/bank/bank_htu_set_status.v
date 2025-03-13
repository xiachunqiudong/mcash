module bank_htu_set_status(
  input wire         clk_i,
  input wire         rst_i,
  input wire         set_hit_i,
  input wire [31:10] set_tag_i,
  input wire         offset_i
);

  wire [7:0] htu_way_valid_array_In;
  reg  [7:0] htu_way_valid_array_Q;

  wire [6:0] plru_tree_In;
  reg  [6:0] plru_tree_Q;

  wire [2:0] way0_refer_cnt_In;
  wire [2:0] way1_refer_cnt_In;
  wire [2:0] way2_refer_cnt_In;
  wire [2:0] way3_refer_cnt_In;
  wire [2:0] way4_refer_cnt_In;
  wire [2:0] way5_refer_cnt_In;
  wire [2:0] way6_refer_cnt_In;
  wire [2:0] way7_refer_cnt_In;

  reg  [2:0] way0_refer_cnt_Q;
  reg  [2:0] way1_refer_cnt_Q;
  reg  [2:0] way2_refer_cnt_Q;
  reg  [2:0] way3_refer_cnt_Q;
  reg  [2:0] way4_refer_cnt_Q;
  reg  [2:0] way5_refer_cnt_Q;
  reg  [2:0] way6_refer_cnt_Q;
  reg  [2:0] way7_refer_cnt_Q;

  wire [31:10] way0_tag_In;
  wire [31:10] way1_tag_In;
  wire [31:10] way2_tag_In;
  wire [31:10] way3_tag_In;
  wire [31:10] way4_tag_In;
  wire [31:10] way5_tag_In;
  wire [31:10] way6_tag_In;
  wire [31:10] way7_tag_In;
  reg  [31:10] way0_tag_Q;
  reg  [31:10] way1_tag_Q;
  reg  [31:10] way2_tag_Q;
  reg  [31:10] way3_tag_Q;
  reg  [31:10] way4_tag_Q;
  reg  [31:10] way5_tag_Q;
  reg  [31:10] way6_tag_Q;
  reg  [31:10] way7_tag_Q;

  wire [1:0] way0_offset0_status_In;
  wire [1:0] way0_offset1_status_In;
  wire [1:0] way1_offset0_status_In;
  wire [1:0] way1_offset1_status_In;
  wire [1:0] way2_offset0_status_In;
  wire [1:0] way2_offset1_status_In;
  wire [1:0] way3_offset0_status_In;
  wire [1:0] way3_offset1_status_In;
  wire [1:0] way4_offset0_status_In;
  wire [1:0] way4_offset1_status_In;
  wire [1:0] way5_offset0_status_In;
  wire [1:0] way5_offset1_status_In;
  wire [1:0] way6_offset0_status_In;
  wire [1:0] way6_offset1_status_In;
  wire [1:0] way7_offset0_status_In;
  wire [1:0] way7_offset1_status_In;
  reg  [1:0] way0_offset0_status_Q;
  reg  [1:0] way0_offset1_status_Q;
  reg  [1:0] way1_offset0_status_Q;
  reg  [1:0] way1_offset1_status_Q;
  reg  [1:0] way2_offset0_status_Q;
  reg  [1:0] way2_offset1_status_Q;
  reg  [1:0] way3_offset0_status_Q;
  reg  [1:0] way3_offset1_status_Q;
  reg  [1:0] way4_offset0_status_Q;
  reg  [1:0] way4_offset1_status_Q;
  reg  [1:0] way5_offset0_status_Q;
  reg  [1:0] way5_offset1_status_Q;
  reg  [1:0] way6_offset0_status_Q;
  reg  [1:0] way6_offset1_status_Q;
  reg  [1:0] way7_offset0_status_Q;
  reg  [1:0] way7_offset1_status_Q;

  wire way_hit_array;
  



endmodule