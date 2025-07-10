// This RTL code is generate by RTL generator, please do not modify!
module bank_isu_iq_array (
  input  wire                        clk,
  input  wire        [5:0]           biu_rid_In,
  input  wire        [5:0]           read_ptr,
  input  wire                        wen,
  input  wire        [5:0]           write_ptr,
  input  wire        [2:0]           bank_isu_iq_array_rob_id_In,
  input  wire        [1:0]           bank_isu_iq_array_ch_id_In,
  input  wire                        bank_isu_iq_array_op_is_write_In,
  input  wire                        bank_isu_iq_array_op_need_linefill_In,
  input  wire        [6:0]           bank_isu_iq_array_set_way_offset_In,
  input  wire        [7:0]           bank_isu_iq_array_wbuffer_id_In,
  input  wire        [3:0]           bank_isu_iq_array_cacheline_state_In,
  output wire        [2:0]           bank_isu_iq_array_rob_id_rdata,
  output wire        [1:0]           bank_isu_iq_array_ch_id_rdata,
  output wire                        bank_isu_iq_array_op_is_write_rdata,
  output wire                        bank_isu_iq_array_op_need_linefill_rdata,
  output wire        [6:0]           bank_isu_iq_array_set_way_offset_rdata,
  output wire        [7:0]           bank_isu_iq_array_wbuffer_id_rdata,
  output wire        [3:0]           bank_isu_iq_array_cacheline_state_rdata,
  output wire        [63:0]          biu_id_match_array,
  output wire        [63:0]          entry_req_from_ch0_array,
  output wire        [63:0]          entry_req_from_ch1_array,
  output wire        [63:0]          entry_req_from_ch2_array
);

