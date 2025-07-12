// This RTL code is generate by RTL generator, please do not modify!
module iq_array (
  input  wire                        clk,
  input  wire                        rst,
  input  wire                        biu_rvalid_In,
  input  wire        [5:0]           biu_rid_In,
  input  wire        [5:0]           read_ptr,
  input  wire                        validate,
  input  wire        [5:0]           validate_ptr,
  input  wire                        inValidate,
  input  wire        [5:0]           inValidate_ptr,
  input  wire                        cacheline_inflight_In,
  input  wire                        iq_array_op_need_evit_In,
  input  wire        [2:0]           iq_array_rob_id_In,
  input  wire        [1:0]           iq_array_ch_id_In,
  input  wire                        iq_array_op_is_write_In,
  input  wire                        iq_array_op_need_linefill_In,
  input  wire        [6:0]           iq_array_set_way_offset_In,
  input  wire        [7:0]           iq_array_wbuffer_id_In,
  input  wire        [3:0]           iq_array_cacheline_state_In,
  output wire        [63:0]          iq_valid_array_Q,
  output wire        [2:0]           iq_array_rob_id_rdata,
  output wire        [1:0]           iq_array_ch_id_rdata,
  output wire                        iq_array_op_is_write_rdata,
  output wire                        iq_array_op_need_linefill_rdata,
  output wire        [6:0]           iq_array_set_way_offset_rdata,
  output wire        [7:0]           iq_array_wbuffer_id_rdata,
  output wire        [3:0]           iq_array_cacheline_state_rdata,
  output wire                        iq_array_need_evit_rdata,
  output wire        [63:0]          mshr_allow_array_Q,
  output wire        [63:0]          iq_need_evit_array_Q,
  output wire        [63:0]          entry_req_from_ch0_array,
  output wire        [63:0]          entry_req_from_ch1_array,
  output wire        [63:0]          entry_req_from_ch2_array
);

