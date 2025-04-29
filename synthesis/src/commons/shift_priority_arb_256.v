module shift_priority_arb (
  input  wire [255:0] valid_array_i,
  input  wire [7:0] bottom_ptr_i,
  output wire [7:0] select_ptr_o
);

  wire [255:0] shift_valid_array;

  assign shift_valid_array[255:0] = {256{bottom_ptr_i[7:0] == 8'd0}} & valid_array_i[255:0]
                                  | {256{bottom_ptr_i[7:0] == 8'd1}} & {valid_array_i[0], valid_array_i[255:1]}
                                  | {256{bottom_ptr_i[7:0] == 8'd2}} & {valid_array_i[1:0], valid_array_i[255:2]}
                                  | {256{bottom_ptr_i[7:0] == 8'd3}} & {valid_array_i[2:0], valid_array_i[255:3]}
                                  | {256{bottom_ptr_i[7:0] == 8'd4}} & {valid_array_i[3:0], valid_array_i[255:4]}
                                  | {256{bottom_ptr_i[7:0] == 8'd5}} & {valid_array_i[4:0], valid_array_i[255:5]}
                                  | {256{bottom_ptr_i[7:0] == 8'd6}} & {valid_array_i[5:0], valid_array_i[255:6]}
                                  | {256{bottom_ptr_i[7:0] == 8'd7}} & {valid_array_i[6:0], valid_array_i[255:7]}
                                  | {256{bottom_ptr_i[7:0] == 8'd8}} & {valid_array_i[7:0], valid_array_i[255:8]}
                                  | {256{bottom_ptr_i[7:0] == 8'd9}} & {valid_array_i[8:0], valid_array_i[255:9]}
                                  | {256{bottom_ptr_i[7:0] == 8'd10}} & {valid_array_i[9:0], valid_array_i[255:10]}
                                  | {256{bottom_ptr_i[7:0] == 8'd11}} & {valid_array_i[10:0], valid_array_i[255:11]}
                                  | {256{bottom_ptr_i[7:0] == 8'd12}} & {valid_array_i[11:0], valid_array_i[255:12]}
                                  | {256{bottom_ptr_i[7:0] == 8'd13}} & {valid_array_i[12:0], valid_array_i[255:13]}
                                  | {256{bottom_ptr_i[7:0] == 8'd14}} & {valid_array_i[13:0], valid_array_i[255:14]}
                                  | {256{bottom_ptr_i[7:0] == 8'd15}} & {valid_array_i[14:0], valid_array_i[255:15]}
                                  | {256{bottom_ptr_i[7:0] == 8'd16}} & {valid_array_i[15:0], valid_array_i[255:16]}
                                  | {256{bottom_ptr_i[7:0] == 8'd17}} & {valid_array_i[16:0], valid_array_i[255:17]}
                                  | {256{bottom_ptr_i[7:0] == 8'd18}} & {valid_array_i[17:0], valid_array_i[255:18]}
                                  | {256{bottom_ptr_i[7:0] == 8'd19}} & {valid_array_i[18:0], valid_array_i[255:19]}
                                  | {256{bottom_ptr_i[7:0] == 8'd20}} & {valid_array_i[19:0], valid_array_i[255:20]}
                                  | {256{bottom_ptr_i[7:0] == 8'd21}} & {valid_array_i[20:0], valid_array_i[255:21]}
                                  | {256{bottom_ptr_i[7:0] == 8'd22}} & {valid_array_i[21:0], valid_array_i[255:22]}
                                  | {256{bottom_ptr_i[7:0] == 8'd23}} & {valid_array_i[22:0], valid_array_i[255:23]}
                                  | {256{bottom_ptr_i[7:0] == 8'd24}} & {valid_array_i[23:0], valid_array_i[255:24]}
                                  | {256{bottom_ptr_i[7:0] == 8'd25}} & {valid_array_i[24:0], valid_array_i[255:25]}
                                  | {256{bottom_ptr_i[7:0] == 8'd26}} & {valid_array_i[25:0], valid_array_i[255:26]}
                                  | {256{bottom_ptr_i[7:0] == 8'd27}} & {valid_array_i[26:0], valid_array_i[255:27]}
                                  | {256{bottom_ptr_i[7:0] == 8'd28}} & {valid_array_i[27:0], valid_array_i[255:28]}
                                  | {256{bottom_ptr_i[7:0] == 8'd29}} & {valid_array_i[28:0], valid_array_i[255:29]}
                                  | {256{bottom_ptr_i[7:0] == 8'd30}} & {valid_array_i[29:0], valid_array_i[255:30]}
                                  | {256{bottom_ptr_i[7:0] == 8'd31}} & {valid_array_i[30:0], valid_array_i[255:31]}
                                  | {256{bottom_ptr_i[7:0] == 8'd32}} & {valid_array_i[31:0], valid_array_i[255:32]}
                                  | {256{bottom_ptr_i[7:0] == 8'd33}} & {valid_array_i[32:0], valid_array_i[255:33]}
                                  | {256{bottom_ptr_i[7:0] == 8'd34}} & {valid_array_i[33:0], valid_array_i[255:34]}
                                  | {256{bottom_ptr_i[7:0] == 8'd35}} & {valid_array_i[34:0], valid_array_i[255:35]}
                                  | {256{bottom_ptr_i[7:0] == 8'd36}} & {valid_array_i[35:0], valid_array_i[255:36]}
                                  | {256{bottom_ptr_i[7:0] == 8'd37}} & {valid_array_i[36:0], valid_array_i[255:37]}
                                  | {256{bottom_ptr_i[7:0] == 8'd38}} & {valid_array_i[37:0], valid_array_i[255:38]}
                                  | {256{bottom_ptr_i[7:0] == 8'd39}} & {valid_array_i[38:0], valid_array_i[255:39]}
                                  | {256{bottom_ptr_i[7:0] == 8'd40}} & {valid_array_i[39:0], valid_array_i[255:40]}
                                  | {256{bottom_ptr_i[7:0] == 8'd41}} & {valid_array_i[40:0], valid_array_i[255:41]}
                                  | {256{bottom_ptr_i[7:0] == 8'd42}} & {valid_array_i[41:0], valid_array_i[255:42]}
                                  | {256{bottom_ptr_i[7:0] == 8'd43}} & {valid_array_i[42:0], valid_array_i[255:43]}
                                  | {256{bottom_ptr_i[7:0] == 8'd44}} & {valid_array_i[43:0], valid_array_i[255:44]}
                                  | {256{bottom_ptr_i[7:0] == 8'd45}} & {valid_array_i[44:0], valid_array_i[255:45]}
                                  | {256{bottom_ptr_i[7:0] == 8'd46}} & {valid_array_i[45:0], valid_array_i[255:46]}
                                  | {256{bottom_ptr_i[7:0] == 8'd47}} & {valid_array_i[46:0], valid_array_i[255:47]}
                                  | {256{bottom_ptr_i[7:0] == 8'd48}} & {valid_array_i[47:0], valid_array_i[255:48]}
                                  | {256{bottom_ptr_i[7:0] == 8'd49}} & {valid_array_i[48:0], valid_array_i[255:49]}
                                  | {256{bottom_ptr_i[7:0] == 8'd50}} & {valid_array_i[49:0], valid_array_i[255:50]}
                                  | {256{bottom_ptr_i[7:0] == 8'd51}} & {valid_array_i[50:0], valid_array_i[255:51]}
                                  | {256{bottom_ptr_i[7:0] == 8'd52}} & {valid_array_i[51:0], valid_array_i[255:52]}
                                  | {256{bottom_ptr_i[7:0] == 8'd53}} & {valid_array_i[52:0], valid_array_i[255:53]}
                                  | {256{bottom_ptr_i[7:0] == 8'd54}} & {valid_array_i[53:0], valid_array_i[255:54]}
                                  | {256{bottom_ptr_i[7:0] == 8'd55}} & {valid_array_i[54:0], valid_array_i[255:55]}
                                  | {256{bottom_ptr_i[7:0] == 8'd56}} & {valid_array_i[55:0], valid_array_i[255:56]}
                                  | {256{bottom_ptr_i[7:0] == 8'd57}} & {valid_array_i[56:0], valid_array_i[255:57]}
                                  | {256{bottom_ptr_i[7:0] == 8'd58}} & {valid_array_i[57:0], valid_array_i[255:58]}
                                  | {256{bottom_ptr_i[7:0] == 8'd59}} & {valid_array_i[58:0], valid_array_i[255:59]}
                                  | {256{bottom_ptr_i[7:0] == 8'd60}} & {valid_array_i[59:0], valid_array_i[255:60]}
                                  | {256{bottom_ptr_i[7:0] == 8'd61}} & {valid_array_i[60:0], valid_array_i[255:61]}
                                  | {256{bottom_ptr_i[7:0] == 8'd62}} & {valid_array_i[61:0], valid_array_i[255:62]}
                                  | {256{bottom_ptr_i[7:0] == 8'd63}} & {valid_array_i[62:0], valid_array_i[255:63]}
                                  | {256{bottom_ptr_i[7:0] == 8'd64}} & {valid_array_i[63:0], valid_array_i[255:64]}
                                  | {256{bottom_ptr_i[7:0] == 8'd65}} & {valid_array_i[64:0], valid_array_i[255:65]}
                                  | {256{bottom_ptr_i[7:0] == 8'd66}} & {valid_array_i[65:0], valid_array_i[255:66]}
                                  | {256{bottom_ptr_i[7:0] == 8'd67}} & {valid_array_i[66:0], valid_array_i[255:67]}
                                  | {256{bottom_ptr_i[7:0] == 8'd68}} & {valid_array_i[67:0], valid_array_i[255:68]}
                                  | {256{bottom_ptr_i[7:0] == 8'd69}} & {valid_array_i[68:0], valid_array_i[255:69]}
                                  | {256{bottom_ptr_i[7:0] == 8'd70}} & {valid_array_i[69:0], valid_array_i[255:70]}
                                  | {256{bottom_ptr_i[7:0] == 8'd71}} & {valid_array_i[70:0], valid_array_i[255:71]}
                                  | {256{bottom_ptr_i[7:0] == 8'd72}} & {valid_array_i[71:0], valid_array_i[255:72]}
                                  | {256{bottom_ptr_i[7:0] == 8'd73}} & {valid_array_i[72:0], valid_array_i[255:73]}
                                  | {256{bottom_ptr_i[7:0] == 8'd74}} & {valid_array_i[73:0], valid_array_i[255:74]}
                                  | {256{bottom_ptr_i[7:0] == 8'd75}} & {valid_array_i[74:0], valid_array_i[255:75]}
                                  | {256{bottom_ptr_i[7:0] == 8'd76}} & {valid_array_i[75:0], valid_array_i[255:76]}
                                  | {256{bottom_ptr_i[7:0] == 8'd77}} & {valid_array_i[76:0], valid_array_i[255:77]}
                                  | {256{bottom_ptr_i[7:0] == 8'd78}} & {valid_array_i[77:0], valid_array_i[255:78]}
                                  | {256{bottom_ptr_i[7:0] == 8'd79}} & {valid_array_i[78:0], valid_array_i[255:79]}
                                  | {256{bottom_ptr_i[7:0] == 8'd80}} & {valid_array_i[79:0], valid_array_i[255:80]}
                                  | {256{bottom_ptr_i[7:0] == 8'd81}} & {valid_array_i[80:0], valid_array_i[255:81]}
                                  | {256{bottom_ptr_i[7:0] == 8'd82}} & {valid_array_i[81:0], valid_array_i[255:82]}
                                  | {256{bottom_ptr_i[7:0] == 8'd83}} & {valid_array_i[82:0], valid_array_i[255:83]}
                                  | {256{bottom_ptr_i[7:0] == 8'd84}} & {valid_array_i[83:0], valid_array_i[255:84]}
                                  | {256{bottom_ptr_i[7:0] == 8'd85}} & {valid_array_i[84:0], valid_array_i[255:85]}
                                  | {256{bottom_ptr_i[7:0] == 8'd86}} & {valid_array_i[85:0], valid_array_i[255:86]}
                                  | {256{bottom_ptr_i[7:0] == 8'd87}} & {valid_array_i[86:0], valid_array_i[255:87]}
                                  | {256{bottom_ptr_i[7:0] == 8'd88}} & {valid_array_i[87:0], valid_array_i[255:88]}
                                  | {256{bottom_ptr_i[7:0] == 8'd89}} & {valid_array_i[88:0], valid_array_i[255:89]}
                                  | {256{bottom_ptr_i[7:0] == 8'd90}} & {valid_array_i[89:0], valid_array_i[255:90]}
                                  | {256{bottom_ptr_i[7:0] == 8'd91}} & {valid_array_i[90:0], valid_array_i[255:91]}
                                  | {256{bottom_ptr_i[7:0] == 8'd92}} & {valid_array_i[91:0], valid_array_i[255:92]}
                                  | {256{bottom_ptr_i[7:0] == 8'd93}} & {valid_array_i[92:0], valid_array_i[255:93]}
                                  | {256{bottom_ptr_i[7:0] == 8'd94}} & {valid_array_i[93:0], valid_array_i[255:94]}
                                  | {256{bottom_ptr_i[7:0] == 8'd95}} & {valid_array_i[94:0], valid_array_i[255:95]}
                                  | {256{bottom_ptr_i[7:0] == 8'd96}} & {valid_array_i[95:0], valid_array_i[255:96]}
                                  | {256{bottom_ptr_i[7:0] == 8'd97}} & {valid_array_i[96:0], valid_array_i[255:97]}
                                  | {256{bottom_ptr_i[7:0] == 8'd98}} & {valid_array_i[97:0], valid_array_i[255:98]}
                                  | {256{bottom_ptr_i[7:0] == 8'd99}} & {valid_array_i[98:0], valid_array_i[255:99]}
                                  | {256{bottom_ptr_i[7:0] == 8'd100}} & {valid_array_i[99:0], valid_array_i[255:100]}
                                  | {256{bottom_ptr_i[7:0] == 8'd101}} & {valid_array_i[100:0], valid_array_i[255:101]}
                                  | {256{bottom_ptr_i[7:0] == 8'd102}} & {valid_array_i[101:0], valid_array_i[255:102]}
                                  | {256{bottom_ptr_i[7:0] == 8'd103}} & {valid_array_i[102:0], valid_array_i[255:103]}
                                  | {256{bottom_ptr_i[7:0] == 8'd104}} & {valid_array_i[103:0], valid_array_i[255:104]}
                                  | {256{bottom_ptr_i[7:0] == 8'd105}} & {valid_array_i[104:0], valid_array_i[255:105]}
                                  | {256{bottom_ptr_i[7:0] == 8'd106}} & {valid_array_i[105:0], valid_array_i[255:106]}
                                  | {256{bottom_ptr_i[7:0] == 8'd107}} & {valid_array_i[106:0], valid_array_i[255:107]}
                                  | {256{bottom_ptr_i[7:0] == 8'd108}} & {valid_array_i[107:0], valid_array_i[255:108]}
                                  | {256{bottom_ptr_i[7:0] == 8'd109}} & {valid_array_i[108:0], valid_array_i[255:109]}
                                  | {256{bottom_ptr_i[7:0] == 8'd110}} & {valid_array_i[109:0], valid_array_i[255:110]}
                                  | {256{bottom_ptr_i[7:0] == 8'd111}} & {valid_array_i[110:0], valid_array_i[255:111]}
                                  | {256{bottom_ptr_i[7:0] == 8'd112}} & {valid_array_i[111:0], valid_array_i[255:112]}
                                  | {256{bottom_ptr_i[7:0] == 8'd113}} & {valid_array_i[112:0], valid_array_i[255:113]}
                                  | {256{bottom_ptr_i[7:0] == 8'd114}} & {valid_array_i[113:0], valid_array_i[255:114]}
                                  | {256{bottom_ptr_i[7:0] == 8'd115}} & {valid_array_i[114:0], valid_array_i[255:115]}
                                  | {256{bottom_ptr_i[7:0] == 8'd116}} & {valid_array_i[115:0], valid_array_i[255:116]}
                                  | {256{bottom_ptr_i[7:0] == 8'd117}} & {valid_array_i[116:0], valid_array_i[255:117]}
                                  | {256{bottom_ptr_i[7:0] == 8'd118}} & {valid_array_i[117:0], valid_array_i[255:118]}
                                  | {256{bottom_ptr_i[7:0] == 8'd119}} & {valid_array_i[118:0], valid_array_i[255:119]}
                                  | {256{bottom_ptr_i[7:0] == 8'd120}} & {valid_array_i[119:0], valid_array_i[255:120]}
                                  | {256{bottom_ptr_i[7:0] == 8'd121}} & {valid_array_i[120:0], valid_array_i[255:121]}
                                  | {256{bottom_ptr_i[7:0] == 8'd122}} & {valid_array_i[121:0], valid_array_i[255:122]}
                                  | {256{bottom_ptr_i[7:0] == 8'd123}} & {valid_array_i[122:0], valid_array_i[255:123]}
                                  | {256{bottom_ptr_i[7:0] == 8'd124}} & {valid_array_i[123:0], valid_array_i[255:124]}
                                  | {256{bottom_ptr_i[7:0] == 8'd125}} & {valid_array_i[124:0], valid_array_i[255:125]}
                                  | {256{bottom_ptr_i[7:0] == 8'd126}} & {valid_array_i[125:0], valid_array_i[255:126]}
                                  | {256{bottom_ptr_i[7:0] == 8'd127}} & {valid_array_i[126:0], valid_array_i[255:127]}
                                  | {256{bottom_ptr_i[7:0] == 8'd128}} & {valid_array_i[127:0], valid_array_i[255:128]}
                                  | {256{bottom_ptr_i[7:0] == 8'd129}} & {valid_array_i[128:0], valid_array_i[255:129]}
                                  | {256{bottom_ptr_i[7:0] == 8'd130}} & {valid_array_i[129:0], valid_array_i[255:130]}
                                  | {256{bottom_ptr_i[7:0] == 8'd131}} & {valid_array_i[130:0], valid_array_i[255:131]}
                                  | {256{bottom_ptr_i[7:0] == 8'd132}} & {valid_array_i[131:0], valid_array_i[255:132]}
                                  | {256{bottom_ptr_i[7:0] == 8'd133}} & {valid_array_i[132:0], valid_array_i[255:133]}
                                  | {256{bottom_ptr_i[7:0] == 8'd134}} & {valid_array_i[133:0], valid_array_i[255:134]}
                                  | {256{bottom_ptr_i[7:0] == 8'd135}} & {valid_array_i[134:0], valid_array_i[255:135]}
                                  | {256{bottom_ptr_i[7:0] == 8'd136}} & {valid_array_i[135:0], valid_array_i[255:136]}
                                  | {256{bottom_ptr_i[7:0] == 8'd137}} & {valid_array_i[136:0], valid_array_i[255:137]}
                                  | {256{bottom_ptr_i[7:0] == 8'd138}} & {valid_array_i[137:0], valid_array_i[255:138]}
                                  | {256{bottom_ptr_i[7:0] == 8'd139}} & {valid_array_i[138:0], valid_array_i[255:139]}
                                  | {256{bottom_ptr_i[7:0] == 8'd140}} & {valid_array_i[139:0], valid_array_i[255:140]}
                                  | {256{bottom_ptr_i[7:0] == 8'd141}} & {valid_array_i[140:0], valid_array_i[255:141]}
                                  | {256{bottom_ptr_i[7:0] == 8'd142}} & {valid_array_i[141:0], valid_array_i[255:142]}
                                  | {256{bottom_ptr_i[7:0] == 8'd143}} & {valid_array_i[142:0], valid_array_i[255:143]}
                                  | {256{bottom_ptr_i[7:0] == 8'd144}} & {valid_array_i[143:0], valid_array_i[255:144]}
                                  | {256{bottom_ptr_i[7:0] == 8'd145}} & {valid_array_i[144:0], valid_array_i[255:145]}
                                  | {256{bottom_ptr_i[7:0] == 8'd146}} & {valid_array_i[145:0], valid_array_i[255:146]}
                                  | {256{bottom_ptr_i[7:0] == 8'd147}} & {valid_array_i[146:0], valid_array_i[255:147]}
                                  | {256{bottom_ptr_i[7:0] == 8'd148}} & {valid_array_i[147:0], valid_array_i[255:148]}
                                  | {256{bottom_ptr_i[7:0] == 8'd149}} & {valid_array_i[148:0], valid_array_i[255:149]}
                                  | {256{bottom_ptr_i[7:0] == 8'd150}} & {valid_array_i[149:0], valid_array_i[255:150]}
                                  | {256{bottom_ptr_i[7:0] == 8'd151}} & {valid_array_i[150:0], valid_array_i[255:151]}
                                  | {256{bottom_ptr_i[7:0] == 8'd152}} & {valid_array_i[151:0], valid_array_i[255:152]}
                                  | {256{bottom_ptr_i[7:0] == 8'd153}} & {valid_array_i[152:0], valid_array_i[255:153]}
                                  | {256{bottom_ptr_i[7:0] == 8'd154}} & {valid_array_i[153:0], valid_array_i[255:154]}
                                  | {256{bottom_ptr_i[7:0] == 8'd155}} & {valid_array_i[154:0], valid_array_i[255:155]}
                                  | {256{bottom_ptr_i[7:0] == 8'd156}} & {valid_array_i[155:0], valid_array_i[255:156]}
                                  | {256{bottom_ptr_i[7:0] == 8'd157}} & {valid_array_i[156:0], valid_array_i[255:157]}
                                  | {256{bottom_ptr_i[7:0] == 8'd158}} & {valid_array_i[157:0], valid_array_i[255:158]}
                                  | {256{bottom_ptr_i[7:0] == 8'd159}} & {valid_array_i[158:0], valid_array_i[255:159]}
                                  | {256{bottom_ptr_i[7:0] == 8'd160}} & {valid_array_i[159:0], valid_array_i[255:160]}
                                  | {256{bottom_ptr_i[7:0] == 8'd161}} & {valid_array_i[160:0], valid_array_i[255:161]}
                                  | {256{bottom_ptr_i[7:0] == 8'd162}} & {valid_array_i[161:0], valid_array_i[255:162]}
                                  | {256{bottom_ptr_i[7:0] == 8'd163}} & {valid_array_i[162:0], valid_array_i[255:163]}
                                  | {256{bottom_ptr_i[7:0] == 8'd164}} & {valid_array_i[163:0], valid_array_i[255:164]}
                                  | {256{bottom_ptr_i[7:0] == 8'd165}} & {valid_array_i[164:0], valid_array_i[255:165]}
                                  | {256{bottom_ptr_i[7:0] == 8'd166}} & {valid_array_i[165:0], valid_array_i[255:166]}
                                  | {256{bottom_ptr_i[7:0] == 8'd167}} & {valid_array_i[166:0], valid_array_i[255:167]}
                                  | {256{bottom_ptr_i[7:0] == 8'd168}} & {valid_array_i[167:0], valid_array_i[255:168]}
                                  | {256{bottom_ptr_i[7:0] == 8'd169}} & {valid_array_i[168:0], valid_array_i[255:169]}
                                  | {256{bottom_ptr_i[7:0] == 8'd170}} & {valid_array_i[169:0], valid_array_i[255:170]}
                                  | {256{bottom_ptr_i[7:0] == 8'd171}} & {valid_array_i[170:0], valid_array_i[255:171]}
                                  | {256{bottom_ptr_i[7:0] == 8'd172}} & {valid_array_i[171:0], valid_array_i[255:172]}
                                  | {256{bottom_ptr_i[7:0] == 8'd173}} & {valid_array_i[172:0], valid_array_i[255:173]}
                                  | {256{bottom_ptr_i[7:0] == 8'd174}} & {valid_array_i[173:0], valid_array_i[255:174]}
                                  | {256{bottom_ptr_i[7:0] == 8'd175}} & {valid_array_i[174:0], valid_array_i[255:175]}
                                  | {256{bottom_ptr_i[7:0] == 8'd176}} & {valid_array_i[175:0], valid_array_i[255:176]}
                                  | {256{bottom_ptr_i[7:0] == 8'd177}} & {valid_array_i[176:0], valid_array_i[255:177]}
                                  | {256{bottom_ptr_i[7:0] == 8'd178}} & {valid_array_i[177:0], valid_array_i[255:178]}
                                  | {256{bottom_ptr_i[7:0] == 8'd179}} & {valid_array_i[178:0], valid_array_i[255:179]}
                                  | {256{bottom_ptr_i[7:0] == 8'd180}} & {valid_array_i[179:0], valid_array_i[255:180]}
                                  | {256{bottom_ptr_i[7:0] == 8'd181}} & {valid_array_i[180:0], valid_array_i[255:181]}
                                  | {256{bottom_ptr_i[7:0] == 8'd182}} & {valid_array_i[181:0], valid_array_i[255:182]}
                                  | {256{bottom_ptr_i[7:0] == 8'd183}} & {valid_array_i[182:0], valid_array_i[255:183]}
                                  | {256{bottom_ptr_i[7:0] == 8'd184}} & {valid_array_i[183:0], valid_array_i[255:184]}
                                  | {256{bottom_ptr_i[7:0] == 8'd185}} & {valid_array_i[184:0], valid_array_i[255:185]}
                                  | {256{bottom_ptr_i[7:0] == 8'd186}} & {valid_array_i[185:0], valid_array_i[255:186]}
                                  | {256{bottom_ptr_i[7:0] == 8'd187}} & {valid_array_i[186:0], valid_array_i[255:187]}
                                  | {256{bottom_ptr_i[7:0] == 8'd188}} & {valid_array_i[187:0], valid_array_i[255:188]}
                                  | {256{bottom_ptr_i[7:0] == 8'd189}} & {valid_array_i[188:0], valid_array_i[255:189]}
                                  | {256{bottom_ptr_i[7:0] == 8'd190}} & {valid_array_i[189:0], valid_array_i[255:190]}
                                  | {256{bottom_ptr_i[7:0] == 8'd191}} & {valid_array_i[190:0], valid_array_i[255:191]}
                                  | {256{bottom_ptr_i[7:0] == 8'd192}} & {valid_array_i[191:0], valid_array_i[255:192]}
                                  | {256{bottom_ptr_i[7:0] == 8'd193}} & {valid_array_i[192:0], valid_array_i[255:193]}
                                  | {256{bottom_ptr_i[7:0] == 8'd194}} & {valid_array_i[193:0], valid_array_i[255:194]}
                                  | {256{bottom_ptr_i[7:0] == 8'd195}} & {valid_array_i[194:0], valid_array_i[255:195]}
                                  | {256{bottom_ptr_i[7:0] == 8'd196}} & {valid_array_i[195:0], valid_array_i[255:196]}
                                  | {256{bottom_ptr_i[7:0] == 8'd197}} & {valid_array_i[196:0], valid_array_i[255:197]}
                                  | {256{bottom_ptr_i[7:0] == 8'd198}} & {valid_array_i[197:0], valid_array_i[255:198]}
                                  | {256{bottom_ptr_i[7:0] == 8'd199}} & {valid_array_i[198:0], valid_array_i[255:199]}
                                  | {256{bottom_ptr_i[7:0] == 8'd200}} & {valid_array_i[199:0], valid_array_i[255:200]}
                                  | {256{bottom_ptr_i[7:0] == 8'd201}} & {valid_array_i[200:0], valid_array_i[255:201]}
                                  | {256{bottom_ptr_i[7:0] == 8'd202}} & {valid_array_i[201:0], valid_array_i[255:202]}
                                  | {256{bottom_ptr_i[7:0] == 8'd203}} & {valid_array_i[202:0], valid_array_i[255:203]}
                                  | {256{bottom_ptr_i[7:0] == 8'd204}} & {valid_array_i[203:0], valid_array_i[255:204]}
                                  | {256{bottom_ptr_i[7:0] == 8'd205}} & {valid_array_i[204:0], valid_array_i[255:205]}
                                  | {256{bottom_ptr_i[7:0] == 8'd206}} & {valid_array_i[205:0], valid_array_i[255:206]}
                                  | {256{bottom_ptr_i[7:0] == 8'd207}} & {valid_array_i[206:0], valid_array_i[255:207]}
                                  | {256{bottom_ptr_i[7:0] == 8'd208}} & {valid_array_i[207:0], valid_array_i[255:208]}
                                  | {256{bottom_ptr_i[7:0] == 8'd209}} & {valid_array_i[208:0], valid_array_i[255:209]}
                                  | {256{bottom_ptr_i[7:0] == 8'd210}} & {valid_array_i[209:0], valid_array_i[255:210]}
                                  | {256{bottom_ptr_i[7:0] == 8'd211}} & {valid_array_i[210:0], valid_array_i[255:211]}
                                  | {256{bottom_ptr_i[7:0] == 8'd212}} & {valid_array_i[211:0], valid_array_i[255:212]}
                                  | {256{bottom_ptr_i[7:0] == 8'd213}} & {valid_array_i[212:0], valid_array_i[255:213]}
                                  | {256{bottom_ptr_i[7:0] == 8'd214}} & {valid_array_i[213:0], valid_array_i[255:214]}
                                  | {256{bottom_ptr_i[7:0] == 8'd215}} & {valid_array_i[214:0], valid_array_i[255:215]}
                                  | {256{bottom_ptr_i[7:0] == 8'd216}} & {valid_array_i[215:0], valid_array_i[255:216]}
                                  | {256{bottom_ptr_i[7:0] == 8'd217}} & {valid_array_i[216:0], valid_array_i[255:217]}
                                  | {256{bottom_ptr_i[7:0] == 8'd218}} & {valid_array_i[217:0], valid_array_i[255:218]}
                                  | {256{bottom_ptr_i[7:0] == 8'd219}} & {valid_array_i[218:0], valid_array_i[255:219]}
                                  | {256{bottom_ptr_i[7:0] == 8'd220}} & {valid_array_i[219:0], valid_array_i[255:220]}
                                  | {256{bottom_ptr_i[7:0] == 8'd221}} & {valid_array_i[220:0], valid_array_i[255:221]}
                                  | {256{bottom_ptr_i[7:0] == 8'd222}} & {valid_array_i[221:0], valid_array_i[255:222]}
                                  | {256{bottom_ptr_i[7:0] == 8'd223}} & {valid_array_i[222:0], valid_array_i[255:223]}
                                  | {256{bottom_ptr_i[7:0] == 8'd224}} & {valid_array_i[223:0], valid_array_i[255:224]}
                                  | {256{bottom_ptr_i[7:0] == 8'd225}} & {valid_array_i[224:0], valid_array_i[255:225]}
                                  | {256{bottom_ptr_i[7:0] == 8'd226}} & {valid_array_i[225:0], valid_array_i[255:226]}
                                  | {256{bottom_ptr_i[7:0] == 8'd227}} & {valid_array_i[226:0], valid_array_i[255:227]}
                                  | {256{bottom_ptr_i[7:0] == 8'd228}} & {valid_array_i[227:0], valid_array_i[255:228]}
                                  | {256{bottom_ptr_i[7:0] == 8'd229}} & {valid_array_i[228:0], valid_array_i[255:229]}
                                  | {256{bottom_ptr_i[7:0] == 8'd230}} & {valid_array_i[229:0], valid_array_i[255:230]}
                                  | {256{bottom_ptr_i[7:0] == 8'd231}} & {valid_array_i[230:0], valid_array_i[255:231]}
                                  | {256{bottom_ptr_i[7:0] == 8'd232}} & {valid_array_i[231:0], valid_array_i[255:232]}
                                  | {256{bottom_ptr_i[7:0] == 8'd233}} & {valid_array_i[232:0], valid_array_i[255:233]}
                                  | {256{bottom_ptr_i[7:0] == 8'd234}} & {valid_array_i[233:0], valid_array_i[255:234]}
                                  | {256{bottom_ptr_i[7:0] == 8'd235}} & {valid_array_i[234:0], valid_array_i[255:235]}
                                  | {256{bottom_ptr_i[7:0] == 8'd236}} & {valid_array_i[235:0], valid_array_i[255:236]}
                                  | {256{bottom_ptr_i[7:0] == 8'd237}} & {valid_array_i[236:0], valid_array_i[255:237]}
                                  | {256{bottom_ptr_i[7:0] == 8'd238}} & {valid_array_i[237:0], valid_array_i[255:238]}
                                  | {256{bottom_ptr_i[7:0] == 8'd239}} & {valid_array_i[238:0], valid_array_i[255:239]}
                                  | {256{bottom_ptr_i[7:0] == 8'd240}} & {valid_array_i[239:0], valid_array_i[255:240]}
                                  | {256{bottom_ptr_i[7:0] == 8'd241}} & {valid_array_i[240:0], valid_array_i[255:241]}
                                  | {256{bottom_ptr_i[7:0] == 8'd242}} & {valid_array_i[241:0], valid_array_i[255:242]}
                                  | {256{bottom_ptr_i[7:0] == 8'd243}} & {valid_array_i[242:0], valid_array_i[255:243]}
                                  | {256{bottom_ptr_i[7:0] == 8'd244}} & {valid_array_i[243:0], valid_array_i[255:244]}
                                  | {256{bottom_ptr_i[7:0] == 8'd245}} & {valid_array_i[244:0], valid_array_i[255:245]}
                                  | {256{bottom_ptr_i[7:0] == 8'd246}} & {valid_array_i[245:0], valid_array_i[255:246]}
                                  | {256{bottom_ptr_i[7:0] == 8'd247}} & {valid_array_i[246:0], valid_array_i[255:247]}
                                  | {256{bottom_ptr_i[7:0] == 8'd248}} & {valid_array_i[247:0], valid_array_i[255:248]}
                                  | {256{bottom_ptr_i[7:0] == 8'd249}} & {valid_array_i[248:0], valid_array_i[255:249]}
                                  | {256{bottom_ptr_i[7:0] == 8'd250}} & {valid_array_i[249:0], valid_array_i[255:250]}
                                  | {256{bottom_ptr_i[7:0] == 8'd251}} & {valid_array_i[250:0], valid_array_i[255:251]}
                                  | {256{bottom_ptr_i[7:0] == 8'd252}} & {valid_array_i[251:0], valid_array_i[255:252]}
                                  | {256{bottom_ptr_i[7:0] == 8'd253}} & {valid_array_i[252:0], valid_array_i[255:253]}
                                  | {256{bottom_ptr_i[7:0] == 8'd254}} & {valid_array_i[253:0], valid_array_i[255:254]}
                                  | {256{bottom_ptr_i[7:0] == 8'd255}} & {valid_array_i[254:0], valid_array_i[255]};

  assign select_ptr_o[7:0] = shift_valid_array[0] ? bottom_ptr_i[7:0]
                           : shift_valid_array[1] ? bottom_ptr_i[7:0] + 8'd1
                           : shift_valid_array[2] ? bottom_ptr_i[7:0] + 8'd2
                           : shift_valid_array[3] ? bottom_ptr_i[7:0] + 8'd3
                           : shift_valid_array[4] ? bottom_ptr_i[7:0] + 8'd4
                           : shift_valid_array[5] ? bottom_ptr_i[7:0] + 8'd5
                           : shift_valid_array[6] ? bottom_ptr_i[7:0] + 8'd6
                           : shift_valid_array[7] ? bottom_ptr_i[7:0] + 8'd7
                           : shift_valid_array[8] ? bottom_ptr_i[7:0] + 8'd8
                           : shift_valid_array[9] ? bottom_ptr_i[7:0] + 8'd9
                           : shift_valid_array[10] ? bottom_ptr_i[7:0] + 8'd10
                           : shift_valid_array[11] ? bottom_ptr_i[7:0] + 8'd11
                           : shift_valid_array[12] ? bottom_ptr_i[7:0] + 8'd12
                           : shift_valid_array[13] ? bottom_ptr_i[7:0] + 8'd13
                           : shift_valid_array[14] ? bottom_ptr_i[7:0] + 8'd14
                           : shift_valid_array[15] ? bottom_ptr_i[7:0] + 8'd15
                           : shift_valid_array[16] ? bottom_ptr_i[7:0] + 8'd16
                           : shift_valid_array[17] ? bottom_ptr_i[7:0] + 8'd17
                           : shift_valid_array[18] ? bottom_ptr_i[7:0] + 8'd18
                           : shift_valid_array[19] ? bottom_ptr_i[7:0] + 8'd19
                           : shift_valid_array[20] ? bottom_ptr_i[7:0] + 8'd20
                           : shift_valid_array[21] ? bottom_ptr_i[7:0] + 8'd21
                           : shift_valid_array[22] ? bottom_ptr_i[7:0] + 8'd22
                           : shift_valid_array[23] ? bottom_ptr_i[7:0] + 8'd23
                           : shift_valid_array[24] ? bottom_ptr_i[7:0] + 8'd24
                           : shift_valid_array[25] ? bottom_ptr_i[7:0] + 8'd25
                           : shift_valid_array[26] ? bottom_ptr_i[7:0] + 8'd26
                           : shift_valid_array[27] ? bottom_ptr_i[7:0] + 8'd27
                           : shift_valid_array[28] ? bottom_ptr_i[7:0] + 8'd28
                           : shift_valid_array[29] ? bottom_ptr_i[7:0] + 8'd29
                           : shift_valid_array[30] ? bottom_ptr_i[7:0] + 8'd30
                           : shift_valid_array[31] ? bottom_ptr_i[7:0] + 8'd31
                           : shift_valid_array[32] ? bottom_ptr_i[7:0] + 8'd32
                           : shift_valid_array[33] ? bottom_ptr_i[7:0] + 8'd33
                           : shift_valid_array[34] ? bottom_ptr_i[7:0] + 8'd34
                           : shift_valid_array[35] ? bottom_ptr_i[7:0] + 8'd35
                           : shift_valid_array[36] ? bottom_ptr_i[7:0] + 8'd36
                           : shift_valid_array[37] ? bottom_ptr_i[7:0] + 8'd37
                           : shift_valid_array[38] ? bottom_ptr_i[7:0] + 8'd38
                           : shift_valid_array[39] ? bottom_ptr_i[7:0] + 8'd39
                           : shift_valid_array[40] ? bottom_ptr_i[7:0] + 8'd40
                           : shift_valid_array[41] ? bottom_ptr_i[7:0] + 8'd41
                           : shift_valid_array[42] ? bottom_ptr_i[7:0] + 8'd42
                           : shift_valid_array[43] ? bottom_ptr_i[7:0] + 8'd43
                           : shift_valid_array[44] ? bottom_ptr_i[7:0] + 8'd44
                           : shift_valid_array[45] ? bottom_ptr_i[7:0] + 8'd45
                           : shift_valid_array[46] ? bottom_ptr_i[7:0] + 8'd46
                           : shift_valid_array[47] ? bottom_ptr_i[7:0] + 8'd47
                           : shift_valid_array[48] ? bottom_ptr_i[7:0] + 8'd48
                           : shift_valid_array[49] ? bottom_ptr_i[7:0] + 8'd49
                           : shift_valid_array[50] ? bottom_ptr_i[7:0] + 8'd50
                           : shift_valid_array[51] ? bottom_ptr_i[7:0] + 8'd51
                           : shift_valid_array[52] ? bottom_ptr_i[7:0] + 8'd52
                           : shift_valid_array[53] ? bottom_ptr_i[7:0] + 8'd53
                           : shift_valid_array[54] ? bottom_ptr_i[7:0] + 8'd54
                           : shift_valid_array[55] ? bottom_ptr_i[7:0] + 8'd55
                           : shift_valid_array[56] ? bottom_ptr_i[7:0] + 8'd56
                           : shift_valid_array[57] ? bottom_ptr_i[7:0] + 8'd57
                           : shift_valid_array[58] ? bottom_ptr_i[7:0] + 8'd58
                           : shift_valid_array[59] ? bottom_ptr_i[7:0] + 8'd59
                           : shift_valid_array[60] ? bottom_ptr_i[7:0] + 8'd60
                           : shift_valid_array[61] ? bottom_ptr_i[7:0] + 8'd61
                           : shift_valid_array[62] ? bottom_ptr_i[7:0] + 8'd62
                           : shift_valid_array[63] ? bottom_ptr_i[7:0] + 8'd63
                           : shift_valid_array[64] ? bottom_ptr_i[7:0] + 8'd64
                           : shift_valid_array[65] ? bottom_ptr_i[7:0] + 8'd65
                           : shift_valid_array[66] ? bottom_ptr_i[7:0] + 8'd66
                           : shift_valid_array[67] ? bottom_ptr_i[7:0] + 8'd67
                           : shift_valid_array[68] ? bottom_ptr_i[7:0] + 8'd68
                           : shift_valid_array[69] ? bottom_ptr_i[7:0] + 8'd69
                           : shift_valid_array[70] ? bottom_ptr_i[7:0] + 8'd70
                           : shift_valid_array[71] ? bottom_ptr_i[7:0] + 8'd71
                           : shift_valid_array[72] ? bottom_ptr_i[7:0] + 8'd72
                           : shift_valid_array[73] ? bottom_ptr_i[7:0] + 8'd73
                           : shift_valid_array[74] ? bottom_ptr_i[7:0] + 8'd74
                           : shift_valid_array[75] ? bottom_ptr_i[7:0] + 8'd75
                           : shift_valid_array[76] ? bottom_ptr_i[7:0] + 8'd76
                           : shift_valid_array[77] ? bottom_ptr_i[7:0] + 8'd77
                           : shift_valid_array[78] ? bottom_ptr_i[7:0] + 8'd78
                           : shift_valid_array[79] ? bottom_ptr_i[7:0] + 8'd79
                           : shift_valid_array[80] ? bottom_ptr_i[7:0] + 8'd80
                           : shift_valid_array[81] ? bottom_ptr_i[7:0] + 8'd81
                           : shift_valid_array[82] ? bottom_ptr_i[7:0] + 8'd82
                           : shift_valid_array[83] ? bottom_ptr_i[7:0] + 8'd83
                           : shift_valid_array[84] ? bottom_ptr_i[7:0] + 8'd84
                           : shift_valid_array[85] ? bottom_ptr_i[7:0] + 8'd85
                           : shift_valid_array[86] ? bottom_ptr_i[7:0] + 8'd86
                           : shift_valid_array[87] ? bottom_ptr_i[7:0] + 8'd87
                           : shift_valid_array[88] ? bottom_ptr_i[7:0] + 8'd88
                           : shift_valid_array[89] ? bottom_ptr_i[7:0] + 8'd89
                           : shift_valid_array[90] ? bottom_ptr_i[7:0] + 8'd90
                           : shift_valid_array[91] ? bottom_ptr_i[7:0] + 8'd91
                           : shift_valid_array[92] ? bottom_ptr_i[7:0] + 8'd92
                           : shift_valid_array[93] ? bottom_ptr_i[7:0] + 8'd93
                           : shift_valid_array[94] ? bottom_ptr_i[7:0] + 8'd94
                           : shift_valid_array[95] ? bottom_ptr_i[7:0] + 8'd95
                           : shift_valid_array[96] ? bottom_ptr_i[7:0] + 8'd96
                           : shift_valid_array[97] ? bottom_ptr_i[7:0] + 8'd97
                           : shift_valid_array[98] ? bottom_ptr_i[7:0] + 8'd98
                           : shift_valid_array[99] ? bottom_ptr_i[7:0] + 8'd99
                           : shift_valid_array[100] ? bottom_ptr_i[7:0] + 8'd100
                           : shift_valid_array[101] ? bottom_ptr_i[7:0] + 8'd101
                           : shift_valid_array[102] ? bottom_ptr_i[7:0] + 8'd102
                           : shift_valid_array[103] ? bottom_ptr_i[7:0] + 8'd103
                           : shift_valid_array[104] ? bottom_ptr_i[7:0] + 8'd104
                           : shift_valid_array[105] ? bottom_ptr_i[7:0] + 8'd105
                           : shift_valid_array[106] ? bottom_ptr_i[7:0] + 8'd106
                           : shift_valid_array[107] ? bottom_ptr_i[7:0] + 8'd107
                           : shift_valid_array[108] ? bottom_ptr_i[7:0] + 8'd108
                           : shift_valid_array[109] ? bottom_ptr_i[7:0] + 8'd109
                           : shift_valid_array[110] ? bottom_ptr_i[7:0] + 8'd110
                           : shift_valid_array[111] ? bottom_ptr_i[7:0] + 8'd111
                           : shift_valid_array[112] ? bottom_ptr_i[7:0] + 8'd112
                           : shift_valid_array[113] ? bottom_ptr_i[7:0] + 8'd113
                           : shift_valid_array[114] ? bottom_ptr_i[7:0] + 8'd114
                           : shift_valid_array[115] ? bottom_ptr_i[7:0] + 8'd115
                           : shift_valid_array[116] ? bottom_ptr_i[7:0] + 8'd116
                           : shift_valid_array[117] ? bottom_ptr_i[7:0] + 8'd117
                           : shift_valid_array[118] ? bottom_ptr_i[7:0] + 8'd118
                           : shift_valid_array[119] ? bottom_ptr_i[7:0] + 8'd119
                           : shift_valid_array[120] ? bottom_ptr_i[7:0] + 8'd120
                           : shift_valid_array[121] ? bottom_ptr_i[7:0] + 8'd121
                           : shift_valid_array[122] ? bottom_ptr_i[7:0] + 8'd122
                           : shift_valid_array[123] ? bottom_ptr_i[7:0] + 8'd123
                           : shift_valid_array[124] ? bottom_ptr_i[7:0] + 8'd124
                           : shift_valid_array[125] ? bottom_ptr_i[7:0] + 8'd125
                           : shift_valid_array[126] ? bottom_ptr_i[7:0] + 8'd126
                           : shift_valid_array[127] ? bottom_ptr_i[7:0] + 8'd127
                           : shift_valid_array[128] ? bottom_ptr_i[7:0] + 8'd128
                           : shift_valid_array[129] ? bottom_ptr_i[7:0] + 8'd129
                           : shift_valid_array[130] ? bottom_ptr_i[7:0] + 8'd130
                           : shift_valid_array[131] ? bottom_ptr_i[7:0] + 8'd131
                           : shift_valid_array[132] ? bottom_ptr_i[7:0] + 8'd132
                           : shift_valid_array[133] ? bottom_ptr_i[7:0] + 8'd133
                           : shift_valid_array[134] ? bottom_ptr_i[7:0] + 8'd134
                           : shift_valid_array[135] ? bottom_ptr_i[7:0] + 8'd135
                           : shift_valid_array[136] ? bottom_ptr_i[7:0] + 8'd136
                           : shift_valid_array[137] ? bottom_ptr_i[7:0] + 8'd137
                           : shift_valid_array[138] ? bottom_ptr_i[7:0] + 8'd138
                           : shift_valid_array[139] ? bottom_ptr_i[7:0] + 8'd139
                           : shift_valid_array[140] ? bottom_ptr_i[7:0] + 8'd140
                           : shift_valid_array[141] ? bottom_ptr_i[7:0] + 8'd141
                           : shift_valid_array[142] ? bottom_ptr_i[7:0] + 8'd142
                           : shift_valid_array[143] ? bottom_ptr_i[7:0] + 8'd143
                           : shift_valid_array[144] ? bottom_ptr_i[7:0] + 8'd144
                           : shift_valid_array[145] ? bottom_ptr_i[7:0] + 8'd145
                           : shift_valid_array[146] ? bottom_ptr_i[7:0] + 8'd146
                           : shift_valid_array[147] ? bottom_ptr_i[7:0] + 8'd147
                           : shift_valid_array[148] ? bottom_ptr_i[7:0] + 8'd148
                           : shift_valid_array[149] ? bottom_ptr_i[7:0] + 8'd149
                           : shift_valid_array[150] ? bottom_ptr_i[7:0] + 8'd150
                           : shift_valid_array[151] ? bottom_ptr_i[7:0] + 8'd151
                           : shift_valid_array[152] ? bottom_ptr_i[7:0] + 8'd152
                           : shift_valid_array[153] ? bottom_ptr_i[7:0] + 8'd153
                           : shift_valid_array[154] ? bottom_ptr_i[7:0] + 8'd154
                           : shift_valid_array[155] ? bottom_ptr_i[7:0] + 8'd155
                           : shift_valid_array[156] ? bottom_ptr_i[7:0] + 8'd156
                           : shift_valid_array[157] ? bottom_ptr_i[7:0] + 8'd157
                           : shift_valid_array[158] ? bottom_ptr_i[7:0] + 8'd158
                           : shift_valid_array[159] ? bottom_ptr_i[7:0] + 8'd159
                           : shift_valid_array[160] ? bottom_ptr_i[7:0] + 8'd160
                           : shift_valid_array[161] ? bottom_ptr_i[7:0] + 8'd161
                           : shift_valid_array[162] ? bottom_ptr_i[7:0] + 8'd162
                           : shift_valid_array[163] ? bottom_ptr_i[7:0] + 8'd163
                           : shift_valid_array[164] ? bottom_ptr_i[7:0] + 8'd164
                           : shift_valid_array[165] ? bottom_ptr_i[7:0] + 8'd165
                           : shift_valid_array[166] ? bottom_ptr_i[7:0] + 8'd166
                           : shift_valid_array[167] ? bottom_ptr_i[7:0] + 8'd167
                           : shift_valid_array[168] ? bottom_ptr_i[7:0] + 8'd168
                           : shift_valid_array[169] ? bottom_ptr_i[7:0] + 8'd169
                           : shift_valid_array[170] ? bottom_ptr_i[7:0] + 8'd170
                           : shift_valid_array[171] ? bottom_ptr_i[7:0] + 8'd171
                           : shift_valid_array[172] ? bottom_ptr_i[7:0] + 8'd172
                           : shift_valid_array[173] ? bottom_ptr_i[7:0] + 8'd173
                           : shift_valid_array[174] ? bottom_ptr_i[7:0] + 8'd174
                           : shift_valid_array[175] ? bottom_ptr_i[7:0] + 8'd175
                           : shift_valid_array[176] ? bottom_ptr_i[7:0] + 8'd176
                           : shift_valid_array[177] ? bottom_ptr_i[7:0] + 8'd177
                           : shift_valid_array[178] ? bottom_ptr_i[7:0] + 8'd178
                           : shift_valid_array[179] ? bottom_ptr_i[7:0] + 8'd179
                           : shift_valid_array[180] ? bottom_ptr_i[7:0] + 8'd180
                           : shift_valid_array[181] ? bottom_ptr_i[7:0] + 8'd181
                           : shift_valid_array[182] ? bottom_ptr_i[7:0] + 8'd182
                           : shift_valid_array[183] ? bottom_ptr_i[7:0] + 8'd183
                           : shift_valid_array[184] ? bottom_ptr_i[7:0] + 8'd184
                           : shift_valid_array[185] ? bottom_ptr_i[7:0] + 8'd185
                           : shift_valid_array[186] ? bottom_ptr_i[7:0] + 8'd186
                           : shift_valid_array[187] ? bottom_ptr_i[7:0] + 8'd187
                           : shift_valid_array[188] ? bottom_ptr_i[7:0] + 8'd188
                           : shift_valid_array[189] ? bottom_ptr_i[7:0] + 8'd189
                           : shift_valid_array[190] ? bottom_ptr_i[7:0] + 8'd190
                           : shift_valid_array[191] ? bottom_ptr_i[7:0] + 8'd191
                           : shift_valid_array[192] ? bottom_ptr_i[7:0] + 8'd192
                           : shift_valid_array[193] ? bottom_ptr_i[7:0] + 8'd193
                           : shift_valid_array[194] ? bottom_ptr_i[7:0] + 8'd194
                           : shift_valid_array[195] ? bottom_ptr_i[7:0] + 8'd195
                           : shift_valid_array[196] ? bottom_ptr_i[7:0] + 8'd196
                           : shift_valid_array[197] ? bottom_ptr_i[7:0] + 8'd197
                           : shift_valid_array[198] ? bottom_ptr_i[7:0] + 8'd198
                           : shift_valid_array[199] ? bottom_ptr_i[7:0] + 8'd199
                           : shift_valid_array[200] ? bottom_ptr_i[7:0] + 8'd200
                           : shift_valid_array[201] ? bottom_ptr_i[7:0] + 8'd201
                           : shift_valid_array[202] ? bottom_ptr_i[7:0] + 8'd202
                           : shift_valid_array[203] ? bottom_ptr_i[7:0] + 8'd203
                           : shift_valid_array[204] ? bottom_ptr_i[7:0] + 8'd204
                           : shift_valid_array[205] ? bottom_ptr_i[7:0] + 8'd205
                           : shift_valid_array[206] ? bottom_ptr_i[7:0] + 8'd206
                           : shift_valid_array[207] ? bottom_ptr_i[7:0] + 8'd207
                           : shift_valid_array[208] ? bottom_ptr_i[7:0] + 8'd208
                           : shift_valid_array[209] ? bottom_ptr_i[7:0] + 8'd209
                           : shift_valid_array[210] ? bottom_ptr_i[7:0] + 8'd210
                           : shift_valid_array[211] ? bottom_ptr_i[7:0] + 8'd211
                           : shift_valid_array[212] ? bottom_ptr_i[7:0] + 8'd212
                           : shift_valid_array[213] ? bottom_ptr_i[7:0] + 8'd213
                           : shift_valid_array[214] ? bottom_ptr_i[7:0] + 8'd214
                           : shift_valid_array[215] ? bottom_ptr_i[7:0] + 8'd215
                           : shift_valid_array[216] ? bottom_ptr_i[7:0] + 8'd216
                           : shift_valid_array[217] ? bottom_ptr_i[7:0] + 8'd217
                           : shift_valid_array[218] ? bottom_ptr_i[7:0] + 8'd218
                           : shift_valid_array[219] ? bottom_ptr_i[7:0] + 8'd219
                           : shift_valid_array[220] ? bottom_ptr_i[7:0] + 8'd220
                           : shift_valid_array[221] ? bottom_ptr_i[7:0] + 8'd221
                           : shift_valid_array[222] ? bottom_ptr_i[7:0] + 8'd222
                           : shift_valid_array[223] ? bottom_ptr_i[7:0] + 8'd223
                           : shift_valid_array[224] ? bottom_ptr_i[7:0] + 8'd224
                           : shift_valid_array[225] ? bottom_ptr_i[7:0] + 8'd225
                           : shift_valid_array[226] ? bottom_ptr_i[7:0] + 8'd226
                           : shift_valid_array[227] ? bottom_ptr_i[7:0] + 8'd227
                           : shift_valid_array[228] ? bottom_ptr_i[7:0] + 8'd228
                           : shift_valid_array[229] ? bottom_ptr_i[7:0] + 8'd229
                           : shift_valid_array[230] ? bottom_ptr_i[7:0] + 8'd230
                           : shift_valid_array[231] ? bottom_ptr_i[7:0] + 8'd231
                           : shift_valid_array[232] ? bottom_ptr_i[7:0] + 8'd232
                           : shift_valid_array[233] ? bottom_ptr_i[7:0] + 8'd233
                           : shift_valid_array[234] ? bottom_ptr_i[7:0] + 8'd234
                           : shift_valid_array[235] ? bottom_ptr_i[7:0] + 8'd235
                           : shift_valid_array[236] ? bottom_ptr_i[7:0] + 8'd236
                           : shift_valid_array[237] ? bottom_ptr_i[7:0] + 8'd237
                           : shift_valid_array[238] ? bottom_ptr_i[7:0] + 8'd238
                           : shift_valid_array[239] ? bottom_ptr_i[7:0] + 8'd239
                           : shift_valid_array[240] ? bottom_ptr_i[7:0] + 8'd240
                           : shift_valid_array[241] ? bottom_ptr_i[7:0] + 8'd241
                           : shift_valid_array[242] ? bottom_ptr_i[7:0] + 8'd242
                           : shift_valid_array[243] ? bottom_ptr_i[7:0] + 8'd243
                           : shift_valid_array[244] ? bottom_ptr_i[7:0] + 8'd244
                           : shift_valid_array[245] ? bottom_ptr_i[7:0] + 8'd245
                           : shift_valid_array[246] ? bottom_ptr_i[7:0] + 8'd246
                           : shift_valid_array[247] ? bottom_ptr_i[7:0] + 8'd247
                           : shift_valid_array[248] ? bottom_ptr_i[7:0] + 8'd248
                           : shift_valid_array[249] ? bottom_ptr_i[7:0] + 8'd249
                           : shift_valid_array[250] ? bottom_ptr_i[7:0] + 8'd250
                           : shift_valid_array[251] ? bottom_ptr_i[7:0] + 8'd251
                           : shift_valid_array[252] ? bottom_ptr_i[7:0] + 8'd252
                           : shift_valid_array[253] ? bottom_ptr_i[7:0] + 8'd253
                           : shift_valid_array[254] ? bottom_ptr_i[7:0] + 8'd254
                           : shift_valid_array[255] ? bottom_ptr_i[7:0] + 8'd255
                           : 8'd0;
endmodule
