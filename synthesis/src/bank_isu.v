module bank_isu (
  input  wire          clk_i,
  input  wire          rst_i,
  // isu >> sc
  output wire          isu_sc_valid_o,
  input  wire          isu_sc_ready_i,
  output wire [1:0]    isu_sc_channel_id_o,
  output wire [2:0]    isu_sc_opcode_o,
  output wire [6:0]    isu_sc_set_way_offset_o,
  output wire [7:0]    isu_sc_wbuffer_id_o,
  output wire [2:0]    isu_sc_xbar_rob_num_o,
  output wire [1:0]    isu_sc_cacheline_dirty_offset0_o,
  output wire [1:0]    isu_sc_cacheline_dirty_offset1_o,
  output wire [127:0]  isu_sc_linefill_data_offset0_o,
  output wire [127:0]  isu_sc_linefill_data_offset1_o
);


  reg [6:0] set_way_offset;

  reg [127:0] line_fill_data;

  assign isu_sc_valid_o = 1'b1;

  assign isu_sc_channel_id_o[1:0] = 2'b00;
  assign isu_sc_opcode_o[2:0] = 3'd0; // write

  assign isu_sc_wbuffer_id_o[7:0] = 8'd0;
  assign isu_sc_xbar_rob_num_o[2:0] = 'd0;

  assign isu_sc_cacheline_dirty_offset0_o[1:0] = 'd0; // empty
  assign isu_sc_cacheline_dirty_offset1_o[1:0] = 'd0; // empty


  assign isu_sc_set_way_offset_o = set_way_offset;

  assign isu_sc_linefill_data_offset0_o = line_fill_data;
  assign isu_sc_linefill_data_offset1_o = line_fill_data + 'd1;



  always @(posedge clk_i or rst_i) begin
    if (rst_i) begin
      set_way_offset <= 'd0;
      line_fill_data <= 'd0;
    end
    else begin
      if (isu_sc_valid_o & isu_sc_ready_i) begin
        set_way_offset <= set_way_offset + 'd2;
        line_fill_data <= line_fill_data + 'd100;
      end
    end
  end

endmodule