//--------------------------------------------------------------------------------
//                              Wire declaration
//--------------------------------------------------------------------------------
  wire        [2:0]           iq_entry00_rob_id_Q;
  wire        [2:0]           iq_entry01_rob_id_Q;
  wire        [2:0]           iq_entry02_rob_id_Q;
  wire        [2:0]           iq_entry03_rob_id_Q;
  wire        [2:0]           iq_entry04_rob_id_Q;
  wire        [2:0]           iq_entry05_rob_id_Q;
  wire        [2:0]           iq_entry06_rob_id_Q;
  wire        [2:0]           iq_entry07_rob_id_Q;
  wire        [2:0]           iq_entry08_rob_id_Q;
  wire        [2:0]           iq_entry09_rob_id_Q;
  wire        [2:0]           iq_entry10_rob_id_Q;
  wire        [2:0]           iq_entry11_rob_id_Q;
  wire        [2:0]           iq_entry12_rob_id_Q;
  wire        [2:0]           iq_entry13_rob_id_Q;
  wire        [2:0]           iq_entry14_rob_id_Q;
  wire        [2:0]           iq_entry15_rob_id_Q;
  wire        [2:0]           iq_entry16_rob_id_Q;
  wire        [2:0]           iq_entry17_rob_id_Q;
  wire        [2:0]           iq_entry18_rob_id_Q;
  wire        [2:0]           iq_entry19_rob_id_Q;
  wire        [2:0]           iq_entry20_rob_id_Q;
  wire        [2:0]           iq_entry21_rob_id_Q;
  wire        [2:0]           iq_entry22_rob_id_Q;
  wire        [2:0]           iq_entry23_rob_id_Q;
  wire        [2:0]           iq_entry24_rob_id_Q;
  wire        [2:0]           iq_entry25_rob_id_Q;
  wire        [2:0]           iq_entry26_rob_id_Q;
  wire        [2:0]           iq_entry27_rob_id_Q;
  wire        [2:0]           iq_entry28_rob_id_Q;
  wire        [2:0]           iq_entry29_rob_id_Q;
  wire        [2:0]           iq_entry30_rob_id_Q;
  wire        [2:0]           iq_entry31_rob_id_Q;
  wire        [2:0]           iq_entry32_rob_id_Q;
  wire        [2:0]           iq_entry33_rob_id_Q;
  wire        [2:0]           iq_entry34_rob_id_Q;
  wire        [2:0]           iq_entry35_rob_id_Q;
  wire        [2:0]           iq_entry36_rob_id_Q;
  wire        [2:0]           iq_entry37_rob_id_Q;
  wire        [2:0]           iq_entry38_rob_id_Q;
  wire        [2:0]           iq_entry39_rob_id_Q;
  wire        [2:0]           iq_entry40_rob_id_Q;
  wire        [2:0]           iq_entry41_rob_id_Q;
  wire        [2:0]           iq_entry42_rob_id_Q;
  wire        [2:0]           iq_entry43_rob_id_Q;
  wire        [2:0]           iq_entry44_rob_id_Q;
  wire        [2:0]           iq_entry45_rob_id_Q;
  wire        [2:0]           iq_entry46_rob_id_Q;
  wire        [2:0]           iq_entry47_rob_id_Q;
  wire        [2:0]           iq_entry48_rob_id_Q;
  wire        [2:0]           iq_entry49_rob_id_Q;
  wire        [2:0]           iq_entry50_rob_id_Q;
  wire        [2:0]           iq_entry51_rob_id_Q;
  wire        [2:0]           iq_entry52_rob_id_Q;
  wire        [2:0]           iq_entry53_rob_id_Q;
  wire        [2:0]           iq_entry54_rob_id_Q;
  wire        [2:0]           iq_entry55_rob_id_Q;
  wire        [2:0]           iq_entry56_rob_id_Q;
  wire        [2:0]           iq_entry57_rob_id_Q;
  wire        [2:0]           iq_entry58_rob_id_Q;
  wire        [2:0]           iq_entry59_rob_id_Q;
  wire        [2:0]           iq_entry60_rob_id_Q;
  wire        [2:0]           iq_entry61_rob_id_Q;
  wire        [2:0]           iq_entry62_rob_id_Q;
  wire        [2:0]           iq_entry63_rob_id_Q;
  wire        [1:0]           iq_entry00_ch_id_Q;
  wire        [1:0]           iq_entry01_ch_id_Q;
  wire        [1:0]           iq_entry02_ch_id_Q;
  wire        [1:0]           iq_entry03_ch_id_Q;
  wire        [1:0]           iq_entry04_ch_id_Q;
  wire        [1:0]           iq_entry05_ch_id_Q;
  wire        [1:0]           iq_entry06_ch_id_Q;
  wire        [1:0]           iq_entry07_ch_id_Q;
  wire        [1:0]           iq_entry08_ch_id_Q;
  wire        [1:0]           iq_entry09_ch_id_Q;
  wire        [1:0]           iq_entry10_ch_id_Q;
  wire        [1:0]           iq_entry11_ch_id_Q;
  wire        [1:0]           iq_entry12_ch_id_Q;
  wire        [1:0]           iq_entry13_ch_id_Q;
  wire        [1:0]           iq_entry14_ch_id_Q;
  wire        [1:0]           iq_entry15_ch_id_Q;
  wire        [1:0]           iq_entry16_ch_id_Q;
  wire        [1:0]           iq_entry17_ch_id_Q;
  wire        [1:0]           iq_entry18_ch_id_Q;
  wire        [1:0]           iq_entry19_ch_id_Q;
  wire        [1:0]           iq_entry20_ch_id_Q;
  wire        [1:0]           iq_entry21_ch_id_Q;
  wire        [1:0]           iq_entry22_ch_id_Q;
  wire        [1:0]           iq_entry23_ch_id_Q;
  wire        [1:0]           iq_entry24_ch_id_Q;
  wire        [1:0]           iq_entry25_ch_id_Q;
  wire        [1:0]           iq_entry26_ch_id_Q;
  wire        [1:0]           iq_entry27_ch_id_Q;
  wire        [1:0]           iq_entry28_ch_id_Q;
  wire        [1:0]           iq_entry29_ch_id_Q;
  wire        [1:0]           iq_entry30_ch_id_Q;
  wire        [1:0]           iq_entry31_ch_id_Q;
  wire        [1:0]           iq_entry32_ch_id_Q;
  wire        [1:0]           iq_entry33_ch_id_Q;
  wire        [1:0]           iq_entry34_ch_id_Q;
  wire        [1:0]           iq_entry35_ch_id_Q;
  wire        [1:0]           iq_entry36_ch_id_Q;
  wire        [1:0]           iq_entry37_ch_id_Q;
  wire        [1:0]           iq_entry38_ch_id_Q;
  wire        [1:0]           iq_entry39_ch_id_Q;
  wire        [1:0]           iq_entry40_ch_id_Q;
  wire        [1:0]           iq_entry41_ch_id_Q;
  wire        [1:0]           iq_entry42_ch_id_Q;
  wire        [1:0]           iq_entry43_ch_id_Q;
  wire        [1:0]           iq_entry44_ch_id_Q;
  wire        [1:0]           iq_entry45_ch_id_Q;
  wire        [1:0]           iq_entry46_ch_id_Q;
  wire        [1:0]           iq_entry47_ch_id_Q;
  wire        [1:0]           iq_entry48_ch_id_Q;
  wire        [1:0]           iq_entry49_ch_id_Q;
  wire        [1:0]           iq_entry50_ch_id_Q;
  wire        [1:0]           iq_entry51_ch_id_Q;
  wire        [1:0]           iq_entry52_ch_id_Q;
  wire        [1:0]           iq_entry53_ch_id_Q;
  wire        [1:0]           iq_entry54_ch_id_Q;
  wire        [1:0]           iq_entry55_ch_id_Q;
  wire        [1:0]           iq_entry56_ch_id_Q;
  wire        [1:0]           iq_entry57_ch_id_Q;
  wire        [1:0]           iq_entry58_ch_id_Q;
  wire        [1:0]           iq_entry59_ch_id_Q;
  wire        [1:0]           iq_entry60_ch_id_Q;
  wire        [1:0]           iq_entry61_ch_id_Q;
  wire        [1:0]           iq_entry62_ch_id_Q;
  wire        [1:0]           iq_entry63_ch_id_Q;
  wire                        iq_entry00_op_is_write_Q;
  wire                        iq_entry01_op_is_write_Q;
  wire                        iq_entry02_op_is_write_Q;
  wire                        iq_entry03_op_is_write_Q;
  wire                        iq_entry04_op_is_write_Q;
  wire                        iq_entry05_op_is_write_Q;
  wire                        iq_entry06_op_is_write_Q;
  wire                        iq_entry07_op_is_write_Q;
  wire                        iq_entry08_op_is_write_Q;
  wire                        iq_entry09_op_is_write_Q;
  wire                        iq_entry10_op_is_write_Q;
  wire                        iq_entry11_op_is_write_Q;
  wire                        iq_entry12_op_is_write_Q;
  wire                        iq_entry13_op_is_write_Q;
  wire                        iq_entry14_op_is_write_Q;
  wire                        iq_entry15_op_is_write_Q;
  wire                        iq_entry16_op_is_write_Q;
  wire                        iq_entry17_op_is_write_Q;
  wire                        iq_entry18_op_is_write_Q;
  wire                        iq_entry19_op_is_write_Q;
  wire                        iq_entry20_op_is_write_Q;
  wire                        iq_entry21_op_is_write_Q;
  wire                        iq_entry22_op_is_write_Q;
  wire                        iq_entry23_op_is_write_Q;
  wire                        iq_entry24_op_is_write_Q;
  wire                        iq_entry25_op_is_write_Q;
  wire                        iq_entry26_op_is_write_Q;
  wire                        iq_entry27_op_is_write_Q;
  wire                        iq_entry28_op_is_write_Q;
  wire                        iq_entry29_op_is_write_Q;
  wire                        iq_entry30_op_is_write_Q;
  wire                        iq_entry31_op_is_write_Q;
  wire                        iq_entry32_op_is_write_Q;
  wire                        iq_entry33_op_is_write_Q;
  wire                        iq_entry34_op_is_write_Q;
  wire                        iq_entry35_op_is_write_Q;
  wire                        iq_entry36_op_is_write_Q;
  wire                        iq_entry37_op_is_write_Q;
  wire                        iq_entry38_op_is_write_Q;
  wire                        iq_entry39_op_is_write_Q;
  wire                        iq_entry40_op_is_write_Q;
  wire                        iq_entry41_op_is_write_Q;
  wire                        iq_entry42_op_is_write_Q;
  wire                        iq_entry43_op_is_write_Q;
  wire                        iq_entry44_op_is_write_Q;
  wire                        iq_entry45_op_is_write_Q;
  wire                        iq_entry46_op_is_write_Q;
  wire                        iq_entry47_op_is_write_Q;
  wire                        iq_entry48_op_is_write_Q;
  wire                        iq_entry49_op_is_write_Q;
  wire                        iq_entry50_op_is_write_Q;
  wire                        iq_entry51_op_is_write_Q;
  wire                        iq_entry52_op_is_write_Q;
  wire                        iq_entry53_op_is_write_Q;
  wire                        iq_entry54_op_is_write_Q;
  wire                        iq_entry55_op_is_write_Q;
  wire                        iq_entry56_op_is_write_Q;
  wire                        iq_entry57_op_is_write_Q;
  wire                        iq_entry58_op_is_write_Q;
  wire                        iq_entry59_op_is_write_Q;
  wire                        iq_entry60_op_is_write_Q;
  wire                        iq_entry61_op_is_write_Q;
  wire                        iq_entry62_op_is_write_Q;
  wire                        iq_entry63_op_is_write_Q;
  wire                        iq_entry00_op_need_linefill_Q;
  wire                        iq_entry01_op_need_linefill_Q;
  wire                        iq_entry02_op_need_linefill_Q;
  wire                        iq_entry03_op_need_linefill_Q;
  wire                        iq_entry04_op_need_linefill_Q;
  wire                        iq_entry05_op_need_linefill_Q;
  wire                        iq_entry06_op_need_linefill_Q;
  wire                        iq_entry07_op_need_linefill_Q;
  wire                        iq_entry08_op_need_linefill_Q;
  wire                        iq_entry09_op_need_linefill_Q;
  wire                        iq_entry10_op_need_linefill_Q;
  wire                        iq_entry11_op_need_linefill_Q;
  wire                        iq_entry12_op_need_linefill_Q;
  wire                        iq_entry13_op_need_linefill_Q;
  wire                        iq_entry14_op_need_linefill_Q;
  wire                        iq_entry15_op_need_linefill_Q;
  wire                        iq_entry16_op_need_linefill_Q;
  wire                        iq_entry17_op_need_linefill_Q;
  wire                        iq_entry18_op_need_linefill_Q;
  wire                        iq_entry19_op_need_linefill_Q;
  wire                        iq_entry20_op_need_linefill_Q;
  wire                        iq_entry21_op_need_linefill_Q;
  wire                        iq_entry22_op_need_linefill_Q;
  wire                        iq_entry23_op_need_linefill_Q;
  wire                        iq_entry24_op_need_linefill_Q;
  wire                        iq_entry25_op_need_linefill_Q;
  wire                        iq_entry26_op_need_linefill_Q;
  wire                        iq_entry27_op_need_linefill_Q;
  wire                        iq_entry28_op_need_linefill_Q;
  wire                        iq_entry29_op_need_linefill_Q;
  wire                        iq_entry30_op_need_linefill_Q;
  wire                        iq_entry31_op_need_linefill_Q;
  wire                        iq_entry32_op_need_linefill_Q;
  wire                        iq_entry33_op_need_linefill_Q;
  wire                        iq_entry34_op_need_linefill_Q;
  wire                        iq_entry35_op_need_linefill_Q;
  wire                        iq_entry36_op_need_linefill_Q;
  wire                        iq_entry37_op_need_linefill_Q;
  wire                        iq_entry38_op_need_linefill_Q;
  wire                        iq_entry39_op_need_linefill_Q;
  wire                        iq_entry40_op_need_linefill_Q;
  wire                        iq_entry41_op_need_linefill_Q;
  wire                        iq_entry42_op_need_linefill_Q;
  wire                        iq_entry43_op_need_linefill_Q;
  wire                        iq_entry44_op_need_linefill_Q;
  wire                        iq_entry45_op_need_linefill_Q;
  wire                        iq_entry46_op_need_linefill_Q;
  wire                        iq_entry47_op_need_linefill_Q;
  wire                        iq_entry48_op_need_linefill_Q;
  wire                        iq_entry49_op_need_linefill_Q;
  wire                        iq_entry50_op_need_linefill_Q;
  wire                        iq_entry51_op_need_linefill_Q;
  wire                        iq_entry52_op_need_linefill_Q;
  wire                        iq_entry53_op_need_linefill_Q;
  wire                        iq_entry54_op_need_linefill_Q;
  wire                        iq_entry55_op_need_linefill_Q;
  wire                        iq_entry56_op_need_linefill_Q;
  wire                        iq_entry57_op_need_linefill_Q;
  wire                        iq_entry58_op_need_linefill_Q;
  wire                        iq_entry59_op_need_linefill_Q;
  wire                        iq_entry60_op_need_linefill_Q;
  wire                        iq_entry61_op_need_linefill_Q;
  wire                        iq_entry62_op_need_linefill_Q;
  wire                        iq_entry63_op_need_linefill_Q;
  wire        [6:0]           iq_entry00_set_way_offset_Q;
  wire        [6:0]           iq_entry01_set_way_offset_Q;
  wire        [6:0]           iq_entry02_set_way_offset_Q;
  wire        [6:0]           iq_entry03_set_way_offset_Q;
  wire        [6:0]           iq_entry04_set_way_offset_Q;
  wire        [6:0]           iq_entry05_set_way_offset_Q;
  wire        [6:0]           iq_entry06_set_way_offset_Q;
  wire        [6:0]           iq_entry07_set_way_offset_Q;
  wire        [6:0]           iq_entry08_set_way_offset_Q;
  wire        [6:0]           iq_entry09_set_way_offset_Q;
  wire        [6:0]           iq_entry10_set_way_offset_Q;
  wire        [6:0]           iq_entry11_set_way_offset_Q;
  wire        [6:0]           iq_entry12_set_way_offset_Q;
  wire        [6:0]           iq_entry13_set_way_offset_Q;
  wire        [6:0]           iq_entry14_set_way_offset_Q;
  wire        [6:0]           iq_entry15_set_way_offset_Q;
  wire        [6:0]           iq_entry16_set_way_offset_Q;
  wire        [6:0]           iq_entry17_set_way_offset_Q;
  wire        [6:0]           iq_entry18_set_way_offset_Q;
  wire        [6:0]           iq_entry19_set_way_offset_Q;
  wire        [6:0]           iq_entry20_set_way_offset_Q;
  wire        [6:0]           iq_entry21_set_way_offset_Q;
  wire        [6:0]           iq_entry22_set_way_offset_Q;
  wire        [6:0]           iq_entry23_set_way_offset_Q;
  wire        [6:0]           iq_entry24_set_way_offset_Q;
  wire        [6:0]           iq_entry25_set_way_offset_Q;
  wire        [6:0]           iq_entry26_set_way_offset_Q;
  wire        [6:0]           iq_entry27_set_way_offset_Q;
  wire        [6:0]           iq_entry28_set_way_offset_Q;
  wire        [6:0]           iq_entry29_set_way_offset_Q;
  wire        [6:0]           iq_entry30_set_way_offset_Q;
  wire        [6:0]           iq_entry31_set_way_offset_Q;
  wire        [6:0]           iq_entry32_set_way_offset_Q;
  wire        [6:0]           iq_entry33_set_way_offset_Q;
  wire        [6:0]           iq_entry34_set_way_offset_Q;
  wire        [6:0]           iq_entry35_set_way_offset_Q;
  wire        [6:0]           iq_entry36_set_way_offset_Q;
  wire        [6:0]           iq_entry37_set_way_offset_Q;
  wire        [6:0]           iq_entry38_set_way_offset_Q;
  wire        [6:0]           iq_entry39_set_way_offset_Q;
  wire        [6:0]           iq_entry40_set_way_offset_Q;
  wire        [6:0]           iq_entry41_set_way_offset_Q;
  wire        [6:0]           iq_entry42_set_way_offset_Q;
  wire        [6:0]           iq_entry43_set_way_offset_Q;
  wire        [6:0]           iq_entry44_set_way_offset_Q;
  wire        [6:0]           iq_entry45_set_way_offset_Q;
  wire        [6:0]           iq_entry46_set_way_offset_Q;
  wire        [6:0]           iq_entry47_set_way_offset_Q;
  wire        [6:0]           iq_entry48_set_way_offset_Q;
  wire        [6:0]           iq_entry49_set_way_offset_Q;
  wire        [6:0]           iq_entry50_set_way_offset_Q;
  wire        [6:0]           iq_entry51_set_way_offset_Q;
  wire        [6:0]           iq_entry52_set_way_offset_Q;
  wire        [6:0]           iq_entry53_set_way_offset_Q;
  wire        [6:0]           iq_entry54_set_way_offset_Q;
  wire        [6:0]           iq_entry55_set_way_offset_Q;
  wire        [6:0]           iq_entry56_set_way_offset_Q;
  wire        [6:0]           iq_entry57_set_way_offset_Q;
  wire        [6:0]           iq_entry58_set_way_offset_Q;
  wire        [6:0]           iq_entry59_set_way_offset_Q;
  wire        [6:0]           iq_entry60_set_way_offset_Q;
  wire        [6:0]           iq_entry61_set_way_offset_Q;
  wire        [6:0]           iq_entry62_set_way_offset_Q;
  wire        [6:0]           iq_entry63_set_way_offset_Q;
  wire        [7:0]           iq_entry00_wbuffer_id_Q;
  wire        [7:0]           iq_entry01_wbuffer_id_Q;
  wire        [7:0]           iq_entry02_wbuffer_id_Q;
  wire        [7:0]           iq_entry03_wbuffer_id_Q;
  wire        [7:0]           iq_entry04_wbuffer_id_Q;
  wire        [7:0]           iq_entry05_wbuffer_id_Q;
  wire        [7:0]           iq_entry06_wbuffer_id_Q;
  wire        [7:0]           iq_entry07_wbuffer_id_Q;
  wire        [7:0]           iq_entry08_wbuffer_id_Q;
  wire        [7:0]           iq_entry09_wbuffer_id_Q;
  wire        [7:0]           iq_entry10_wbuffer_id_Q;
  wire        [7:0]           iq_entry11_wbuffer_id_Q;
  wire        [7:0]           iq_entry12_wbuffer_id_Q;
  wire        [7:0]           iq_entry13_wbuffer_id_Q;
  wire        [7:0]           iq_entry14_wbuffer_id_Q;
  wire        [7:0]           iq_entry15_wbuffer_id_Q;
  wire        [7:0]           iq_entry16_wbuffer_id_Q;
  wire        [7:0]           iq_entry17_wbuffer_id_Q;
  wire        [7:0]           iq_entry18_wbuffer_id_Q;
  wire        [7:0]           iq_entry19_wbuffer_id_Q;
  wire        [7:0]           iq_entry20_wbuffer_id_Q;
  wire        [7:0]           iq_entry21_wbuffer_id_Q;
  wire        [7:0]           iq_entry22_wbuffer_id_Q;
  wire        [7:0]           iq_entry23_wbuffer_id_Q;
  wire        [7:0]           iq_entry24_wbuffer_id_Q;
  wire        [7:0]           iq_entry25_wbuffer_id_Q;
  wire        [7:0]           iq_entry26_wbuffer_id_Q;
  wire        [7:0]           iq_entry27_wbuffer_id_Q;
  wire        [7:0]           iq_entry28_wbuffer_id_Q;
  wire        [7:0]           iq_entry29_wbuffer_id_Q;
  wire        [7:0]           iq_entry30_wbuffer_id_Q;
  wire        [7:0]           iq_entry31_wbuffer_id_Q;
  wire        [7:0]           iq_entry32_wbuffer_id_Q;
  wire        [7:0]           iq_entry33_wbuffer_id_Q;
  wire        [7:0]           iq_entry34_wbuffer_id_Q;
  wire        [7:0]           iq_entry35_wbuffer_id_Q;
  wire        [7:0]           iq_entry36_wbuffer_id_Q;
  wire        [7:0]           iq_entry37_wbuffer_id_Q;
  wire        [7:0]           iq_entry38_wbuffer_id_Q;
  wire        [7:0]           iq_entry39_wbuffer_id_Q;
  wire        [7:0]           iq_entry40_wbuffer_id_Q;
  wire        [7:0]           iq_entry41_wbuffer_id_Q;
  wire        [7:0]           iq_entry42_wbuffer_id_Q;
  wire        [7:0]           iq_entry43_wbuffer_id_Q;
  wire        [7:0]           iq_entry44_wbuffer_id_Q;
  wire        [7:0]           iq_entry45_wbuffer_id_Q;
  wire        [7:0]           iq_entry46_wbuffer_id_Q;
  wire        [7:0]           iq_entry47_wbuffer_id_Q;
  wire        [7:0]           iq_entry48_wbuffer_id_Q;
  wire        [7:0]           iq_entry49_wbuffer_id_Q;
  wire        [7:0]           iq_entry50_wbuffer_id_Q;
  wire        [7:0]           iq_entry51_wbuffer_id_Q;
  wire        [7:0]           iq_entry52_wbuffer_id_Q;
  wire        [7:0]           iq_entry53_wbuffer_id_Q;
  wire        [7:0]           iq_entry54_wbuffer_id_Q;
  wire        [7:0]           iq_entry55_wbuffer_id_Q;
  wire        [7:0]           iq_entry56_wbuffer_id_Q;
  wire        [7:0]           iq_entry57_wbuffer_id_Q;
  wire        [7:0]           iq_entry58_wbuffer_id_Q;
  wire        [7:0]           iq_entry59_wbuffer_id_Q;
  wire        [7:0]           iq_entry60_wbuffer_id_Q;
  wire        [7:0]           iq_entry61_wbuffer_id_Q;
  wire        [7:0]           iq_entry62_wbuffer_id_Q;
  wire        [7:0]           iq_entry63_wbuffer_id_Q;
  wire        [3:0]           iq_entry00_cacheline_state_Q;
  wire        [3:0]           iq_entry01_cacheline_state_Q;
  wire        [3:0]           iq_entry02_cacheline_state_Q;
  wire        [3:0]           iq_entry03_cacheline_state_Q;
  wire        [3:0]           iq_entry04_cacheline_state_Q;
  wire        [3:0]           iq_entry05_cacheline_state_Q;
  wire        [3:0]           iq_entry06_cacheline_state_Q;
  wire        [3:0]           iq_entry07_cacheline_state_Q;
  wire        [3:0]           iq_entry08_cacheline_state_Q;
  wire        [3:0]           iq_entry09_cacheline_state_Q;
  wire        [3:0]           iq_entry10_cacheline_state_Q;
  wire        [3:0]           iq_entry11_cacheline_state_Q;
  wire        [3:0]           iq_entry12_cacheline_state_Q;
  wire        [3:0]           iq_entry13_cacheline_state_Q;
  wire        [3:0]           iq_entry14_cacheline_state_Q;
  wire        [3:0]           iq_entry15_cacheline_state_Q;
  wire        [3:0]           iq_entry16_cacheline_state_Q;
  wire        [3:0]           iq_entry17_cacheline_state_Q;
  wire        [3:0]           iq_entry18_cacheline_state_Q;
  wire        [3:0]           iq_entry19_cacheline_state_Q;
  wire        [3:0]           iq_entry20_cacheline_state_Q;
  wire        [3:0]           iq_entry21_cacheline_state_Q;
  wire        [3:0]           iq_entry22_cacheline_state_Q;
  wire        [3:0]           iq_entry23_cacheline_state_Q;
  wire        [3:0]           iq_entry24_cacheline_state_Q;
  wire        [3:0]           iq_entry25_cacheline_state_Q;
  wire        [3:0]           iq_entry26_cacheline_state_Q;
  wire        [3:0]           iq_entry27_cacheline_state_Q;
  wire        [3:0]           iq_entry28_cacheline_state_Q;
  wire        [3:0]           iq_entry29_cacheline_state_Q;
  wire        [3:0]           iq_entry30_cacheline_state_Q;
  wire        [3:0]           iq_entry31_cacheline_state_Q;
  wire        [3:0]           iq_entry32_cacheline_state_Q;
  wire        [3:0]           iq_entry33_cacheline_state_Q;
  wire        [3:0]           iq_entry34_cacheline_state_Q;
  wire        [3:0]           iq_entry35_cacheline_state_Q;
  wire        [3:0]           iq_entry36_cacheline_state_Q;
  wire        [3:0]           iq_entry37_cacheline_state_Q;
  wire        [3:0]           iq_entry38_cacheline_state_Q;
  wire        [3:0]           iq_entry39_cacheline_state_Q;
  wire        [3:0]           iq_entry40_cacheline_state_Q;
  wire        [3:0]           iq_entry41_cacheline_state_Q;
  wire        [3:0]           iq_entry42_cacheline_state_Q;
  wire        [3:0]           iq_entry43_cacheline_state_Q;
  wire        [3:0]           iq_entry44_cacheline_state_Q;
  wire        [3:0]           iq_entry45_cacheline_state_Q;
  wire        [3:0]           iq_entry46_cacheline_state_Q;
  wire        [3:0]           iq_entry47_cacheline_state_Q;
  wire        [3:0]           iq_entry48_cacheline_state_Q;
  wire        [3:0]           iq_entry49_cacheline_state_Q;
  wire        [3:0]           iq_entry50_cacheline_state_Q;
  wire        [3:0]           iq_entry51_cacheline_state_Q;
  wire        [3:0]           iq_entry52_cacheline_state_Q;
  wire        [3:0]           iq_entry53_cacheline_state_Q;
  wire        [3:0]           iq_entry54_cacheline_state_Q;
  wire        [3:0]           iq_entry55_cacheline_state_Q;
  wire        [3:0]           iq_entry56_cacheline_state_Q;
  wire        [3:0]           iq_entry57_cacheline_state_Q;
  wire        [3:0]           iq_entry58_cacheline_state_Q;
  wire        [3:0]           iq_entry59_cacheline_state_Q;
  wire        [3:0]           iq_entry60_cacheline_state_Q;
  wire        [3:0]           iq_entry61_cacheline_state_Q;
  wire        [3:0]           iq_entry62_cacheline_state_Q;
  wire        [3:0]           iq_entry63_cacheline_state_Q;
  wire        [63:0]          read_ptr_dcd;
  wire                        entry00_validate;
  wire                        entry01_validate;
  wire                        entry02_validate;
  wire                        entry03_validate;
  wire                        entry04_validate;
  wire                        entry05_validate;
  wire                        entry06_validate;
  wire                        entry07_validate;
  wire                        entry08_validate;
  wire                        entry09_validate;
  wire                        entry10_validate;
  wire                        entry11_validate;
  wire                        entry12_validate;
  wire                        entry13_validate;
  wire                        entry14_validate;
  wire                        entry15_validate;
  wire                        entry16_validate;
  wire                        entry17_validate;
  wire                        entry18_validate;
  wire                        entry19_validate;
  wire                        entry20_validate;
  wire                        entry21_validate;
  wire                        entry22_validate;
  wire                        entry23_validate;
  wire                        entry24_validate;
  wire                        entry25_validate;
  wire                        entry26_validate;
  wire                        entry27_validate;
  wire                        entry28_validate;
  wire                        entry29_validate;
  wire                        entry30_validate;
  wire                        entry31_validate;
  wire                        entry32_validate;
  wire                        entry33_validate;
  wire                        entry34_validate;
  wire                        entry35_validate;
  wire                        entry36_validate;
  wire                        entry37_validate;
  wire                        entry38_validate;
  wire                        entry39_validate;
  wire                        entry40_validate;
  wire                        entry41_validate;
  wire                        entry42_validate;
  wire                        entry43_validate;
  wire                        entry44_validate;
  wire                        entry45_validate;
  wire                        entry46_validate;
  wire                        entry47_validate;
  wire                        entry48_validate;
  wire                        entry49_validate;
  wire                        entry50_validate;
  wire                        entry51_validate;
  wire                        entry52_validate;
  wire                        entry53_validate;
  wire                        entry54_validate;
  wire                        entry55_validate;
  wire                        entry56_validate;
  wire                        entry57_validate;
  wire                        entry58_validate;
  wire                        entry59_validate;
  wire                        entry60_validate;
  wire                        entry61_validate;
  wire                        entry62_validate;
  wire                        entry63_validate;
  wire                        entry00_inValidate;
  wire                        entry01_inValidate;
  wire                        entry02_inValidate;
  wire                        entry03_inValidate;
  wire                        entry04_inValidate;
  wire                        entry05_inValidate;
  wire                        entry06_inValidate;
  wire                        entry07_inValidate;
  wire                        entry08_inValidate;
  wire                        entry09_inValidate;
  wire                        entry10_inValidate;
  wire                        entry11_inValidate;
  wire                        entry12_inValidate;
  wire                        entry13_inValidate;
  wire                        entry14_inValidate;
  wire                        entry15_inValidate;
  wire                        entry16_inValidate;
  wire                        entry17_inValidate;
  wire                        entry18_inValidate;
  wire                        entry19_inValidate;
  wire                        entry20_inValidate;
  wire                        entry21_inValidate;
  wire                        entry22_inValidate;
  wire                        entry23_inValidate;
  wire                        entry24_inValidate;
  wire                        entry25_inValidate;
  wire                        entry26_inValidate;
  wire                        entry27_inValidate;
  wire                        entry28_inValidate;
  wire                        entry29_inValidate;
  wire                        entry30_inValidate;
  wire                        entry31_inValidate;
  wire                        entry32_inValidate;
  wire                        entry33_inValidate;
  wire                        entry34_inValidate;
  wire                        entry35_inValidate;
  wire                        entry36_inValidate;
  wire                        entry37_inValidate;
  wire                        entry38_inValidate;
  wire                        entry39_inValidate;
  wire                        entry40_inValidate;
  wire                        entry41_inValidate;
  wire                        entry42_inValidate;
  wire                        entry43_inValidate;
  wire                        entry44_inValidate;
  wire                        entry45_inValidate;
  wire                        entry46_inValidate;
  wire                        entry47_inValidate;
  wire                        entry48_inValidate;
  wire                        entry49_inValidate;
  wire                        entry50_inValidate;
  wire                        entry51_inValidate;
  wire                        entry52_inValidate;
  wire                        entry53_inValidate;
  wire                        entry54_inValidate;
  wire                        entry55_inValidate;
  wire                        entry56_inValidate;
  wire                        entry57_inValidate;
  wire                        entry58_inValidate;
  wire                        entry59_inValidate;
  wire                        entry60_inValidate;
  wire                        entry61_inValidate;
  wire                        entry62_inValidate;
  wire                        entry63_inValidate;