//--------------------------------------------------------------------------------
//                              Wire declaration
//--------------------------------------------------------------------------------
  wire        [2:0]           bank_isu_iq_entry00_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry01_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry02_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry03_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry04_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry05_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry06_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry07_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry08_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry09_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry10_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry11_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry12_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry13_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry14_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry15_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry16_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry17_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry18_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry19_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry20_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry21_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry22_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry23_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry24_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry25_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry26_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry27_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry28_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry29_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry30_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry31_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry32_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry33_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry34_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry35_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry36_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry37_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry38_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry39_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry40_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry41_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry42_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry43_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry44_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry45_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry46_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry47_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry48_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry49_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry50_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry51_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry52_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry53_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry54_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry55_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry56_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry57_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry58_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry59_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry60_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry61_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry62_rob_id_Q;
  wire        [2:0]           bank_isu_iq_entry63_rob_id_Q;
  wire        [1:0]           bank_isu_iq_entry00_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry01_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry02_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry03_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry04_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry05_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry06_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry07_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry08_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry09_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry10_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry11_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry12_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry13_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry14_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry15_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry16_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry17_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry18_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry19_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry20_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry21_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry22_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry23_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry24_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry25_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry26_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry27_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry28_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry29_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry30_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry31_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry32_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry33_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry34_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry35_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry36_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry37_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry38_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry39_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry40_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry41_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry42_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry43_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry44_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry45_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry46_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry47_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry48_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry49_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry50_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry51_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry52_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry53_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry54_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry55_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry56_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry57_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry58_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry59_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry60_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry61_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry62_ch_id_Q;
  wire        [1:0]           bank_isu_iq_entry63_ch_id_Q;
  wire                        bank_isu_iq_entry00_op_is_write_Q;
  wire                        bank_isu_iq_entry01_op_is_write_Q;
  wire                        bank_isu_iq_entry02_op_is_write_Q;
  wire                        bank_isu_iq_entry03_op_is_write_Q;
  wire                        bank_isu_iq_entry04_op_is_write_Q;
  wire                        bank_isu_iq_entry05_op_is_write_Q;
  wire                        bank_isu_iq_entry06_op_is_write_Q;
  wire                        bank_isu_iq_entry07_op_is_write_Q;
  wire                        bank_isu_iq_entry08_op_is_write_Q;
  wire                        bank_isu_iq_entry09_op_is_write_Q;
  wire                        bank_isu_iq_entry10_op_is_write_Q;
  wire                        bank_isu_iq_entry11_op_is_write_Q;
  wire                        bank_isu_iq_entry12_op_is_write_Q;
  wire                        bank_isu_iq_entry13_op_is_write_Q;
  wire                        bank_isu_iq_entry14_op_is_write_Q;
  wire                        bank_isu_iq_entry15_op_is_write_Q;
  wire                        bank_isu_iq_entry16_op_is_write_Q;
  wire                        bank_isu_iq_entry17_op_is_write_Q;
  wire                        bank_isu_iq_entry18_op_is_write_Q;
  wire                        bank_isu_iq_entry19_op_is_write_Q;
  wire                        bank_isu_iq_entry20_op_is_write_Q;
  wire                        bank_isu_iq_entry21_op_is_write_Q;
  wire                        bank_isu_iq_entry22_op_is_write_Q;
  wire                        bank_isu_iq_entry23_op_is_write_Q;
  wire                        bank_isu_iq_entry24_op_is_write_Q;
  wire                        bank_isu_iq_entry25_op_is_write_Q;
  wire                        bank_isu_iq_entry26_op_is_write_Q;
  wire                        bank_isu_iq_entry27_op_is_write_Q;
  wire                        bank_isu_iq_entry28_op_is_write_Q;
  wire                        bank_isu_iq_entry29_op_is_write_Q;
  wire                        bank_isu_iq_entry30_op_is_write_Q;
  wire                        bank_isu_iq_entry31_op_is_write_Q;
  wire                        bank_isu_iq_entry32_op_is_write_Q;
  wire                        bank_isu_iq_entry33_op_is_write_Q;
  wire                        bank_isu_iq_entry34_op_is_write_Q;
  wire                        bank_isu_iq_entry35_op_is_write_Q;
  wire                        bank_isu_iq_entry36_op_is_write_Q;
  wire                        bank_isu_iq_entry37_op_is_write_Q;
  wire                        bank_isu_iq_entry38_op_is_write_Q;
  wire                        bank_isu_iq_entry39_op_is_write_Q;
  wire                        bank_isu_iq_entry40_op_is_write_Q;
  wire                        bank_isu_iq_entry41_op_is_write_Q;
  wire                        bank_isu_iq_entry42_op_is_write_Q;
  wire                        bank_isu_iq_entry43_op_is_write_Q;
  wire                        bank_isu_iq_entry44_op_is_write_Q;
  wire                        bank_isu_iq_entry45_op_is_write_Q;
  wire                        bank_isu_iq_entry46_op_is_write_Q;
  wire                        bank_isu_iq_entry47_op_is_write_Q;
  wire                        bank_isu_iq_entry48_op_is_write_Q;
  wire                        bank_isu_iq_entry49_op_is_write_Q;
  wire                        bank_isu_iq_entry50_op_is_write_Q;
  wire                        bank_isu_iq_entry51_op_is_write_Q;
  wire                        bank_isu_iq_entry52_op_is_write_Q;
  wire                        bank_isu_iq_entry53_op_is_write_Q;
  wire                        bank_isu_iq_entry54_op_is_write_Q;
  wire                        bank_isu_iq_entry55_op_is_write_Q;
  wire                        bank_isu_iq_entry56_op_is_write_Q;
  wire                        bank_isu_iq_entry57_op_is_write_Q;
  wire                        bank_isu_iq_entry58_op_is_write_Q;
  wire                        bank_isu_iq_entry59_op_is_write_Q;
  wire                        bank_isu_iq_entry60_op_is_write_Q;
  wire                        bank_isu_iq_entry61_op_is_write_Q;
  wire                        bank_isu_iq_entry62_op_is_write_Q;
  wire                        bank_isu_iq_entry63_op_is_write_Q;
  wire                        bank_isu_iq_entry00_op_need_linefill_Q;
  wire                        bank_isu_iq_entry01_op_need_linefill_Q;
  wire                        bank_isu_iq_entry02_op_need_linefill_Q;
  wire                        bank_isu_iq_entry03_op_need_linefill_Q;
  wire                        bank_isu_iq_entry04_op_need_linefill_Q;
  wire                        bank_isu_iq_entry05_op_need_linefill_Q;
  wire                        bank_isu_iq_entry06_op_need_linefill_Q;
  wire                        bank_isu_iq_entry07_op_need_linefill_Q;
  wire                        bank_isu_iq_entry08_op_need_linefill_Q;
  wire                        bank_isu_iq_entry09_op_need_linefill_Q;
  wire                        bank_isu_iq_entry10_op_need_linefill_Q;
  wire                        bank_isu_iq_entry11_op_need_linefill_Q;
  wire                        bank_isu_iq_entry12_op_need_linefill_Q;
  wire                        bank_isu_iq_entry13_op_need_linefill_Q;
  wire                        bank_isu_iq_entry14_op_need_linefill_Q;
  wire                        bank_isu_iq_entry15_op_need_linefill_Q;
  wire                        bank_isu_iq_entry16_op_need_linefill_Q;
  wire                        bank_isu_iq_entry17_op_need_linefill_Q;
  wire                        bank_isu_iq_entry18_op_need_linefill_Q;
  wire                        bank_isu_iq_entry19_op_need_linefill_Q;
  wire                        bank_isu_iq_entry20_op_need_linefill_Q;
  wire                        bank_isu_iq_entry21_op_need_linefill_Q;
  wire                        bank_isu_iq_entry22_op_need_linefill_Q;
  wire                        bank_isu_iq_entry23_op_need_linefill_Q;
  wire                        bank_isu_iq_entry24_op_need_linefill_Q;
  wire                        bank_isu_iq_entry25_op_need_linefill_Q;
  wire                        bank_isu_iq_entry26_op_need_linefill_Q;
  wire                        bank_isu_iq_entry27_op_need_linefill_Q;
  wire                        bank_isu_iq_entry28_op_need_linefill_Q;
  wire                        bank_isu_iq_entry29_op_need_linefill_Q;
  wire                        bank_isu_iq_entry30_op_need_linefill_Q;
  wire                        bank_isu_iq_entry31_op_need_linefill_Q;
  wire                        bank_isu_iq_entry32_op_need_linefill_Q;
  wire                        bank_isu_iq_entry33_op_need_linefill_Q;
  wire                        bank_isu_iq_entry34_op_need_linefill_Q;
  wire                        bank_isu_iq_entry35_op_need_linefill_Q;
  wire                        bank_isu_iq_entry36_op_need_linefill_Q;
  wire                        bank_isu_iq_entry37_op_need_linefill_Q;
  wire                        bank_isu_iq_entry38_op_need_linefill_Q;
  wire                        bank_isu_iq_entry39_op_need_linefill_Q;
  wire                        bank_isu_iq_entry40_op_need_linefill_Q;
  wire                        bank_isu_iq_entry41_op_need_linefill_Q;
  wire                        bank_isu_iq_entry42_op_need_linefill_Q;
  wire                        bank_isu_iq_entry43_op_need_linefill_Q;
  wire                        bank_isu_iq_entry44_op_need_linefill_Q;
  wire                        bank_isu_iq_entry45_op_need_linefill_Q;
  wire                        bank_isu_iq_entry46_op_need_linefill_Q;
  wire                        bank_isu_iq_entry47_op_need_linefill_Q;
  wire                        bank_isu_iq_entry48_op_need_linefill_Q;
  wire                        bank_isu_iq_entry49_op_need_linefill_Q;
  wire                        bank_isu_iq_entry50_op_need_linefill_Q;
  wire                        bank_isu_iq_entry51_op_need_linefill_Q;
  wire                        bank_isu_iq_entry52_op_need_linefill_Q;
  wire                        bank_isu_iq_entry53_op_need_linefill_Q;
  wire                        bank_isu_iq_entry54_op_need_linefill_Q;
  wire                        bank_isu_iq_entry55_op_need_linefill_Q;
  wire                        bank_isu_iq_entry56_op_need_linefill_Q;
  wire                        bank_isu_iq_entry57_op_need_linefill_Q;
  wire                        bank_isu_iq_entry58_op_need_linefill_Q;
  wire                        bank_isu_iq_entry59_op_need_linefill_Q;
  wire                        bank_isu_iq_entry60_op_need_linefill_Q;
  wire                        bank_isu_iq_entry61_op_need_linefill_Q;
  wire                        bank_isu_iq_entry62_op_need_linefill_Q;
  wire                        bank_isu_iq_entry63_op_need_linefill_Q;
  wire        [6:0]           bank_isu_iq_entry00_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry01_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry02_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry03_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry04_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry05_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry06_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry07_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry08_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry09_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry10_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry11_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry12_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry13_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry14_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry15_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry16_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry17_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry18_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry19_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry20_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry21_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry22_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry23_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry24_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry25_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry26_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry27_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry28_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry29_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry30_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry31_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry32_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry33_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry34_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry35_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry36_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry37_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry38_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry39_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry40_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry41_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry42_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry43_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry44_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry45_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry46_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry47_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry48_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry49_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry50_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry51_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry52_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry53_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry54_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry55_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry56_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry57_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry58_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry59_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry60_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry61_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry62_set_way_offset_Q;
  wire        [6:0]           bank_isu_iq_entry63_set_way_offset_Q;
  wire        [7:0]           bank_isu_iq_entry00_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry01_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry02_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry03_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry04_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry05_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry06_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry07_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry08_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry09_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry10_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry11_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry12_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry13_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry14_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry15_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry16_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry17_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry18_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry19_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry20_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry21_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry22_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry23_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry24_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry25_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry26_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry27_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry28_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry29_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry30_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry31_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry32_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry33_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry34_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry35_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry36_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry37_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry38_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry39_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry40_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry41_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry42_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry43_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry44_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry45_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry46_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry47_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry48_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry49_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry50_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry51_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry52_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry53_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry54_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry55_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry56_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry57_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry58_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry59_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry60_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry61_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry62_wbuffer_id_Q;
  wire        [7:0]           bank_isu_iq_entry63_wbuffer_id_Q;
  wire        [3:0]           bank_isu_iq_entry00_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry01_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry02_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry03_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry04_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry05_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry06_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry07_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry08_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry09_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry10_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry11_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry12_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry13_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry14_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry15_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry16_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry17_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry18_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry19_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry20_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry21_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry22_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry23_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry24_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry25_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry26_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry27_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry28_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry29_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry30_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry31_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry32_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry33_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry34_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry35_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry36_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry37_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry38_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry39_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry40_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry41_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry42_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry43_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry44_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry45_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry46_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry47_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry48_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry49_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry50_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry51_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry52_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry53_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry54_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry55_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry56_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry57_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry58_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry59_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry60_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry61_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry62_cacheline_state_Q;
  wire        [3:0]           bank_isu_iq_entry63_cacheline_state_Q;
  wire        [63:0]          read_ptr_dcd;
  wire                        bank_isu_iq_entry_entry00_wen;
  wire                        bank_isu_iq_entry_entry01_wen;
  wire                        bank_isu_iq_entry_entry02_wen;
  wire                        bank_isu_iq_entry_entry03_wen;
  wire                        bank_isu_iq_entry_entry04_wen;
  wire                        bank_isu_iq_entry_entry05_wen;
  wire                        bank_isu_iq_entry_entry06_wen;
  wire                        bank_isu_iq_entry_entry07_wen;
  wire                        bank_isu_iq_entry_entry08_wen;
  wire                        bank_isu_iq_entry_entry09_wen;
  wire                        bank_isu_iq_entry_entry10_wen;
  wire                        bank_isu_iq_entry_entry11_wen;
  wire                        bank_isu_iq_entry_entry12_wen;
  wire                        bank_isu_iq_entry_entry13_wen;
  wire                        bank_isu_iq_entry_entry14_wen;
  wire                        bank_isu_iq_entry_entry15_wen;
  wire                        bank_isu_iq_entry_entry16_wen;
  wire                        bank_isu_iq_entry_entry17_wen;
  wire                        bank_isu_iq_entry_entry18_wen;
  wire                        bank_isu_iq_entry_entry19_wen;
  wire                        bank_isu_iq_entry_entry20_wen;
  wire                        bank_isu_iq_entry_entry21_wen;
  wire                        bank_isu_iq_entry_entry22_wen;
  wire                        bank_isu_iq_entry_entry23_wen;
  wire                        bank_isu_iq_entry_entry24_wen;
  wire                        bank_isu_iq_entry_entry25_wen;
  wire                        bank_isu_iq_entry_entry26_wen;
  wire                        bank_isu_iq_entry_entry27_wen;
  wire                        bank_isu_iq_entry_entry28_wen;
  wire                        bank_isu_iq_entry_entry29_wen;
  wire                        bank_isu_iq_entry_entry30_wen;
  wire                        bank_isu_iq_entry_entry31_wen;
  wire                        bank_isu_iq_entry_entry32_wen;
  wire                        bank_isu_iq_entry_entry33_wen;
  wire                        bank_isu_iq_entry_entry34_wen;
  wire                        bank_isu_iq_entry_entry35_wen;
  wire                        bank_isu_iq_entry_entry36_wen;
  wire                        bank_isu_iq_entry_entry37_wen;
  wire                        bank_isu_iq_entry_entry38_wen;
  wire                        bank_isu_iq_entry_entry39_wen;
  wire                        bank_isu_iq_entry_entry40_wen;
  wire                        bank_isu_iq_entry_entry41_wen;
  wire                        bank_isu_iq_entry_entry42_wen;
  wire                        bank_isu_iq_entry_entry43_wen;
  wire                        bank_isu_iq_entry_entry44_wen;
  wire                        bank_isu_iq_entry_entry45_wen;
  wire                        bank_isu_iq_entry_entry46_wen;
  wire                        bank_isu_iq_entry_entry47_wen;
  wire                        bank_isu_iq_entry_entry48_wen;
  wire                        bank_isu_iq_entry_entry49_wen;
  wire                        bank_isu_iq_entry_entry50_wen;
  wire                        bank_isu_iq_entry_entry51_wen;
  wire                        bank_isu_iq_entry_entry52_wen;
  wire                        bank_isu_iq_entry_entry53_wen;
  wire                        bank_isu_iq_entry_entry54_wen;
  wire                        bank_isu_iq_entry_entry55_wen;
  wire                        bank_isu_iq_entry_entry56_wen;
  wire                        bank_isu_iq_entry_entry57_wen;
  wire                        bank_isu_iq_entry_entry58_wen;
  wire                        bank_isu_iq_entry_entry59_wen;
  wire                        bank_isu_iq_entry_entry60_wen;
  wire                        bank_isu_iq_entry_entry61_wen;
  wire                        bank_isu_iq_entry_entry62_wen;
  wire                        bank_isu_iq_entry_entry63_wen;

