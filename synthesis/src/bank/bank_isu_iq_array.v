module bank_isu_iq (
  input  wire clk,
  input  wire [6:0] read_ptr,
  input  wire [6:0] wire_ptr,
  input  wire [2:0] bank_isu_iq_rob_id_In,
  input  wire [1:0] bank_isu_iq_ch_id_In,
  input  wire bank_isu_iq_op_is_write_In,
  input  wire bank_isu_iq_op_need_evit_In,
  input  wire bank_isu_iq_op_need_linefill_In,
  input  wire [6:0] bank_isu_iq_set_way_offset_In,
  input  wire [7:0] bank_isu_iq_wbuffer_id_In,
  input  wire [3:0] bank_isu_iq_cacheline_state_In,
  output wire [2:0] bank_isu_iq_rob_id_Q,
  output wire [1:0] bank_isu_iq_ch_id_Q,
  output wire bank_isu_iq_op_is_write_Q,
  output wire bank_isu_iq_op_need_evit_Q,
  output wire bank_isu_iq_op_need_linefill_Q,
  output wire [6:0] bank_isu_iq_set_way_offset_Q,
  output wire [7:0] bank_isu_iq_wbuffer_id_Q,
  output wire [3:0] bank_isu_iq_cacheline_state_Q
);

  wire        [2:0]          bank_isu_iq_entry0_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry1_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry2_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry3_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry4_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry5_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry6_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry7_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry8_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry9_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry10_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry11_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry12_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry13_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry14_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry15_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry16_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry17_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry18_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry19_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry20_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry21_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry22_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry23_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry24_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry25_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry26_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry27_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry28_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry29_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry30_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry31_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry32_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry33_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry34_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry35_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry36_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry37_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry38_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry39_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry40_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry41_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry42_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry43_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry44_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry45_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry46_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry47_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry48_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry49_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry50_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry51_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry52_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry53_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry54_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry55_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry56_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry57_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry58_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry59_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry60_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry61_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry62_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry63_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry64_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry65_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry66_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry67_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry68_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry69_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry70_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry71_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry72_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry73_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry74_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry75_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry76_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry77_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry78_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry79_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry80_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry81_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry82_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry83_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry84_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry85_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry86_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry87_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry88_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry89_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry90_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry91_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry92_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry93_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry94_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry95_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry96_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry97_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry98_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry99_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry100_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry101_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry102_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry103_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry104_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry105_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry106_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry107_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry108_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry109_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry110_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry111_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry112_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry113_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry114_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry115_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry116_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry117_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry118_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry119_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry120_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry121_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry122_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry123_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry124_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry125_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry126_rob_id_Q;
  wire        [2:0]          bank_isu_iq_entry127_rob_id_Q;
  wire        [1:0]          bank_isu_iq_entry0_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry1_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry2_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry3_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry4_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry5_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry6_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry7_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry8_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry9_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry10_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry11_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry12_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry13_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry14_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry15_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry16_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry17_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry18_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry19_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry20_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry21_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry22_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry23_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry24_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry25_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry26_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry27_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry28_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry29_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry30_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry31_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry32_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry33_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry34_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry35_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry36_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry37_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry38_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry39_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry40_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry41_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry42_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry43_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry44_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry45_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry46_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry47_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry48_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry49_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry50_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry51_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry52_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry53_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry54_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry55_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry56_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry57_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry58_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry59_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry60_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry61_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry62_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry63_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry64_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry65_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry66_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry67_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry68_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry69_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry70_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry71_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry72_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry73_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry74_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry75_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry76_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry77_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry78_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry79_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry80_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry81_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry82_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry83_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry84_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry85_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry86_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry87_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry88_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry89_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry90_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry91_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry92_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry93_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry94_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry95_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry96_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry97_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry98_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry99_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry100_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry101_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry102_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry103_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry104_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry105_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry106_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry107_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry108_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry109_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry110_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry111_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry112_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry113_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry114_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry115_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry116_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry117_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry118_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry119_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry120_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry121_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry122_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry123_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry124_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry125_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry126_ch_id_Q;
  wire        [1:0]          bank_isu_iq_entry127_ch_id_Q;
  wire                       bank_isu_iq_entry0_op_is_write_Q;
  wire                       bank_isu_iq_entry1_op_is_write_Q;
  wire                       bank_isu_iq_entry2_op_is_write_Q;
  wire                       bank_isu_iq_entry3_op_is_write_Q;
  wire                       bank_isu_iq_entry4_op_is_write_Q;
  wire                       bank_isu_iq_entry5_op_is_write_Q;
  wire                       bank_isu_iq_entry6_op_is_write_Q;
  wire                       bank_isu_iq_entry7_op_is_write_Q;
  wire                       bank_isu_iq_entry8_op_is_write_Q;
  wire                       bank_isu_iq_entry9_op_is_write_Q;
  wire                       bank_isu_iq_entry10_op_is_write_Q;
  wire                       bank_isu_iq_entry11_op_is_write_Q;
  wire                       bank_isu_iq_entry12_op_is_write_Q;
  wire                       bank_isu_iq_entry13_op_is_write_Q;
  wire                       bank_isu_iq_entry14_op_is_write_Q;
  wire                       bank_isu_iq_entry15_op_is_write_Q;
  wire                       bank_isu_iq_entry16_op_is_write_Q;
  wire                       bank_isu_iq_entry17_op_is_write_Q;
  wire                       bank_isu_iq_entry18_op_is_write_Q;
  wire                       bank_isu_iq_entry19_op_is_write_Q;
  wire                       bank_isu_iq_entry20_op_is_write_Q;
  wire                       bank_isu_iq_entry21_op_is_write_Q;
  wire                       bank_isu_iq_entry22_op_is_write_Q;
  wire                       bank_isu_iq_entry23_op_is_write_Q;
  wire                       bank_isu_iq_entry24_op_is_write_Q;
  wire                       bank_isu_iq_entry25_op_is_write_Q;
  wire                       bank_isu_iq_entry26_op_is_write_Q;
  wire                       bank_isu_iq_entry27_op_is_write_Q;
  wire                       bank_isu_iq_entry28_op_is_write_Q;
  wire                       bank_isu_iq_entry29_op_is_write_Q;
  wire                       bank_isu_iq_entry30_op_is_write_Q;
  wire                       bank_isu_iq_entry31_op_is_write_Q;
  wire                       bank_isu_iq_entry32_op_is_write_Q;
  wire                       bank_isu_iq_entry33_op_is_write_Q;
  wire                       bank_isu_iq_entry34_op_is_write_Q;
  wire                       bank_isu_iq_entry35_op_is_write_Q;
  wire                       bank_isu_iq_entry36_op_is_write_Q;
  wire                       bank_isu_iq_entry37_op_is_write_Q;
  wire                       bank_isu_iq_entry38_op_is_write_Q;
  wire                       bank_isu_iq_entry39_op_is_write_Q;
  wire                       bank_isu_iq_entry40_op_is_write_Q;
  wire                       bank_isu_iq_entry41_op_is_write_Q;
  wire                       bank_isu_iq_entry42_op_is_write_Q;
  wire                       bank_isu_iq_entry43_op_is_write_Q;
  wire                       bank_isu_iq_entry44_op_is_write_Q;
  wire                       bank_isu_iq_entry45_op_is_write_Q;
  wire                       bank_isu_iq_entry46_op_is_write_Q;
  wire                       bank_isu_iq_entry47_op_is_write_Q;
  wire                       bank_isu_iq_entry48_op_is_write_Q;
  wire                       bank_isu_iq_entry49_op_is_write_Q;
  wire                       bank_isu_iq_entry50_op_is_write_Q;
  wire                       bank_isu_iq_entry51_op_is_write_Q;
  wire                       bank_isu_iq_entry52_op_is_write_Q;
  wire                       bank_isu_iq_entry53_op_is_write_Q;
  wire                       bank_isu_iq_entry54_op_is_write_Q;
  wire                       bank_isu_iq_entry55_op_is_write_Q;
  wire                       bank_isu_iq_entry56_op_is_write_Q;
  wire                       bank_isu_iq_entry57_op_is_write_Q;
  wire                       bank_isu_iq_entry58_op_is_write_Q;
  wire                       bank_isu_iq_entry59_op_is_write_Q;
  wire                       bank_isu_iq_entry60_op_is_write_Q;
  wire                       bank_isu_iq_entry61_op_is_write_Q;
  wire                       bank_isu_iq_entry62_op_is_write_Q;
  wire                       bank_isu_iq_entry63_op_is_write_Q;
  wire                       bank_isu_iq_entry64_op_is_write_Q;
  wire                       bank_isu_iq_entry65_op_is_write_Q;
  wire                       bank_isu_iq_entry66_op_is_write_Q;
  wire                       bank_isu_iq_entry67_op_is_write_Q;
  wire                       bank_isu_iq_entry68_op_is_write_Q;
  wire                       bank_isu_iq_entry69_op_is_write_Q;
  wire                       bank_isu_iq_entry70_op_is_write_Q;
  wire                       bank_isu_iq_entry71_op_is_write_Q;
  wire                       bank_isu_iq_entry72_op_is_write_Q;
  wire                       bank_isu_iq_entry73_op_is_write_Q;
  wire                       bank_isu_iq_entry74_op_is_write_Q;
  wire                       bank_isu_iq_entry75_op_is_write_Q;
  wire                       bank_isu_iq_entry76_op_is_write_Q;
  wire                       bank_isu_iq_entry77_op_is_write_Q;
  wire                       bank_isu_iq_entry78_op_is_write_Q;
  wire                       bank_isu_iq_entry79_op_is_write_Q;
  wire                       bank_isu_iq_entry80_op_is_write_Q;
  wire                       bank_isu_iq_entry81_op_is_write_Q;
  wire                       bank_isu_iq_entry82_op_is_write_Q;
  wire                       bank_isu_iq_entry83_op_is_write_Q;
  wire                       bank_isu_iq_entry84_op_is_write_Q;
  wire                       bank_isu_iq_entry85_op_is_write_Q;
  wire                       bank_isu_iq_entry86_op_is_write_Q;
  wire                       bank_isu_iq_entry87_op_is_write_Q;
  wire                       bank_isu_iq_entry88_op_is_write_Q;
  wire                       bank_isu_iq_entry89_op_is_write_Q;
  wire                       bank_isu_iq_entry90_op_is_write_Q;
  wire                       bank_isu_iq_entry91_op_is_write_Q;
  wire                       bank_isu_iq_entry92_op_is_write_Q;
  wire                       bank_isu_iq_entry93_op_is_write_Q;
  wire                       bank_isu_iq_entry94_op_is_write_Q;
  wire                       bank_isu_iq_entry95_op_is_write_Q;
  wire                       bank_isu_iq_entry96_op_is_write_Q;
  wire                       bank_isu_iq_entry97_op_is_write_Q;
  wire                       bank_isu_iq_entry98_op_is_write_Q;
  wire                       bank_isu_iq_entry99_op_is_write_Q;
  wire                       bank_isu_iq_entry100_op_is_write_Q;
  wire                       bank_isu_iq_entry101_op_is_write_Q;
  wire                       bank_isu_iq_entry102_op_is_write_Q;
  wire                       bank_isu_iq_entry103_op_is_write_Q;
  wire                       bank_isu_iq_entry104_op_is_write_Q;
  wire                       bank_isu_iq_entry105_op_is_write_Q;
  wire                       bank_isu_iq_entry106_op_is_write_Q;
  wire                       bank_isu_iq_entry107_op_is_write_Q;
  wire                       bank_isu_iq_entry108_op_is_write_Q;
  wire                       bank_isu_iq_entry109_op_is_write_Q;
  wire                       bank_isu_iq_entry110_op_is_write_Q;
  wire                       bank_isu_iq_entry111_op_is_write_Q;
  wire                       bank_isu_iq_entry112_op_is_write_Q;
  wire                       bank_isu_iq_entry113_op_is_write_Q;
  wire                       bank_isu_iq_entry114_op_is_write_Q;
  wire                       bank_isu_iq_entry115_op_is_write_Q;
  wire                       bank_isu_iq_entry116_op_is_write_Q;
  wire                       bank_isu_iq_entry117_op_is_write_Q;
  wire                       bank_isu_iq_entry118_op_is_write_Q;
  wire                       bank_isu_iq_entry119_op_is_write_Q;
  wire                       bank_isu_iq_entry120_op_is_write_Q;
  wire                       bank_isu_iq_entry121_op_is_write_Q;
  wire                       bank_isu_iq_entry122_op_is_write_Q;
  wire                       bank_isu_iq_entry123_op_is_write_Q;
  wire                       bank_isu_iq_entry124_op_is_write_Q;
  wire                       bank_isu_iq_entry125_op_is_write_Q;
  wire                       bank_isu_iq_entry126_op_is_write_Q;
  wire                       bank_isu_iq_entry127_op_is_write_Q;
  wire                       bank_isu_iq_entry0_op_need_evit_Q;
  wire                       bank_isu_iq_entry1_op_need_evit_Q;
  wire                       bank_isu_iq_entry2_op_need_evit_Q;
  wire                       bank_isu_iq_entry3_op_need_evit_Q;
  wire                       bank_isu_iq_entry4_op_need_evit_Q;
  wire                       bank_isu_iq_entry5_op_need_evit_Q;
  wire                       bank_isu_iq_entry6_op_need_evit_Q;
  wire                       bank_isu_iq_entry7_op_need_evit_Q;
  wire                       bank_isu_iq_entry8_op_need_evit_Q;
  wire                       bank_isu_iq_entry9_op_need_evit_Q;
  wire                       bank_isu_iq_entry10_op_need_evit_Q;
  wire                       bank_isu_iq_entry11_op_need_evit_Q;
  wire                       bank_isu_iq_entry12_op_need_evit_Q;
  wire                       bank_isu_iq_entry13_op_need_evit_Q;
  wire                       bank_isu_iq_entry14_op_need_evit_Q;
  wire                       bank_isu_iq_entry15_op_need_evit_Q;
  wire                       bank_isu_iq_entry16_op_need_evit_Q;
  wire                       bank_isu_iq_entry17_op_need_evit_Q;
  wire                       bank_isu_iq_entry18_op_need_evit_Q;
  wire                       bank_isu_iq_entry19_op_need_evit_Q;
  wire                       bank_isu_iq_entry20_op_need_evit_Q;
  wire                       bank_isu_iq_entry21_op_need_evit_Q;
  wire                       bank_isu_iq_entry22_op_need_evit_Q;
  wire                       bank_isu_iq_entry23_op_need_evit_Q;
  wire                       bank_isu_iq_entry24_op_need_evit_Q;
  wire                       bank_isu_iq_entry25_op_need_evit_Q;
  wire                       bank_isu_iq_entry26_op_need_evit_Q;
  wire                       bank_isu_iq_entry27_op_need_evit_Q;
  wire                       bank_isu_iq_entry28_op_need_evit_Q;
  wire                       bank_isu_iq_entry29_op_need_evit_Q;
  wire                       bank_isu_iq_entry30_op_need_evit_Q;
  wire                       bank_isu_iq_entry31_op_need_evit_Q;
  wire                       bank_isu_iq_entry32_op_need_evit_Q;
  wire                       bank_isu_iq_entry33_op_need_evit_Q;
  wire                       bank_isu_iq_entry34_op_need_evit_Q;
  wire                       bank_isu_iq_entry35_op_need_evit_Q;
  wire                       bank_isu_iq_entry36_op_need_evit_Q;
  wire                       bank_isu_iq_entry37_op_need_evit_Q;
  wire                       bank_isu_iq_entry38_op_need_evit_Q;
  wire                       bank_isu_iq_entry39_op_need_evit_Q;
  wire                       bank_isu_iq_entry40_op_need_evit_Q;
  wire                       bank_isu_iq_entry41_op_need_evit_Q;
  wire                       bank_isu_iq_entry42_op_need_evit_Q;
  wire                       bank_isu_iq_entry43_op_need_evit_Q;
  wire                       bank_isu_iq_entry44_op_need_evit_Q;
  wire                       bank_isu_iq_entry45_op_need_evit_Q;
  wire                       bank_isu_iq_entry46_op_need_evit_Q;
  wire                       bank_isu_iq_entry47_op_need_evit_Q;
  wire                       bank_isu_iq_entry48_op_need_evit_Q;
  wire                       bank_isu_iq_entry49_op_need_evit_Q;
  wire                       bank_isu_iq_entry50_op_need_evit_Q;
  wire                       bank_isu_iq_entry51_op_need_evit_Q;
  wire                       bank_isu_iq_entry52_op_need_evit_Q;
  wire                       bank_isu_iq_entry53_op_need_evit_Q;
  wire                       bank_isu_iq_entry54_op_need_evit_Q;
  wire                       bank_isu_iq_entry55_op_need_evit_Q;
  wire                       bank_isu_iq_entry56_op_need_evit_Q;
  wire                       bank_isu_iq_entry57_op_need_evit_Q;
  wire                       bank_isu_iq_entry58_op_need_evit_Q;
  wire                       bank_isu_iq_entry59_op_need_evit_Q;
  wire                       bank_isu_iq_entry60_op_need_evit_Q;
  wire                       bank_isu_iq_entry61_op_need_evit_Q;
  wire                       bank_isu_iq_entry62_op_need_evit_Q;
  wire                       bank_isu_iq_entry63_op_need_evit_Q;
  wire                       bank_isu_iq_entry64_op_need_evit_Q;
  wire                       bank_isu_iq_entry65_op_need_evit_Q;
  wire                       bank_isu_iq_entry66_op_need_evit_Q;
  wire                       bank_isu_iq_entry67_op_need_evit_Q;
  wire                       bank_isu_iq_entry68_op_need_evit_Q;
  wire                       bank_isu_iq_entry69_op_need_evit_Q;
  wire                       bank_isu_iq_entry70_op_need_evit_Q;
  wire                       bank_isu_iq_entry71_op_need_evit_Q;
  wire                       bank_isu_iq_entry72_op_need_evit_Q;
  wire                       bank_isu_iq_entry73_op_need_evit_Q;
  wire                       bank_isu_iq_entry74_op_need_evit_Q;
  wire                       bank_isu_iq_entry75_op_need_evit_Q;
  wire                       bank_isu_iq_entry76_op_need_evit_Q;
  wire                       bank_isu_iq_entry77_op_need_evit_Q;
  wire                       bank_isu_iq_entry78_op_need_evit_Q;
  wire                       bank_isu_iq_entry79_op_need_evit_Q;
  wire                       bank_isu_iq_entry80_op_need_evit_Q;
  wire                       bank_isu_iq_entry81_op_need_evit_Q;
  wire                       bank_isu_iq_entry82_op_need_evit_Q;
  wire                       bank_isu_iq_entry83_op_need_evit_Q;
  wire                       bank_isu_iq_entry84_op_need_evit_Q;
  wire                       bank_isu_iq_entry85_op_need_evit_Q;
  wire                       bank_isu_iq_entry86_op_need_evit_Q;
  wire                       bank_isu_iq_entry87_op_need_evit_Q;
  wire                       bank_isu_iq_entry88_op_need_evit_Q;
  wire                       bank_isu_iq_entry89_op_need_evit_Q;
  wire                       bank_isu_iq_entry90_op_need_evit_Q;
  wire                       bank_isu_iq_entry91_op_need_evit_Q;
  wire                       bank_isu_iq_entry92_op_need_evit_Q;
  wire                       bank_isu_iq_entry93_op_need_evit_Q;
  wire                       bank_isu_iq_entry94_op_need_evit_Q;
  wire                       bank_isu_iq_entry95_op_need_evit_Q;
  wire                       bank_isu_iq_entry96_op_need_evit_Q;
  wire                       bank_isu_iq_entry97_op_need_evit_Q;
  wire                       bank_isu_iq_entry98_op_need_evit_Q;
  wire                       bank_isu_iq_entry99_op_need_evit_Q;
  wire                       bank_isu_iq_entry100_op_need_evit_Q;
  wire                       bank_isu_iq_entry101_op_need_evit_Q;
  wire                       bank_isu_iq_entry102_op_need_evit_Q;
  wire                       bank_isu_iq_entry103_op_need_evit_Q;
  wire                       bank_isu_iq_entry104_op_need_evit_Q;
  wire                       bank_isu_iq_entry105_op_need_evit_Q;
  wire                       bank_isu_iq_entry106_op_need_evit_Q;
  wire                       bank_isu_iq_entry107_op_need_evit_Q;
  wire                       bank_isu_iq_entry108_op_need_evit_Q;
  wire                       bank_isu_iq_entry109_op_need_evit_Q;
  wire                       bank_isu_iq_entry110_op_need_evit_Q;
  wire                       bank_isu_iq_entry111_op_need_evit_Q;
  wire                       bank_isu_iq_entry112_op_need_evit_Q;
  wire                       bank_isu_iq_entry113_op_need_evit_Q;
  wire                       bank_isu_iq_entry114_op_need_evit_Q;
  wire                       bank_isu_iq_entry115_op_need_evit_Q;
  wire                       bank_isu_iq_entry116_op_need_evit_Q;
  wire                       bank_isu_iq_entry117_op_need_evit_Q;
  wire                       bank_isu_iq_entry118_op_need_evit_Q;
  wire                       bank_isu_iq_entry119_op_need_evit_Q;
  wire                       bank_isu_iq_entry120_op_need_evit_Q;
  wire                       bank_isu_iq_entry121_op_need_evit_Q;
  wire                       bank_isu_iq_entry122_op_need_evit_Q;
  wire                       bank_isu_iq_entry123_op_need_evit_Q;
  wire                       bank_isu_iq_entry124_op_need_evit_Q;
  wire                       bank_isu_iq_entry125_op_need_evit_Q;
  wire                       bank_isu_iq_entry126_op_need_evit_Q;
  wire                       bank_isu_iq_entry127_op_need_evit_Q;
  wire                       bank_isu_iq_entry0_op_need_linefill_Q;
  wire                       bank_isu_iq_entry1_op_need_linefill_Q;
  wire                       bank_isu_iq_entry2_op_need_linefill_Q;
  wire                       bank_isu_iq_entry3_op_need_linefill_Q;
  wire                       bank_isu_iq_entry4_op_need_linefill_Q;
  wire                       bank_isu_iq_entry5_op_need_linefill_Q;
  wire                       bank_isu_iq_entry6_op_need_linefill_Q;
  wire                       bank_isu_iq_entry7_op_need_linefill_Q;
  wire                       bank_isu_iq_entry8_op_need_linefill_Q;
  wire                       bank_isu_iq_entry9_op_need_linefill_Q;
  wire                       bank_isu_iq_entry10_op_need_linefill_Q;
  wire                       bank_isu_iq_entry11_op_need_linefill_Q;
  wire                       bank_isu_iq_entry12_op_need_linefill_Q;
  wire                       bank_isu_iq_entry13_op_need_linefill_Q;
  wire                       bank_isu_iq_entry14_op_need_linefill_Q;
  wire                       bank_isu_iq_entry15_op_need_linefill_Q;
  wire                       bank_isu_iq_entry16_op_need_linefill_Q;
  wire                       bank_isu_iq_entry17_op_need_linefill_Q;
  wire                       bank_isu_iq_entry18_op_need_linefill_Q;
  wire                       bank_isu_iq_entry19_op_need_linefill_Q;
  wire                       bank_isu_iq_entry20_op_need_linefill_Q;
  wire                       bank_isu_iq_entry21_op_need_linefill_Q;
  wire                       bank_isu_iq_entry22_op_need_linefill_Q;
  wire                       bank_isu_iq_entry23_op_need_linefill_Q;
  wire                       bank_isu_iq_entry24_op_need_linefill_Q;
  wire                       bank_isu_iq_entry25_op_need_linefill_Q;
  wire                       bank_isu_iq_entry26_op_need_linefill_Q;
  wire                       bank_isu_iq_entry27_op_need_linefill_Q;
  wire                       bank_isu_iq_entry28_op_need_linefill_Q;
  wire                       bank_isu_iq_entry29_op_need_linefill_Q;
  wire                       bank_isu_iq_entry30_op_need_linefill_Q;
  wire                       bank_isu_iq_entry31_op_need_linefill_Q;
  wire                       bank_isu_iq_entry32_op_need_linefill_Q;
  wire                       bank_isu_iq_entry33_op_need_linefill_Q;
  wire                       bank_isu_iq_entry34_op_need_linefill_Q;
  wire                       bank_isu_iq_entry35_op_need_linefill_Q;
  wire                       bank_isu_iq_entry36_op_need_linefill_Q;
  wire                       bank_isu_iq_entry37_op_need_linefill_Q;
  wire                       bank_isu_iq_entry38_op_need_linefill_Q;
  wire                       bank_isu_iq_entry39_op_need_linefill_Q;
  wire                       bank_isu_iq_entry40_op_need_linefill_Q;
  wire                       bank_isu_iq_entry41_op_need_linefill_Q;
  wire                       bank_isu_iq_entry42_op_need_linefill_Q;
  wire                       bank_isu_iq_entry43_op_need_linefill_Q;
  wire                       bank_isu_iq_entry44_op_need_linefill_Q;
  wire                       bank_isu_iq_entry45_op_need_linefill_Q;
  wire                       bank_isu_iq_entry46_op_need_linefill_Q;
  wire                       bank_isu_iq_entry47_op_need_linefill_Q;
  wire                       bank_isu_iq_entry48_op_need_linefill_Q;
  wire                       bank_isu_iq_entry49_op_need_linefill_Q;
  wire                       bank_isu_iq_entry50_op_need_linefill_Q;
  wire                       bank_isu_iq_entry51_op_need_linefill_Q;
  wire                       bank_isu_iq_entry52_op_need_linefill_Q;
  wire                       bank_isu_iq_entry53_op_need_linefill_Q;
  wire                       bank_isu_iq_entry54_op_need_linefill_Q;
  wire                       bank_isu_iq_entry55_op_need_linefill_Q;
  wire                       bank_isu_iq_entry56_op_need_linefill_Q;
  wire                       bank_isu_iq_entry57_op_need_linefill_Q;
  wire                       bank_isu_iq_entry58_op_need_linefill_Q;
  wire                       bank_isu_iq_entry59_op_need_linefill_Q;
  wire                       bank_isu_iq_entry60_op_need_linefill_Q;
  wire                       bank_isu_iq_entry61_op_need_linefill_Q;
  wire                       bank_isu_iq_entry62_op_need_linefill_Q;
  wire                       bank_isu_iq_entry63_op_need_linefill_Q;
  wire                       bank_isu_iq_entry64_op_need_linefill_Q;
  wire                       bank_isu_iq_entry65_op_need_linefill_Q;
  wire                       bank_isu_iq_entry66_op_need_linefill_Q;
  wire                       bank_isu_iq_entry67_op_need_linefill_Q;
  wire                       bank_isu_iq_entry68_op_need_linefill_Q;
  wire                       bank_isu_iq_entry69_op_need_linefill_Q;
  wire                       bank_isu_iq_entry70_op_need_linefill_Q;
  wire                       bank_isu_iq_entry71_op_need_linefill_Q;
  wire                       bank_isu_iq_entry72_op_need_linefill_Q;
  wire                       bank_isu_iq_entry73_op_need_linefill_Q;
  wire                       bank_isu_iq_entry74_op_need_linefill_Q;
  wire                       bank_isu_iq_entry75_op_need_linefill_Q;
  wire                       bank_isu_iq_entry76_op_need_linefill_Q;
  wire                       bank_isu_iq_entry77_op_need_linefill_Q;
  wire                       bank_isu_iq_entry78_op_need_linefill_Q;
  wire                       bank_isu_iq_entry79_op_need_linefill_Q;
  wire                       bank_isu_iq_entry80_op_need_linefill_Q;
  wire                       bank_isu_iq_entry81_op_need_linefill_Q;
  wire                       bank_isu_iq_entry82_op_need_linefill_Q;
  wire                       bank_isu_iq_entry83_op_need_linefill_Q;
  wire                       bank_isu_iq_entry84_op_need_linefill_Q;
  wire                       bank_isu_iq_entry85_op_need_linefill_Q;
  wire                       bank_isu_iq_entry86_op_need_linefill_Q;
  wire                       bank_isu_iq_entry87_op_need_linefill_Q;
  wire                       bank_isu_iq_entry88_op_need_linefill_Q;
  wire                       bank_isu_iq_entry89_op_need_linefill_Q;
  wire                       bank_isu_iq_entry90_op_need_linefill_Q;
  wire                       bank_isu_iq_entry91_op_need_linefill_Q;
  wire                       bank_isu_iq_entry92_op_need_linefill_Q;
  wire                       bank_isu_iq_entry93_op_need_linefill_Q;
  wire                       bank_isu_iq_entry94_op_need_linefill_Q;
  wire                       bank_isu_iq_entry95_op_need_linefill_Q;
  wire                       bank_isu_iq_entry96_op_need_linefill_Q;
  wire                       bank_isu_iq_entry97_op_need_linefill_Q;
  wire                       bank_isu_iq_entry98_op_need_linefill_Q;
  wire                       bank_isu_iq_entry99_op_need_linefill_Q;
  wire                       bank_isu_iq_entry100_op_need_linefill_Q;
  wire                       bank_isu_iq_entry101_op_need_linefill_Q;
  wire                       bank_isu_iq_entry102_op_need_linefill_Q;
  wire                       bank_isu_iq_entry103_op_need_linefill_Q;
  wire                       bank_isu_iq_entry104_op_need_linefill_Q;
  wire                       bank_isu_iq_entry105_op_need_linefill_Q;
  wire                       bank_isu_iq_entry106_op_need_linefill_Q;
  wire                       bank_isu_iq_entry107_op_need_linefill_Q;
  wire                       bank_isu_iq_entry108_op_need_linefill_Q;
  wire                       bank_isu_iq_entry109_op_need_linefill_Q;
  wire                       bank_isu_iq_entry110_op_need_linefill_Q;
  wire                       bank_isu_iq_entry111_op_need_linefill_Q;
  wire                       bank_isu_iq_entry112_op_need_linefill_Q;
  wire                       bank_isu_iq_entry113_op_need_linefill_Q;
  wire                       bank_isu_iq_entry114_op_need_linefill_Q;
  wire                       bank_isu_iq_entry115_op_need_linefill_Q;
  wire                       bank_isu_iq_entry116_op_need_linefill_Q;
  wire                       bank_isu_iq_entry117_op_need_linefill_Q;
  wire                       bank_isu_iq_entry118_op_need_linefill_Q;
  wire                       bank_isu_iq_entry119_op_need_linefill_Q;
  wire                       bank_isu_iq_entry120_op_need_linefill_Q;
  wire                       bank_isu_iq_entry121_op_need_linefill_Q;
  wire                       bank_isu_iq_entry122_op_need_linefill_Q;
  wire                       bank_isu_iq_entry123_op_need_linefill_Q;
  wire                       bank_isu_iq_entry124_op_need_linefill_Q;
  wire                       bank_isu_iq_entry125_op_need_linefill_Q;
  wire                       bank_isu_iq_entry126_op_need_linefill_Q;
  wire                       bank_isu_iq_entry127_op_need_linefill_Q;
  wire        [6:0]          bank_isu_iq_entry0_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry1_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry2_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry3_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry4_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry5_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry6_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry7_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry8_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry9_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry10_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry11_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry12_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry13_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry14_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry15_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry16_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry17_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry18_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry19_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry20_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry21_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry22_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry23_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry24_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry25_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry26_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry27_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry28_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry29_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry30_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry31_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry32_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry33_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry34_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry35_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry36_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry37_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry38_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry39_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry40_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry41_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry42_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry43_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry44_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry45_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry46_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry47_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry48_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry49_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry50_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry51_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry52_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry53_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry54_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry55_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry56_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry57_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry58_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry59_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry60_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry61_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry62_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry63_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry64_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry65_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry66_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry67_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry68_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry69_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry70_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry71_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry72_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry73_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry74_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry75_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry76_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry77_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry78_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry79_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry80_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry81_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry82_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry83_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry84_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry85_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry86_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry87_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry88_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry89_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry90_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry91_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry92_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry93_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry94_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry95_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry96_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry97_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry98_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry99_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry100_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry101_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry102_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry103_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry104_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry105_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry106_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry107_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry108_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry109_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry110_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry111_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry112_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry113_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry114_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry115_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry116_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry117_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry118_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry119_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry120_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry121_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry122_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry123_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry124_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry125_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry126_set_way_offset_Q;
  wire        [6:0]          bank_isu_iq_entry127_set_way_offset_Q;
  wire        [7:0]          bank_isu_iq_entry0_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry1_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry2_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry3_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry4_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry5_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry6_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry7_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry8_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry9_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry10_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry11_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry12_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry13_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry14_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry15_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry16_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry17_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry18_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry19_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry20_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry21_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry22_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry23_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry24_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry25_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry26_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry27_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry28_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry29_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry30_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry31_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry32_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry33_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry34_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry35_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry36_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry37_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry38_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry39_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry40_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry41_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry42_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry43_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry44_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry45_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry46_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry47_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry48_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry49_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry50_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry51_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry52_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry53_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry54_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry55_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry56_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry57_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry58_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry59_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry60_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry61_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry62_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry63_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry64_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry65_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry66_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry67_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry68_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry69_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry70_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry71_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry72_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry73_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry74_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry75_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry76_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry77_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry78_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry79_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry80_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry81_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry82_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry83_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry84_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry85_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry86_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry87_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry88_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry89_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry90_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry91_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry92_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry93_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry94_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry95_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry96_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry97_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry98_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry99_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry100_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry101_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry102_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry103_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry104_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry105_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry106_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry107_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry108_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry109_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry110_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry111_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry112_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry113_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry114_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry115_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry116_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry117_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry118_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry119_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry120_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry121_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry122_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry123_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry124_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry125_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry126_wbuffer_id_Q;
  wire        [7:0]          bank_isu_iq_entry127_wbuffer_id_Q;
  wire        [3:0]          bank_isu_iq_entry0_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry1_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry2_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry3_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry4_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry5_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry6_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry7_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry8_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry9_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry10_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry11_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry12_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry13_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry14_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry15_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry16_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry17_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry18_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry19_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry20_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry21_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry22_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry23_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry24_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry25_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry26_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry27_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry28_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry29_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry30_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry31_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry32_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry33_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry34_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry35_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry36_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry37_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry38_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry39_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry40_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry41_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry42_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry43_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry44_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry45_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry46_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry47_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry48_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry49_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry50_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry51_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry52_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry53_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry54_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry55_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry56_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry57_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry58_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry59_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry60_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry61_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry62_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry63_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry64_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry65_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry66_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry67_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry68_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry69_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry70_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry71_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry72_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry73_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry74_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry75_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry76_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry77_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry78_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry79_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry80_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry81_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry82_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry83_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry84_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry85_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry86_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry87_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry88_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry89_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry90_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry91_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry92_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry93_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry94_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry95_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry96_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry97_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry98_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry99_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry100_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry101_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry102_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry103_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry104_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry105_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry106_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry107_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry108_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry109_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry110_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry111_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry112_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry113_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry114_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry115_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry116_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry117_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry118_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry119_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry120_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry121_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry122_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry123_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry124_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry125_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry126_cacheline_state_Q;
  wire        [3:0]          bank_isu_iq_entry127_cacheline_state_Q;
  wire        [127:0]        array_entry_wen;