//--------------------------------------------------------------------------------
//                              LOGIC START
//--------------------------------------------------------------------------------
  assign entry00_validate = validate & validate_ptr[5:0] == 6'd0;
  assign entry01_validate = validate & validate_ptr[5:0] == 6'd1;
  assign entry02_validate = validate & validate_ptr[5:0] == 6'd2;
  assign entry03_validate = validate & validate_ptr[5:0] == 6'd3;
  assign entry04_validate = validate & validate_ptr[5:0] == 6'd4;
  assign entry05_validate = validate & validate_ptr[5:0] == 6'd5;
  assign entry06_validate = validate & validate_ptr[5:0] == 6'd6;
  assign entry07_validate = validate & validate_ptr[5:0] == 6'd7;
  assign entry08_validate = validate & validate_ptr[5:0] == 6'd8;
  assign entry09_validate = validate & validate_ptr[5:0] == 6'd9;
  assign entry10_validate = validate & validate_ptr[5:0] == 6'd10;
  assign entry11_validate = validate & validate_ptr[5:0] == 6'd11;
  assign entry12_validate = validate & validate_ptr[5:0] == 6'd12;
  assign entry13_validate = validate & validate_ptr[5:0] == 6'd13;
  assign entry14_validate = validate & validate_ptr[5:0] == 6'd14;
  assign entry15_validate = validate & validate_ptr[5:0] == 6'd15;
  assign entry16_validate = validate & validate_ptr[5:0] == 6'd16;
  assign entry17_validate = validate & validate_ptr[5:0] == 6'd17;
  assign entry18_validate = validate & validate_ptr[5:0] == 6'd18;
  assign entry19_validate = validate & validate_ptr[5:0] == 6'd19;
  assign entry20_validate = validate & validate_ptr[5:0] == 6'd20;
  assign entry21_validate = validate & validate_ptr[5:0] == 6'd21;
  assign entry22_validate = validate & validate_ptr[5:0] == 6'd22;
  assign entry23_validate = validate & validate_ptr[5:0] == 6'd23;
  assign entry24_validate = validate & validate_ptr[5:0] == 6'd24;
  assign entry25_validate = validate & validate_ptr[5:0] == 6'd25;
  assign entry26_validate = validate & validate_ptr[5:0] == 6'd26;
  assign entry27_validate = validate & validate_ptr[5:0] == 6'd27;
  assign entry28_validate = validate & validate_ptr[5:0] == 6'd28;
  assign entry29_validate = validate & validate_ptr[5:0] == 6'd29;
  assign entry30_validate = validate & validate_ptr[5:0] == 6'd30;
  assign entry31_validate = validate & validate_ptr[5:0] == 6'd31;
  assign entry32_validate = validate & validate_ptr[5:0] == 6'd32;
  assign entry33_validate = validate & validate_ptr[5:0] == 6'd33;
  assign entry34_validate = validate & validate_ptr[5:0] == 6'd34;
  assign entry35_validate = validate & validate_ptr[5:0] == 6'd35;
  assign entry36_validate = validate & validate_ptr[5:0] == 6'd36;
  assign entry37_validate = validate & validate_ptr[5:0] == 6'd37;
  assign entry38_validate = validate & validate_ptr[5:0] == 6'd38;
  assign entry39_validate = validate & validate_ptr[5:0] == 6'd39;
  assign entry40_validate = validate & validate_ptr[5:0] == 6'd40;
  assign entry41_validate = validate & validate_ptr[5:0] == 6'd41;
  assign entry42_validate = validate & validate_ptr[5:0] == 6'd42;
  assign entry43_validate = validate & validate_ptr[5:0] == 6'd43;
  assign entry44_validate = validate & validate_ptr[5:0] == 6'd44;
  assign entry45_validate = validate & validate_ptr[5:0] == 6'd45;
  assign entry46_validate = validate & validate_ptr[5:0] == 6'd46;
  assign entry47_validate = validate & validate_ptr[5:0] == 6'd47;
  assign entry48_validate = validate & validate_ptr[5:0] == 6'd48;
  assign entry49_validate = validate & validate_ptr[5:0] == 6'd49;
  assign entry50_validate = validate & validate_ptr[5:0] == 6'd50;
  assign entry51_validate = validate & validate_ptr[5:0] == 6'd51;
  assign entry52_validate = validate & validate_ptr[5:0] == 6'd52;
  assign entry53_validate = validate & validate_ptr[5:0] == 6'd53;
  assign entry54_validate = validate & validate_ptr[5:0] == 6'd54;
  assign entry55_validate = validate & validate_ptr[5:0] == 6'd55;
  assign entry56_validate = validate & validate_ptr[5:0] == 6'd56;
  assign entry57_validate = validate & validate_ptr[5:0] == 6'd57;
  assign entry58_validate = validate & validate_ptr[5:0] == 6'd58;
  assign entry59_validate = validate & validate_ptr[5:0] == 6'd59;
  assign entry60_validate = validate & validate_ptr[5:0] == 6'd60;
  assign entry61_validate = validate & validate_ptr[5:0] == 6'd61;
  assign entry62_validate = validate & validate_ptr[5:0] == 6'd62;
  assign entry63_validate = validate & validate_ptr[5:0] == 6'd63;

  assign entry00_inValidate = inValidate & inValidate_ptr[5:0] == 6'd0;
  assign entry01_inValidate = inValidate & inValidate_ptr[5:0] == 6'd1;
  assign entry02_inValidate = inValidate & inValidate_ptr[5:0] == 6'd2;
  assign entry03_inValidate = inValidate & inValidate_ptr[5:0] == 6'd3;
  assign entry04_inValidate = inValidate & inValidate_ptr[5:0] == 6'd4;
  assign entry05_inValidate = inValidate & inValidate_ptr[5:0] == 6'd5;
  assign entry06_inValidate = inValidate & inValidate_ptr[5:0] == 6'd6;
  assign entry07_inValidate = inValidate & inValidate_ptr[5:0] == 6'd7;
  assign entry08_inValidate = inValidate & inValidate_ptr[5:0] == 6'd8;
  assign entry09_inValidate = inValidate & inValidate_ptr[5:0] == 6'd9;
  assign entry10_inValidate = inValidate & inValidate_ptr[5:0] == 6'd10;
  assign entry11_inValidate = inValidate & inValidate_ptr[5:0] == 6'd11;
  assign entry12_inValidate = inValidate & inValidate_ptr[5:0] == 6'd12;
  assign entry13_inValidate = inValidate & inValidate_ptr[5:0] == 6'd13;
  assign entry14_inValidate = inValidate & inValidate_ptr[5:0] == 6'd14;
  assign entry15_inValidate = inValidate & inValidate_ptr[5:0] == 6'd15;
  assign entry16_inValidate = inValidate & inValidate_ptr[5:0] == 6'd16;
  assign entry17_inValidate = inValidate & inValidate_ptr[5:0] == 6'd17;
  assign entry18_inValidate = inValidate & inValidate_ptr[5:0] == 6'd18;
  assign entry19_inValidate = inValidate & inValidate_ptr[5:0] == 6'd19;
  assign entry20_inValidate = inValidate & inValidate_ptr[5:0] == 6'd20;
  assign entry21_inValidate = inValidate & inValidate_ptr[5:0] == 6'd21;
  assign entry22_inValidate = inValidate & inValidate_ptr[5:0] == 6'd22;
  assign entry23_inValidate = inValidate & inValidate_ptr[5:0] == 6'd23;
  assign entry24_inValidate = inValidate & inValidate_ptr[5:0] == 6'd24;
  assign entry25_inValidate = inValidate & inValidate_ptr[5:0] == 6'd25;
  assign entry26_inValidate = inValidate & inValidate_ptr[5:0] == 6'd26;
  assign entry27_inValidate = inValidate & inValidate_ptr[5:0] == 6'd27;
  assign entry28_inValidate = inValidate & inValidate_ptr[5:0] == 6'd28;
  assign entry29_inValidate = inValidate & inValidate_ptr[5:0] == 6'd29;
  assign entry30_inValidate = inValidate & inValidate_ptr[5:0] == 6'd30;
  assign entry31_inValidate = inValidate & inValidate_ptr[5:0] == 6'd31;
  assign entry32_inValidate = inValidate & inValidate_ptr[5:0] == 6'd32;
  assign entry33_inValidate = inValidate & inValidate_ptr[5:0] == 6'd33;
  assign entry34_inValidate = inValidate & inValidate_ptr[5:0] == 6'd34;
  assign entry35_inValidate = inValidate & inValidate_ptr[5:0] == 6'd35;
  assign entry36_inValidate = inValidate & inValidate_ptr[5:0] == 6'd36;
  assign entry37_inValidate = inValidate & inValidate_ptr[5:0] == 6'd37;
  assign entry38_inValidate = inValidate & inValidate_ptr[5:0] == 6'd38;
  assign entry39_inValidate = inValidate & inValidate_ptr[5:0] == 6'd39;
  assign entry40_inValidate = inValidate & inValidate_ptr[5:0] == 6'd40;
  assign entry41_inValidate = inValidate & inValidate_ptr[5:0] == 6'd41;
  assign entry42_inValidate = inValidate & inValidate_ptr[5:0] == 6'd42;
  assign entry43_inValidate = inValidate & inValidate_ptr[5:0] == 6'd43;
  assign entry44_inValidate = inValidate & inValidate_ptr[5:0] == 6'd44;
  assign entry45_inValidate = inValidate & inValidate_ptr[5:0] == 6'd45;
  assign entry46_inValidate = inValidate & inValidate_ptr[5:0] == 6'd46;
  assign entry47_inValidate = inValidate & inValidate_ptr[5:0] == 6'd47;
  assign entry48_inValidate = inValidate & inValidate_ptr[5:0] == 6'd48;
  assign entry49_inValidate = inValidate & inValidate_ptr[5:0] == 6'd49;
  assign entry50_inValidate = inValidate & inValidate_ptr[5:0] == 6'd50;
  assign entry51_inValidate = inValidate & inValidate_ptr[5:0] == 6'd51;
  assign entry52_inValidate = inValidate & inValidate_ptr[5:0] == 6'd52;
  assign entry53_inValidate = inValidate & inValidate_ptr[5:0] == 6'd53;
  assign entry54_inValidate = inValidate & inValidate_ptr[5:0] == 6'd54;
  assign entry55_inValidate = inValidate & inValidate_ptr[5:0] == 6'd55;
  assign entry56_inValidate = inValidate & inValidate_ptr[5:0] == 6'd56;
  assign entry57_inValidate = inValidate & inValidate_ptr[5:0] == 6'd57;
  assign entry58_inValidate = inValidate & inValidate_ptr[5:0] == 6'd58;
  assign entry59_inValidate = inValidate & inValidate_ptr[5:0] == 6'd59;
  assign entry60_inValidate = inValidate & inValidate_ptr[5:0] == 6'd60;
  assign entry61_inValidate = inValidate & inValidate_ptr[5:0] == 6'd61;
  assign entry62_inValidate = inValidate & inValidate_ptr[5:0] == 6'd62;
  assign entry63_inValidate = inValidate & inValidate_ptr[5:0] == 6'd63;

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

