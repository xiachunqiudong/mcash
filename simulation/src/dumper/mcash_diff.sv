module mcash_diff(
  input wire clk
);

  `define CROSS_BAR_TOP mcash_tb.u_mcash_top.u_cross_bar_top
  `define CROSS_BAR_TOP_CORE `CROSS_BAR_TOP.u_cross_bar_core

  import "DPI-C" function int cFunc();
  import "DPI-C" function int c_xbar_ch_buffers_push(byte ch_id, byte op, int addr, longint data);
  import "DPI-C" function int c_xbar_bank_htu_req_check(byte bank_id, byte ch_id, byte entry_id, byte op, int addr, longint data);


  logic         mcash_ch0_req_valid;
  logic         mcash_ch0_req_allowIn;
  logic [2:0]   mcash_ch0_req_op;
  logic [31:0]  mcash_ch0_req_addr;
  logic [127:0] mcash_ch0_req_data;

  logic [2:0]   ch0_entryID_send_to_bank0;
  logic [2:0]   ch0_entryID_send_to_bank1;
  logic [2:0]   ch0_entryID_send_to_bank2;
  logic [2:0]   ch0_entryID_send_to_bank3;

  logic         xbar_bank0_htu_valid;
  logic         xbar_bank0_htu_allowIn;
  logic [1:0]   xbar_bank0_htu_ch_id;
  logic [1:0]   xbar_bank0_htu_opcode;
  logic [31:0]  xbar_bank0_htu_addr;
  logic [127:0] xbar_bank0_htu_data;
  logic [7:0]   xbar_bank0_htu_wbuffer_id;


  assign mcash_ch0_req_valid   = `CROSS_BAR_TOP.mcash_ch0_req_valid_i;
  assign mcash_ch0_req_allowIn = `CROSS_BAR_TOP.mcash_ch0_req_allowIn_o;
  assign mcash_ch0_req_op      = `CROSS_BAR_TOP.mcash_ch0_req_op_i;
  assign mcash_ch0_req_addr    = {`CROSS_BAR_TOP.mcash_ch0_req_addr_i[31:4], 4'b0};
  assign mcash_ch0_req_data    = `CROSS_BAR_TOP.mcash_ch0_req_data_i;

  assign xbar_bank0_htu_valid      = `CROSS_BAR_TOP_CORE.xbar_bank0_htu_valid_o;
  assign xbar_bank0_htu_allowIn    = `CROSS_BAR_TOP_CORE.xbar_bank0_htu_allowIn_i;
  assign xbar_bank0_htu_ch_id      = `CROSS_BAR_TOP_CORE.xbar_bank0_htu_ch_id_o;
  assign xbar_bank0_htu_opcode     = `CROSS_BAR_TOP_CORE.xbar_bank0_htu_opcode_o;
  assign xbar_bank0_htu_addr       = {`CROSS_BAR_TOP_CORE.xbar_bank0_htu_addr_o[31:4], 4'b0};
  assign xbar_bank0_htu_data       = `CROSS_BAR_TOP_CORE.xbar_bank0_htu_data_o;
  assign xbar_bank0_htu_wbuffer_id = `CROSS_BAR_TOP_CORE.xbar_bank0_htu_wbuffer_id_o;

  assign ch0_entryID_send_to_bank0[2:0] = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch0.ch_entryID_send_to_bank0;
  assign ch0_entryID_send_to_bank1[2:0] = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch0.ch_entryID_send_to_bank1;
  assign ch0_entryID_send_to_bank2[2:0] = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch0.ch_entryID_send_to_bank2;
  assign ch0_entryID_send_to_bank3[2:0] = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch0.ch_entryID_send_to_bank3;

  always_ff @(posedge clk) begin
    // push data into cross bar buffer
    if (mcash_ch0_req_valid & mcash_ch0_req_allowIn) begin
      c_xbar_ch_buffers_push(0, mcash_ch0_req_op, mcash_ch0_req_addr, mcash_ch0_req_data);
    end

    // check xbar to bank req
    if (xbar_bank0_htu_valid & xbar_bank0_htu_allowIn) begin
      c_xbar_bank_htu_req_check(0, xbar_bank0_htu_ch_id, ch0_entryID_send_to_bank0, mcash_ch0_req_op, mcash_ch0_req_addr, mcash_ch0_req_data);
    end









  end


endmodule