assign array_entry_wen[0] = wire_ptr[6:0] == 7'd0
assign array_entry_wen[1] = wire_ptr[6:0] == 7'd1
assign array_entry_wen[2] = wire_ptr[6:0] == 7'd2
assign array_entry_wen[3] = wire_ptr[6:0] == 7'd3
assign array_entry_wen[4] = wire_ptr[6:0] == 7'd4
assign array_entry_wen[5] = wire_ptr[6:0] == 7'd5
assign array_entry_wen[6] = wire_ptr[6:0] == 7'd6
assign array_entry_wen[7] = wire_ptr[6:0] == 7'd7
assign array_entry_wen[8] = wire_ptr[6:0] == 7'd8
assign array_entry_wen[9] = wire_ptr[6:0] == 7'd9
assign array_entry_wen[10] = wire_ptr[6:0] == 7'd10
assign array_entry_wen[11] = wire_ptr[6:0] == 7'd11
assign array_entry_wen[12] = wire_ptr[6:0] == 7'd12
assign array_entry_wen[13] = wire_ptr[6:0] == 7'd13
assign array_entry_wen[14] = wire_ptr[6:0] == 7'd14
assign array_entry_wen[15] = wire_ptr[6:0] == 7'd15
assign array_entry_wen[16] = wire_ptr[6:0] == 7'd16
assign array_entry_wen[17] = wire_ptr[6:0] == 7'd17
assign array_entry_wen[18] = wire_ptr[6:0] == 7'd18
assign array_entry_wen[19] = wire_ptr[6:0] == 7'd19
assign array_entry_wen[20] = wire_ptr[6:0] == 7'd20
assign array_entry_wen[21] = wire_ptr[6:0] == 7'd21
assign array_entry_wen[22] = wire_ptr[6:0] == 7'd22
assign array_entry_wen[23] = wire_ptr[6:0] == 7'd23
assign array_entry_wen[24] = wire_ptr[6:0] == 7'd24
assign array_entry_wen[25] = wire_ptr[6:0] == 7'd25
assign array_entry_wen[26] = wire_ptr[6:0] == 7'd26
assign array_entry_wen[27] = wire_ptr[6:0] == 7'd27
assign array_entry_wen[28] = wire_ptr[6:0] == 7'd28
assign array_entry_wen[29] = wire_ptr[6:0] == 7'd29
assign array_entry_wen[30] = wire_ptr[6:0] == 7'd30
assign array_entry_wen[31] = wire_ptr[6:0] == 7'd31
assign array_entry_wen[32] = wire_ptr[6:0] == 7'd32
assign array_entry_wen[33] = wire_ptr[6:0] == 7'd33
assign array_entry_wen[34] = wire_ptr[6:0] == 7'd34
assign array_entry_wen[35] = wire_ptr[6:0] == 7'd35
assign array_entry_wen[36] = wire_ptr[6:0] == 7'd36
assign array_entry_wen[37] = wire_ptr[6:0] == 7'd37
assign array_entry_wen[38] = wire_ptr[6:0] == 7'd38
assign array_entry_wen[39] = wire_ptr[6:0] == 7'd39
assign array_entry_wen[40] = wire_ptr[6:0] == 7'd40
assign array_entry_wen[41] = wire_ptr[6:0] == 7'd41
assign array_entry_wen[42] = wire_ptr[6:0] == 7'd42
assign array_entry_wen[43] = wire_ptr[6:0] == 7'd43
assign array_entry_wen[44] = wire_ptr[6:0] == 7'd44
assign array_entry_wen[45] = wire_ptr[6:0] == 7'd45
assign array_entry_wen[46] = wire_ptr[6:0] == 7'd46
assign array_entry_wen[47] = wire_ptr[6:0] == 7'd47
assign array_entry_wen[48] = wire_ptr[6:0] == 7'd48
assign array_entry_wen[49] = wire_ptr[6:0] == 7'd49
assign array_entry_wen[50] = wire_ptr[6:0] == 7'd50
assign array_entry_wen[51] = wire_ptr[6:0] == 7'd51
assign array_entry_wen[52] = wire_ptr[6:0] == 7'd52
assign array_entry_wen[53] = wire_ptr[6:0] == 7'd53
assign array_entry_wen[54] = wire_ptr[6:0] == 7'd54
assign array_entry_wen[55] = wire_ptr[6:0] == 7'd55
assign array_entry_wen[56] = wire_ptr[6:0] == 7'd56
assign array_entry_wen[57] = wire_ptr[6:0] == 7'd57
assign array_entry_wen[58] = wire_ptr[6:0] == 7'd58
assign array_entry_wen[59] = wire_ptr[6:0] == 7'd59
assign array_entry_wen[60] = wire_ptr[6:0] == 7'd60
assign array_entry_wen[61] = wire_ptr[6:0] == 7'd61
assign array_entry_wen[62] = wire_ptr[6:0] == 7'd62
assign array_entry_wen[63] = wire_ptr[6:0] == 7'd63
assign array_entry_wen[64] = wire_ptr[6:0] == 7'd64
assign array_entry_wen[65] = wire_ptr[6:0] == 7'd65
assign array_entry_wen[66] = wire_ptr[6:0] == 7'd66
assign array_entry_wen[67] = wire_ptr[6:0] == 7'd67
assign array_entry_wen[68] = wire_ptr[6:0] == 7'd68
assign array_entry_wen[69] = wire_ptr[6:0] == 7'd69
assign array_entry_wen[70] = wire_ptr[6:0] == 7'd70
assign array_entry_wen[71] = wire_ptr[6:0] == 7'd71
assign array_entry_wen[72] = wire_ptr[6:0] == 7'd72
assign array_entry_wen[73] = wire_ptr[6:0] == 7'd73
assign array_entry_wen[74] = wire_ptr[6:0] == 7'd74
assign array_entry_wen[75] = wire_ptr[6:0] == 7'd75
assign array_entry_wen[76] = wire_ptr[6:0] == 7'd76
assign array_entry_wen[77] = wire_ptr[6:0] == 7'd77
assign array_entry_wen[78] = wire_ptr[6:0] == 7'd78
assign array_entry_wen[79] = wire_ptr[6:0] == 7'd79
assign array_entry_wen[80] = wire_ptr[6:0] == 7'd80
assign array_entry_wen[81] = wire_ptr[6:0] == 7'd81
assign array_entry_wen[82] = wire_ptr[6:0] == 7'd82
assign array_entry_wen[83] = wire_ptr[6:0] == 7'd83
assign array_entry_wen[84] = wire_ptr[6:0] == 7'd84
assign array_entry_wen[85] = wire_ptr[6:0] == 7'd85
assign array_entry_wen[86] = wire_ptr[6:0] == 7'd86
assign array_entry_wen[87] = wire_ptr[6:0] == 7'd87
assign array_entry_wen[88] = wire_ptr[6:0] == 7'd88
assign array_entry_wen[89] = wire_ptr[6:0] == 7'd89
assign array_entry_wen[90] = wire_ptr[6:0] == 7'd90
assign array_entry_wen[91] = wire_ptr[6:0] == 7'd91
assign array_entry_wen[92] = wire_ptr[6:0] == 7'd92
assign array_entry_wen[93] = wire_ptr[6:0] == 7'd93
assign array_entry_wen[94] = wire_ptr[6:0] == 7'd94
assign array_entry_wen[95] = wire_ptr[6:0] == 7'd95
assign array_entry_wen[96] = wire_ptr[6:0] == 7'd96
assign array_entry_wen[97] = wire_ptr[6:0] == 7'd97
assign array_entry_wen[98] = wire_ptr[6:0] == 7'd98
assign array_entry_wen[99] = wire_ptr[6:0] == 7'd99
assign array_entry_wen[100] = wire_ptr[6:0] == 7'd100
assign array_entry_wen[101] = wire_ptr[6:0] == 7'd101
assign array_entry_wen[102] = wire_ptr[6:0] == 7'd102
assign array_entry_wen[103] = wire_ptr[6:0] == 7'd103
assign array_entry_wen[104] = wire_ptr[6:0] == 7'd104
assign array_entry_wen[105] = wire_ptr[6:0] == 7'd105
assign array_entry_wen[106] = wire_ptr[6:0] == 7'd106
assign array_entry_wen[107] = wire_ptr[6:0] == 7'd107
assign array_entry_wen[108] = wire_ptr[6:0] == 7'd108
assign array_entry_wen[109] = wire_ptr[6:0] == 7'd109
assign array_entry_wen[110] = wire_ptr[6:0] == 7'd110
assign array_entry_wen[111] = wire_ptr[6:0] == 7'd111
assign array_entry_wen[112] = wire_ptr[6:0] == 7'd112
assign array_entry_wen[113] = wire_ptr[6:0] == 7'd113
assign array_entry_wen[114] = wire_ptr[6:0] == 7'd114
assign array_entry_wen[115] = wire_ptr[6:0] == 7'd115
assign array_entry_wen[116] = wire_ptr[6:0] == 7'd116
assign array_entry_wen[117] = wire_ptr[6:0] == 7'd117
assign array_entry_wen[118] = wire_ptr[6:0] == 7'd118
assign array_entry_wen[119] = wire_ptr[6:0] == 7'd119
assign array_entry_wen[120] = wire_ptr[6:0] == 7'd120
assign array_entry_wen[121] = wire_ptr[6:0] == 7'd121
assign array_entry_wen[122] = wire_ptr[6:0] == 7'd122
assign array_entry_wen[123] = wire_ptr[6:0] == 7'd123
assign array_entry_wen[124] = wire_ptr[6:0] == 7'd124
assign array_entry_wen[125] = wire_ptr[6:0] == 7'd125
assign array_entry_wen[126] = wire_ptr[6:0] == 7'd126
assign array_entry_wen[127] = wire_ptr[6:0] == 7'd127
//bank_isu_iq Entry 0
  bank_isu_iq_entry bank_isu_iq_entry0 (
    .rob_id_In(bank_isu_iq_entry0_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry0_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry0_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry0_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry0_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry0_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry0_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry0_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry0_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry0_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry0_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry0_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry0_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry0_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry0_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry0_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 1
  bank_isu_iq_entry bank_isu_iq_entry1 (
    .rob_id_In(bank_isu_iq_entry1_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry1_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry1_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry1_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry1_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry1_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry1_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry1_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry1_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry1_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry1_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry1_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry1_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry1_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry1_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry1_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 2
  bank_isu_iq_entry bank_isu_iq_entry2 (
    .rob_id_In(bank_isu_iq_entry2_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry2_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry2_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry2_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry2_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry2_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry2_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry2_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry2_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry2_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry2_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry2_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry2_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry2_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry2_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry2_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 3
  bank_isu_iq_entry bank_isu_iq_entry3 (
    .rob_id_In(bank_isu_iq_entry3_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry3_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry3_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry3_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry3_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry3_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry3_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry3_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry3_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry3_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry3_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry3_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry3_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry3_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry3_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry3_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 4
  bank_isu_iq_entry bank_isu_iq_entry4 (
    .rob_id_In(bank_isu_iq_entry4_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry4_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry4_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry4_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry4_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry4_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry4_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry4_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry4_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry4_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry4_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry4_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry4_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry4_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry4_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry4_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 5
  bank_isu_iq_entry bank_isu_iq_entry5 (
    .rob_id_In(bank_isu_iq_entry5_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry5_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry5_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry5_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry5_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry5_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry5_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry5_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry5_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry5_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry5_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry5_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry5_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry5_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry5_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry5_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 6
  bank_isu_iq_entry bank_isu_iq_entry6 (
    .rob_id_In(bank_isu_iq_entry6_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry6_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry6_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry6_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry6_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry6_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry6_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry6_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry6_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry6_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry6_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry6_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry6_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry6_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry6_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry6_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 7
  bank_isu_iq_entry bank_isu_iq_entry7 (
    .rob_id_In(bank_isu_iq_entry7_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry7_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry7_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry7_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry7_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry7_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry7_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry7_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry7_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry7_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry7_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry7_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry7_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry7_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry7_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry7_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 8
  bank_isu_iq_entry bank_isu_iq_entry8 (
    .rob_id_In(bank_isu_iq_entry8_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry8_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry8_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry8_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry8_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry8_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry8_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry8_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry8_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry8_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry8_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry8_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry8_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry8_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry8_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry8_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 9
  bank_isu_iq_entry bank_isu_iq_entry9 (
    .rob_id_In(bank_isu_iq_entry9_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry9_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry9_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry9_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry9_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry9_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry9_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry9_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry9_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry9_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry9_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry9_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry9_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry9_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry9_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry9_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 10
  bank_isu_iq_entry bank_isu_iq_entry10 (
    .rob_id_In(bank_isu_iq_entry10_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry10_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry10_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry10_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry10_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry10_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry10_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry10_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry10_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry10_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry10_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry10_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry10_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry10_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry10_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry10_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 11
  bank_isu_iq_entry bank_isu_iq_entry11 (
    .rob_id_In(bank_isu_iq_entry11_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry11_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry11_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry11_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry11_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry11_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry11_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry11_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry11_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry11_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry11_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry11_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry11_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry11_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry11_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry11_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 12
  bank_isu_iq_entry bank_isu_iq_entry12 (
    .rob_id_In(bank_isu_iq_entry12_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry12_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry12_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry12_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry12_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry12_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry12_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry12_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry12_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry12_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry12_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry12_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry12_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry12_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry12_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry12_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 13
  bank_isu_iq_entry bank_isu_iq_entry13 (
    .rob_id_In(bank_isu_iq_entry13_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry13_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry13_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry13_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry13_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry13_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry13_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry13_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry13_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry13_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry13_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry13_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry13_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry13_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry13_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry13_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 14
  bank_isu_iq_entry bank_isu_iq_entry14 (
    .rob_id_In(bank_isu_iq_entry14_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry14_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry14_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry14_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry14_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry14_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry14_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry14_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry14_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry14_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry14_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry14_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry14_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry14_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry14_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry14_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 15
  bank_isu_iq_entry bank_isu_iq_entry15 (
    .rob_id_In(bank_isu_iq_entry15_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry15_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry15_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry15_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry15_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry15_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry15_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry15_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry15_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry15_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry15_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry15_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry15_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry15_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry15_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry15_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 16
  bank_isu_iq_entry bank_isu_iq_entry16 (
    .rob_id_In(bank_isu_iq_entry16_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry16_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry16_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry16_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry16_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry16_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry16_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry16_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry16_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry16_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry16_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry16_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry16_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry16_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry16_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry16_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 17
  bank_isu_iq_entry bank_isu_iq_entry17 (
    .rob_id_In(bank_isu_iq_entry17_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry17_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry17_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry17_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry17_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry17_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry17_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry17_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry17_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry17_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry17_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry17_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry17_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry17_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry17_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry17_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 18
  bank_isu_iq_entry bank_isu_iq_entry18 (
    .rob_id_In(bank_isu_iq_entry18_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry18_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry18_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry18_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry18_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry18_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry18_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry18_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry18_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry18_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry18_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry18_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry18_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry18_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry18_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry18_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 19
  bank_isu_iq_entry bank_isu_iq_entry19 (
    .rob_id_In(bank_isu_iq_entry19_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry19_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry19_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry19_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry19_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry19_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry19_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry19_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry19_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry19_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry19_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry19_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry19_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry19_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry19_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry19_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 20
  bank_isu_iq_entry bank_isu_iq_entry20 (
    .rob_id_In(bank_isu_iq_entry20_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry20_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry20_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry20_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry20_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry20_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry20_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry20_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry20_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry20_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry20_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry20_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry20_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry20_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry20_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry20_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 21
  bank_isu_iq_entry bank_isu_iq_entry21 (
    .rob_id_In(bank_isu_iq_entry21_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry21_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry21_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry21_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry21_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry21_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry21_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry21_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry21_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry21_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry21_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry21_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry21_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry21_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry21_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry21_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 22
  bank_isu_iq_entry bank_isu_iq_entry22 (
    .rob_id_In(bank_isu_iq_entry22_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry22_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry22_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry22_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry22_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry22_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry22_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry22_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry22_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry22_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry22_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry22_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry22_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry22_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry22_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry22_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 23
  bank_isu_iq_entry bank_isu_iq_entry23 (
    .rob_id_In(bank_isu_iq_entry23_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry23_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry23_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry23_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry23_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry23_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry23_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry23_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry23_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry23_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry23_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry23_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry23_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry23_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry23_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry23_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 24
  bank_isu_iq_entry bank_isu_iq_entry24 (
    .rob_id_In(bank_isu_iq_entry24_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry24_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry24_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry24_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry24_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry24_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry24_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry24_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry24_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry24_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry24_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry24_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry24_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry24_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry24_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry24_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 25
  bank_isu_iq_entry bank_isu_iq_entry25 (
    .rob_id_In(bank_isu_iq_entry25_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry25_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry25_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry25_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry25_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry25_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry25_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry25_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry25_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry25_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry25_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry25_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry25_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry25_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry25_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry25_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 26
  bank_isu_iq_entry bank_isu_iq_entry26 (
    .rob_id_In(bank_isu_iq_entry26_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry26_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry26_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry26_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry26_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry26_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry26_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry26_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry26_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry26_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry26_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry26_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry26_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry26_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry26_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry26_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 27
  bank_isu_iq_entry bank_isu_iq_entry27 (
    .rob_id_In(bank_isu_iq_entry27_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry27_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry27_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry27_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry27_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry27_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry27_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry27_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry27_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry27_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry27_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry27_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry27_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry27_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry27_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry27_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 28
  bank_isu_iq_entry bank_isu_iq_entry28 (
    .rob_id_In(bank_isu_iq_entry28_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry28_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry28_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry28_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry28_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry28_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry28_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry28_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry28_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry28_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry28_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry28_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry28_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry28_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry28_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry28_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 29
  bank_isu_iq_entry bank_isu_iq_entry29 (
    .rob_id_In(bank_isu_iq_entry29_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry29_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry29_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry29_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry29_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry29_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry29_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry29_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry29_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry29_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry29_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry29_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry29_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry29_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry29_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry29_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 30
  bank_isu_iq_entry bank_isu_iq_entry30 (
    .rob_id_In(bank_isu_iq_entry30_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry30_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry30_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry30_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry30_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry30_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry30_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry30_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry30_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry30_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry30_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry30_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry30_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry30_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry30_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry30_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 31
  bank_isu_iq_entry bank_isu_iq_entry31 (
    .rob_id_In(bank_isu_iq_entry31_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry31_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry31_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry31_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry31_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry31_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry31_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry31_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry31_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry31_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry31_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry31_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry31_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry31_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry31_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry31_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 32
  bank_isu_iq_entry bank_isu_iq_entry32 (
    .rob_id_In(bank_isu_iq_entry32_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry32_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry32_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry32_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry32_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry32_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry32_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry32_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry32_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry32_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry32_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry32_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry32_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry32_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry32_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry32_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 33
  bank_isu_iq_entry bank_isu_iq_entry33 (
    .rob_id_In(bank_isu_iq_entry33_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry33_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry33_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry33_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry33_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry33_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry33_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry33_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry33_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry33_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry33_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry33_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry33_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry33_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry33_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry33_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 34
  bank_isu_iq_entry bank_isu_iq_entry34 (
    .rob_id_In(bank_isu_iq_entry34_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry34_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry34_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry34_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry34_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry34_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry34_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry34_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry34_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry34_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry34_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry34_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry34_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry34_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry34_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry34_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 35
  bank_isu_iq_entry bank_isu_iq_entry35 (
    .rob_id_In(bank_isu_iq_entry35_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry35_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry35_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry35_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry35_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry35_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry35_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry35_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry35_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry35_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry35_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry35_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry35_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry35_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry35_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry35_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 36
  bank_isu_iq_entry bank_isu_iq_entry36 (
    .rob_id_In(bank_isu_iq_entry36_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry36_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry36_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry36_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry36_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry36_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry36_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry36_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry36_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry36_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry36_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry36_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry36_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry36_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry36_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry36_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 37
  bank_isu_iq_entry bank_isu_iq_entry37 (
    .rob_id_In(bank_isu_iq_entry37_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry37_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry37_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry37_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry37_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry37_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry37_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry37_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry37_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry37_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry37_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry37_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry37_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry37_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry37_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry37_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 38
  bank_isu_iq_entry bank_isu_iq_entry38 (
    .rob_id_In(bank_isu_iq_entry38_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry38_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry38_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry38_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry38_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry38_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry38_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry38_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry38_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry38_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry38_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry38_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry38_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry38_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry38_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry38_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 39
  bank_isu_iq_entry bank_isu_iq_entry39 (
    .rob_id_In(bank_isu_iq_entry39_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry39_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry39_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry39_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry39_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry39_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry39_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry39_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry39_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry39_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry39_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry39_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry39_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry39_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry39_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry39_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 40
  bank_isu_iq_entry bank_isu_iq_entry40 (
    .rob_id_In(bank_isu_iq_entry40_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry40_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry40_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry40_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry40_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry40_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry40_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry40_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry40_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry40_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry40_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry40_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry40_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry40_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry40_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry40_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 41
  bank_isu_iq_entry bank_isu_iq_entry41 (
    .rob_id_In(bank_isu_iq_entry41_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry41_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry41_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry41_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry41_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry41_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry41_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry41_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry41_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry41_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry41_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry41_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry41_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry41_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry41_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry41_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 42
  bank_isu_iq_entry bank_isu_iq_entry42 (
    .rob_id_In(bank_isu_iq_entry42_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry42_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry42_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry42_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry42_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry42_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry42_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry42_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry42_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry42_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry42_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry42_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry42_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry42_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry42_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry42_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 43
  bank_isu_iq_entry bank_isu_iq_entry43 (
    .rob_id_In(bank_isu_iq_entry43_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry43_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry43_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry43_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry43_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry43_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry43_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry43_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry43_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry43_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry43_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry43_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry43_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry43_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry43_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry43_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 44
  bank_isu_iq_entry bank_isu_iq_entry44 (
    .rob_id_In(bank_isu_iq_entry44_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry44_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry44_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry44_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry44_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry44_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry44_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry44_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry44_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry44_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry44_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry44_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry44_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry44_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry44_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry44_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 45
  bank_isu_iq_entry bank_isu_iq_entry45 (
    .rob_id_In(bank_isu_iq_entry45_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry45_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry45_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry45_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry45_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry45_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry45_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry45_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry45_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry45_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry45_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry45_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry45_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry45_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry45_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry45_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 46
  bank_isu_iq_entry bank_isu_iq_entry46 (
    .rob_id_In(bank_isu_iq_entry46_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry46_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry46_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry46_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry46_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry46_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry46_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry46_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry46_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry46_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry46_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry46_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry46_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry46_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry46_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry46_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 47
  bank_isu_iq_entry bank_isu_iq_entry47 (
    .rob_id_In(bank_isu_iq_entry47_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry47_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry47_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry47_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry47_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry47_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry47_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry47_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry47_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry47_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry47_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry47_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry47_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry47_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry47_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry47_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 48
  bank_isu_iq_entry bank_isu_iq_entry48 (
    .rob_id_In(bank_isu_iq_entry48_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry48_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry48_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry48_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry48_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry48_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry48_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry48_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry48_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry48_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry48_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry48_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry48_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry48_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry48_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry48_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 49
  bank_isu_iq_entry bank_isu_iq_entry49 (
    .rob_id_In(bank_isu_iq_entry49_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry49_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry49_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry49_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry49_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry49_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry49_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry49_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry49_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry49_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry49_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry49_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry49_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry49_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry49_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry49_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 50
  bank_isu_iq_entry bank_isu_iq_entry50 (
    .rob_id_In(bank_isu_iq_entry50_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry50_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry50_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry50_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry50_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry50_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry50_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry50_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry50_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry50_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry50_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry50_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry50_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry50_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry50_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry50_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 51
  bank_isu_iq_entry bank_isu_iq_entry51 (
    .rob_id_In(bank_isu_iq_entry51_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry51_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry51_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry51_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry51_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry51_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry51_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry51_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry51_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry51_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry51_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry51_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry51_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry51_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry51_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry51_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 52
  bank_isu_iq_entry bank_isu_iq_entry52 (
    .rob_id_In(bank_isu_iq_entry52_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry52_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry52_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry52_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry52_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry52_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry52_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry52_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry52_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry52_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry52_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry52_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry52_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry52_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry52_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry52_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 53
  bank_isu_iq_entry bank_isu_iq_entry53 (
    .rob_id_In(bank_isu_iq_entry53_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry53_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry53_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry53_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry53_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry53_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry53_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry53_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry53_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry53_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry53_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry53_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry53_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry53_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry53_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry53_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 54
  bank_isu_iq_entry bank_isu_iq_entry54 (
    .rob_id_In(bank_isu_iq_entry54_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry54_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry54_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry54_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry54_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry54_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry54_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry54_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry54_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry54_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry54_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry54_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry54_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry54_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry54_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry54_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 55
  bank_isu_iq_entry bank_isu_iq_entry55 (
    .rob_id_In(bank_isu_iq_entry55_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry55_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry55_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry55_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry55_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry55_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry55_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry55_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry55_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry55_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry55_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry55_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry55_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry55_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry55_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry55_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 56
  bank_isu_iq_entry bank_isu_iq_entry56 (
    .rob_id_In(bank_isu_iq_entry56_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry56_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry56_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry56_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry56_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry56_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry56_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry56_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry56_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry56_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry56_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry56_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry56_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry56_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry56_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry56_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 57
  bank_isu_iq_entry bank_isu_iq_entry57 (
    .rob_id_In(bank_isu_iq_entry57_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry57_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry57_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry57_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry57_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry57_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry57_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry57_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry57_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry57_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry57_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry57_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry57_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry57_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry57_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry57_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 58
  bank_isu_iq_entry bank_isu_iq_entry58 (
    .rob_id_In(bank_isu_iq_entry58_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry58_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry58_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry58_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry58_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry58_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry58_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry58_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry58_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry58_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry58_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry58_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry58_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry58_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry58_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry58_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 59
  bank_isu_iq_entry bank_isu_iq_entry59 (
    .rob_id_In(bank_isu_iq_entry59_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry59_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry59_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry59_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry59_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry59_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry59_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry59_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry59_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry59_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry59_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry59_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry59_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry59_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry59_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry59_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 60
  bank_isu_iq_entry bank_isu_iq_entry60 (
    .rob_id_In(bank_isu_iq_entry60_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry60_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry60_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry60_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry60_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry60_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry60_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry60_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry60_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry60_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry60_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry60_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry60_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry60_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry60_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry60_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 61
  bank_isu_iq_entry bank_isu_iq_entry61 (
    .rob_id_In(bank_isu_iq_entry61_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry61_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry61_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry61_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry61_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry61_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry61_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry61_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry61_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry61_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry61_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry61_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry61_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry61_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry61_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry61_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 62
  bank_isu_iq_entry bank_isu_iq_entry62 (
    .rob_id_In(bank_isu_iq_entry62_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry62_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry62_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry62_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry62_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry62_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry62_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry62_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry62_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry62_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry62_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry62_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry62_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry62_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry62_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry62_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 63
  bank_isu_iq_entry bank_isu_iq_entry63 (
    .rob_id_In(bank_isu_iq_entry63_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry63_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry63_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry63_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry63_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry63_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry63_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry63_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry63_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry63_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry63_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry63_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry63_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry63_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry63_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry63_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 64
  bank_isu_iq_entry bank_isu_iq_entry64 (
    .rob_id_In(bank_isu_iq_entry64_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry64_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry64_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry64_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry64_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry64_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry64_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry64_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry64_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry64_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry64_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry64_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry64_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry64_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry64_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry64_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 65
  bank_isu_iq_entry bank_isu_iq_entry65 (
    .rob_id_In(bank_isu_iq_entry65_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry65_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry65_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry65_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry65_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry65_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry65_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry65_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry65_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry65_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry65_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry65_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry65_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry65_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry65_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry65_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 66
  bank_isu_iq_entry bank_isu_iq_entry66 (
    .rob_id_In(bank_isu_iq_entry66_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry66_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry66_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry66_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry66_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry66_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry66_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry66_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry66_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry66_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry66_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry66_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry66_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry66_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry66_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry66_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 67
  bank_isu_iq_entry bank_isu_iq_entry67 (
    .rob_id_In(bank_isu_iq_entry67_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry67_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry67_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry67_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry67_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry67_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry67_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry67_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry67_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry67_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry67_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry67_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry67_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry67_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry67_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry67_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 68
  bank_isu_iq_entry bank_isu_iq_entry68 (
    .rob_id_In(bank_isu_iq_entry68_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry68_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry68_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry68_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry68_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry68_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry68_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry68_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry68_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry68_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry68_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry68_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry68_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry68_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry68_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry68_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 69
  bank_isu_iq_entry bank_isu_iq_entry69 (
    .rob_id_In(bank_isu_iq_entry69_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry69_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry69_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry69_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry69_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry69_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry69_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry69_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry69_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry69_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry69_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry69_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry69_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry69_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry69_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry69_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 70
  bank_isu_iq_entry bank_isu_iq_entry70 (
    .rob_id_In(bank_isu_iq_entry70_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry70_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry70_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry70_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry70_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry70_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry70_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry70_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry70_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry70_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry70_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry70_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry70_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry70_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry70_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry70_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 71
  bank_isu_iq_entry bank_isu_iq_entry71 (
    .rob_id_In(bank_isu_iq_entry71_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry71_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry71_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry71_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry71_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry71_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry71_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry71_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry71_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry71_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry71_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry71_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry71_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry71_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry71_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry71_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 72
  bank_isu_iq_entry bank_isu_iq_entry72 (
    .rob_id_In(bank_isu_iq_entry72_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry72_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry72_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry72_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry72_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry72_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry72_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry72_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry72_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry72_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry72_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry72_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry72_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry72_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry72_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry72_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 73
  bank_isu_iq_entry bank_isu_iq_entry73 (
    .rob_id_In(bank_isu_iq_entry73_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry73_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry73_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry73_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry73_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry73_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry73_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry73_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry73_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry73_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry73_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry73_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry73_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry73_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry73_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry73_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 74
  bank_isu_iq_entry bank_isu_iq_entry74 (
    .rob_id_In(bank_isu_iq_entry74_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry74_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry74_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry74_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry74_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry74_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry74_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry74_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry74_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry74_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry74_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry74_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry74_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry74_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry74_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry74_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 75
  bank_isu_iq_entry bank_isu_iq_entry75 (
    .rob_id_In(bank_isu_iq_entry75_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry75_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry75_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry75_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry75_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry75_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry75_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry75_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry75_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry75_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry75_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry75_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry75_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry75_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry75_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry75_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 76
  bank_isu_iq_entry bank_isu_iq_entry76 (
    .rob_id_In(bank_isu_iq_entry76_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry76_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry76_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry76_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry76_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry76_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry76_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry76_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry76_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry76_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry76_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry76_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry76_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry76_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry76_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry76_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 77
  bank_isu_iq_entry bank_isu_iq_entry77 (
    .rob_id_In(bank_isu_iq_entry77_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry77_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry77_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry77_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry77_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry77_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry77_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry77_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry77_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry77_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry77_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry77_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry77_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry77_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry77_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry77_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 78
  bank_isu_iq_entry bank_isu_iq_entry78 (
    .rob_id_In(bank_isu_iq_entry78_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry78_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry78_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry78_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry78_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry78_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry78_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry78_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry78_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry78_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry78_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry78_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry78_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry78_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry78_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry78_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 79
  bank_isu_iq_entry bank_isu_iq_entry79 (
    .rob_id_In(bank_isu_iq_entry79_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry79_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry79_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry79_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry79_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry79_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry79_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry79_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry79_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry79_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry79_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry79_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry79_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry79_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry79_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry79_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 80
  bank_isu_iq_entry bank_isu_iq_entry80 (
    .rob_id_In(bank_isu_iq_entry80_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry80_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry80_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry80_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry80_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry80_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry80_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry80_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry80_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry80_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry80_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry80_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry80_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry80_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry80_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry80_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 81
  bank_isu_iq_entry bank_isu_iq_entry81 (
    .rob_id_In(bank_isu_iq_entry81_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry81_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry81_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry81_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry81_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry81_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry81_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry81_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry81_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry81_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry81_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry81_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry81_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry81_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry81_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry81_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 82
  bank_isu_iq_entry bank_isu_iq_entry82 (
    .rob_id_In(bank_isu_iq_entry82_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry82_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry82_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry82_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry82_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry82_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry82_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry82_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry82_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry82_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry82_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry82_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry82_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry82_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry82_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry82_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 83
  bank_isu_iq_entry bank_isu_iq_entry83 (
    .rob_id_In(bank_isu_iq_entry83_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry83_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry83_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry83_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry83_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry83_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry83_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry83_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry83_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry83_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry83_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry83_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry83_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry83_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry83_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry83_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 84
  bank_isu_iq_entry bank_isu_iq_entry84 (
    .rob_id_In(bank_isu_iq_entry84_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry84_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry84_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry84_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry84_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry84_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry84_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry84_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry84_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry84_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry84_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry84_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry84_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry84_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry84_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry84_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 85
  bank_isu_iq_entry bank_isu_iq_entry85 (
    .rob_id_In(bank_isu_iq_entry85_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry85_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry85_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry85_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry85_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry85_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry85_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry85_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry85_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry85_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry85_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry85_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry85_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry85_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry85_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry85_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 86
  bank_isu_iq_entry bank_isu_iq_entry86 (
    .rob_id_In(bank_isu_iq_entry86_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry86_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry86_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry86_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry86_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry86_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry86_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry86_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry86_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry86_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry86_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry86_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry86_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry86_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry86_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry86_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 87
  bank_isu_iq_entry bank_isu_iq_entry87 (
    .rob_id_In(bank_isu_iq_entry87_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry87_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry87_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry87_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry87_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry87_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry87_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry87_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry87_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry87_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry87_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry87_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry87_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry87_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry87_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry87_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 88
  bank_isu_iq_entry bank_isu_iq_entry88 (
    .rob_id_In(bank_isu_iq_entry88_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry88_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry88_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry88_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry88_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry88_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry88_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry88_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry88_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry88_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry88_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry88_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry88_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry88_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry88_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry88_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 89
  bank_isu_iq_entry bank_isu_iq_entry89 (
    .rob_id_In(bank_isu_iq_entry89_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry89_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry89_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry89_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry89_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry89_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry89_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry89_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry89_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry89_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry89_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry89_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry89_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry89_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry89_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry89_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 90
  bank_isu_iq_entry bank_isu_iq_entry90 (
    .rob_id_In(bank_isu_iq_entry90_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry90_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry90_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry90_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry90_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry90_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry90_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry90_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry90_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry90_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry90_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry90_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry90_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry90_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry90_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry90_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 91
  bank_isu_iq_entry bank_isu_iq_entry91 (
    .rob_id_In(bank_isu_iq_entry91_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry91_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry91_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry91_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry91_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry91_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry91_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry91_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry91_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry91_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry91_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry91_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry91_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry91_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry91_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry91_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 92
  bank_isu_iq_entry bank_isu_iq_entry92 (
    .rob_id_In(bank_isu_iq_entry92_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry92_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry92_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry92_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry92_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry92_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry92_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry92_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry92_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry92_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry92_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry92_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry92_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry92_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry92_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry92_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 93
  bank_isu_iq_entry bank_isu_iq_entry93 (
    .rob_id_In(bank_isu_iq_entry93_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry93_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry93_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry93_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry93_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry93_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry93_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry93_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry93_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry93_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry93_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry93_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry93_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry93_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry93_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry93_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 94
  bank_isu_iq_entry bank_isu_iq_entry94 (
    .rob_id_In(bank_isu_iq_entry94_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry94_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry94_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry94_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry94_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry94_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry94_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry94_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry94_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry94_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry94_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry94_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry94_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry94_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry94_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry94_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 95
  bank_isu_iq_entry bank_isu_iq_entry95 (
    .rob_id_In(bank_isu_iq_entry95_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry95_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry95_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry95_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry95_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry95_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry95_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry95_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry95_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry95_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry95_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry95_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry95_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry95_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry95_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry95_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 96
  bank_isu_iq_entry bank_isu_iq_entry96 (
    .rob_id_In(bank_isu_iq_entry96_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry96_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry96_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry96_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry96_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry96_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry96_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry96_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry96_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry96_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry96_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry96_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry96_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry96_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry96_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry96_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 97
  bank_isu_iq_entry bank_isu_iq_entry97 (
    .rob_id_In(bank_isu_iq_entry97_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry97_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry97_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry97_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry97_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry97_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry97_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry97_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry97_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry97_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry97_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry97_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry97_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry97_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry97_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry97_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 98
  bank_isu_iq_entry bank_isu_iq_entry98 (
    .rob_id_In(bank_isu_iq_entry98_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry98_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry98_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry98_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry98_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry98_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry98_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry98_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry98_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry98_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry98_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry98_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry98_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry98_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry98_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry98_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 99
  bank_isu_iq_entry bank_isu_iq_entry99 (
    .rob_id_In(bank_isu_iq_entry99_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry99_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry99_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry99_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry99_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry99_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry99_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry99_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry99_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry99_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry99_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry99_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry99_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry99_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry99_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry99_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 100
  bank_isu_iq_entry bank_isu_iq_entry100 (
    .rob_id_In(bank_isu_iq_entry100_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry100_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry100_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry100_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry100_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry100_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry100_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry100_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry100_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry100_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry100_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry100_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry100_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry100_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry100_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry100_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 101
  bank_isu_iq_entry bank_isu_iq_entry101 (
    .rob_id_In(bank_isu_iq_entry101_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry101_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry101_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry101_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry101_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry101_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry101_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry101_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry101_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry101_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry101_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry101_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry101_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry101_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry101_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry101_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 102
  bank_isu_iq_entry bank_isu_iq_entry102 (
    .rob_id_In(bank_isu_iq_entry102_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry102_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry102_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry102_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry102_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry102_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry102_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry102_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry102_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry102_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry102_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry102_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry102_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry102_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry102_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry102_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 103
  bank_isu_iq_entry bank_isu_iq_entry103 (
    .rob_id_In(bank_isu_iq_entry103_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry103_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry103_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry103_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry103_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry103_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry103_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry103_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry103_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry103_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry103_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry103_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry103_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry103_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry103_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry103_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 104
  bank_isu_iq_entry bank_isu_iq_entry104 (
    .rob_id_In(bank_isu_iq_entry104_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry104_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry104_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry104_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry104_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry104_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry104_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry104_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry104_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry104_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry104_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry104_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry104_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry104_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry104_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry104_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 105
  bank_isu_iq_entry bank_isu_iq_entry105 (
    .rob_id_In(bank_isu_iq_entry105_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry105_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry105_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry105_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry105_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry105_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry105_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry105_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry105_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry105_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry105_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry105_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry105_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry105_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry105_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry105_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 106
  bank_isu_iq_entry bank_isu_iq_entry106 (
    .rob_id_In(bank_isu_iq_entry106_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry106_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry106_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry106_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry106_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry106_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry106_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry106_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry106_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry106_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry106_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry106_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry106_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry106_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry106_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry106_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 107
  bank_isu_iq_entry bank_isu_iq_entry107 (
    .rob_id_In(bank_isu_iq_entry107_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry107_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry107_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry107_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry107_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry107_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry107_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry107_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry107_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry107_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry107_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry107_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry107_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry107_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry107_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry107_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 108
  bank_isu_iq_entry bank_isu_iq_entry108 (
    .rob_id_In(bank_isu_iq_entry108_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry108_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry108_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry108_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry108_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry108_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry108_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry108_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry108_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry108_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry108_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry108_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry108_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry108_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry108_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry108_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 109
  bank_isu_iq_entry bank_isu_iq_entry109 (
    .rob_id_In(bank_isu_iq_entry109_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry109_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry109_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry109_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry109_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry109_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry109_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry109_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry109_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry109_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry109_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry109_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry109_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry109_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry109_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry109_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 110
  bank_isu_iq_entry bank_isu_iq_entry110 (
    .rob_id_In(bank_isu_iq_entry110_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry110_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry110_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry110_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry110_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry110_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry110_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry110_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry110_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry110_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry110_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry110_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry110_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry110_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry110_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry110_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 111
  bank_isu_iq_entry bank_isu_iq_entry111 (
    .rob_id_In(bank_isu_iq_entry111_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry111_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry111_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry111_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry111_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry111_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry111_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry111_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry111_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry111_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry111_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry111_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry111_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry111_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry111_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry111_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 112
  bank_isu_iq_entry bank_isu_iq_entry112 (
    .rob_id_In(bank_isu_iq_entry112_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry112_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry112_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry112_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry112_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry112_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry112_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry112_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry112_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry112_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry112_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry112_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry112_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry112_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry112_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry112_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 113
  bank_isu_iq_entry bank_isu_iq_entry113 (
    .rob_id_In(bank_isu_iq_entry113_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry113_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry113_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry113_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry113_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry113_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry113_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry113_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry113_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry113_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry113_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry113_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry113_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry113_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry113_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry113_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 114
  bank_isu_iq_entry bank_isu_iq_entry114 (
    .rob_id_In(bank_isu_iq_entry114_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry114_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry114_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry114_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry114_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry114_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry114_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry114_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry114_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry114_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry114_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry114_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry114_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry114_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry114_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry114_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 115
  bank_isu_iq_entry bank_isu_iq_entry115 (
    .rob_id_In(bank_isu_iq_entry115_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry115_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry115_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry115_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry115_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry115_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry115_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry115_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry115_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry115_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry115_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry115_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry115_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry115_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry115_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry115_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 116
  bank_isu_iq_entry bank_isu_iq_entry116 (
    .rob_id_In(bank_isu_iq_entry116_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry116_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry116_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry116_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry116_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry116_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry116_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry116_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry116_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry116_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry116_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry116_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry116_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry116_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry116_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry116_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 117
  bank_isu_iq_entry bank_isu_iq_entry117 (
    .rob_id_In(bank_isu_iq_entry117_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry117_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry117_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry117_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry117_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry117_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry117_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry117_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry117_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry117_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry117_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry117_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry117_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry117_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry117_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry117_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 118
  bank_isu_iq_entry bank_isu_iq_entry118 (
    .rob_id_In(bank_isu_iq_entry118_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry118_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry118_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry118_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry118_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry118_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry118_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry118_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry118_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry118_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry118_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry118_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry118_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry118_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry118_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry118_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 119
  bank_isu_iq_entry bank_isu_iq_entry119 (
    .rob_id_In(bank_isu_iq_entry119_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry119_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry119_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry119_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry119_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry119_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry119_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry119_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry119_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry119_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry119_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry119_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry119_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry119_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry119_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry119_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 120
  bank_isu_iq_entry bank_isu_iq_entry120 (
    .rob_id_In(bank_isu_iq_entry120_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry120_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry120_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry120_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry120_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry120_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry120_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry120_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry120_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry120_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry120_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry120_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry120_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry120_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry120_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry120_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 121
  bank_isu_iq_entry bank_isu_iq_entry121 (
    .rob_id_In(bank_isu_iq_entry121_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry121_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry121_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry121_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry121_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry121_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry121_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry121_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry121_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry121_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry121_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry121_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry121_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry121_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry121_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry121_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 122
  bank_isu_iq_entry bank_isu_iq_entry122 (
    .rob_id_In(bank_isu_iq_entry122_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry122_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry122_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry122_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry122_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry122_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry122_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry122_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry122_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry122_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry122_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry122_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry122_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry122_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry122_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry122_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 123
  bank_isu_iq_entry bank_isu_iq_entry123 (
    .rob_id_In(bank_isu_iq_entry123_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry123_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry123_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry123_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry123_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry123_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry123_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry123_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry123_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry123_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry123_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry123_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry123_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry123_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry123_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry123_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 124
  bank_isu_iq_entry bank_isu_iq_entry124 (
    .rob_id_In(bank_isu_iq_entry124_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry124_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry124_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry124_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry124_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry124_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry124_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry124_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry124_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry124_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry124_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry124_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry124_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry124_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry124_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry124_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 125
  bank_isu_iq_entry bank_isu_iq_entry125 (
    .rob_id_In(bank_isu_iq_entry125_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry125_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry125_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry125_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry125_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry125_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry125_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry125_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry125_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry125_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry125_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry125_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry125_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry125_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry125_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry125_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 126
  bank_isu_iq_entry bank_isu_iq_entry126 (
    .rob_id_In(bank_isu_iq_entry126_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry126_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry126_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry126_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry126_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry126_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry126_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry126_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry126_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry126_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry126_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry126_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry126_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry126_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry126_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry126_cacheline_state_Q[3:0])
  );

//bank_isu_iq Entry 127
  bank_isu_iq_entry bank_isu_iq_entry127 (
    .rob_id_In(bank_isu_iq_entry127_rob_id_In[2:0])
    .ch_id_In(bank_isu_iq_entry127_ch_id_In[1:0])
    .op_is_write_In(bank_isu_iq_entry127_op_is_write_In[0:0])
    .op_need_evit_In(bank_isu_iq_entry127_op_need_evit_In[0:0])
    .op_need_linefill_In(bank_isu_iq_entry127_op_need_linefill_In[0:0])
    .set_way_offset_In(bank_isu_iq_entry127_set_way_offset_In[6:0])
    .wbuffer_id_In(bank_isu_iq_entry127_wbuffer_id_In[7:0])
    .cacheline_state_In(bank_isu_iq_entry127_cacheline_state_In[3:0])
    .rob_id_Q(bank_isu_iq_entry127_rob_id_Q[2:0])
    .ch_id_Q(bank_isu_iq_entry127_ch_id_Q[1:0])
    .op_is_write_Q(bank_isu_iq_entry127_op_is_write_Q[0:0])
    .op_need_evit_Q(bank_isu_iq_entry127_op_need_evit_Q[0:0])
    .op_need_linefill_Q(bank_isu_iq_entry127_op_need_linefill_Q[0:0])
    .set_way_offset_Q(bank_isu_iq_entry127_set_way_offset_Q[6:0])
    .wbuffer_id_Q(bank_isu_iq_entry127_wbuffer_id_Q[7:0])
    .cacheline_state_Q(bank_isu_iq_entry127_cacheline_state_Q[3:0])
  );


endmodule