assign iq_array_rob_id_rdata[2:0] = {3{read_ptr_dcd[0]}} & iq_entry00_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[1]}} & iq_entry01_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[2]}} & iq_entry02_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[3]}} & iq_entry03_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[4]}} & iq_entry04_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[5]}} & iq_entry05_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[6]}} & iq_entry06_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[7]}} & iq_entry07_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[8]}} & iq_entry08_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[9]}} & iq_entry09_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[10]}} & iq_entry10_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[11]}} & iq_entry11_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[12]}} & iq_entry12_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[13]}} & iq_entry13_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[14]}} & iq_entry14_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[15]}} & iq_entry15_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[16]}} & iq_entry16_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[17]}} & iq_entry17_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[18]}} & iq_entry18_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[19]}} & iq_entry19_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[20]}} & iq_entry20_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[21]}} & iq_entry21_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[22]}} & iq_entry22_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[23]}} & iq_entry23_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[24]}} & iq_entry24_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[25]}} & iq_entry25_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[26]}} & iq_entry26_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[27]}} & iq_entry27_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[28]}} & iq_entry28_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[29]}} & iq_entry29_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[30]}} & iq_entry30_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[31]}} & iq_entry31_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[32]}} & iq_entry32_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[33]}} & iq_entry33_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[34]}} & iq_entry34_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[35]}} & iq_entry35_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[36]}} & iq_entry36_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[37]}} & iq_entry37_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[38]}} & iq_entry38_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[39]}} & iq_entry39_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[40]}} & iq_entry40_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[41]}} & iq_entry41_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[42]}} & iq_entry42_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[43]}} & iq_entry43_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[44]}} & iq_entry44_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[45]}} & iq_entry45_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[46]}} & iq_entry46_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[47]}} & iq_entry47_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[48]}} & iq_entry48_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[49]}} & iq_entry49_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[50]}} & iq_entry50_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[51]}} & iq_entry51_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[52]}} & iq_entry52_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[53]}} & iq_entry53_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[54]}} & iq_entry54_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[55]}} & iq_entry55_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[56]}} & iq_entry56_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[57]}} & iq_entry57_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[58]}} & iq_entry58_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[59]}} & iq_entry59_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[60]}} & iq_entry60_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[61]}} & iq_entry61_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[62]}} & iq_entry62_rob_id_Q[2:0]
                                  | {3{read_ptr_dcd[63]}} & iq_entry63_rob_id_Q[2:0];

