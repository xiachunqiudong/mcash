module cross_bar_rob #(
  parameter CHANNEL_ID = 0
)(
  input  wire         clk_i,
  input  wire         rst_i,
  input  wire         keep_order_fifo_push_i,
  input  wire [1:0]   mcash_ch_read_req_bank_id_i,
  output wire         keep_order_fifo_allowIn_o,
  input  wire         bank0_sc_xbar_valid_i,
  input  wire [1:0]   bank0_sc_xbar_ch_id_i,
  input  wire [2:0]   bank0_sc_xbar_rob_num_i,
  input  wire [127:0] bank0_sc_xbar_data_i,
  input  wire         bank1_sc_xbar_valid_i,
  input  wire [1:0]   bank1_sc_xbar_ch_id_i,
  input  wire [2:0]   bank1_sc_xbar_rob_num_i,
  input  wire [127:0] bank1_sc_xbar_data_i,
  input  wire         bank2_sc_xbar_valid_i,
  input  wire [1:0]   bank2_sc_xbar_ch_id_i,
  input  wire [2:0]   bank2_sc_xbar_rob_num_i,
  input  wire [127:0] bank2_sc_xbar_data_i,
  input  wire         bank3_sc_xbar_valid_i,
  input  wire [1:0]   bank3_sc_xbar_ch_id_i,
  input  wire [2:0]   bank3_sc_xbar_rob_num_i,
  input  wire [127:0] bank3_sc_xbar_data_i,
  output wire         ch_rtn_data_valid_o,
  output wire         ch_rtn_data_ready_i,
  output wire [127:0] ch_rtn_data_o,
  output wire         bank0_spw_buffer_pop_o,
  output wire         bank1_spw_buffer_pop_o,
  output wire         bank2_spw_buffer_pop_o,
  output wire         bank3_spw_buffer_pop_o
);
  

  wire         keep_order_fifo_empty;
  wire         keep_order_fifo_full;
  wire         keep_order_fifo_pop;
  wire [1:0]   keep_order_fifo_dout;
  wire         kof_use_bank0;
  wire         kof_use_bank1;
  wire         kof_use_bank2;
  wire         kof_use_bank3;
  reg  [2:0]   bank0_rob_num_Q;
  reg  [2:0]   bank1_rob_num_Q;
  reg  [2:0]   bank2_rob_num_Q;
  reg  [2:0]   bank3_rob_num_Q;
  wire         bank0_spw_buffer_wen;
  wire         bank1_spw_buffer_wen;
  wire         bank2_spw_buffer_wen;
  wire         bank3_spw_buffer_wen;
  wire         bank0_spw_buffer_ren;
  wire         bank1_spw_buffer_ren;
  wire         bank2_spw_buffer_ren;
  wire         bank3_spw_buffer_ren;
  wire         bank0_spw_buffer_rvalid;
  wire         bank1_spw_buffer_rvalid;
  wire         bank2_spw_buffer_rvalid;
  wire         bank3_spw_buffer_rvalid;
  wire [127:0] bank0_spw_buffer_rdata;
  wire [127:0] bank1_spw_buffer_rdata;
  wire [127:0] bank2_spw_buffer_rdata;
  wire [127:0] bank3_spw_buffer_rdata;

//-------------------------------------------------------------
//                     Keep order fifo
//-------------------------------------------------------------
  sync_fifo#(
    .AW (4),
    .DW (2)
  ) keep_order_fifo(
      .clk   (clk_i                           ),
      .rst   (rst_i                           ),
      .push  (keep_order_fifo_push_i          ),
      .din   (mcash_ch_read_req_bank_id_i[1:0]),
      .pop   (keep_order_fifo_pop             ),
      .dout  (keep_order_fifo_dout[1:0]       ),
      .empry (keep_order_fifo_empty           ),
      .full  (keep_order_fifo_full            )
  );

  assign keep_order_fifo_allowIn_o = ~keep_order_fifo_full;

  assign kof_use_bank0 = keep_order_fifo_dout[1:0] == 2'b00;
  assign kof_use_bank1 = keep_order_fifo_dout[1:0] == 2'b01;
  assign kof_use_bank2 = keep_order_fifo_dout[1:0] == 2'b10;
  assign kof_use_bank3 = keep_order_fifo_dout[1:0] == 2'b11;

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      bank0_rob_num_Q <= 'd0;
    end
    else if (bank0_spw_buffer_ren) begin
      bank0_rob_num_Q <= bank0_rob_num_Q + 'd1;
    end
  end

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      bank1_rob_num_Q <= 'd0;
    end
    else if (bank1_spw_buffer_ren) begin
      bank1_rob_num_Q <= bank1_rob_num_Q + 'd1;
    end
  end

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      bank2_rob_num_Q <= 'd0;
    end
    else if (bank2_spw_buffer_ren) begin
      bank2_rob_num_Q <= bank2_rob_num_Q + 'd1;
    end
  end

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      bank3_rob_num_Q <= 'd0;
    end
    else if (bank3_spw_buffer_ren) begin
      bank3_rob_num_Q <= bank3_rob_num_Q + 'd1;
    end
  end

  assign keep_order_fifo_pop = ~keep_order_fifo_empty
                             & (  kof_use_bank0 & bank0_spw_buffer_rvalid
                                | kof_use_bank1 & bank1_spw_buffer_rvalid
                                | kof_use_bank2 & bank2_spw_buffer_rvalid
                                | kof_use_bank3 & bank3_spw_buffer_rvalid
                               );

