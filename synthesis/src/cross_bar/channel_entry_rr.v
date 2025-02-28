module channel_entry_rr(
  input  wire [4:0] channel_array_valid_i,
  input  wire [2:0] read_ptr_i,
  input  wire [4:0] read_ptr_dcd_i,
  output wire [2:0] entry_id_o
);

  wire [4:0] shift_array_valid;
  wire [3:0] read_ptr_incr;
  wire [3:0] select_ptr;
  wire [3:0] real_select_ptr;

  assign shift_array_valid[4:0] = {5{read_ptr_dcd_i[0]}} & channel_array_valid_i[4:0]
                                | {5{read_ptr_dcd_i[1]}} & {channel_array_valid_i[0],   channel_array_valid_i[4:1]}
                                | {5{read_ptr_dcd_i[2]}} & {channel_array_valid_i[1:0], channel_array_valid_i[4:2]}
                                | {5{read_ptr_dcd_i[3]}} & {channel_array_valid_i[2:0], channel_array_valid_i[4:3]}
                                | {5{read_ptr_dcd_i[4]}} & {channel_array_valid_i[3:0], channel_array_valid_i[4]};

  assign read_ptr_incr[3:0] = shift_array_valid[0] ? 4'd0
                            : shift_array_valid[1] ? 4'd1
                            : shift_array_valid[2] ? 4'd2
                            : shift_array_valid[3] ? 4'd3
                            : shift_array_valid[4] ? 4'd4
                            :                        4'd0;

  assign select_ptr[3:0] = {1'b0, read_ptr_i[2:0]} + read_ptr_incr[3:0];

  assign real_select_ptr[3:0] = select_ptr[3:0] < 4'd5
                              ? select_ptr[3:0]
                              : select_ptr[3:0] - 4'd5;

  assign entry_id_o[2:0] = real_select_ptr[2:0];

endmodule