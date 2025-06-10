module shift_priority_arb_64 (
  input  wire [63:0] valid_array_i,
  input  wire [5:0] bottom_ptr_i,
  output wire [5:0] select_ptr_o
);

  wire [63:0] shift_valid_array;

  assign shift_valid_array[63:0] = {64{bottom_ptr_i[5:0] == 6'd0}} & valid_array_i[63:0]
                                  | {64{bottom_ptr_i[5:0] == 6'd1}} & {valid_array_i[0], valid_array_i[63:1]}
                                  | {64{bottom_ptr_i[5:0] == 6'd2}} & {valid_array_i[1:0], valid_array_i[63:2]}
                                  | {64{bottom_ptr_i[5:0] == 6'd3}} & {valid_array_i[2:0], valid_array_i[63:3]}
                                  | {64{bottom_ptr_i[5:0] == 6'd4}} & {valid_array_i[3:0], valid_array_i[63:4]}
                                  | {64{bottom_ptr_i[5:0] == 6'd5}} & {valid_array_i[4:0], valid_array_i[63:5]}
                                  | {64{bottom_ptr_i[5:0] == 6'd6}} & {valid_array_i[5:0], valid_array_i[63:6]}
                                  | {64{bottom_ptr_i[5:0] == 6'd7}} & {valid_array_i[6:0], valid_array_i[63:7]}
                                  | {64{bottom_ptr_i[5:0] == 6'd8}} & {valid_array_i[7:0], valid_array_i[63:8]}
                                  | {64{bottom_ptr_i[5:0] == 6'd9}} & {valid_array_i[8:0], valid_array_i[63:9]}
                                  | {64{bottom_ptr_i[5:0] == 6'd10}} & {valid_array_i[9:0], valid_array_i[63:10]}
                                  | {64{bottom_ptr_i[5:0] == 6'd11}} & {valid_array_i[10:0], valid_array_i[63:11]}
                                  | {64{bottom_ptr_i[5:0] == 6'd12}} & {valid_array_i[11:0], valid_array_i[63:12]}
                                  | {64{bottom_ptr_i[5:0] == 6'd13}} & {valid_array_i[12:0], valid_array_i[63:13]}
                                  | {64{bottom_ptr_i[5:0] == 6'd14}} & {valid_array_i[13:0], valid_array_i[63:14]}
                                  | {64{bottom_ptr_i[5:0] == 6'd15}} & {valid_array_i[14:0], valid_array_i[63:15]}
                                  | {64{bottom_ptr_i[5:0] == 6'd16}} & {valid_array_i[15:0], valid_array_i[63:16]}
                                  | {64{bottom_ptr_i[5:0] == 6'd17}} & {valid_array_i[16:0], valid_array_i[63:17]}
                                  | {64{bottom_ptr_i[5:0] == 6'd18}} & {valid_array_i[17:0], valid_array_i[63:18]}
                                  | {64{bottom_ptr_i[5:0] == 6'd19}} & {valid_array_i[18:0], valid_array_i[63:19]}
                                  | {64{bottom_ptr_i[5:0] == 6'd20}} & {valid_array_i[19:0], valid_array_i[63:20]}
                                  | {64{bottom_ptr_i[5:0] == 6'd21}} & {valid_array_i[20:0], valid_array_i[63:21]}
                                  | {64{bottom_ptr_i[5:0] == 6'd22}} & {valid_array_i[21:0], valid_array_i[63:22]}
                                  | {64{bottom_ptr_i[5:0] == 6'd23}} & {valid_array_i[22:0], valid_array_i[63:23]}
                                  | {64{bottom_ptr_i[5:0] == 6'd24}} & {valid_array_i[23:0], valid_array_i[63:24]}
                                  | {64{bottom_ptr_i[5:0] == 6'd25}} & {valid_array_i[24:0], valid_array_i[63:25]}
                                  | {64{bottom_ptr_i[5:0] == 6'd26}} & {valid_array_i[25:0], valid_array_i[63:26]}
                                  | {64{bottom_ptr_i[5:0] == 6'd27}} & {valid_array_i[26:0], valid_array_i[63:27]}
                                  | {64{bottom_ptr_i[5:0] == 6'd28}} & {valid_array_i[27:0], valid_array_i[63:28]}
                                  | {64{bottom_ptr_i[5:0] == 6'd29}} & {valid_array_i[28:0], valid_array_i[63:29]}
                                  | {64{bottom_ptr_i[5:0] == 6'd30}} & {valid_array_i[29:0], valid_array_i[63:30]}
                                  | {64{bottom_ptr_i[5:0] == 6'd31}} & {valid_array_i[30:0], valid_array_i[63:31]}
                                  | {64{bottom_ptr_i[5:0] == 6'd32}} & {valid_array_i[31:0], valid_array_i[63:32]}
                                  | {64{bottom_ptr_i[5:0] == 6'd33}} & {valid_array_i[32:0], valid_array_i[63:33]}
                                  | {64{bottom_ptr_i[5:0] == 6'd34}} & {valid_array_i[33:0], valid_array_i[63:34]}
                                  | {64{bottom_ptr_i[5:0] == 6'd35}} & {valid_array_i[34:0], valid_array_i[63:35]}
                                  | {64{bottom_ptr_i[5:0] == 6'd36}} & {valid_array_i[35:0], valid_array_i[63:36]}
                                  | {64{bottom_ptr_i[5:0] == 6'd37}} & {valid_array_i[36:0], valid_array_i[63:37]}
                                  | {64{bottom_ptr_i[5:0] == 6'd38}} & {valid_array_i[37:0], valid_array_i[63:38]}
                                  | {64{bottom_ptr_i[5:0] == 6'd39}} & {valid_array_i[38:0], valid_array_i[63:39]}
                                  | {64{bottom_ptr_i[5:0] == 6'd40}} & {valid_array_i[39:0], valid_array_i[63:40]}
                                  | {64{bottom_ptr_i[5:0] == 6'd41}} & {valid_array_i[40:0], valid_array_i[63:41]}
                                  | {64{bottom_ptr_i[5:0] == 6'd42}} & {valid_array_i[41:0], valid_array_i[63:42]}
                                  | {64{bottom_ptr_i[5:0] == 6'd43}} & {valid_array_i[42:0], valid_array_i[63:43]}
                                  | {64{bottom_ptr_i[5:0] == 6'd44}} & {valid_array_i[43:0], valid_array_i[63:44]}
                                  | {64{bottom_ptr_i[5:0] == 6'd45}} & {valid_array_i[44:0], valid_array_i[63:45]}
                                  | {64{bottom_ptr_i[5:0] == 6'd46}} & {valid_array_i[45:0], valid_array_i[63:46]}
                                  | {64{bottom_ptr_i[5:0] == 6'd47}} & {valid_array_i[46:0], valid_array_i[63:47]}
                                  | {64{bottom_ptr_i[5:0] == 6'd48}} & {valid_array_i[47:0], valid_array_i[63:48]}
                                  | {64{bottom_ptr_i[5:0] == 6'd49}} & {valid_array_i[48:0], valid_array_i[63:49]}
                                  | {64{bottom_ptr_i[5:0] == 6'd50}} & {valid_array_i[49:0], valid_array_i[63:50]}
                                  | {64{bottom_ptr_i[5:0] == 6'd51}} & {valid_array_i[50:0], valid_array_i[63:51]}
                                  | {64{bottom_ptr_i[5:0] == 6'd52}} & {valid_array_i[51:0], valid_array_i[63:52]}
                                  | {64{bottom_ptr_i[5:0] == 6'd53}} & {valid_array_i[52:0], valid_array_i[63:53]}
                                  | {64{bottom_ptr_i[5:0] == 6'd54}} & {valid_array_i[53:0], valid_array_i[63:54]}
                                  | {64{bottom_ptr_i[5:0] == 6'd55}} & {valid_array_i[54:0], valid_array_i[63:55]}
                                  | {64{bottom_ptr_i[5:0] == 6'd56}} & {valid_array_i[55:0], valid_array_i[63:56]}
                                  | {64{bottom_ptr_i[5:0] == 6'd57}} & {valid_array_i[56:0], valid_array_i[63:57]}
                                  | {64{bottom_ptr_i[5:0] == 6'd58}} & {valid_array_i[57:0], valid_array_i[63:58]}
                                  | {64{bottom_ptr_i[5:0] == 6'd59}} & {valid_array_i[58:0], valid_array_i[63:59]}
                                  | {64{bottom_ptr_i[5:0] == 6'd60}} & {valid_array_i[59:0], valid_array_i[63:60]}
                                  | {64{bottom_ptr_i[5:0] == 6'd61}} & {valid_array_i[60:0], valid_array_i[63:61]}
                                  | {64{bottom_ptr_i[5:0] == 6'd62}} & {valid_array_i[61:0], valid_array_i[63:62]}
                                  | {64{bottom_ptr_i[5:0] == 6'd63}} & {valid_array_i[62:0], valid_array_i[63]};

  assign select_ptr_o[5:0] = shift_valid_array[0] ? bottom_ptr_i[5:0]
                           : shift_valid_array[1] ? bottom_ptr_i[5:0] + 6'd1
                           : shift_valid_array[2] ? bottom_ptr_i[5:0] + 6'd2
                           : shift_valid_array[3] ? bottom_ptr_i[5:0] + 6'd3
                           : shift_valid_array[4] ? bottom_ptr_i[5:0] + 6'd4
                           : shift_valid_array[5] ? bottom_ptr_i[5:0] + 6'd5
                           : shift_valid_array[6] ? bottom_ptr_i[5:0] + 6'd6
                           : shift_valid_array[7] ? bottom_ptr_i[5:0] + 6'd7
                           : shift_valid_array[8] ? bottom_ptr_i[5:0] + 6'd8
                           : shift_valid_array[9] ? bottom_ptr_i[5:0] + 6'd9
                           : shift_valid_array[10] ? bottom_ptr_i[5:0] + 6'd10
                           : shift_valid_array[11] ? bottom_ptr_i[5:0] + 6'd11
                           : shift_valid_array[12] ? bottom_ptr_i[5:0] + 6'd12
                           : shift_valid_array[13] ? bottom_ptr_i[5:0] + 6'd13
                           : shift_valid_array[14] ? bottom_ptr_i[5:0] + 6'd14
                           : shift_valid_array[15] ? bottom_ptr_i[5:0] + 6'd15
                           : shift_valid_array[16] ? bottom_ptr_i[5:0] + 6'd16
                           : shift_valid_array[17] ? bottom_ptr_i[5:0] + 6'd17
                           : shift_valid_array[18] ? bottom_ptr_i[5:0] + 6'd18
                           : shift_valid_array[19] ? bottom_ptr_i[5:0] + 6'd19
                           : shift_valid_array[20] ? bottom_ptr_i[5:0] + 6'd20
                           : shift_valid_array[21] ? bottom_ptr_i[5:0] + 6'd21
                           : shift_valid_array[22] ? bottom_ptr_i[5:0] + 6'd22
                           : shift_valid_array[23] ? bottom_ptr_i[5:0] + 6'd23
                           : shift_valid_array[24] ? bottom_ptr_i[5:0] + 6'd24
                           : shift_valid_array[25] ? bottom_ptr_i[5:0] + 6'd25
                           : shift_valid_array[26] ? bottom_ptr_i[5:0] + 6'd26
                           : shift_valid_array[27] ? bottom_ptr_i[5:0] + 6'd27
                           : shift_valid_array[28] ? bottom_ptr_i[5:0] + 6'd28
                           : shift_valid_array[29] ? bottom_ptr_i[5:0] + 6'd29
                           : shift_valid_array[30] ? bottom_ptr_i[5:0] + 6'd30
                           : shift_valid_array[31] ? bottom_ptr_i[5:0] + 6'd31
                           : shift_valid_array[32] ? bottom_ptr_i[5:0] + 6'd32
                           : shift_valid_array[33] ? bottom_ptr_i[5:0] + 6'd33
                           : shift_valid_array[34] ? bottom_ptr_i[5:0] + 6'd34
                           : shift_valid_array[35] ? bottom_ptr_i[5:0] + 6'd35
                           : shift_valid_array[36] ? bottom_ptr_i[5:0] + 6'd36
                           : shift_valid_array[37] ? bottom_ptr_i[5:0] + 6'd37
                           : shift_valid_array[38] ? bottom_ptr_i[5:0] + 6'd38
                           : shift_valid_array[39] ? bottom_ptr_i[5:0] + 6'd39
                           : shift_valid_array[40] ? bottom_ptr_i[5:0] + 6'd40
                           : shift_valid_array[41] ? bottom_ptr_i[5:0] + 6'd41
                           : shift_valid_array[42] ? bottom_ptr_i[5:0] + 6'd42
                           : shift_valid_array[43] ? bottom_ptr_i[5:0] + 6'd43
                           : shift_valid_array[44] ? bottom_ptr_i[5:0] + 6'd44
                           : shift_valid_array[45] ? bottom_ptr_i[5:0] + 6'd45
                           : shift_valid_array[46] ? bottom_ptr_i[5:0] + 6'd46
                           : shift_valid_array[47] ? bottom_ptr_i[5:0] + 6'd47
                           : shift_valid_array[48] ? bottom_ptr_i[5:0] + 6'd48
                           : shift_valid_array[49] ? bottom_ptr_i[5:0] + 6'd49
                           : shift_valid_array[50] ? bottom_ptr_i[5:0] + 6'd50
                           : shift_valid_array[51] ? bottom_ptr_i[5:0] + 6'd51
                           : shift_valid_array[52] ? bottom_ptr_i[5:0] + 6'd52
                           : shift_valid_array[53] ? bottom_ptr_i[5:0] + 6'd53
                           : shift_valid_array[54] ? bottom_ptr_i[5:0] + 6'd54
                           : shift_valid_array[55] ? bottom_ptr_i[5:0] + 6'd55
                           : shift_valid_array[56] ? bottom_ptr_i[5:0] + 6'd56
                           : shift_valid_array[57] ? bottom_ptr_i[5:0] + 6'd57
                           : shift_valid_array[58] ? bottom_ptr_i[5:0] + 6'd58
                           : shift_valid_array[59] ? bottom_ptr_i[5:0] + 6'd59
                           : shift_valid_array[60] ? bottom_ptr_i[5:0] + 6'd60
                           : shift_valid_array[61] ? bottom_ptr_i[5:0] + 6'd61
                           : shift_valid_array[62] ? bottom_ptr_i[5:0] + 6'd62
                           : shift_valid_array[63] ? bottom_ptr_i[5:0] + 6'd63
                           : 6'd0;
endmodule
