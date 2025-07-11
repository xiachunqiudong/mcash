module shift_priority_arb (
  input  wire [15:0] valid_array_i,
  input  wire [3:0] bottom_ptr_i,
  output wire [3:0] issue_ptr_o
);

  wire [15:0] shift_valid_array;

  assign shift_valid_array[15:0] = {16{bottom_ptr_i[3:0] == 4'd0}} & valid_array_i[15:0]
                                 | {16{bottom_ptr_i[3:0] == 4'd1}} & {valid_array_i[0], valid_array_i[15:1]}
                                 | {16{bottom_ptr_i[3:0] == 4'd2}} & {valid_array_i[1:0], valid_array_i[15:2]}
                                 | {16{bottom_ptr_i[3:0] == 4'd3}} & {valid_array_i[2:0], valid_array_i[15:3]}
                                 | {16{bottom_ptr_i[3:0] == 4'd4}} & {valid_array_i[3:0], valid_array_i[15:4]}
                                 | {16{bottom_ptr_i[3:0] == 4'd5}} & {valid_array_i[4:0], valid_array_i[15:5]}
                                 | {16{bottom_ptr_i[3:0] == 4'd6}} & {valid_array_i[5:0], valid_array_i[15:6]}
                                 | {16{bottom_ptr_i[3:0] == 4'd7}} & {valid_array_i[6:0], valid_array_i[15:7]}
                                 | {16{bottom_ptr_i[3:0] == 4'd8}} & {valid_array_i[7:0], valid_array_i[15:8]}
                                 | {16{bottom_ptr_i[3:0] == 4'd9}} & {valid_array_i[8:0], valid_array_i[15:9]}
                                 | {16{bottom_ptr_i[3:0] == 4'd10}} & {valid_array_i[9:0], valid_array_i[15:10]}
                                 | {16{bottom_ptr_i[3:0] == 4'd11}} & {valid_array_i[10:0], valid_array_i[15:11]}
                                 | {16{bottom_ptr_i[3:0] == 4'd12}} & {valid_array_i[11:0], valid_array_i[15:12]}
                                 | {16{bottom_ptr_i[3:0] == 4'd13}} & {valid_array_i[12:0], valid_array_i[15:13]}
                                 | {16{bottom_ptr_i[3:0] == 4'd14}} & {valid_array_i[13:0], valid_array_i[15:14]}
                                 | {16{bottom_ptr_i[3:0] == 4'd15}} & {valid_array_i[14:0], valid_array_i[15]};

  assign issue_ptr_o[3:0] = shift_valid_array[0] ? bottom_ptr_i[3:0]
                           : shift_valid_array[1] ? bottom_ptr_i[3:0] + 16'd1
                           : shift_valid_array[2] ? bottom_ptr_i[3:0] + 16'd2
                           : shift_valid_array[3] ? bottom_ptr_i[3:0] + 16'd3
                           : shift_valid_array[4] ? bottom_ptr_i[3:0] + 16'd4
                           : shift_valid_array[5] ? bottom_ptr_i[3:0] + 16'd5
                           : shift_valid_array[6] ? bottom_ptr_i[3:0] + 16'd6
                           : shift_valid_array[7] ? bottom_ptr_i[3:0] + 16'd7
                           : shift_valid_array[8] ? bottom_ptr_i[3:0] + 16'd8
                           : shift_valid_array[9] ? bottom_ptr_i[3:0] + 16'd9
                           : shift_valid_array[10] ? bottom_ptr_i[3:0] + 16'd10
                           : shift_valid_array[11] ? bottom_ptr_i[3:0] + 16'd11
                           : shift_valid_array[12] ? bottom_ptr_i[3:0] + 16'd12
                           : shift_valid_array[13] ? bottom_ptr_i[3:0] + 16'd13
                           : shift_valid_array[14] ? bottom_ptr_i[3:0] + 16'd14
                           : shift_valid_array[15] ? bottom_ptr_i[3:0] + 16'd15
                           : 16'd0;
endmodule
