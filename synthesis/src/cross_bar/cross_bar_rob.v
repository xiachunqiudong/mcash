module cross_bar_rob #(
  parameter CHANNEL_ID = 0
)(
  input  wire         clk_i,
  input  wire         rst_i,
  input  wire         bank0_sc_xbar_valid_i,
  output wire         bank0_sc_xbar_allowIn_o,
  input  wire [1:0]   bank0_sc_xbar_ch_id_i,
  input  wire [2:0]   bank0_sc_xbar_rob_num_i,
  input  wire [127:0] bank0_sc_xbar_data_i,
  input  wire         bank1_sc_xbar_valid_i,
  output wire         bank1_sc_xbar_allowIn_o,
  input  wire [1:0]   bank1_sc_xbar_ch_id_i,
  input  wire [2:0]   bank1_sc_xbar_rob_num_i,
  input  wire [127:0] bank1_sc_xbar_data_i,
  input  wire         bank2_sc_xbar_valid_i,
  output wire         bank2_sc_xbar_allowIn_o,
  input  wire [1:0]   bank2_sc_xbar_ch_id_i,
  input  wire [2:0]   bank2_sc_xbar_rob_num_i,
  input  wire [127:0] bank2_sc_xbar_data_i,
  input  wire         bank3_sc_xbar_valid_i,
  output wire         bank3_sc_xbar_allowIn_o,
  input  wire [1:0]   bank3_sc_xbar_ch_id_i,
  input  wire [2:0]   bank3_sc_xbar_rob_num_i,
  input  wire [127:0] bank3_sc_xbar_data_i
);
  

  wire bank0_spw_buffer_wen;
  wire bank1_spw_buffer_wen;
  wire bank2_spw_buffer_wen;
  wire bank3_spw_buffer_wen;
  wire bank0_spw_buffer_ren;
  wire bank1_spw_buffer_ren;
  wire bank2_spw_buffer_ren;
  wire bank3_spw_buffer_ren;
  wire [2:0] bank0_spw_buffer_read_ptr;
  wire [2:0] bank1_spw_buffer_read_ptr;
  wire [2:0] bank2_spw_buffer_read_ptr;
  wire [2:0] bank3_spw_buffer_read_ptr;


  assign bank0_spw_buffer_wen = bank0_sc_xbar_valid_i
                              & bank0_sc_xbar_ch_id_i[1:0] == CHANNEL_ID[1:0];

  spw_buffer
  bank0_spw_buffer(
    .clk_i       (clk_i),
    .rst_i       (rst_i),
    .wr_en_i     (bank0_spw_buffer_wen),
    .write_ptr_i (bank0_sc_xbar_rob_num_i[2:0]),
    .write_data_i(bank0_sc_xbar_data_i[127:0]),
    .rd_en_i     (bank0_spw_buffer_ren),
    .read_ptr_i  (bank0_spw_buffer_read_ptr[2:0]),
    .read_data_o ()
  );





endmodule