assign iq_array_ch_id_rdata[1:0] = {2{read_ptr_dcd[0]}} & iq_entry00_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[1]}} & iq_entry01_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[2]}} & iq_entry02_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[3]}} & iq_entry03_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[4]}} & iq_entry04_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[5]}} & iq_entry05_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[6]}} & iq_entry06_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[7]}} & iq_entry07_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[8]}} & iq_entry08_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[9]}} & iq_entry09_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[10]}} & iq_entry10_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[11]}} & iq_entry11_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[12]}} & iq_entry12_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[13]}} & iq_entry13_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[14]}} & iq_entry14_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[15]}} & iq_entry15_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[16]}} & iq_entry16_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[17]}} & iq_entry17_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[18]}} & iq_entry18_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[19]}} & iq_entry19_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[20]}} & iq_entry20_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[21]}} & iq_entry21_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[22]}} & iq_entry22_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[23]}} & iq_entry23_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[24]}} & iq_entry24_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[25]}} & iq_entry25_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[26]}} & iq_entry26_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[27]}} & iq_entry27_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[28]}} & iq_entry28_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[29]}} & iq_entry29_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[30]}} & iq_entry30_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[31]}} & iq_entry31_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[32]}} & iq_entry32_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[33]}} & iq_entry33_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[34]}} & iq_entry34_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[35]}} & iq_entry35_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[36]}} & iq_entry36_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[37]}} & iq_entry37_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[38]}} & iq_entry38_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[39]}} & iq_entry39_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[40]}} & iq_entry40_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[41]}} & iq_entry41_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[42]}} & iq_entry42_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[43]}} & iq_entry43_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[44]}} & iq_entry44_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[45]}} & iq_entry45_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[46]}} & iq_entry46_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[47]}} & iq_entry47_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[48]}} & iq_entry48_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[49]}} & iq_entry49_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[50]}} & iq_entry50_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[51]}} & iq_entry51_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[52]}} & iq_entry52_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[53]}} & iq_entry53_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[54]}} & iq_entry54_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[55]}} & iq_entry55_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[56]}} & iq_entry56_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[57]}} & iq_entry57_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[58]}} & iq_entry58_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[59]}} & iq_entry59_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[60]}} & iq_entry60_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[61]}} & iq_entry61_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[62]}} & iq_entry62_ch_id_Q[1:0]
                                 | {2{read_ptr_dcd[63]}} & iq_entry63_ch_id_Q[1:0];

assign iq_array_op_is_write_rdata = read_ptr_dcd[0] & iq_entry00_op_is_write_Q
                                  | read_ptr_dcd[1] & iq_entry01_op_is_write_Q
                                  | read_ptr_dcd[2] & iq_entry02_op_is_write_Q
                                  | read_ptr_dcd[3] & iq_entry03_op_is_write_Q
                                  | read_ptr_dcd[4] & iq_entry04_op_is_write_Q
                                  | read_ptr_dcd[5] & iq_entry05_op_is_write_Q
                                  | read_ptr_dcd[6] & iq_entry06_op_is_write_Q
                                  | read_ptr_dcd[7] & iq_entry07_op_is_write_Q
                                  | read_ptr_dcd[8] & iq_entry08_op_is_write_Q
                                  | read_ptr_dcd[9] & iq_entry09_op_is_write_Q
                                  | read_ptr_dcd[10] & iq_entry10_op_is_write_Q
                                  | read_ptr_dcd[11] & iq_entry11_op_is_write_Q
                                  | read_ptr_dcd[12] & iq_entry12_op_is_write_Q
                                  | read_ptr_dcd[13] & iq_entry13_op_is_write_Q
                                  | read_ptr_dcd[14] & iq_entry14_op_is_write_Q
                                  | read_ptr_dcd[15] & iq_entry15_op_is_write_Q
                                  | read_ptr_dcd[16] & iq_entry16_op_is_write_Q
                                  | read_ptr_dcd[17] & iq_entry17_op_is_write_Q
                                  | read_ptr_dcd[18] & iq_entry18_op_is_write_Q
                                  | read_ptr_dcd[19] & iq_entry19_op_is_write_Q
                                  | read_ptr_dcd[20] & iq_entry20_op_is_write_Q
                                  | read_ptr_dcd[21] & iq_entry21_op_is_write_Q
                                  | read_ptr_dcd[22] & iq_entry22_op_is_write_Q
                                  | read_ptr_dcd[23] & iq_entry23_op_is_write_Q
                                  | read_ptr_dcd[24] & iq_entry24_op_is_write_Q
                                  | read_ptr_dcd[25] & iq_entry25_op_is_write_Q
                                  | read_ptr_dcd[26] & iq_entry26_op_is_write_Q
                                  | read_ptr_dcd[27] & iq_entry27_op_is_write_Q
                                  | read_ptr_dcd[28] & iq_entry28_op_is_write_Q
                                  | read_ptr_dcd[29] & iq_entry29_op_is_write_Q
                                  | read_ptr_dcd[30] & iq_entry30_op_is_write_Q
                                  | read_ptr_dcd[31] & iq_entry31_op_is_write_Q
                                  | read_ptr_dcd[32] & iq_entry32_op_is_write_Q
                                  | read_ptr_dcd[33] & iq_entry33_op_is_write_Q
                                  | read_ptr_dcd[34] & iq_entry34_op_is_write_Q
                                  | read_ptr_dcd[35] & iq_entry35_op_is_write_Q
                                  | read_ptr_dcd[36] & iq_entry36_op_is_write_Q
                                  | read_ptr_dcd[37] & iq_entry37_op_is_write_Q
                                  | read_ptr_dcd[38] & iq_entry38_op_is_write_Q
                                  | read_ptr_dcd[39] & iq_entry39_op_is_write_Q
                                  | read_ptr_dcd[40] & iq_entry40_op_is_write_Q
                                  | read_ptr_dcd[41] & iq_entry41_op_is_write_Q
                                  | read_ptr_dcd[42] & iq_entry42_op_is_write_Q
                                  | read_ptr_dcd[43] & iq_entry43_op_is_write_Q
                                  | read_ptr_dcd[44] & iq_entry44_op_is_write_Q
                                  | read_ptr_dcd[45] & iq_entry45_op_is_write_Q
                                  | read_ptr_dcd[46] & iq_entry46_op_is_write_Q
                                  | read_ptr_dcd[47] & iq_entry47_op_is_write_Q
                                  | read_ptr_dcd[48] & iq_entry48_op_is_write_Q
                                  | read_ptr_dcd[49] & iq_entry49_op_is_write_Q
                                  | read_ptr_dcd[50] & iq_entry50_op_is_write_Q
                                  | read_ptr_dcd[51] & iq_entry51_op_is_write_Q
                                  | read_ptr_dcd[52] & iq_entry52_op_is_write_Q
                                  | read_ptr_dcd[53] & iq_entry53_op_is_write_Q
                                  | read_ptr_dcd[54] & iq_entry54_op_is_write_Q
                                  | read_ptr_dcd[55] & iq_entry55_op_is_write_Q
                                  | read_ptr_dcd[56] & iq_entry56_op_is_write_Q
                                  | read_ptr_dcd[57] & iq_entry57_op_is_write_Q
                                  | read_ptr_dcd[58] & iq_entry58_op_is_write_Q
                                  | read_ptr_dcd[59] & iq_entry59_op_is_write_Q
                                  | read_ptr_dcd[60] & iq_entry60_op_is_write_Q
                                  | read_ptr_dcd[61] & iq_entry61_op_is_write_Q
                                  | read_ptr_dcd[62] & iq_entry62_op_is_write_Q
                                  | read_ptr_dcd[63] & iq_entry63_op_is_write_Q;

assign iq_array_op_need_linefill_rdata = read_ptr_dcd[0] & iq_entry00_op_need_linefill_Q
                                       | read_ptr_dcd[1] & iq_entry01_op_need_linefill_Q
                                       | read_ptr_dcd[2] & iq_entry02_op_need_linefill_Q
                                       | read_ptr_dcd[3] & iq_entry03_op_need_linefill_Q
                                       | read_ptr_dcd[4] & iq_entry04_op_need_linefill_Q
                                       | read_ptr_dcd[5] & iq_entry05_op_need_linefill_Q
                                       | read_ptr_dcd[6] & iq_entry06_op_need_linefill_Q
                                       | read_ptr_dcd[7] & iq_entry07_op_need_linefill_Q
                                       | read_ptr_dcd[8] & iq_entry08_op_need_linefill_Q
                                       | read_ptr_dcd[9] & iq_entry09_op_need_linefill_Q
                                       | read_ptr_dcd[10] & iq_entry10_op_need_linefill_Q
                                       | read_ptr_dcd[11] & iq_entry11_op_need_linefill_Q
                                       | read_ptr_dcd[12] & iq_entry12_op_need_linefill_Q
                                       | read_ptr_dcd[13] & iq_entry13_op_need_linefill_Q
                                       | read_ptr_dcd[14] & iq_entry14_op_need_linefill_Q
                                       | read_ptr_dcd[15] & iq_entry15_op_need_linefill_Q
                                       | read_ptr_dcd[16] & iq_entry16_op_need_linefill_Q
                                       | read_ptr_dcd[17] & iq_entry17_op_need_linefill_Q
                                       | read_ptr_dcd[18] & iq_entry18_op_need_linefill_Q
                                       | read_ptr_dcd[19] & iq_entry19_op_need_linefill_Q
                                       | read_ptr_dcd[20] & iq_entry20_op_need_linefill_Q
                                       | read_ptr_dcd[21] & iq_entry21_op_need_linefill_Q
                                       | read_ptr_dcd[22] & iq_entry22_op_need_linefill_Q
                                       | read_ptr_dcd[23] & iq_entry23_op_need_linefill_Q
                                       | read_ptr_dcd[24] & iq_entry24_op_need_linefill_Q
                                       | read_ptr_dcd[25] & iq_entry25_op_need_linefill_Q
                                       | read_ptr_dcd[26] & iq_entry26_op_need_linefill_Q
                                       | read_ptr_dcd[27] & iq_entry27_op_need_linefill_Q
                                       | read_ptr_dcd[28] & iq_entry28_op_need_linefill_Q
                                       | read_ptr_dcd[29] & iq_entry29_op_need_linefill_Q
                                       | read_ptr_dcd[30] & iq_entry30_op_need_linefill_Q
                                       | read_ptr_dcd[31] & iq_entry31_op_need_linefill_Q
                                       | read_ptr_dcd[32] & iq_entry32_op_need_linefill_Q
                                       | read_ptr_dcd[33] & iq_entry33_op_need_linefill_Q
                                       | read_ptr_dcd[34] & iq_entry34_op_need_linefill_Q
                                       | read_ptr_dcd[35] & iq_entry35_op_need_linefill_Q
                                       | read_ptr_dcd[36] & iq_entry36_op_need_linefill_Q
                                       | read_ptr_dcd[37] & iq_entry37_op_need_linefill_Q
                                       | read_ptr_dcd[38] & iq_entry38_op_need_linefill_Q
                                       | read_ptr_dcd[39] & iq_entry39_op_need_linefill_Q
                                       | read_ptr_dcd[40] & iq_entry40_op_need_linefill_Q
                                       | read_ptr_dcd[41] & iq_entry41_op_need_linefill_Q
                                       | read_ptr_dcd[42] & iq_entry42_op_need_linefill_Q
                                       | read_ptr_dcd[43] & iq_entry43_op_need_linefill_Q
                                       | read_ptr_dcd[44] & iq_entry44_op_need_linefill_Q
                                       | read_ptr_dcd[45] & iq_entry45_op_need_linefill_Q
                                       | read_ptr_dcd[46] & iq_entry46_op_need_linefill_Q
                                       | read_ptr_dcd[47] & iq_entry47_op_need_linefill_Q
                                       | read_ptr_dcd[48] & iq_entry48_op_need_linefill_Q
                                       | read_ptr_dcd[49] & iq_entry49_op_need_linefill_Q
                                       | read_ptr_dcd[50] & iq_entry50_op_need_linefill_Q
                                       | read_ptr_dcd[51] & iq_entry51_op_need_linefill_Q
                                       | read_ptr_dcd[52] & iq_entry52_op_need_linefill_Q
                                       | read_ptr_dcd[53] & iq_entry53_op_need_linefill_Q
                                       | read_ptr_dcd[54] & iq_entry54_op_need_linefill_Q
                                       | read_ptr_dcd[55] & iq_entry55_op_need_linefill_Q
                                       | read_ptr_dcd[56] & iq_entry56_op_need_linefill_Q
                                       | read_ptr_dcd[57] & iq_entry57_op_need_linefill_Q
                                       | read_ptr_dcd[58] & iq_entry58_op_need_linefill_Q
                                       | read_ptr_dcd[59] & iq_entry59_op_need_linefill_Q
                                       | read_ptr_dcd[60] & iq_entry60_op_need_linefill_Q
                                       | read_ptr_dcd[61] & iq_entry61_op_need_linefill_Q
                                       | read_ptr_dcd[62] & iq_entry62_op_need_linefill_Q
                                       | read_ptr_dcd[63] & iq_entry63_op_need_linefill_Q;

