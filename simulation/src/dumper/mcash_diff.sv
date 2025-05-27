module mcash_diff(
  input wire clk,
  input wire rst
);

  `define CROSS_BAR_TOP mcash_tb.u_mcash_top.u_cross_bar_top
  `define CROSS_BAR_TOP_CORE `CROSS_BAR_TOP.u_cross_bar_core

  import "DPI-C" function int c_xbar_ch_buffers_push(longint cycle, byte ch_id, byte op, int addr, longint data);
  import "DPI-C" function int c_xbar_bank_htu_req_check(longint cycle, byte bank_id, byte ch_id, byte entry_id, byte op, int addr, longint data);
  
  logic [63:0]  cycle_cnt_Q;

  logic         mcash_ch0_req_valid;
  logic         mcash_ch0_req_allowIn;
  logic [2:0]   mcash_ch0_req_op;
  logic [31:0]  mcash_ch0_req_addr;
  logic [127:0] mcash_ch0_req_data;
  logic         mcash_ch1_req_valid;
  logic         mcash_ch1_req_allowIn;
  logic [2:0]   mcash_ch1_req_op;
  logic [31:0]  mcash_ch1_req_addr;
  logic [127:0] mcash_ch1_req_data;
  logic         mcash_ch2_req_valid;
  logic         mcash_ch2_req_allowIn;
  logic [2:0]   mcash_ch2_req_op;
  logic [31:0]  mcash_ch2_req_addr;
  logic [127:0] mcash_ch2_req_data;


  logic [2:0]   ch0_entryID_send_to_bank0;
  logic [2:0]   ch0_entryID_send_to_bank1;
  logic [2:0]   ch0_entryID_send_to_bank2;
  logic [2:0]   ch0_entryID_send_to_bank3;
  logic [2:0]   ch1_entryID_send_to_bank0;
  logic [2:0]   ch1_entryID_send_to_bank1;
  logic [2:0]   ch1_entryID_send_to_bank2;
  logic [2:0]   ch1_entryID_send_to_bank3;
  logic [2:0]   ch2_entryID_send_to_bank0;
  logic [2:0]   ch2_entryID_send_to_bank1;
  logic [2:0]   ch2_entryID_send_to_bank2;
  logic [2:0]   ch2_entryID_send_to_bank3;

  logic [2:0]   xbar_bank0_ch_entryID;
  logic [2:0]   xbar_bank1_ch_entryID;
  logic [2:0]   xbar_bank2_ch_entryID;
  logic [2:0]   xbar_bank3_ch_entryID;

  logic         xbar_bank0_htu_valid;
  logic         xbar_bank0_htu_allowIn;
  logic [1:0]   xbar_bank0_htu_ch_id;
  logic [1:0]   xbar_bank0_htu_opcode;
  logic [31:0]  xbar_bank0_htu_addr;
  logic [127:0] xbar_bank0_htu_data;
  logic [7:0]   xbar_bank0_htu_wbuffer_id;
  logic         xbar_bank1_htu_valid;
  logic         xbar_bank1_htu_allowIn;
  logic [1:0]   xbar_bank1_htu_ch_id;
  logic [1:0]   xbar_bank1_htu_opcode;
  logic [31:0]  xbar_bank1_htu_addr;
  logic [127:0] xbar_bank1_htu_data;
  logic [7:0]   xbar_bank1_htu_wbuffer_id;
  logic         xbar_bank2_htu_valid;
  logic         xbar_bank2_htu_allowIn;
  logic [1:0]   xbar_bank2_htu_ch_id;
  logic [1:0]   xbar_bank2_htu_opcode;
  logic [31:0]  xbar_bank2_htu_addr;
  logic [127:0] xbar_bank2_htu_data;
  logic [7:0]   xbar_bank2_htu_wbuffer_id;
  logic         xbar_bank3_htu_valid;
  logic         xbar_bank3_htu_allowIn;
  logic [1:0]   xbar_bank3_htu_ch_id;
  logic [1:0]   xbar_bank3_htu_opcode;
  logic [31:0]  xbar_bank3_htu_addr;
  logic [127:0] xbar_bank3_htu_data;
  logic [7:0]   xbar_bank3_htu_wbuffer_id;

  always_ff @(posedge clk or posedge rst) begin
    if (rst) cycle_cnt_Q <= 'd0;
    else     cycle_cnt_Q <= cycle_cnt_Q + 'd1;
  end

  assign mcash_ch0_req_valid   = `CROSS_BAR_TOP.mcash_ch0_req_valid_i;
  assign mcash_ch0_req_allowIn = `CROSS_BAR_TOP.mcash_ch0_req_allowIn_o;
  assign mcash_ch0_req_op      = `CROSS_BAR_TOP.mcash_ch0_req_op_i;
  assign mcash_ch0_req_addr    = {`CROSS_BAR_TOP.mcash_ch0_req_addr_i[31:4], 4'b0};
  assign mcash_ch0_req_data    = `CROSS_BAR_TOP.mcash_ch0_req_data_i;
  assign mcash_ch1_req_valid   = `CROSS_BAR_TOP.mcash_ch1_req_valid_i;
  assign mcash_ch1_req_allowIn = `CROSS_BAR_TOP.mcash_ch1_req_allowIn_o;
  assign mcash_ch1_req_op      = `CROSS_BAR_TOP.mcash_ch1_req_op_i;
  assign mcash_ch1_req_addr    = {`CROSS_BAR_TOP.mcash_ch1_req_addr_i[31:4], 4'b0};
  assign mcash_ch1_req_data    = `CROSS_BAR_TOP.mcash_ch1_req_data_i;
  assign mcash_ch2_req_valid   = `CROSS_BAR_TOP.mcash_ch2_req_valid_i;
  assign mcash_ch2_req_allowIn = `CROSS_BAR_TOP.mcash_ch2_req_allowIn_o;
  assign mcash_ch2_req_op      = `CROSS_BAR_TOP.mcash_ch2_req_op_i;
  assign mcash_ch2_req_addr    = {`CROSS_BAR_TOP.mcash_ch2_req_addr_i[31:4], 4'b0};
  assign mcash_ch2_req_data    = `CROSS_BAR_TOP.mcash_ch2_req_data_i;

  assign xbar_bank0_htu_valid      = `CROSS_BAR_TOP_CORE.xbar_bank0_htu_valid_o;
  assign xbar_bank0_htu_allowIn    = `CROSS_BAR_TOP_CORE.xbar_bank0_htu_allowIn_i;
  assign xbar_bank0_htu_ch_id      = `CROSS_BAR_TOP_CORE.xbar_bank0_htu_ch_id_o;
  assign xbar_bank0_htu_opcode     = `CROSS_BAR_TOP_CORE.xbar_bank0_htu_opcode_o;
  assign xbar_bank0_htu_addr       = {`CROSS_BAR_TOP_CORE.xbar_bank0_htu_addr_o[31:4], 4'b0};
  assign xbar_bank0_htu_data       = `CROSS_BAR_TOP_CORE.xbar_bank0_htu_data_o;
  assign xbar_bank0_htu_wbuffer_id = `CROSS_BAR_TOP_CORE.xbar_bank0_htu_wbuffer_id_o;
  assign xbar_bank1htu_valid      = `CROSS_BAR_TOP_CORE.xbar_bank1_htu_valid_o;
  assign xbar_bank1htu_allowIn    = `CROSS_BAR_TOP_CORE.xbar_bank1_htu_allowIn_i;
  assign xbar_bank1htu_ch_id      = `CROSS_BAR_TOP_CORE.xbar_bank1_htu_ch_id_o;
  assign xbar_bank1htu_opcode     = `CROSS_BAR_TOP_CORE.xbar_bank1_htu_opcode_o;
  assign xbar_bank1htu_addr       = {`CROSS_BAR_TOP_CORE.xbar_bank1_htu_addr_o[31:4], 4'b0};
  assign xbar_bank1htu_data       = `CROSS_BAR_TOP_CORE.xbar_bank1_htu_data_o;
  assign xbar_bank1htu_wbuffer_id = `CROSS_BAR_TOP_CORE.xbar_bank1_htu_wbuffer_id_o;
  assign xbar_bank2_htu_valid      = `CROSS_BAR_TOP_CORE.xbar_bank2_htu_valid_o;
  assign xbar_bank2_htu_allowIn    = `CROSS_BAR_TOP_CORE.xbar_bank2_htu_allowIn_i;
  assign xbar_bank2_htu_ch_id      = `CROSS_BAR_TOP_CORE.xbar_bank2_htu_ch_id_o;
  assign xbar_bank2_htu_opcode     = `CROSS_BAR_TOP_CORE.xbar_bank2_htu_opcode_o;
  assign xbar_bank2_htu_addr       = {`CROSS_BAR_TOP_CORE.xbar_bank2_htu_addr_o[31:4], 4'b0};
  assign xbar_bank2_htu_data       = `CROSS_BAR_TOP_CORE.xbar_bank2_htu_data_o;
  assign xbar_bank2_htu_wbuffer_id = `CROSS_BAR_TOP_CORE.xbar_bank2_htu_wbuffer_id_o;
  assign xbar_bank3_htu_valid      = `CROSS_BAR_TOP_CORE.xbar_bank3_htu_valid_o;
  assign xbar_bank3_htu_allowIn    = `CROSS_BAR_TOP_CORE.xbar_bank3_htu_allowIn_i;
  assign xbar_bank3_htu_ch_id      = `CROSS_BAR_TOP_CORE.xbar_bank3_htu_ch_id_o;
  assign xbar_bank3_htu_opcode     = `CROSS_BAR_TOP_CORE.xbar_bank3_htu_opcode_o;
  assign xbar_bank3_htu_addr       = {`CROSS_BAR_TOP_CORE.xbar_bank3_htu_addr_o[31:4], 4'b0};
  assign xbar_bank3_htu_data       = `CROSS_BAR_TOP_CORE.xbar_bank3_htu_data_o;
  assign xbar_bank3_htu_wbuffer_id = `CROSS_BAR_TOP_CORE.xbar_bank3_htu_wbuffer_id_o;

  assign ch0_entryID_send_to_bank0[2:0] = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch0.ch_entryID_send_to_bank0;
  assign ch0_entryID_send_to_bank1[2:0] = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch0.ch_entryID_send_to_bank1;
  assign ch0_entryID_send_to_bank2[2:0] = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch0.ch_entryID_send_to_bank2;
  assign ch0_entryID_send_to_bank3[2:0] = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch0.ch_entryID_send_to_bank3;
  assign ch1_entryID_send_to_bank0[2:0] = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch1.ch_entryID_send_to_bank0;
  assign ch1_entryID_send_to_bank1[2:0] = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch1.ch_entryID_send_to_bank1;
  assign ch1_entryID_send_to_bank2[2:0] = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch1.ch_entryID_send_to_bank2;
  assign ch1_entryID_send_to_bank3[2:0] = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch1.ch_entryID_send_to_bank3;
  assign ch2_entryID_send_to_bank0[2:0] = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch2.ch_entryID_send_to_bank0;
  assign ch2_entryID_send_to_bank1[2:0] = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch2.ch_entryID_send_to_bank1;
  assign ch2_entryID_send_to_bank2[2:0] = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch2.ch_entryID_send_to_bank2;
  assign ch2_entryID_send_to_bank3[2:0] = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch2.ch_entryID_send_to_bank3;

  always_comb begin
    // bank0
    if      (xbar_bank0_htu_ch_id == 'd0) xbar_bank0_ch_entryID = ch0_entryID_send_to_bank0;
    else if (xbar_bank0_htu_ch_id == 'd1) xbar_bank0_ch_entryID = ch1_entryID_send_to_bank0;
    else if (xbar_bank0_htu_ch_id == 'd2) xbar_bank0_ch_entryID = ch2_entryID_send_to_bank0;
    else                                  xbar_bank0_ch_entryID = 'd0;
    // bank1
    if      (xbar_bank1_htu_ch_id == 'd0) xbar_bank1_ch_entryID = ch0_entryID_send_to_bank1;
    else if (xbar_bank1_htu_ch_id == 'd1) xbar_bank1_ch_entryID = ch1_entryID_send_to_bank1;
    else if (xbar_bank1_htu_ch_id == 'd2) xbar_bank1_ch_entryID = ch2_entryID_send_to_bank1;
    else                                  xbar_bank1_ch_entryID = 'd0;
    // bank2
    if      (xbar_bank2_htu_ch_id == 'd0) xbar_bank2_ch_entryID = ch0_entryID_send_to_bank2;
    else if (xbar_bank2_htu_ch_id == 'd1) xbar_bank2_ch_entryID = ch1_entryID_send_to_bank2;
    else if (xbar_bank2_htu_ch_id == 'd2) xbar_bank2_ch_entryID = ch2_entryID_send_to_bank2;
    else                                  xbar_bank2_ch_entryID = 'd0;
    // bank3
    if      (xbar_bank3_htu_ch_id == 'd0) xbar_bank3_ch_entryID = ch0_entryID_send_to_bank3;
    else if (xbar_bank3_htu_ch_id == 'd1) xbar_bank3_ch_entryID = ch1_entryID_send_to_bank3;
    else if (xbar_bank3_htu_ch_id == 'd2) xbar_bank3_ch_entryID = ch2_entryID_send_to_bank3;
    else                                  xbar_bank3_ch_entryID = 'd0;
  end

  always_ff @(posedge clk) begin
    // push data into cross bar buffer
    if (mcash_ch0_req_valid & mcash_ch0_req_allowIn) begin
      c_xbar_ch_buffers_push(cycle_cnt_Q, 0, mcash_ch0_req_op, mcash_ch0_req_addr, mcash_ch0_req_data);
    end
    if (mcash_ch1_req_valid & mcash_ch1_req_allowIn) begin
      c_xbar_ch_buffers_push(cycle_cnt_Q, 0, mcash_ch1_req_op, mcash_ch1_req_addr, mcash_ch1_req_data);
    end
    if (mcash_ch2_req_valid & mcash_ch2_req_allowIn) begin
      c_xbar_ch_buffers_push(cycle_cnt_Q, 0, mcash_ch1_req_op, mcash_ch2_req_addr, mcash_ch2_req_data);
    end


    // check xbar to bank req
    if (xbar_bank0_htu_valid & xbar_bank0_htu_allowIn) begin
      if(c_xbar_bank_htu_req_check(cycle_cnt_Q, 0, xbar_bank0_htu_ch_id, ch0_entryID_send_to_bank0, xbar_bank0_htu_opcode, xbar_bank0_htu_addr, xbar_bank0_htu_data)) begin
        $finish;
      end
    end









  end


endmodule