//--------------------------------------------------------------------------------
//                              LOGIC START
//--------------------------------------------------------------------------------
  assign bank_isu_iq_entry_entry00_wen = write_ptr[5:0] == 6'd0;
  assign bank_isu_iq_entry_entry01_wen = write_ptr[5:0] == 6'd1;
  assign bank_isu_iq_entry_entry02_wen = write_ptr[5:0] == 6'd2;
  assign bank_isu_iq_entry_entry03_wen = write_ptr[5:0] == 6'd3;
  assign bank_isu_iq_entry_entry04_wen = write_ptr[5:0] == 6'd4;
  assign bank_isu_iq_entry_entry05_wen = write_ptr[5:0] == 6'd5;
  assign bank_isu_iq_entry_entry06_wen = write_ptr[5:0] == 6'd6;
  assign bank_isu_iq_entry_entry07_wen = write_ptr[5:0] == 6'd7;
  assign bank_isu_iq_entry_entry08_wen = write_ptr[5:0] == 6'd8;
  assign bank_isu_iq_entry_entry09_wen = write_ptr[5:0] == 6'd9;
  assign bank_isu_iq_entry_entry10_wen = write_ptr[5:0] == 6'd10;
  assign bank_isu_iq_entry_entry11_wen = write_ptr[5:0] == 6'd11;
  assign bank_isu_iq_entry_entry12_wen = write_ptr[5:0] == 6'd12;
  assign bank_isu_iq_entry_entry13_wen = write_ptr[5:0] == 6'd13;
  assign bank_isu_iq_entry_entry14_wen = write_ptr[5:0] == 6'd14;
  assign bank_isu_iq_entry_entry15_wen = write_ptr[5:0] == 6'd15;
  assign bank_isu_iq_entry_entry16_wen = write_ptr[5:0] == 6'd16;
  assign bank_isu_iq_entry_entry17_wen = write_ptr[5:0] == 6'd17;
  assign bank_isu_iq_entry_entry18_wen = write_ptr[5:0] == 6'd18;
  assign bank_isu_iq_entry_entry19_wen = write_ptr[5:0] == 6'd19;
  assign bank_isu_iq_entry_entry20_wen = write_ptr[5:0] == 6'd20;
  assign bank_isu_iq_entry_entry21_wen = write_ptr[5:0] == 6'd21;
  assign bank_isu_iq_entry_entry22_wen = write_ptr[5:0] == 6'd22;
  assign bank_isu_iq_entry_entry23_wen = write_ptr[5:0] == 6'd23;
  assign bank_isu_iq_entry_entry24_wen = write_ptr[5:0] == 6'd24;
  assign bank_isu_iq_entry_entry25_wen = write_ptr[5:0] == 6'd25;
  assign bank_isu_iq_entry_entry26_wen = write_ptr[5:0] == 6'd26;
  assign bank_isu_iq_entry_entry27_wen = write_ptr[5:0] == 6'd27;
  assign bank_isu_iq_entry_entry28_wen = write_ptr[5:0] == 6'd28;
  assign bank_isu_iq_entry_entry29_wen = write_ptr[5:0] == 6'd29;
  assign bank_isu_iq_entry_entry30_wen = write_ptr[5:0] == 6'd30;
  assign bank_isu_iq_entry_entry31_wen = write_ptr[5:0] == 6'd31;
  assign bank_isu_iq_entry_entry32_wen = write_ptr[5:0] == 6'd32;
  assign bank_isu_iq_entry_entry33_wen = write_ptr[5:0] == 6'd33;
  assign bank_isu_iq_entry_entry34_wen = write_ptr[5:0] == 6'd34;
  assign bank_isu_iq_entry_entry35_wen = write_ptr[5:0] == 6'd35;
  assign bank_isu_iq_entry_entry36_wen = write_ptr[5:0] == 6'd36;
  assign bank_isu_iq_entry_entry37_wen = write_ptr[5:0] == 6'd37;
  assign bank_isu_iq_entry_entry38_wen = write_ptr[5:0] == 6'd38;
  assign bank_isu_iq_entry_entry39_wen = write_ptr[5:0] == 6'd39;
  assign bank_isu_iq_entry_entry40_wen = write_ptr[5:0] == 6'd40;
  assign bank_isu_iq_entry_entry41_wen = write_ptr[5:0] == 6'd41;
  assign bank_isu_iq_entry_entry42_wen = write_ptr[5:0] == 6'd42;
  assign bank_isu_iq_entry_entry43_wen = write_ptr[5:0] == 6'd43;
  assign bank_isu_iq_entry_entry44_wen = write_ptr[5:0] == 6'd44;
  assign bank_isu_iq_entry_entry45_wen = write_ptr[5:0] == 6'd45;
  assign bank_isu_iq_entry_entry46_wen = write_ptr[5:0] == 6'd46;
  assign bank_isu_iq_entry_entry47_wen = write_ptr[5:0] == 6'd47;
  assign bank_isu_iq_entry_entry48_wen = write_ptr[5:0] == 6'd48;
  assign bank_isu_iq_entry_entry49_wen = write_ptr[5:0] == 6'd49;
  assign bank_isu_iq_entry_entry50_wen = write_ptr[5:0] == 6'd50;
  assign bank_isu_iq_entry_entry51_wen = write_ptr[5:0] == 6'd51;
  assign bank_isu_iq_entry_entry52_wen = write_ptr[5:0] == 6'd52;
  assign bank_isu_iq_entry_entry53_wen = write_ptr[5:0] == 6'd53;
  assign bank_isu_iq_entry_entry54_wen = write_ptr[5:0] == 6'd54;
  assign bank_isu_iq_entry_entry55_wen = write_ptr[5:0] == 6'd55;
  assign bank_isu_iq_entry_entry56_wen = write_ptr[5:0] == 6'd56;
  assign bank_isu_iq_entry_entry57_wen = write_ptr[5:0] == 6'd57;
  assign bank_isu_iq_entry_entry58_wen = write_ptr[5:0] == 6'd58;
  assign bank_isu_iq_entry_entry59_wen = write_ptr[5:0] == 6'd59;
  assign bank_isu_iq_entry_entry60_wen = write_ptr[5:0] == 6'd60;
  assign bank_isu_iq_entry_entry61_wen = write_ptr[5:0] == 6'd61;
  assign bank_isu_iq_entry_entry62_wen = write_ptr[5:0] == 6'd62;
  assign bank_isu_iq_entry_entry63_wen = write_ptr[5:0] == 6'd63;

  assign read_ptr_dcd[0] = read_ptr[5:0] == 6'd0;
  assign read_ptr_dcd[1] = read_ptr[5:0] == 6'd1;
  assign read_ptr_dcd[2] = read_ptr[5:0] == 6'd2;
  assign read_ptr_dcd[3] = read_ptr[5:0] == 6'd3;
  assign read_ptr_dcd[4] = read_ptr[5:0] == 6'd4;
  assign read_ptr_dcd[5] = read_ptr[5:0] == 6'd5;
  assign read_ptr_dcd[6] = read_ptr[5:0] == 6'd6;
  assign read_ptr_dcd[7] = read_ptr[5:0] == 6'd7;
  assign read_ptr_dcd[8] = read_ptr[5:0] == 6'd8;
  assign read_ptr_dcd[9] = read_ptr[5:0] == 6'd9;
  assign read_ptr_dcd[10] = read_ptr[5:0] == 6'd10;
  assign read_ptr_dcd[11] = read_ptr[5:0] == 6'd11;
  assign read_ptr_dcd[12] = read_ptr[5:0] == 6'd12;
  assign read_ptr_dcd[13] = read_ptr[5:0] == 6'd13;
  assign read_ptr_dcd[14] = read_ptr[5:0] == 6'd14;
  assign read_ptr_dcd[15] = read_ptr[5:0] == 6'd15;
  assign read_ptr_dcd[16] = read_ptr[5:0] == 6'd16;
  assign read_ptr_dcd[17] = read_ptr[5:0] == 6'd17;
  assign read_ptr_dcd[18] = read_ptr[5:0] == 6'd18;
  assign read_ptr_dcd[19] = read_ptr[5:0] == 6'd19;
  assign read_ptr_dcd[20] = read_ptr[5:0] == 6'd20;
  assign read_ptr_dcd[21] = read_ptr[5:0] == 6'd21;
  assign read_ptr_dcd[22] = read_ptr[5:0] == 6'd22;
  assign read_ptr_dcd[23] = read_ptr[5:0] == 6'd23;
  assign read_ptr_dcd[24] = read_ptr[5:0] == 6'd24;
  assign read_ptr_dcd[25] = read_ptr[5:0] == 6'd25;
  assign read_ptr_dcd[26] = read_ptr[5:0] == 6'd26;
  assign read_ptr_dcd[27] = read_ptr[5:0] == 6'd27;
  assign read_ptr_dcd[28] = read_ptr[5:0] == 6'd28;
  assign read_ptr_dcd[29] = read_ptr[5:0] == 6'd29;
  assign read_ptr_dcd[30] = read_ptr[5:0] == 6'd30;
  assign read_ptr_dcd[31] = read_ptr[5:0] == 6'd31;
  assign read_ptr_dcd[32] = read_ptr[5:0] == 6'd32;
  assign read_ptr_dcd[33] = read_ptr[5:0] == 6'd33;
  assign read_ptr_dcd[34] = read_ptr[5:0] == 6'd34;
  assign read_ptr_dcd[35] = read_ptr[5:0] == 6'd35;
  assign read_ptr_dcd[36] = read_ptr[5:0] == 6'd36;
  assign read_ptr_dcd[37] = read_ptr[5:0] == 6'd37;
  assign read_ptr_dcd[38] = read_ptr[5:0] == 6'd38;
  assign read_ptr_dcd[39] = read_ptr[5:0] == 6'd39;
  assign read_ptr_dcd[40] = read_ptr[5:0] == 6'd40;
  assign read_ptr_dcd[41] = read_ptr[5:0] == 6'd41;
  assign read_ptr_dcd[42] = read_ptr[5:0] == 6'd42;
  assign read_ptr_dcd[43] = read_ptr[5:0] == 6'd43;
  assign read_ptr_dcd[44] = read_ptr[5:0] == 6'd44;
  assign read_ptr_dcd[45] = read_ptr[5:0] == 6'd45;
  assign read_ptr_dcd[46] = read_ptr[5:0] == 6'd46;
  assign read_ptr_dcd[47] = read_ptr[5:0] == 6'd47;
  assign read_ptr_dcd[48] = read_ptr[5:0] == 6'd48;
  assign read_ptr_dcd[49] = read_ptr[5:0] == 6'd49;
  assign read_ptr_dcd[50] = read_ptr[5:0] == 6'd50;
  assign read_ptr_dcd[51] = read_ptr[5:0] == 6'd51;
  assign read_ptr_dcd[52] = read_ptr[5:0] == 6'd52;
  assign read_ptr_dcd[53] = read_ptr[5:0] == 6'd53;
  assign read_ptr_dcd[54] = read_ptr[5:0] == 6'd54;
  assign read_ptr_dcd[55] = read_ptr[5:0] == 6'd55;
  assign read_ptr_dcd[56] = read_ptr[5:0] == 6'd56;
  assign read_ptr_dcd[57] = read_ptr[5:0] == 6'd57;
  assign read_ptr_dcd[58] = read_ptr[5:0] == 6'd58;
  assign read_ptr_dcd[59] = read_ptr[5:0] == 6'd59;
  assign read_ptr_dcd[60] = read_ptr[5:0] == 6'd60;
  assign read_ptr_dcd[61] = read_ptr[5:0] == 6'd61;
  assign read_ptr_dcd[62] = read_ptr[5:0] == 6'd62;
  assign read_ptr_dcd[63] = read_ptr[5:0] == 6'd63;

  assign bank_isu_iq_array_rob_id_rdata[2:0] = {3{read_ptr_dcd[0]}} & bank_isu_iq_entry00_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[1]}} & bank_isu_iq_entry01_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[2]}} & bank_isu_iq_entry02_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[3]}} & bank_isu_iq_entry03_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[4]}} & bank_isu_iq_entry04_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[5]}} & bank_isu_iq_entry05_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[6]}} & bank_isu_iq_entry06_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[7]}} & bank_isu_iq_entry07_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[8]}} & bank_isu_iq_entry08_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[9]}} & bank_isu_iq_entry09_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[10]}} & bank_isu_iq_entry10_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[11]}} & bank_isu_iq_entry11_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[12]}} & bank_isu_iq_entry12_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[13]}} & bank_isu_iq_entry13_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[14]}} & bank_isu_iq_entry14_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[15]}} & bank_isu_iq_entry15_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[16]}} & bank_isu_iq_entry16_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[17]}} & bank_isu_iq_entry17_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[18]}} & bank_isu_iq_entry18_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[19]}} & bank_isu_iq_entry19_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[20]}} & bank_isu_iq_entry20_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[21]}} & bank_isu_iq_entry21_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[22]}} & bank_isu_iq_entry22_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[23]}} & bank_isu_iq_entry23_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[24]}} & bank_isu_iq_entry24_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[25]}} & bank_isu_iq_entry25_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[26]}} & bank_isu_iq_entry26_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[27]}} & bank_isu_iq_entry27_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[28]}} & bank_isu_iq_entry28_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[29]}} & bank_isu_iq_entry29_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[30]}} & bank_isu_iq_entry30_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[31]}} & bank_isu_iq_entry31_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[32]}} & bank_isu_iq_entry32_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[33]}} & bank_isu_iq_entry33_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[34]}} & bank_isu_iq_entry34_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[35]}} & bank_isu_iq_entry35_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[36]}} & bank_isu_iq_entry36_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[37]}} & bank_isu_iq_entry37_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[38]}} & bank_isu_iq_entry38_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[39]}} & bank_isu_iq_entry39_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[40]}} & bank_isu_iq_entry40_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[41]}} & bank_isu_iq_entry41_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[42]}} & bank_isu_iq_entry42_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[43]}} & bank_isu_iq_entry43_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[44]}} & bank_isu_iq_entry44_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[45]}} & bank_isu_iq_entry45_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[46]}} & bank_isu_iq_entry46_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[47]}} & bank_isu_iq_entry47_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[48]}} & bank_isu_iq_entry48_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[49]}} & bank_isu_iq_entry49_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[50]}} & bank_isu_iq_entry50_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[51]}} & bank_isu_iq_entry51_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[52]}} & bank_isu_iq_entry52_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[53]}} & bank_isu_iq_entry53_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[54]}} & bank_isu_iq_entry54_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[55]}} & bank_isu_iq_entry55_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[56]}} & bank_isu_iq_entry56_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[57]}} & bank_isu_iq_entry57_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[58]}} & bank_isu_iq_entry58_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[59]}} & bank_isu_iq_entry59_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[60]}} & bank_isu_iq_entry60_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[61]}} & bank_isu_iq_entry61_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[62]}} & bank_isu_iq_entry62_rob_id_Q[2:0]
                                             | {3{read_ptr_dcd[63]}} & bank_isu_iq_entry63_rob_id_Q[2:0];

  assign bank_isu_iq_array_ch_id_rdata[1:0] = {2{read_ptr_dcd[0]}} & bank_isu_iq_entry00_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[1]}} & bank_isu_iq_entry01_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[2]}} & bank_isu_iq_entry02_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[3]}} & bank_isu_iq_entry03_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[4]}} & bank_isu_iq_entry04_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[5]}} & bank_isu_iq_entry05_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[6]}} & bank_isu_iq_entry06_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[7]}} & bank_isu_iq_entry07_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[8]}} & bank_isu_iq_entry08_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[9]}} & bank_isu_iq_entry09_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[10]}} & bank_isu_iq_entry10_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[11]}} & bank_isu_iq_entry11_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[12]}} & bank_isu_iq_entry12_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[13]}} & bank_isu_iq_entry13_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[14]}} & bank_isu_iq_entry14_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[15]}} & bank_isu_iq_entry15_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[16]}} & bank_isu_iq_entry16_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[17]}} & bank_isu_iq_entry17_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[18]}} & bank_isu_iq_entry18_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[19]}} & bank_isu_iq_entry19_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[20]}} & bank_isu_iq_entry20_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[21]}} & bank_isu_iq_entry21_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[22]}} & bank_isu_iq_entry22_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[23]}} & bank_isu_iq_entry23_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[24]}} & bank_isu_iq_entry24_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[25]}} & bank_isu_iq_entry25_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[26]}} & bank_isu_iq_entry26_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[27]}} & bank_isu_iq_entry27_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[28]}} & bank_isu_iq_entry28_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[29]}} & bank_isu_iq_entry29_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[30]}} & bank_isu_iq_entry30_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[31]}} & bank_isu_iq_entry31_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[32]}} & bank_isu_iq_entry32_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[33]}} & bank_isu_iq_entry33_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[34]}} & bank_isu_iq_entry34_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[35]}} & bank_isu_iq_entry35_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[36]}} & bank_isu_iq_entry36_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[37]}} & bank_isu_iq_entry37_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[38]}} & bank_isu_iq_entry38_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[39]}} & bank_isu_iq_entry39_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[40]}} & bank_isu_iq_entry40_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[41]}} & bank_isu_iq_entry41_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[42]}} & bank_isu_iq_entry42_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[43]}} & bank_isu_iq_entry43_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[44]}} & bank_isu_iq_entry44_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[45]}} & bank_isu_iq_entry45_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[46]}} & bank_isu_iq_entry46_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[47]}} & bank_isu_iq_entry47_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[48]}} & bank_isu_iq_entry48_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[49]}} & bank_isu_iq_entry49_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[50]}} & bank_isu_iq_entry50_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[51]}} & bank_isu_iq_entry51_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[52]}} & bank_isu_iq_entry52_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[53]}} & bank_isu_iq_entry53_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[54]}} & bank_isu_iq_entry54_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[55]}} & bank_isu_iq_entry55_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[56]}} & bank_isu_iq_entry56_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[57]}} & bank_isu_iq_entry57_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[58]}} & bank_isu_iq_entry58_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[59]}} & bank_isu_iq_entry59_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[60]}} & bank_isu_iq_entry60_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[61]}} & bank_isu_iq_entry61_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[62]}} & bank_isu_iq_entry62_ch_id_Q[1:0]
                                            | {2{read_ptr_dcd[63]}} & bank_isu_iq_entry63_ch_id_Q[1:0];

  assign bank_isu_iq_array_op_is_write_rdata = read_ptr_dcd[0] & bank_isu_iq_entry00_op_is_write_Q
                                             | read_ptr_dcd[1] & bank_isu_iq_entry01_op_is_write_Q
                                             | read_ptr_dcd[2] & bank_isu_iq_entry02_op_is_write_Q
                                             | read_ptr_dcd[3] & bank_isu_iq_entry03_op_is_write_Q
                                             | read_ptr_dcd[4] & bank_isu_iq_entry04_op_is_write_Q
                                             | read_ptr_dcd[5] & bank_isu_iq_entry05_op_is_write_Q
                                             | read_ptr_dcd[6] & bank_isu_iq_entry06_op_is_write_Q
                                             | read_ptr_dcd[7] & bank_isu_iq_entry07_op_is_write_Q
                                             | read_ptr_dcd[8] & bank_isu_iq_entry08_op_is_write_Q
                                             | read_ptr_dcd[9] & bank_isu_iq_entry09_op_is_write_Q
                                             | read_ptr_dcd[10] & bank_isu_iq_entry10_op_is_write_Q
                                             | read_ptr_dcd[11] & bank_isu_iq_entry11_op_is_write_Q
                                             | read_ptr_dcd[12] & bank_isu_iq_entry12_op_is_write_Q
                                             | read_ptr_dcd[13] & bank_isu_iq_entry13_op_is_write_Q
                                             | read_ptr_dcd[14] & bank_isu_iq_entry14_op_is_write_Q
                                             | read_ptr_dcd[15] & bank_isu_iq_entry15_op_is_write_Q
                                             | read_ptr_dcd[16] & bank_isu_iq_entry16_op_is_write_Q
                                             | read_ptr_dcd[17] & bank_isu_iq_entry17_op_is_write_Q
                                             | read_ptr_dcd[18] & bank_isu_iq_entry18_op_is_write_Q
                                             | read_ptr_dcd[19] & bank_isu_iq_entry19_op_is_write_Q
                                             | read_ptr_dcd[20] & bank_isu_iq_entry20_op_is_write_Q
                                             | read_ptr_dcd[21] & bank_isu_iq_entry21_op_is_write_Q
                                             | read_ptr_dcd[22] & bank_isu_iq_entry22_op_is_write_Q
                                             | read_ptr_dcd[23] & bank_isu_iq_entry23_op_is_write_Q
                                             | read_ptr_dcd[24] & bank_isu_iq_entry24_op_is_write_Q
                                             | read_ptr_dcd[25] & bank_isu_iq_entry25_op_is_write_Q
                                             | read_ptr_dcd[26] & bank_isu_iq_entry26_op_is_write_Q
                                             | read_ptr_dcd[27] & bank_isu_iq_entry27_op_is_write_Q
                                             | read_ptr_dcd[28] & bank_isu_iq_entry28_op_is_write_Q
                                             | read_ptr_dcd[29] & bank_isu_iq_entry29_op_is_write_Q
                                             | read_ptr_dcd[30] & bank_isu_iq_entry30_op_is_write_Q
                                             | read_ptr_dcd[31] & bank_isu_iq_entry31_op_is_write_Q
                                             | read_ptr_dcd[32] & bank_isu_iq_entry32_op_is_write_Q
                                             | read_ptr_dcd[33] & bank_isu_iq_entry33_op_is_write_Q
                                             | read_ptr_dcd[34] & bank_isu_iq_entry34_op_is_write_Q
                                             | read_ptr_dcd[35] & bank_isu_iq_entry35_op_is_write_Q
                                             | read_ptr_dcd[36] & bank_isu_iq_entry36_op_is_write_Q
                                             | read_ptr_dcd[37] & bank_isu_iq_entry37_op_is_write_Q
                                             | read_ptr_dcd[38] & bank_isu_iq_entry38_op_is_write_Q
                                             | read_ptr_dcd[39] & bank_isu_iq_entry39_op_is_write_Q
                                             | read_ptr_dcd[40] & bank_isu_iq_entry40_op_is_write_Q
                                             | read_ptr_dcd[41] & bank_isu_iq_entry41_op_is_write_Q
                                             | read_ptr_dcd[42] & bank_isu_iq_entry42_op_is_write_Q
                                             | read_ptr_dcd[43] & bank_isu_iq_entry43_op_is_write_Q
                                             | read_ptr_dcd[44] & bank_isu_iq_entry44_op_is_write_Q
                                             | read_ptr_dcd[45] & bank_isu_iq_entry45_op_is_write_Q
                                             | read_ptr_dcd[46] & bank_isu_iq_entry46_op_is_write_Q
                                             | read_ptr_dcd[47] & bank_isu_iq_entry47_op_is_write_Q
                                             | read_ptr_dcd[48] & bank_isu_iq_entry48_op_is_write_Q
                                             | read_ptr_dcd[49] & bank_isu_iq_entry49_op_is_write_Q
                                             | read_ptr_dcd[50] & bank_isu_iq_entry50_op_is_write_Q
                                             | read_ptr_dcd[51] & bank_isu_iq_entry51_op_is_write_Q
                                             | read_ptr_dcd[52] & bank_isu_iq_entry52_op_is_write_Q
                                             | read_ptr_dcd[53] & bank_isu_iq_entry53_op_is_write_Q
                                             | read_ptr_dcd[54] & bank_isu_iq_entry54_op_is_write_Q
                                             | read_ptr_dcd[55] & bank_isu_iq_entry55_op_is_write_Q
                                             | read_ptr_dcd[56] & bank_isu_iq_entry56_op_is_write_Q
                                             | read_ptr_dcd[57] & bank_isu_iq_entry57_op_is_write_Q
                                             | read_ptr_dcd[58] & bank_isu_iq_entry58_op_is_write_Q
                                             | read_ptr_dcd[59] & bank_isu_iq_entry59_op_is_write_Q
                                             | read_ptr_dcd[60] & bank_isu_iq_entry60_op_is_write_Q
                                             | read_ptr_dcd[61] & bank_isu_iq_entry61_op_is_write_Q
                                             | read_ptr_dcd[62] & bank_isu_iq_entry62_op_is_write_Q
                                             | read_ptr_dcd[63] & bank_isu_iq_entry63_op_is_write_Q;

  assign bank_isu_iq_array_op_need_linefill_rdata = read_ptr_dcd[0] & bank_isu_iq_entry00_op_need_linefill_Q
                                                  | read_ptr_dcd[1] & bank_isu_iq_entry01_op_need_linefill_Q
                                                  | read_ptr_dcd[2] & bank_isu_iq_entry02_op_need_linefill_Q
                                                  | read_ptr_dcd[3] & bank_isu_iq_entry03_op_need_linefill_Q
                                                  | read_ptr_dcd[4] & bank_isu_iq_entry04_op_need_linefill_Q
                                                  | read_ptr_dcd[5] & bank_isu_iq_entry05_op_need_linefill_Q
                                                  | read_ptr_dcd[6] & bank_isu_iq_entry06_op_need_linefill_Q
                                                  | read_ptr_dcd[7] & bank_isu_iq_entry07_op_need_linefill_Q
                                                  | read_ptr_dcd[8] & bank_isu_iq_entry08_op_need_linefill_Q
                                                  | read_ptr_dcd[9] & bank_isu_iq_entry09_op_need_linefill_Q
                                                  | read_ptr_dcd[10] & bank_isu_iq_entry10_op_need_linefill_Q
                                                  | read_ptr_dcd[11] & bank_isu_iq_entry11_op_need_linefill_Q
                                                  | read_ptr_dcd[12] & bank_isu_iq_entry12_op_need_linefill_Q
                                                  | read_ptr_dcd[13] & bank_isu_iq_entry13_op_need_linefill_Q
                                                  | read_ptr_dcd[14] & bank_isu_iq_entry14_op_need_linefill_Q
                                                  | read_ptr_dcd[15] & bank_isu_iq_entry15_op_need_linefill_Q
                                                  | read_ptr_dcd[16] & bank_isu_iq_entry16_op_need_linefill_Q
                                                  | read_ptr_dcd[17] & bank_isu_iq_entry17_op_need_linefill_Q
                                                  | read_ptr_dcd[18] & bank_isu_iq_entry18_op_need_linefill_Q
                                                  | read_ptr_dcd[19] & bank_isu_iq_entry19_op_need_linefill_Q
                                                  | read_ptr_dcd[20] & bank_isu_iq_entry20_op_need_linefill_Q
                                                  | read_ptr_dcd[21] & bank_isu_iq_entry21_op_need_linefill_Q
                                                  | read_ptr_dcd[22] & bank_isu_iq_entry22_op_need_linefill_Q
                                                  | read_ptr_dcd[23] & bank_isu_iq_entry23_op_need_linefill_Q
                                                  | read_ptr_dcd[24] & bank_isu_iq_entry24_op_need_linefill_Q
                                                  | read_ptr_dcd[25] & bank_isu_iq_entry25_op_need_linefill_Q
                                                  | read_ptr_dcd[26] & bank_isu_iq_entry26_op_need_linefill_Q
                                                  | read_ptr_dcd[27] & bank_isu_iq_entry27_op_need_linefill_Q
                                                  | read_ptr_dcd[28] & bank_isu_iq_entry28_op_need_linefill_Q
                                                  | read_ptr_dcd[29] & bank_isu_iq_entry29_op_need_linefill_Q
                                                  | read_ptr_dcd[30] & bank_isu_iq_entry30_op_need_linefill_Q
                                                  | read_ptr_dcd[31] & bank_isu_iq_entry31_op_need_linefill_Q
                                                  | read_ptr_dcd[32] & bank_isu_iq_entry32_op_need_linefill_Q
                                                  | read_ptr_dcd[33] & bank_isu_iq_entry33_op_need_linefill_Q
                                                  | read_ptr_dcd[34] & bank_isu_iq_entry34_op_need_linefill_Q
                                                  | read_ptr_dcd[35] & bank_isu_iq_entry35_op_need_linefill_Q
                                                  | read_ptr_dcd[36] & bank_isu_iq_entry36_op_need_linefill_Q
                                                  | read_ptr_dcd[37] & bank_isu_iq_entry37_op_need_linefill_Q
                                                  | read_ptr_dcd[38] & bank_isu_iq_entry38_op_need_linefill_Q
                                                  | read_ptr_dcd[39] & bank_isu_iq_entry39_op_need_linefill_Q
                                                  | read_ptr_dcd[40] & bank_isu_iq_entry40_op_need_linefill_Q
                                                  | read_ptr_dcd[41] & bank_isu_iq_entry41_op_need_linefill_Q
                                                  | read_ptr_dcd[42] & bank_isu_iq_entry42_op_need_linefill_Q
                                                  | read_ptr_dcd[43] & bank_isu_iq_entry43_op_need_linefill_Q
                                                  | read_ptr_dcd[44] & bank_isu_iq_entry44_op_need_linefill_Q
                                                  | read_ptr_dcd[45] & bank_isu_iq_entry45_op_need_linefill_Q
                                                  | read_ptr_dcd[46] & bank_isu_iq_entry46_op_need_linefill_Q
                                                  | read_ptr_dcd[47] & bank_isu_iq_entry47_op_need_linefill_Q
                                                  | read_ptr_dcd[48] & bank_isu_iq_entry48_op_need_linefill_Q
                                                  | read_ptr_dcd[49] & bank_isu_iq_entry49_op_need_linefill_Q
                                                  | read_ptr_dcd[50] & bank_isu_iq_entry50_op_need_linefill_Q
                                                  | read_ptr_dcd[51] & bank_isu_iq_entry51_op_need_linefill_Q
                                                  | read_ptr_dcd[52] & bank_isu_iq_entry52_op_need_linefill_Q
                                                  | read_ptr_dcd[53] & bank_isu_iq_entry53_op_need_linefill_Q
                                                  | read_ptr_dcd[54] & bank_isu_iq_entry54_op_need_linefill_Q
                                                  | read_ptr_dcd[55] & bank_isu_iq_entry55_op_need_linefill_Q
                                                  | read_ptr_dcd[56] & bank_isu_iq_entry56_op_need_linefill_Q
                                                  | read_ptr_dcd[57] & bank_isu_iq_entry57_op_need_linefill_Q
                                                  | read_ptr_dcd[58] & bank_isu_iq_entry58_op_need_linefill_Q
                                                  | read_ptr_dcd[59] & bank_isu_iq_entry59_op_need_linefill_Q
                                                  | read_ptr_dcd[60] & bank_isu_iq_entry60_op_need_linefill_Q
                                                  | read_ptr_dcd[61] & bank_isu_iq_entry61_op_need_linefill_Q
                                                  | read_ptr_dcd[62] & bank_isu_iq_entry62_op_need_linefill_Q
                                                  | read_ptr_dcd[63] & bank_isu_iq_entry63_op_need_linefill_Q;

  assign bank_isu_iq_array_set_way_offset_rdata[6:0] = {7{read_ptr_dcd[0]}} & bank_isu_iq_entry00_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[1]}} & bank_isu_iq_entry01_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[2]}} & bank_isu_iq_entry02_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[3]}} & bank_isu_iq_entry03_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[4]}} & bank_isu_iq_entry04_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[5]}} & bank_isu_iq_entry05_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[6]}} & bank_isu_iq_entry06_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[7]}} & bank_isu_iq_entry07_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[8]}} & bank_isu_iq_entry08_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[9]}} & bank_isu_iq_entry09_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[10]}} & bank_isu_iq_entry10_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[11]}} & bank_isu_iq_entry11_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[12]}} & bank_isu_iq_entry12_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[13]}} & bank_isu_iq_entry13_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[14]}} & bank_isu_iq_entry14_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[15]}} & bank_isu_iq_entry15_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[16]}} & bank_isu_iq_entry16_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[17]}} & bank_isu_iq_entry17_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[18]}} & bank_isu_iq_entry18_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[19]}} & bank_isu_iq_entry19_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[20]}} & bank_isu_iq_entry20_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[21]}} & bank_isu_iq_entry21_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[22]}} & bank_isu_iq_entry22_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[23]}} & bank_isu_iq_entry23_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[24]}} & bank_isu_iq_entry24_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[25]}} & bank_isu_iq_entry25_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[26]}} & bank_isu_iq_entry26_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[27]}} & bank_isu_iq_entry27_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[28]}} & bank_isu_iq_entry28_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[29]}} & bank_isu_iq_entry29_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[30]}} & bank_isu_iq_entry30_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[31]}} & bank_isu_iq_entry31_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[32]}} & bank_isu_iq_entry32_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[33]}} & bank_isu_iq_entry33_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[34]}} & bank_isu_iq_entry34_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[35]}} & bank_isu_iq_entry35_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[36]}} & bank_isu_iq_entry36_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[37]}} & bank_isu_iq_entry37_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[38]}} & bank_isu_iq_entry38_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[39]}} & bank_isu_iq_entry39_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[40]}} & bank_isu_iq_entry40_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[41]}} & bank_isu_iq_entry41_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[42]}} & bank_isu_iq_entry42_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[43]}} & bank_isu_iq_entry43_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[44]}} & bank_isu_iq_entry44_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[45]}} & bank_isu_iq_entry45_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[46]}} & bank_isu_iq_entry46_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[47]}} & bank_isu_iq_entry47_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[48]}} & bank_isu_iq_entry48_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[49]}} & bank_isu_iq_entry49_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[50]}} & bank_isu_iq_entry50_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[51]}} & bank_isu_iq_entry51_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[52]}} & bank_isu_iq_entry52_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[53]}} & bank_isu_iq_entry53_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[54]}} & bank_isu_iq_entry54_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[55]}} & bank_isu_iq_entry55_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[56]}} & bank_isu_iq_entry56_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[57]}} & bank_isu_iq_entry57_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[58]}} & bank_isu_iq_entry58_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[59]}} & bank_isu_iq_entry59_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[60]}} & bank_isu_iq_entry60_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[61]}} & bank_isu_iq_entry61_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[62]}} & bank_isu_iq_entry62_set_way_offset_Q[6:0]
                                                     | {7{read_ptr_dcd[63]}} & bank_isu_iq_entry63_set_way_offset_Q[6:0];

  assign bank_isu_iq_array_wbuffer_id_rdata[7:0] = {8{read_ptr_dcd[0]}} & bank_isu_iq_entry00_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[1]}} & bank_isu_iq_entry01_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[2]}} & bank_isu_iq_entry02_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[3]}} & bank_isu_iq_entry03_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[4]}} & bank_isu_iq_entry04_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[5]}} & bank_isu_iq_entry05_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[6]}} & bank_isu_iq_entry06_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[7]}} & bank_isu_iq_entry07_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[8]}} & bank_isu_iq_entry08_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[9]}} & bank_isu_iq_entry09_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[10]}} & bank_isu_iq_entry10_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[11]}} & bank_isu_iq_entry11_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[12]}} & bank_isu_iq_entry12_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[13]}} & bank_isu_iq_entry13_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[14]}} & bank_isu_iq_entry14_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[15]}} & bank_isu_iq_entry15_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[16]}} & bank_isu_iq_entry16_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[17]}} & bank_isu_iq_entry17_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[18]}} & bank_isu_iq_entry18_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[19]}} & bank_isu_iq_entry19_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[20]}} & bank_isu_iq_entry20_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[21]}} & bank_isu_iq_entry21_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[22]}} & bank_isu_iq_entry22_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[23]}} & bank_isu_iq_entry23_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[24]}} & bank_isu_iq_entry24_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[25]}} & bank_isu_iq_entry25_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[26]}} & bank_isu_iq_entry26_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[27]}} & bank_isu_iq_entry27_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[28]}} & bank_isu_iq_entry28_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[29]}} & bank_isu_iq_entry29_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[30]}} & bank_isu_iq_entry30_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[31]}} & bank_isu_iq_entry31_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[32]}} & bank_isu_iq_entry32_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[33]}} & bank_isu_iq_entry33_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[34]}} & bank_isu_iq_entry34_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[35]}} & bank_isu_iq_entry35_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[36]}} & bank_isu_iq_entry36_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[37]}} & bank_isu_iq_entry37_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[38]}} & bank_isu_iq_entry38_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[39]}} & bank_isu_iq_entry39_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[40]}} & bank_isu_iq_entry40_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[41]}} & bank_isu_iq_entry41_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[42]}} & bank_isu_iq_entry42_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[43]}} & bank_isu_iq_entry43_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[44]}} & bank_isu_iq_entry44_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[45]}} & bank_isu_iq_entry45_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[46]}} & bank_isu_iq_entry46_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[47]}} & bank_isu_iq_entry47_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[48]}} & bank_isu_iq_entry48_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[49]}} & bank_isu_iq_entry49_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[50]}} & bank_isu_iq_entry50_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[51]}} & bank_isu_iq_entry51_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[52]}} & bank_isu_iq_entry52_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[53]}} & bank_isu_iq_entry53_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[54]}} & bank_isu_iq_entry54_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[55]}} & bank_isu_iq_entry55_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[56]}} & bank_isu_iq_entry56_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[57]}} & bank_isu_iq_entry57_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[58]}} & bank_isu_iq_entry58_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[59]}} & bank_isu_iq_entry59_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[60]}} & bank_isu_iq_entry60_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[61]}} & bank_isu_iq_entry61_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[62]}} & bank_isu_iq_entry62_wbuffer_id_Q[7:0]
                                                 | {8{read_ptr_dcd[63]}} & bank_isu_iq_entry63_wbuffer_id_Q[7:0];

  assign bank_isu_iq_array_cacheline_state_rdata[3:0] = {4{read_ptr_dcd[0]}} & bank_isu_iq_entry00_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[1]}} & bank_isu_iq_entry01_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[2]}} & bank_isu_iq_entry02_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[3]}} & bank_isu_iq_entry03_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[4]}} & bank_isu_iq_entry04_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[5]}} & bank_isu_iq_entry05_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[6]}} & bank_isu_iq_entry06_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[7]}} & bank_isu_iq_entry07_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[8]}} & bank_isu_iq_entry08_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[9]}} & bank_isu_iq_entry09_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[10]}} & bank_isu_iq_entry10_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[11]}} & bank_isu_iq_entry11_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[12]}} & bank_isu_iq_entry12_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[13]}} & bank_isu_iq_entry13_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[14]}} & bank_isu_iq_entry14_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[15]}} & bank_isu_iq_entry15_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[16]}} & bank_isu_iq_entry16_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[17]}} & bank_isu_iq_entry17_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[18]}} & bank_isu_iq_entry18_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[19]}} & bank_isu_iq_entry19_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[20]}} & bank_isu_iq_entry20_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[21]}} & bank_isu_iq_entry21_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[22]}} & bank_isu_iq_entry22_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[23]}} & bank_isu_iq_entry23_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[24]}} & bank_isu_iq_entry24_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[25]}} & bank_isu_iq_entry25_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[26]}} & bank_isu_iq_entry26_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[27]}} & bank_isu_iq_entry27_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[28]}} & bank_isu_iq_entry28_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[29]}} & bank_isu_iq_entry29_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[30]}} & bank_isu_iq_entry30_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[31]}} & bank_isu_iq_entry31_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[32]}} & bank_isu_iq_entry32_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[33]}} & bank_isu_iq_entry33_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[34]}} & bank_isu_iq_entry34_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[35]}} & bank_isu_iq_entry35_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[36]}} & bank_isu_iq_entry36_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[37]}} & bank_isu_iq_entry37_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[38]}} & bank_isu_iq_entry38_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[39]}} & bank_isu_iq_entry39_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[40]}} & bank_isu_iq_entry40_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[41]}} & bank_isu_iq_entry41_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[42]}} & bank_isu_iq_entry42_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[43]}} & bank_isu_iq_entry43_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[44]}} & bank_isu_iq_entry44_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[45]}} & bank_isu_iq_entry45_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[46]}} & bank_isu_iq_entry46_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[47]}} & bank_isu_iq_entry47_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[48]}} & bank_isu_iq_entry48_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[49]}} & bank_isu_iq_entry49_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[50]}} & bank_isu_iq_entry50_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[51]}} & bank_isu_iq_entry51_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[52]}} & bank_isu_iq_entry52_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[53]}} & bank_isu_iq_entry53_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[54]}} & bank_isu_iq_entry54_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[55]}} & bank_isu_iq_entry55_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[56]}} & bank_isu_iq_entry56_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[57]}} & bank_isu_iq_entry57_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[58]}} & bank_isu_iq_entry58_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[59]}} & bank_isu_iq_entry59_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[60]}} & bank_isu_iq_entry60_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[61]}} & bank_isu_iq_entry61_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[62]}} & bank_isu_iq_entry62_cacheline_state_Q[3:0]
                                                      | {4{read_ptr_dcd[63]}} & bank_isu_iq_entry63_cacheline_state_Q[3:0];