assign iq_array_set_way_offset_rdata[6:0] = {7{read_ptr_dcd[0]}} & iq_entry00_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[1]}} & iq_entry01_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[2]}} & iq_entry02_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[3]}} & iq_entry03_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[4]}} & iq_entry04_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[5]}} & iq_entry05_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[6]}} & iq_entry06_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[7]}} & iq_entry07_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[8]}} & iq_entry08_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[9]}} & iq_entry09_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[10]}} & iq_entry10_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[11]}} & iq_entry11_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[12]}} & iq_entry12_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[13]}} & iq_entry13_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[14]}} & iq_entry14_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[15]}} & iq_entry15_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[16]}} & iq_entry16_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[17]}} & iq_entry17_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[18]}} & iq_entry18_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[19]}} & iq_entry19_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[20]}} & iq_entry20_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[21]}} & iq_entry21_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[22]}} & iq_entry22_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[23]}} & iq_entry23_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[24]}} & iq_entry24_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[25]}} & iq_entry25_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[26]}} & iq_entry26_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[27]}} & iq_entry27_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[28]}} & iq_entry28_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[29]}} & iq_entry29_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[30]}} & iq_entry30_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[31]}} & iq_entry31_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[32]}} & iq_entry32_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[33]}} & iq_entry33_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[34]}} & iq_entry34_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[35]}} & iq_entry35_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[36]}} & iq_entry36_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[37]}} & iq_entry37_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[38]}} & iq_entry38_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[39]}} & iq_entry39_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[40]}} & iq_entry40_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[41]}} & iq_entry41_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[42]}} & iq_entry42_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[43]}} & iq_entry43_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[44]}} & iq_entry44_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[45]}} & iq_entry45_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[46]}} & iq_entry46_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[47]}} & iq_entry47_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[48]}} & iq_entry48_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[49]}} & iq_entry49_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[50]}} & iq_entry50_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[51]}} & iq_entry51_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[52]}} & iq_entry52_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[53]}} & iq_entry53_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[54]}} & iq_entry54_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[55]}} & iq_entry55_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[56]}} & iq_entry56_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[57]}} & iq_entry57_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[58]}} & iq_entry58_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[59]}} & iq_entry59_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[60]}} & iq_entry60_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[61]}} & iq_entry61_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[62]}} & iq_entry62_set_way_offset_Q[6:0]
                                          | {7{read_ptr_dcd[63]}} & iq_entry63_set_way_offset_Q[6:0];

assign iq_array_wbuffer_id_rdata[7:0] = {8{read_ptr_dcd[0]}} & iq_entry00_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[1]}} & iq_entry01_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[2]}} & iq_entry02_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[3]}} & iq_entry03_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[4]}} & iq_entry04_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[5]}} & iq_entry05_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[6]}} & iq_entry06_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[7]}} & iq_entry07_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[8]}} & iq_entry08_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[9]}} & iq_entry09_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[10]}} & iq_entry10_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[11]}} & iq_entry11_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[12]}} & iq_entry12_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[13]}} & iq_entry13_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[14]}} & iq_entry14_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[15]}} & iq_entry15_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[16]}} & iq_entry16_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[17]}} & iq_entry17_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[18]}} & iq_entry18_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[19]}} & iq_entry19_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[20]}} & iq_entry20_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[21]}} & iq_entry21_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[22]}} & iq_entry22_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[23]}} & iq_entry23_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[24]}} & iq_entry24_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[25]}} & iq_entry25_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[26]}} & iq_entry26_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[27]}} & iq_entry27_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[28]}} & iq_entry28_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[29]}} & iq_entry29_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[30]}} & iq_entry30_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[31]}} & iq_entry31_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[32]}} & iq_entry32_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[33]}} & iq_entry33_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[34]}} & iq_entry34_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[35]}} & iq_entry35_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[36]}} & iq_entry36_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[37]}} & iq_entry37_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[38]}} & iq_entry38_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[39]}} & iq_entry39_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[40]}} & iq_entry40_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[41]}} & iq_entry41_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[42]}} & iq_entry42_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[43]}} & iq_entry43_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[44]}} & iq_entry44_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[45]}} & iq_entry45_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[46]}} & iq_entry46_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[47]}} & iq_entry47_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[48]}} & iq_entry48_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[49]}} & iq_entry49_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[50]}} & iq_entry50_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[51]}} & iq_entry51_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[52]}} & iq_entry52_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[53]}} & iq_entry53_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[54]}} & iq_entry54_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[55]}} & iq_entry55_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[56]}} & iq_entry56_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[57]}} & iq_entry57_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[58]}} & iq_entry58_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[59]}} & iq_entry59_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[60]}} & iq_entry60_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[61]}} & iq_entry61_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[62]}} & iq_entry62_wbuffer_id_Q[7:0]
                                      | {8{read_ptr_dcd[63]}} & iq_entry63_wbuffer_id_Q[7:0];

assign iq_array_cacheline_state_rdata[3:0] = {4{read_ptr_dcd[0]}} & iq_entry00_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[1]}} & iq_entry01_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[2]}} & iq_entry02_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[3]}} & iq_entry03_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[4]}} & iq_entry04_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[5]}} & iq_entry05_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[6]}} & iq_entry06_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[7]}} & iq_entry07_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[8]}} & iq_entry08_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[9]}} & iq_entry09_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[10]}} & iq_entry10_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[11]}} & iq_entry11_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[12]}} & iq_entry12_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[13]}} & iq_entry13_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[14]}} & iq_entry14_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[15]}} & iq_entry15_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[16]}} & iq_entry16_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[17]}} & iq_entry17_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[18]}} & iq_entry18_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[19]}} & iq_entry19_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[20]}} & iq_entry20_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[21]}} & iq_entry21_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[22]}} & iq_entry22_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[23]}} & iq_entry23_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[24]}} & iq_entry24_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[25]}} & iq_entry25_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[26]}} & iq_entry26_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[27]}} & iq_entry27_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[28]}} & iq_entry28_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[29]}} & iq_entry29_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[30]}} & iq_entry30_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[31]}} & iq_entry31_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[32]}} & iq_entry32_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[33]}} & iq_entry33_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[34]}} & iq_entry34_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[35]}} & iq_entry35_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[36]}} & iq_entry36_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[37]}} & iq_entry37_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[38]}} & iq_entry38_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[39]}} & iq_entry39_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[40]}} & iq_entry40_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[41]}} & iq_entry41_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[42]}} & iq_entry42_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[43]}} & iq_entry43_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[44]}} & iq_entry44_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[45]}} & iq_entry45_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[46]}} & iq_entry46_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[47]}} & iq_entry47_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[48]}} & iq_entry48_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[49]}} & iq_entry49_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[50]}} & iq_entry50_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[51]}} & iq_entry51_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[52]}} & iq_entry52_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[53]}} & iq_entry53_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[54]}} & iq_entry54_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[55]}} & iq_entry55_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[56]}} & iq_entry56_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[57]}} & iq_entry57_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[58]}} & iq_entry58_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[59]}} & iq_entry59_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[60]}} & iq_entry60_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[61]}} & iq_entry61_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[62]}} & iq_entry62_cacheline_state_Q[3:0]
                                           | {4{read_ptr_dcd[63]}} & iq_entry63_cacheline_state_Q[3:0];

assign iq_array_need_evit_rdata = read_ptr_dcd[0] & iq_need_evit_array_Q[0]
                                | read_ptr_dcd[1] & iq_need_evit_array_Q[1]
                                | read_ptr_dcd[2] & iq_need_evit_array_Q[2]
                                | read_ptr_dcd[3] & iq_need_evit_array_Q[3]
                                | read_ptr_dcd[4] & iq_need_evit_array_Q[4]
                                | read_ptr_dcd[5] & iq_need_evit_array_Q[5]
                                | read_ptr_dcd[6] & iq_need_evit_array_Q[6]
                                | read_ptr_dcd[7] & iq_need_evit_array_Q[7]
                                | read_ptr_dcd[8] & iq_need_evit_array_Q[8]
                                | read_ptr_dcd[9] & iq_need_evit_array_Q[9]
                                | read_ptr_dcd[10] & iq_need_evit_array_Q[10]
                                | read_ptr_dcd[11] & iq_need_evit_array_Q[11]
                                | read_ptr_dcd[12] & iq_need_evit_array_Q[12]
                                | read_ptr_dcd[13] & iq_need_evit_array_Q[13]
                                | read_ptr_dcd[14] & iq_need_evit_array_Q[14]
                                | read_ptr_dcd[15] & iq_need_evit_array_Q[15]
                                | read_ptr_dcd[16] & iq_need_evit_array_Q[16]
                                | read_ptr_dcd[17] & iq_need_evit_array_Q[17]
                                | read_ptr_dcd[18] & iq_need_evit_array_Q[18]
                                | read_ptr_dcd[19] & iq_need_evit_array_Q[19]
                                | read_ptr_dcd[20] & iq_need_evit_array_Q[20]
                                | read_ptr_dcd[21] & iq_need_evit_array_Q[21]
                                | read_ptr_dcd[22] & iq_need_evit_array_Q[22]
                                | read_ptr_dcd[23] & iq_need_evit_array_Q[23]
                                | read_ptr_dcd[24] & iq_need_evit_array_Q[24]
                                | read_ptr_dcd[25] & iq_need_evit_array_Q[25]
                                | read_ptr_dcd[26] & iq_need_evit_array_Q[26]
                                | read_ptr_dcd[27] & iq_need_evit_array_Q[27]
                                | read_ptr_dcd[28] & iq_need_evit_array_Q[28]
                                | read_ptr_dcd[29] & iq_need_evit_array_Q[29]
                                | read_ptr_dcd[30] & iq_need_evit_array_Q[30]
                                | read_ptr_dcd[31] & iq_need_evit_array_Q[31]
                                | read_ptr_dcd[32] & iq_need_evit_array_Q[32]
                                | read_ptr_dcd[33] & iq_need_evit_array_Q[33]
                                | read_ptr_dcd[34] & iq_need_evit_array_Q[34]
                                | read_ptr_dcd[35] & iq_need_evit_array_Q[35]
                                | read_ptr_dcd[36] & iq_need_evit_array_Q[36]
                                | read_ptr_dcd[37] & iq_need_evit_array_Q[37]
                                | read_ptr_dcd[38] & iq_need_evit_array_Q[38]
                                | read_ptr_dcd[39] & iq_need_evit_array_Q[39]
                                | read_ptr_dcd[40] & iq_need_evit_array_Q[40]
                                | read_ptr_dcd[41] & iq_need_evit_array_Q[41]
                                | read_ptr_dcd[42] & iq_need_evit_array_Q[42]
                                | read_ptr_dcd[43] & iq_need_evit_array_Q[43]
                                | read_ptr_dcd[44] & iq_need_evit_array_Q[44]
                                | read_ptr_dcd[45] & iq_need_evit_array_Q[45]
                                | read_ptr_dcd[46] & iq_need_evit_array_Q[46]
                                | read_ptr_dcd[47] & iq_need_evit_array_Q[47]
                                | read_ptr_dcd[48] & iq_need_evit_array_Q[48]
                                | read_ptr_dcd[49] & iq_need_evit_array_Q[49]
                                | read_ptr_dcd[50] & iq_need_evit_array_Q[50]
                                | read_ptr_dcd[51] & iq_need_evit_array_Q[51]
                                | read_ptr_dcd[52] & iq_need_evit_array_Q[52]
                                | read_ptr_dcd[53] & iq_need_evit_array_Q[53]
                                | read_ptr_dcd[54] & iq_need_evit_array_Q[54]
                                | read_ptr_dcd[55] & iq_need_evit_array_Q[55]
                                | read_ptr_dcd[56] & iq_need_evit_array_Q[56]
                                | read_ptr_dcd[57] & iq_need_evit_array_Q[57]
                                | read_ptr_dcd[58] & iq_need_evit_array_Q[58]
                                | read_ptr_dcd[59] & iq_need_evit_array_Q[59]
                                | read_ptr_dcd[60] & iq_need_evit_array_Q[60]
                                | read_ptr_dcd[61] & iq_need_evit_array_Q[61]
                                | read_ptr_dcd[62] & iq_need_evit_array_Q[62]
                                | read_ptr_dcd[63] & iq_need_evit_array_Q[63];