//-------------------------------------------------------------
//                  sparse write buffer
//-------------------------------------------------------------
  assign bank0_spw_buffer_wen = bank0_sc_xbar_valid_i
                              & bank0_sc_xbar_ch_id_i[1:0] == CHANNEL_ID[1:0];

  assign bank0_spw_buffer_ren = keep_order_fifo_pop
                              & kof_use_bank0;

  spw_buffer
  bank0_spw_buffer(
    .clk_i            (clk_i                        ),
    .rst_i            (rst_i                        ),
    .wr_en_i          (bank0_spw_buffer_wen         ),
    .write_ptr_i      (bank0_sc_xbar_rob_num_i[2:0] ),
    .write_data_i     (bank0_sc_xbar_data_i[127:0]  ),
    .rd_en_i          (bank0_spw_buffer_ren         ),
    .read_ptr_i       (bank0_rob_num_Q[2:0]         ),
    .read_data_valid_o(bank0_spw_buffer_rvalid      ),
    .read_data_o      (bank0_spw_buffer_rdata[127:0])
  );

  assign bank1_spw_buffer_wen = bank1_sc_xbar_valid_i
                              & bank1_sc_xbar_ch_id_i[1:0] == CHANNEL_ID[1:0];

  assign bank1_spw_buffer_ren = keep_order_fifo_pop
                              & kof_use_bank1;

  spw_buffer
  bank1_spw_buffer(
    .clk_i            (clk_i                        ),
    .rst_i            (rst_i                        ),
    .wr_en_i          (bank1_spw_buffer_wen         ),
    .write_ptr_i      (bank1_sc_xbar_rob_num_i[2:0] ),
    .write_data_i     (bank1_sc_xbar_data_i[127:0]  ),
    .rd_en_i          (bank1_spw_buffer_ren         ),
    .read_ptr_i       (bank1_rob_num_Q[2:0]         ),
    .read_data_valid_o(bank1_spw_buffer_rvalid      ),
    .read_data_o      (bank1_spw_buffer_rdata[127:0])
  );

  assign bank2_spw_buffer_wen = bank2_sc_xbar_valid_i
                              & bank2_sc_xbar_ch_id_i[1:0] == CHANNEL_ID[1:0];

  assign bank2_spw_buffer_ren = keep_order_fifo_pop
                              & kof_use_bank2;

  spw_buffer
  bank2_spw_buffer(
    .clk_i            (clk_i                        ),
    .rst_i            (rst_i                        ),
    .wr_en_i          (bank2_spw_buffer_wen         ),
    .write_ptr_i      (bank2_sc_xbar_rob_num_i[2:0] ),
    .write_data_i     (bank2_sc_xbar_data_i[127:0]  ),
    .rd_en_i          (bank2_spw_buffer_ren         ),
    .read_ptr_i       (bank2_rob_num_Q[2:0]         ),
    .read_data_valid_o(bank2_spw_buffer_rvalid      ),
    .read_data_o      (bank2_spw_buffer_rdata[127:0])
  );

  assign bank3_spw_buffer_wen = bank3_sc_xbar_valid_i
                              & bank3_sc_xbar_ch_id_i[1:0] == CHANNEL_ID[1:0];

  assign bank3_spw_buffer_ren = keep_order_fifo_pop
                              & kof_use_bank3;

  spw_buffer
  bank3_spw_buffer(
    .clk_i            (clk_i                        ),
    .rst_i            (rst_i                        ),
    .wr_en_i          (bank3_spw_buffer_wen         ),
    .write_ptr_i      (bank3_sc_xbar_rob_num_i[2:0] ),
    .write_data_i     (bank3_sc_xbar_data_i[127:0]  ),
    .rd_en_i          (bank3_spw_buffer_ren         ),
    .read_ptr_i       (bank3_rob_num_Q[2:0]         ),
    .read_data_valid_o(bank3_spw_buffer_rvalid      ),
    .read_data_o      (bank3_spw_buffer_rdata[127:0])
  );

  assign ch_rtn_data_valid_o = bank0_spw_buffer_rvalid
                             | bank1_spw_buffer_rvalid
                             | bank2_spw_buffer_rvalid
                             | bank3_spw_buffer_rvalid;

  assign ch_rtn_data_o[127:0] = {128{kof_use_bank0}} & bank0_spw_buffer_rdata[127:0]
                              | {128{kof_use_bank1}} & bank1_spw_buffer_rdata[127:0]
                              | {128{kof_use_bank2}} & bank2_spw_buffer_rdata[127:0]
                              | {128{kof_use_bank3}} & bank3_spw_buffer_rdata[127:0];

  assign bank0_spw_buffer_pop_o = bank0_spw_buffer_ren;
  assign bank1_spw_buffer_pop_o = bank1_spw_buffer_ren;
  assign bank2_spw_buffer_pop_o = bank2_spw_buffer_ren;
  assign bank3_spw_buffer_pop_o = bank3_spw_buffer_ren;

endmodule