//--------------------------------------------------------------------------------
//                              Module instance
//--------------------------------------------------------------------------------
  bank_isu_iq_entry
  bank_isu_iq_entry_entry00 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry00_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry00_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry00_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry00_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry00_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry00_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry00_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry00_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[0]                     ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[0]               ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[0]               ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[0]               )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry01 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry01_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry01_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry01_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry01_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry01_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry01_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry01_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry01_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[1]                     ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[1]               ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[1]               ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[1]               )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry02 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry02_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry02_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry02_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry02_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry02_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry02_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry02_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry02_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[2]                     ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[2]               ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[2]               ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[2]               )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry03 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry03_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry03_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry03_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry03_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry03_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry03_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry03_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry03_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[3]                     ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[3]               ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[3]               ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[3]               )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry04 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry04_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry04_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry04_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry04_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry04_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry04_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry04_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry04_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[4]                     ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[4]               ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[4]               ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[4]               )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry05 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry05_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry05_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry05_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry05_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry05_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry05_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry05_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry05_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[5]                     ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[5]               ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[5]               ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[5]               )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry06 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry06_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry06_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry06_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry06_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry06_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry06_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry06_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry06_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[6]                     ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[6]               ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[6]               ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[6]               )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry07 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry07_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry07_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry07_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry07_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry07_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry07_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry07_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry07_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[7]                     ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[7]               ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[7]               ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[7]               )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry08 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry08_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry08_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry08_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry08_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry08_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry08_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry08_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry08_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[8]                     ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[8]               ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[8]               ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[8]               )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry09 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry09_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry09_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry09_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry09_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry09_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry09_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry09_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry09_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[9]                     ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[9]               ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[9]               ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[9]               )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry10 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry10_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry10_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry10_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry10_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry10_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry10_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry10_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry10_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[10]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[10]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[10]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[10]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry11 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry11_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry11_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry11_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry11_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry11_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry11_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry11_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry11_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[11]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[11]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[11]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[11]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry12 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry12_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry12_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry12_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry12_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry12_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry12_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry12_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry12_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[12]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[12]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[12]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[12]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry13 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry13_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry13_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry13_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry13_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry13_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry13_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry13_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry13_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[13]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[13]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[13]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[13]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry14 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry14_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry14_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry14_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry14_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry14_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry14_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry14_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry14_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[14]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[14]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[14]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[14]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry15 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry15_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry15_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry15_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry15_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry15_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry15_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry15_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry15_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[15]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[15]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[15]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[15]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry16 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry16_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry16_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry16_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry16_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry16_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry16_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry16_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry16_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[16]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[16]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[16]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[16]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry17 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry17_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry17_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry17_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry17_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry17_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry17_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry17_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry17_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[17]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[17]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[17]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[17]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry18 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry18_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry18_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry18_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry18_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry18_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry18_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry18_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry18_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[18]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[18]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[18]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[18]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry19 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry19_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry19_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry19_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry19_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry19_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry19_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry19_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry19_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[19]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[19]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[19]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[19]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry20 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry20_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry20_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry20_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry20_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry20_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry20_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry20_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry20_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[20]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[20]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[20]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[20]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry21 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry21_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry21_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry21_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry21_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry21_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry21_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry21_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry21_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[21]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[21]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[21]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[21]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry22 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry22_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry22_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry22_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry22_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry22_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry22_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry22_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry22_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[22]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[22]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[22]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[22]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry23 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry23_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry23_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry23_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry23_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry23_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry23_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry23_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry23_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[23]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[23]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[23]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[23]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry24 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry24_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry24_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry24_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry24_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry24_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry24_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry24_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry24_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[24]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[24]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[24]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[24]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry25 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry25_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry25_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry25_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry25_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry25_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry25_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry25_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry25_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[25]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[25]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[25]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[25]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry26 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry26_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry26_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry26_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry26_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry26_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry26_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry26_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry26_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[26]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[26]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[26]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[26]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry27 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry27_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry27_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry27_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry27_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry27_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry27_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry27_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry27_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[27]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[27]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[27]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[27]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry28 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry28_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry28_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry28_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry28_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry28_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry28_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry28_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry28_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[28]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[28]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[28]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[28]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry29 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry29_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry29_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry29_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry29_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry29_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry29_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry29_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry29_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[29]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[29]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[29]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[29]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry30 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry30_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry30_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry30_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry30_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry30_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry30_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry30_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry30_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[30]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[30]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[30]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[30]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry31 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry31_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry31_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry31_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry31_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry31_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry31_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry31_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry31_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[31]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[31]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[31]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[31]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry32 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry32_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry32_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry32_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry32_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry32_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry32_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry32_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry32_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[32]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[32]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[32]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[32]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry33 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry33_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry33_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry33_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry33_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry33_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry33_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry33_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry33_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[33]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[33]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[33]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[33]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry34 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry34_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry34_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry34_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry34_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry34_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry34_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry34_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry34_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[34]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[34]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[34]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[34]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry35 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry35_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry35_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry35_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry35_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry35_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry35_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry35_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry35_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[35]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[35]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[35]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[35]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry36 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry36_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry36_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry36_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry36_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry36_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry36_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry36_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry36_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[36]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[36]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[36]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[36]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry37 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry37_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry37_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry37_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry37_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry37_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry37_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry37_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry37_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[37]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[37]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[37]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[37]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry38 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry38_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry38_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry38_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry38_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry38_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry38_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry38_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry38_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[38]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[38]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[38]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[38]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry39 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry39_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry39_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry39_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry39_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry39_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry39_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry39_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry39_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[39]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[39]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[39]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[39]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry40 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry40_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry40_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry40_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry40_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry40_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry40_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry40_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry40_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[40]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[40]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[40]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[40]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry41 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry41_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry41_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry41_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry41_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry41_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry41_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry41_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry41_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[41]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[41]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[41]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[41]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry42 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry42_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry42_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry42_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry42_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry42_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry42_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry42_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry42_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[42]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[42]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[42]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[42]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry43 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry43_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry43_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry43_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry43_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry43_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry43_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry43_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry43_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[43]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[43]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[43]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[43]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry44 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry44_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry44_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry44_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry44_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry44_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry44_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry44_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry44_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[44]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[44]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[44]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[44]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry45 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry45_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry45_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry45_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry45_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry45_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry45_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry45_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry45_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[45]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[45]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[45]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[45]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry46 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry46_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry46_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry46_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry46_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry46_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry46_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry46_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry46_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[46]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[46]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[46]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[46]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry47 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry47_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry47_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry47_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry47_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry47_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry47_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry47_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry47_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[47]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[47]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[47]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[47]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry48 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry48_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry48_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry48_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry48_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry48_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry48_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry48_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry48_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[48]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[48]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[48]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[48]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry49 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry49_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry49_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry49_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry49_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry49_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry49_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry49_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry49_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[49]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[49]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[49]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[49]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry50 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry50_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry50_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry50_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry50_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry50_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry50_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry50_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry50_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[50]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[50]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[50]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[50]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry51 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry51_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry51_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry51_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry51_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry51_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry51_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry51_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry51_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[51]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[51]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[51]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[51]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry52 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry52_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry52_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry52_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry52_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry52_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry52_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry52_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry52_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[52]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[52]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[52]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[52]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry53 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry53_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry53_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry53_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry53_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry53_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry53_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry53_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry53_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[53]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[53]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[53]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[53]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry54 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry54_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry54_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry54_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry54_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry54_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry54_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry54_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry54_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[54]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[54]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[54]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[54]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry55 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry55_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry55_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry55_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry55_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry55_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry55_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry55_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry55_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[55]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[55]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[55]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[55]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry56 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry56_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry56_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry56_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry56_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry56_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry56_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry56_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry56_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[56]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[56]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[56]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[56]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry57 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry57_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry57_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry57_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry57_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry57_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry57_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry57_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry57_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[57]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[57]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[57]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[57]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry58 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry58_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry58_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry58_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry58_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry58_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry58_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry58_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry58_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[58]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[58]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[58]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[58]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry59 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry59_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry59_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry59_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry59_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry59_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry59_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry59_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry59_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[59]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[59]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[59]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[59]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry60 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry60_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry60_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry60_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry60_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry60_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry60_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry60_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry60_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[60]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[60]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[60]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[60]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry61 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry61_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry61_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry61_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry61_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry61_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry61_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry61_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry61_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[61]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[61]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[61]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[61]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry62 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry62_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry62_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry62_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry62_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry62_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry62_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry62_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry62_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[62]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[62]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[62]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[62]              )
  );

  bank_isu_iq_entry
  bank_isu_iq_entry_entry63 (
    .clk                 (clk                                       ),
    .wen                 (bank_isu_iq_entry_entry63_wen             ),
    .biu_rid_In          (biu_rid_In[5:0]                           ),
    .rob_id_In           (bank_isu_iq_array_rob_id_In[2:0]          ),
    .ch_id_In            (bank_isu_iq_array_ch_id_In[1:0]           ),
    .op_is_write_In      (bank_isu_iq_array_op_is_write_In          ),
    .op_need_linefill_In (bank_isu_iq_array_op_need_linefill_In     ),
    .set_way_offset_In   (bank_isu_iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In       (bank_isu_iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In  (bank_isu_iq_array_cacheline_state_In[3:0] ),
    .rob_id_Q            (bank_isu_iq_entry63_rob_id_Q[2:0]         ),
    .ch_id_Q             (bank_isu_iq_entry63_ch_id_Q[1:0]          ),
    .op_is_write_Q       (bank_isu_iq_entry63_op_is_write_Q         ),
    .op_need_linefill_Q  (bank_isu_iq_entry63_op_need_linefill_Q    ),
    .set_way_offset_Q    (bank_isu_iq_entry63_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q        (bank_isu_iq_entry63_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q   (bank_isu_iq_entry63_cacheline_state_Q[3:0]),
    .biu_id_match        (biu_id_match_array[63]                    ),
    .entry_req_from_ch0  (entry_req_from_ch0_array[63]              ),
    .entry_req_from_ch1  (entry_req_from_ch1_array[63]              ),
    .entry_req_from_ch2  (entry_req_from_ch2_array[63]              )
  );

endmodule