//--------------------------------------------------------------------------------
//                              Module instance
//--------------------------------------------------------------------------------
  iq_entry iq_entry_entry00 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry00_validate                 ),
    .inValidate            (entry00_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[0]              ),
    .rob_id_Q              (iq_entry00_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry00_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry00_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry00_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry00_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry00_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry00_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[0]            ),
    .need_evit_Q           (iq_need_evit_array_Q[0]          ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[0]      ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[0]      ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[0]      )
  );

  iq_entry iq_entry_entry01 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry01_validate                 ),
    .inValidate            (entry01_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[1]              ),
    .rob_id_Q              (iq_entry01_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry01_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry01_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry01_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry01_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry01_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry01_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[1]            ),
    .need_evit_Q           (iq_need_evit_array_Q[1]          ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[1]      ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[1]      ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[1]      )
  );

  iq_entry iq_entry_entry02 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry02_validate                 ),
    .inValidate            (entry02_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[2]              ),
    .rob_id_Q              (iq_entry02_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry02_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry02_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry02_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry02_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry02_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry02_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[2]            ),
    .need_evit_Q           (iq_need_evit_array_Q[2]          ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[2]      ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[2]      ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[2]      )
  );

  iq_entry iq_entry_entry03 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry03_validate                 ),
    .inValidate            (entry03_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[3]              ),
    .rob_id_Q              (iq_entry03_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry03_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry03_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry03_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry03_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry03_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry03_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[3]            ),
    .need_evit_Q           (iq_need_evit_array_Q[3]          ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[3]      ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[3]      ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[3]      )
  );

  iq_entry iq_entry_entry04 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry04_validate                 ),
    .inValidate            (entry04_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[4]              ),
    .rob_id_Q              (iq_entry04_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry04_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry04_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry04_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry04_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry04_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry04_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[4]            ),
    .need_evit_Q           (iq_need_evit_array_Q[4]          ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[4]      ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[4]      ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[4]      )
  );

  iq_entry iq_entry_entry05 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry05_validate                 ),
    .inValidate            (entry05_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[5]              ),
    .rob_id_Q              (iq_entry05_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry05_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry05_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry05_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry05_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry05_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry05_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[5]            ),
    .need_evit_Q           (iq_need_evit_array_Q[5]          ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[5]      ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[5]      ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[5]      )
  );

  iq_entry iq_entry_entry06 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry06_validate                 ),
    .inValidate            (entry06_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[6]              ),
    .rob_id_Q              (iq_entry06_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry06_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry06_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry06_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry06_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry06_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry06_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[6]            ),
    .need_evit_Q           (iq_need_evit_array_Q[6]          ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[6]      ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[6]      ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[6]      )
  );

  iq_entry iq_entry_entry07 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry07_validate                 ),
    .inValidate            (entry07_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[7]              ),
    .rob_id_Q              (iq_entry07_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry07_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry07_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry07_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry07_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry07_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry07_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[7]            ),
    .need_evit_Q           (iq_need_evit_array_Q[7]          ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[7]      ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[7]      ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[7]      )
  );

  iq_entry iq_entry_entry08 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry08_validate                 ),
    .inValidate            (entry08_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[8]              ),
    .rob_id_Q              (iq_entry08_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry08_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry08_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry08_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry08_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry08_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry08_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[8]            ),
    .need_evit_Q           (iq_need_evit_array_Q[8]          ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[8]      ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[8]      ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[8]      )
  );

  iq_entry iq_entry_entry09 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry09_validate                 ),
    .inValidate            (entry09_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[9]              ),
    .rob_id_Q              (iq_entry09_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry09_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry09_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry09_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry09_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry09_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry09_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[9]            ),
    .need_evit_Q           (iq_need_evit_array_Q[9]          ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[9]      ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[9]      ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[9]      )
  );

  iq_entry iq_entry_entry10 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry10_validate                 ),
    .inValidate            (entry10_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[10]             ),
    .rob_id_Q              (iq_entry10_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry10_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry10_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry10_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry10_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry10_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry10_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[10]           ),
    .need_evit_Q           (iq_need_evit_array_Q[10]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[10]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[10]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[10]     )
  );

  iq_entry iq_entry_entry11 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry11_validate                 ),
    .inValidate            (entry11_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[11]             ),
    .rob_id_Q              (iq_entry11_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry11_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry11_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry11_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry11_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry11_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry11_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[11]           ),
    .need_evit_Q           (iq_need_evit_array_Q[11]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[11]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[11]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[11]     )
  );

  iq_entry iq_entry_entry12 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry12_validate                 ),
    .inValidate            (entry12_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[12]             ),
    .rob_id_Q              (iq_entry12_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry12_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry12_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry12_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry12_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry12_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry12_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[12]           ),
    .need_evit_Q           (iq_need_evit_array_Q[12]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[12]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[12]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[12]     )
  );

  iq_entry iq_entry_entry13 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry13_validate                 ),
    .inValidate            (entry13_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[13]             ),
    .rob_id_Q              (iq_entry13_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry13_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry13_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry13_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry13_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry13_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry13_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[13]           ),
    .need_evit_Q           (iq_need_evit_array_Q[13]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[13]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[13]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[13]     )
  );

  iq_entry iq_entry_entry14 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry14_validate                 ),
    .inValidate            (entry14_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[14]             ),
    .rob_id_Q              (iq_entry14_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry14_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry14_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry14_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry14_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry14_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry14_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[14]           ),
    .need_evit_Q           (iq_need_evit_array_Q[14]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[14]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[14]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[14]     )
  );

  iq_entry iq_entry_entry15 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry15_validate                 ),
    .inValidate            (entry15_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[15]             ),
    .rob_id_Q              (iq_entry15_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry15_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry15_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry15_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry15_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry15_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry15_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[15]           ),
    .need_evit_Q           (iq_need_evit_array_Q[15]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[15]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[15]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[15]     )
  );

  iq_entry iq_entry_entry16 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry16_validate                 ),
    .inValidate            (entry16_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[16]             ),
    .rob_id_Q              (iq_entry16_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry16_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry16_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry16_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry16_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry16_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry16_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[16]           ),
    .need_evit_Q           (iq_need_evit_array_Q[16]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[16]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[16]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[16]     )
  );

  iq_entry iq_entry_entry17 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry17_validate                 ),
    .inValidate            (entry17_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[17]             ),
    .rob_id_Q              (iq_entry17_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry17_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry17_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry17_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry17_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry17_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry17_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[17]           ),
    .need_evit_Q           (iq_need_evit_array_Q[17]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[17]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[17]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[17]     )
  );

  iq_entry iq_entry_entry18 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry18_validate                 ),
    .inValidate            (entry18_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[18]             ),
    .rob_id_Q              (iq_entry18_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry18_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry18_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry18_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry18_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry18_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry18_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[18]           ),
    .need_evit_Q           (iq_need_evit_array_Q[18]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[18]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[18]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[18]     )
  );

  iq_entry iq_entry_entry19 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry19_validate                 ),
    .inValidate            (entry19_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[19]             ),
    .rob_id_Q              (iq_entry19_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry19_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry19_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry19_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry19_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry19_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry19_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[19]           ),
    .need_evit_Q           (iq_need_evit_array_Q[19]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[19]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[19]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[19]     )
  );

  iq_entry iq_entry_entry20 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry20_validate                 ),
    .inValidate            (entry20_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[20]             ),
    .rob_id_Q              (iq_entry20_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry20_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry20_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry20_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry20_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry20_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry20_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[20]           ),
    .need_evit_Q           (iq_need_evit_array_Q[20]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[20]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[20]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[20]     )
  );

  iq_entry iq_entry_entry21 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry21_validate                 ),
    .inValidate            (entry21_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[21]             ),
    .rob_id_Q              (iq_entry21_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry21_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry21_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry21_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry21_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry21_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry21_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[21]           ),
    .need_evit_Q           (iq_need_evit_array_Q[21]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[21]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[21]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[21]     )
  );

  iq_entry iq_entry_entry22 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry22_validate                 ),
    .inValidate            (entry22_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[22]             ),
    .rob_id_Q              (iq_entry22_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry22_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry22_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry22_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry22_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry22_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry22_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[22]           ),
    .need_evit_Q           (iq_need_evit_array_Q[22]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[22]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[22]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[22]     )
  );

  iq_entry iq_entry_entry23 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry23_validate                 ),
    .inValidate            (entry23_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[23]             ),
    .rob_id_Q              (iq_entry23_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry23_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry23_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry23_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry23_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry23_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry23_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[23]           ),
    .need_evit_Q           (iq_need_evit_array_Q[23]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[23]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[23]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[23]     )
  );

  iq_entry iq_entry_entry24 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry24_validate                 ),
    .inValidate            (entry24_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[24]             ),
    .rob_id_Q              (iq_entry24_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry24_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry24_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry24_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry24_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry24_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry24_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[24]           ),
    .need_evit_Q           (iq_need_evit_array_Q[24]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[24]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[24]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[24]     )
  );

  iq_entry iq_entry_entry25 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry25_validate                 ),
    .inValidate            (entry25_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[25]             ),
    .rob_id_Q              (iq_entry25_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry25_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry25_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry25_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry25_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry25_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry25_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[25]           ),
    .need_evit_Q           (iq_need_evit_array_Q[25]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[25]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[25]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[25]     )
  );

  iq_entry iq_entry_entry26 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry26_validate                 ),
    .inValidate            (entry26_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[26]             ),
    .rob_id_Q              (iq_entry26_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry26_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry26_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry26_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry26_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry26_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry26_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[26]           ),
    .need_evit_Q           (iq_need_evit_array_Q[26]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[26]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[26]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[26]     )
  );

  iq_entry iq_entry_entry27 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry27_validate                 ),
    .inValidate            (entry27_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[27]             ),
    .rob_id_Q              (iq_entry27_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry27_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry27_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry27_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry27_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry27_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry27_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[27]           ),
    .need_evit_Q           (iq_need_evit_array_Q[27]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[27]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[27]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[27]     )
  );

  iq_entry iq_entry_entry28 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry28_validate                 ),
    .inValidate            (entry28_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[28]             ),
    .rob_id_Q              (iq_entry28_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry28_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry28_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry28_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry28_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry28_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry28_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[28]           ),
    .need_evit_Q           (iq_need_evit_array_Q[28]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[28]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[28]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[28]     )
  );

  iq_entry iq_entry_entry29 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry29_validate                 ),
    .inValidate            (entry29_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[29]             ),
    .rob_id_Q              (iq_entry29_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry29_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry29_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry29_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry29_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry29_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry29_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[29]           ),
    .need_evit_Q           (iq_need_evit_array_Q[29]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[29]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[29]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[29]     )
  );

  iq_entry iq_entry_entry30 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry30_validate                 ),
    .inValidate            (entry30_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[30]             ),
    .rob_id_Q              (iq_entry30_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry30_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry30_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry30_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry30_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry30_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry30_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[30]           ),
    .need_evit_Q           (iq_need_evit_array_Q[30]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[30]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[30]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[30]     )
  );

  iq_entry iq_entry_entry31 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry31_validate                 ),
    .inValidate            (entry31_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[31]             ),
    .rob_id_Q              (iq_entry31_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry31_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry31_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry31_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry31_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry31_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry31_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[31]           ),
    .need_evit_Q           (iq_need_evit_array_Q[31]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[31]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[31]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[31]     )
  );

  iq_entry iq_entry_entry32 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry32_validate                 ),
    .inValidate            (entry32_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[32]             ),
    .rob_id_Q              (iq_entry32_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry32_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry32_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry32_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry32_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry32_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry32_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[32]           ),
    .need_evit_Q           (iq_need_evit_array_Q[32]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[32]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[32]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[32]     )
  );

  iq_entry iq_entry_entry33 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry33_validate                 ),
    .inValidate            (entry33_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[33]             ),
    .rob_id_Q              (iq_entry33_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry33_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry33_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry33_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry33_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry33_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry33_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[33]           ),
    .need_evit_Q           (iq_need_evit_array_Q[33]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[33]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[33]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[33]     )
  );

  iq_entry iq_entry_entry34 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry34_validate                 ),
    .inValidate            (entry34_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[34]             ),
    .rob_id_Q              (iq_entry34_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry34_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry34_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry34_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry34_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry34_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry34_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[34]           ),
    .need_evit_Q           (iq_need_evit_array_Q[34]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[34]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[34]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[34]     )
  );

  iq_entry iq_entry_entry35 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry35_validate                 ),
    .inValidate            (entry35_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[35]             ),
    .rob_id_Q              (iq_entry35_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry35_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry35_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry35_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry35_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry35_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry35_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[35]           ),
    .need_evit_Q           (iq_need_evit_array_Q[35]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[35]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[35]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[35]     )
  );

  iq_entry iq_entry_entry36 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry36_validate                 ),
    .inValidate            (entry36_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[36]             ),
    .rob_id_Q              (iq_entry36_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry36_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry36_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry36_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry36_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry36_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry36_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[36]           ),
    .need_evit_Q           (iq_need_evit_array_Q[36]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[36]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[36]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[36]     )
  );

  iq_entry iq_entry_entry37 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry37_validate                 ),
    .inValidate            (entry37_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[37]             ),
    .rob_id_Q              (iq_entry37_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry37_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry37_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry37_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry37_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry37_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry37_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[37]           ),
    .need_evit_Q           (iq_need_evit_array_Q[37]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[37]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[37]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[37]     )
  );

  iq_entry iq_entry_entry38 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry38_validate                 ),
    .inValidate            (entry38_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[38]             ),
    .rob_id_Q              (iq_entry38_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry38_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry38_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry38_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry38_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry38_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry38_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[38]           ),
    .need_evit_Q           (iq_need_evit_array_Q[38]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[38]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[38]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[38]     )
  );

  iq_entry iq_entry_entry39 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry39_validate                 ),
    .inValidate            (entry39_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[39]             ),
    .rob_id_Q              (iq_entry39_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry39_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry39_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry39_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry39_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry39_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry39_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[39]           ),
    .need_evit_Q           (iq_need_evit_array_Q[39]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[39]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[39]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[39]     )
  );

  iq_entry iq_entry_entry40 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry40_validate                 ),
    .inValidate            (entry40_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[40]             ),
    .rob_id_Q              (iq_entry40_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry40_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry40_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry40_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry40_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry40_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry40_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[40]           ),
    .need_evit_Q           (iq_need_evit_array_Q[40]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[40]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[40]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[40]     )
  );

  iq_entry iq_entry_entry41 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry41_validate                 ),
    .inValidate            (entry41_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[41]             ),
    .rob_id_Q              (iq_entry41_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry41_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry41_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry41_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry41_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry41_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry41_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[41]           ),
    .need_evit_Q           (iq_need_evit_array_Q[41]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[41]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[41]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[41]     )
  );

  iq_entry iq_entry_entry42 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry42_validate                 ),
    .inValidate            (entry42_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[42]             ),
    .rob_id_Q              (iq_entry42_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry42_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry42_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry42_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry42_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry42_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry42_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[42]           ),
    .need_evit_Q           (iq_need_evit_array_Q[42]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[42]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[42]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[42]     )
  );

  iq_entry iq_entry_entry43 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry43_validate                 ),
    .inValidate            (entry43_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[43]             ),
    .rob_id_Q              (iq_entry43_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry43_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry43_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry43_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry43_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry43_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry43_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[43]           ),
    .need_evit_Q           (iq_need_evit_array_Q[43]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[43]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[43]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[43]     )
  );

  iq_entry iq_entry_entry44 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry44_validate                 ),
    .inValidate            (entry44_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[44]             ),
    .rob_id_Q              (iq_entry44_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry44_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry44_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry44_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry44_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry44_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry44_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[44]           ),
    .need_evit_Q           (iq_need_evit_array_Q[44]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[44]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[44]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[44]     )
  );

  iq_entry iq_entry_entry45 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry45_validate                 ),
    .inValidate            (entry45_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[45]             ),
    .rob_id_Q              (iq_entry45_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry45_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry45_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry45_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry45_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry45_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry45_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[45]           ),
    .need_evit_Q           (iq_need_evit_array_Q[45]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[45]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[45]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[45]     )
  );

  iq_entry iq_entry_entry46 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry46_validate                 ),
    .inValidate            (entry46_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[46]             ),
    .rob_id_Q              (iq_entry46_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry46_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry46_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry46_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry46_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry46_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry46_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[46]           ),
    .need_evit_Q           (iq_need_evit_array_Q[46]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[46]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[46]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[46]     )
  );

  iq_entry iq_entry_entry47 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry47_validate                 ),
    .inValidate            (entry47_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[47]             ),
    .rob_id_Q              (iq_entry47_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry47_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry47_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry47_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry47_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry47_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry47_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[47]           ),
    .need_evit_Q           (iq_need_evit_array_Q[47]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[47]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[47]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[47]     )
  );

  iq_entry iq_entry_entry48 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry48_validate                 ),
    .inValidate            (entry48_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[48]             ),
    .rob_id_Q              (iq_entry48_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry48_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry48_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry48_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry48_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry48_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry48_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[48]           ),
    .need_evit_Q           (iq_need_evit_array_Q[48]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[48]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[48]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[48]     )
  );

  iq_entry iq_entry_entry49 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry49_validate                 ),
    .inValidate            (entry49_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[49]             ),
    .rob_id_Q              (iq_entry49_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry49_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry49_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry49_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry49_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry49_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry49_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[49]           ),
    .need_evit_Q           (iq_need_evit_array_Q[49]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[49]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[49]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[49]     )
  );

  iq_entry iq_entry_entry50 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry50_validate                 ),
    .inValidate            (entry50_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[50]             ),
    .rob_id_Q              (iq_entry50_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry50_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry50_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry50_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry50_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry50_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry50_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[50]           ),
    .need_evit_Q           (iq_need_evit_array_Q[50]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[50]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[50]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[50]     )
  );

  iq_entry iq_entry_entry51 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry51_validate                 ),
    .inValidate            (entry51_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[51]             ),
    .rob_id_Q              (iq_entry51_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry51_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry51_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry51_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry51_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry51_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry51_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[51]           ),
    .need_evit_Q           (iq_need_evit_array_Q[51]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[51]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[51]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[51]     )
  );

  iq_entry iq_entry_entry52 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry52_validate                 ),
    .inValidate            (entry52_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[52]             ),
    .rob_id_Q              (iq_entry52_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry52_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry52_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry52_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry52_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry52_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry52_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[52]           ),
    .need_evit_Q           (iq_need_evit_array_Q[52]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[52]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[52]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[52]     )
  );

  iq_entry iq_entry_entry53 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry53_validate                 ),
    .inValidate            (entry53_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[53]             ),
    .rob_id_Q              (iq_entry53_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry53_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry53_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry53_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry53_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry53_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry53_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[53]           ),
    .need_evit_Q           (iq_need_evit_array_Q[53]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[53]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[53]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[53]     )
  );

  iq_entry iq_entry_entry54 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry54_validate                 ),
    .inValidate            (entry54_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[54]             ),
    .rob_id_Q              (iq_entry54_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry54_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry54_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry54_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry54_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry54_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry54_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[54]           ),
    .need_evit_Q           (iq_need_evit_array_Q[54]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[54]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[54]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[54]     )
  );

  iq_entry iq_entry_entry55 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry55_validate                 ),
    .inValidate            (entry55_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[55]             ),
    .rob_id_Q              (iq_entry55_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry55_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry55_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry55_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry55_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry55_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry55_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[55]           ),
    .need_evit_Q           (iq_need_evit_array_Q[55]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[55]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[55]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[55]     )
  );

  iq_entry iq_entry_entry56 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry56_validate                 ),
    .inValidate            (entry56_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[56]             ),
    .rob_id_Q              (iq_entry56_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry56_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry56_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry56_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry56_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry56_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry56_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[56]           ),
    .need_evit_Q           (iq_need_evit_array_Q[56]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[56]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[56]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[56]     )
  );

  iq_entry iq_entry_entry57 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry57_validate                 ),
    .inValidate            (entry57_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[57]             ),
    .rob_id_Q              (iq_entry57_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry57_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry57_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry57_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry57_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry57_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry57_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[57]           ),
    .need_evit_Q           (iq_need_evit_array_Q[57]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[57]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[57]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[57]     )
  );

  iq_entry iq_entry_entry58 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry58_validate                 ),
    .inValidate            (entry58_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[58]             ),
    .rob_id_Q              (iq_entry58_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry58_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry58_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry58_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry58_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry58_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry58_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[58]           ),
    .need_evit_Q           (iq_need_evit_array_Q[58]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[58]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[58]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[58]     )
  );

  iq_entry iq_entry_entry59 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry59_validate                 ),
    .inValidate            (entry59_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[59]             ),
    .rob_id_Q              (iq_entry59_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry59_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry59_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry59_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry59_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry59_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry59_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[59]           ),
    .need_evit_Q           (iq_need_evit_array_Q[59]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[59]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[59]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[59]     )
  );

  iq_entry iq_entry_entry60 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry60_validate                 ),
    .inValidate            (entry60_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[60]             ),
    .rob_id_Q              (iq_entry60_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry60_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry60_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry60_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry60_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry60_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry60_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[60]           ),
    .need_evit_Q           (iq_need_evit_array_Q[60]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[60]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[60]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[60]     )
  );

  iq_entry iq_entry_entry61 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry61_validate                 ),
    .inValidate            (entry61_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[61]             ),
    .rob_id_Q              (iq_entry61_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry61_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry61_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry61_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry61_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry61_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry61_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[61]           ),
    .need_evit_Q           (iq_need_evit_array_Q[61]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[61]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[61]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[61]     )
  );

  iq_entry iq_entry_entry62 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry62_validate                 ),
    .inValidate            (entry62_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[62]             ),
    .rob_id_Q              (iq_entry62_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry62_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry62_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry62_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry62_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry62_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry62_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[62]           ),
    .need_evit_Q           (iq_need_evit_array_Q[62]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[62]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[62]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[62]     )
  );

  iq_entry iq_entry_entry63 (
    .clk                   (clk                              ),
    .rst                   (rst                              ),
    .validate              (entry63_validate                 ),
    .inValidate            (entry63_inValidate               ),
    .cacheline_inflight_In (cacheline_inflight_In            ),
    .op_need_evit_In       (iq_array_op_need_evit_In         ),
    .biu_rvalid_In         (biu_rvalid_In                    ),
    .biu_rid_In            (biu_rid_In[5:0]                  ),
    .rob_id_In             (iq_array_rob_id_In[2:0]          ),
    .ch_id_In              (iq_array_ch_id_In[1:0]           ),
    .op_is_write_In        (iq_array_op_is_write_In          ),
    .op_need_linefill_In   (iq_array_op_need_linefill_In     ),
    .set_way_offset_In     (iq_array_set_way_offset_In[6:0]  ),
    .wbuffer_id_In         (iq_array_wbuffer_id_In[7:0]      ),
    .cacheline_state_In    (iq_array_cacheline_state_In[3:0] ),
    .valid_Q               (iq_valid_array_Q[63]             ),
    .rob_id_Q              (iq_entry63_rob_id_Q[2:0]         ),
    .ch_id_Q               (iq_entry63_ch_id_Q[1:0]          ),
    .op_is_write_Q         (iq_entry63_op_is_write_Q         ),
    .op_need_linefill_Q    (iq_entry63_op_need_linefill_Q    ),
    .set_way_offset_Q      (iq_entry63_set_way_offset_Q[6:0] ),
    .wbuffer_id_Q          (iq_entry63_wbuffer_id_Q[7:0]     ),
    .cacheline_state_Q     (iq_entry63_cacheline_state_Q[3:0]),
    .mshr_allow_Q          (mshr_allow_array_Q[63]           ),
    .need_evit_Q           (iq_need_evit_array_Q[63]         ),
    .entry_req_from_ch0    (entry_req_from_ch0_array[63]     ),
    .entry_req_from_ch1    (entry_req_from_ch1_array[63]     ),
    .entry_req_from_ch2    (entry_req_from_ch2_array[63]     )
  );

endmodule
