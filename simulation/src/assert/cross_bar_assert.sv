module cross_bar_assert(
  input  logic       clk_i,
  input  logic       rst_i,
  input  logic       mcash_ch0_req_valid_i,
  input  logic       mcash_ch0_req_allowIn_o,
  input  logic [2:0] mcash_ch0_req_op_i,
  input  logic [31:4] mcash_ch0_req_addr_i,
  input  logic       mcash_ch1_req_valid_i,
  input  logic       mcash_ch1_req_allowIn_o,
  input  logic [2:0] mcash_ch1_req_op_i,
  input  logic [31:4] mcash_ch1_req_addr_i,
  input  logic       mcash_ch2_req_valid_i,
  input  logic       mcash_ch2_req_allowIn_o,
  input  logic [2:0] mcash_ch2_req_op_i,
  input  logic [31:4] mcash_ch2_req_addr_i,
  input  logic       mcash_ch0_rtn_valid_o,
  input  logic       mcash_ch1_rtn_valid_o,
  input  logic       mcash_ch2_rtn_valid_o
);

  `define CROSS_BAR_TOP_CH0_ROB mcash_tb.u_mcash_top.u_cross_bar_top.ch0_rob
  `define CROSS_BAR_TOP_CH1_ROB mcash_tb.u_mcash_top.u_cross_bar_top.ch1_rob
  `define CROSS_BAR_TOP_CH2_ROB mcash_tb.u_mcash_top.u_cross_bar_top.ch2_rob

  logic mcash_ch0_req_bank0;
  logic mcash_ch0_req_bank1;
  logic mcash_ch0_req_bank2;
  logic mcash_ch0_req_bank3;
  logic mcash_ch1_req_bank0;
  logic mcash_ch1_req_bank1;
  logic mcash_ch1_req_bank2;
  logic mcash_ch1_req_bank3;
  logic mcash_ch2_req_bank0;
  logic mcash_ch2_req_bank1;
  logic mcash_ch2_req_bank2;
  logic mcash_ch2_req_bank3;

  logic mcash_ch0_rtn_bank0;
  logic mcash_ch0_rtn_bank1;
  logic mcash_ch0_rtn_bank2;
  logic mcash_ch0_rtn_bank3;
  logic mcash_ch1_rtn_bank0;
  logic mcash_ch1_rtn_bank1;
  logic mcash_ch1_rtn_bank2;
  logic mcash_ch1_rtn_bank3;
  logic mcash_ch2_rtn_bank0;
  logic mcash_ch2_rtn_bank1;
  logic mcash_ch2_rtn_bank2;
  logic mcash_ch2_rtn_bank3;

  logic mcash_ch0_sc_xbar_bank0;
  logic mcash_ch0_sc_xbar_bank1;
  logic mcash_ch0_sc_xbar_bank2;
  logic mcash_ch0_sc_xbar_bank3;
  logic mcash_ch1_sc_xbar_bank0;
  logic mcash_ch1_sc_xbar_bank1;
  logic mcash_ch1_sc_xbar_bank2;
  logic mcash_ch1_sc_xbar_bank3;
  logic mcash_ch2_sc_xbar_bank0;
  logic mcash_ch2_sc_xbar_bank1;
  logic mcash_ch2_sc_xbar_bank2;
  logic mcash_ch2_sc_xbar_bank3;

  logic ch0_read_req_kickoff;
  logic ch1_read_req_kickoff;
  logic ch2_read_req_kickoff;
  logic ch0_read_resp_kickoff;
  logic ch1_read_resp_kickoff;
  logic ch2_read_resp_kickoff;

  logic [9:0] ch0_bank0_read_req_cnt_Q;
  logic [9:0] ch0_bank1_read_req_cnt_Q;
  logic [9:0] ch0_bank2_read_req_cnt_Q;
  logic [9:0] ch0_bank3_read_req_cnt_Q;
  logic [9:0] ch1_bank0_read_req_cnt_Q;
  logic [9:0] ch1_bank1_read_req_cnt_Q;
  logic [9:0] ch1_bank2_read_req_cnt_Q;
  logic [9:0] ch1_bank3_read_req_cnt_Q;
  logic [9:0] ch2_bank0_read_req_cnt_Q;
  logic [9:0] ch2_bank1_read_req_cnt_Q;
  logic [9:0] ch2_bank2_read_req_cnt_Q;
  logic [9:0] ch2_bank3_read_req_cnt_Q;
  logic [9:0] ch0_rob_bank0_read_resp_cnt_Q;
  logic [9:0] ch0_rob_bank1_read_resp_cnt_Q;
  logic [9:0] ch0_rob_bank2_read_resp_cnt_Q;
  logic [9:0] ch0_rob_bank3_read_resp_cnt_Q;
  logic [9:0] ch1_rob_bank0_read_resp_cnt_Q;
  logic [9:0] ch1_rob_bank1_read_resp_cnt_Q;
  logic [9:0] ch1_rob_bank2_read_resp_cnt_Q;
  logic [9:0] ch1_rob_bank3_read_resp_cnt_Q;
  logic [9:0] ch2_rob_bank0_read_resp_cnt_Q;
  logic [9:0] ch2_rob_bank1_read_resp_cnt_Q;
  logic [9:0] ch2_rob_bank2_read_resp_cnt_Q;
  logic [9:0] ch2_rob_bank3_read_resp_cnt_Q;

  // kof
  assign mcash_ch0_req_bank0 = mcash_ch0_req_addr_i[9:8] == 2'b00;
  assign mcash_ch0_req_bank1 = mcash_ch0_req_addr_i[9:8] == 2'b01;
  assign mcash_ch0_req_bank2 = mcash_ch0_req_addr_i[9:8] == 2'b10;
  assign mcash_ch0_req_bank3 = mcash_ch0_req_addr_i[9:8] == 2'b11;
  assign mcash_ch1_req_bank0 = mcash_ch1_req_addr_i[9:8] == 2'b00;
  assign mcash_ch1_req_bank1 = mcash_ch1_req_addr_i[9:8] == 2'b01;
  assign mcash_ch1_req_bank2 = mcash_ch1_req_addr_i[9:8] == 2'b10;
  assign mcash_ch1_req_bank3 = mcash_ch1_req_addr_i[9:8] == 2'b11;
  assign mcash_ch2_req_bank0 = mcash_ch2_req_addr_i[9:8] == 2'b00;
  assign mcash_ch2_req_bank1 = mcash_ch2_req_addr_i[9:8] == 2'b01;
  assign mcash_ch2_req_bank2 = mcash_ch2_req_addr_i[9:8] == 2'b10;
  assign mcash_ch2_req_bank3 = mcash_ch2_req_addr_i[9:8] == 2'b11;

  assign mcash_ch0_rtn_bank0 = `CROSS_BAR_TOP_CH0_ROB.bank0_spw_buffer_rvalid & `CROSS_BAR_TOP_CH0_ROB.kof_use_bank0;
  assign mcash_ch0_rtn_bank1 = `CROSS_BAR_TOP_CH0_ROB.bank1_spw_buffer_rvalid & `CROSS_BAR_TOP_CH0_ROB.kof_use_bank1;
  assign mcash_ch0_rtn_bank2 = `CROSS_BAR_TOP_CH0_ROB.bank2_spw_buffer_rvalid & `CROSS_BAR_TOP_CH0_ROB.kof_use_bank2;
  assign mcash_ch0_rtn_bank3 = `CROSS_BAR_TOP_CH0_ROB.bank3_spw_buffer_rvalid & `CROSS_BAR_TOP_CH0_ROB.kof_use_bank3;
  assign mcash_ch1_rtn_bank0 = `CROSS_BAR_TOP_CH1_ROB.bank0_spw_buffer_rvalid & `CROSS_BAR_TOP_CH1_ROB.kof_use_bank0;
  assign mcash_ch1_rtn_bank1 = `CROSS_BAR_TOP_CH1_ROB.bank1_spw_buffer_rvalid & `CROSS_BAR_TOP_CH1_ROB.kof_use_bank1;
  assign mcash_ch1_rtn_bank2 = `CROSS_BAR_TOP_CH1_ROB.bank2_spw_buffer_rvalid & `CROSS_BAR_TOP_CH1_ROB.kof_use_bank2;
  assign mcash_ch1_rtn_bank3 = `CROSS_BAR_TOP_CH1_ROB.bank3_spw_buffer_rvalid & `CROSS_BAR_TOP_CH1_ROB.kof_use_bank3;
  assign mcash_ch2_rtn_bank0 = `CROSS_BAR_TOP_CH2_ROB.bank0_spw_buffer_rvalid & `CROSS_BAR_TOP_CH2_ROB.kof_use_bank0;
  assign mcash_ch2_rtn_bank1 = `CROSS_BAR_TOP_CH2_ROB.bank1_spw_buffer_rvalid & `CROSS_BAR_TOP_CH2_ROB.kof_use_bank1;
  assign mcash_ch2_rtn_bank2 = `CROSS_BAR_TOP_CH2_ROB.bank2_spw_buffer_rvalid & `CROSS_BAR_TOP_CH2_ROB.kof_use_bank2;
  assign mcash_ch2_rtn_bank3 = `CROSS_BAR_TOP_CH2_ROB.bank3_spw_buffer_rvalid & `CROSS_BAR_TOP_CH2_ROB.kof_use_bank3;
  
  // spw
  assign mcash_ch0_spw_buffer_push_bank0 = `CROSS_BAR_TOP_CH0_ROB.bank0_spw_buffer_wen;
  assign mcash_ch0_spw_buffer_push_bank1 = `CROSS_BAR_TOP_CH0_ROB.bank1_spw_buffer_wen;
  assign mcash_ch0_spw_buffer_push_bank2 = `CROSS_BAR_TOP_CH0_ROB.bank2_spw_buffer_wen;
  assign mcash_ch0_spw_buffer_push_bank3 = `CROSS_BAR_TOP_CH0_ROB.bank3_spw_buffer_wen;
  assign mcash_ch1_spw_buffer_push_bank0 = `CROSS_BAR_TOP_CH1_ROB.bank0_spw_buffer_wen;
  assign mcash_ch1_spw_buffer_push_bank1 = `CROSS_BAR_TOP_CH1_ROB.bank1_spw_buffer_wen;
  assign mcash_ch1_spw_buffer_push_bank2 = `CROSS_BAR_TOP_CH1_ROB.bank2_spw_buffer_wen;
  assign mcash_ch1_spw_buffer_push_bank3 = `CROSS_BAR_TOP_CH1_ROB.bank3_spw_buffer_wen;
  assign mcash_ch2_spw_buffer_push_bank0 = `CROSS_BAR_TOP_CH2_ROB.bank0_spw_buffer_wen;
  assign mcash_ch2_spw_buffer_push_bank1 = `CROSS_BAR_TOP_CH2_ROB.bank1_spw_buffer_wen;
  assign mcash_ch2_spw_buffer_push_bank2 = `CROSS_BAR_TOP_CH2_ROB.bank2_spw_buffer_wen;
  assign mcash_ch2_spw_buffer_push_bank3 = `CROSS_BAR_TOP_CH2_ROB.bank3_spw_buffer_wen;

  assign mcash_ch0_spw_buffer_pop_bank0 = `CROSS_BAR_TOP_CH0_ROB.bank0_spw_buffer_pop_o;
  assign mcash_ch0_spw_buffer_pop_bank1 = `CROSS_BAR_TOP_CH0_ROB.bank1_spw_buffer_pop_o;
  assign mcash_ch0_spw_buffer_pop_bank2 = `CROSS_BAR_TOP_CH0_ROB.bank2_spw_buffer_pop_o;
  assign mcash_ch0_spw_buffer_pop_bank3 = `CROSS_BAR_TOP_CH0_ROB.bank3_spw_buffer_pop_o;
  assign mcash_ch1_spw_buffer_pop_bank0 = `CROSS_BAR_TOP_CH1_ROB.bank0_spw_buffer_pop_o;
  assign mcash_ch1_spw_buffer_pop_bank1 = `CROSS_BAR_TOP_CH1_ROB.bank1_spw_buffer_pop_o;
  assign mcash_ch1_spw_buffer_pop_bank2 = `CROSS_BAR_TOP_CH1_ROB.bank2_spw_buffer_pop_o;
  assign mcash_ch1_spw_buffer_pop_bank3 = `CROSS_BAR_TOP_CH1_ROB.bank3_spw_buffer_pop_o;
  assign mcash_ch2_spw_buffer_pop_bank0 = `CROSS_BAR_TOP_CH2_ROB.bank0_spw_buffer_pop_o;
  assign mcash_ch2_spw_buffer_pop_bank1 = `CROSS_BAR_TOP_CH2_ROB.bank1_spw_buffer_pop_o;
  assign mcash_ch2_spw_buffer_pop_bank2 = `CROSS_BAR_TOP_CH2_ROB.bank2_spw_buffer_pop_o;
  assign mcash_ch2_spw_buffer_pop_bank3 = `CROSS_BAR_TOP_CH2_ROB.bank3_spw_buffer_pop_o;

  assign ch0_read_req_kickoff = mcash_ch0_req_valid_i & mcash_ch0_req_allowIn_o & mcash_ch0_req_op_i[2:0] == 3'b0;
  assign ch1_read_req_kickoff = mcash_ch1_req_valid_i & mcash_ch1_req_allowIn_o & mcash_ch1_req_op_i[2:0] == 3'b0;
  assign ch2_read_req_kickoff = mcash_ch2_req_valid_i & mcash_ch2_req_allowIn_o & mcash_ch2_req_op_i[2:0] == 3'b0;

  assign ch0_read_resp_kickoff = mcash_ch0_rtn_valid_o;
  assign ch1_read_resp_kickoff = mcash_ch1_rtn_valid_o;
  assign ch2_read_resp_kickoff = mcash_ch2_rtn_valid_o;


  always_ff @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      ch0_bank0_read_req_cnt_Q <= 'd0;
      ch0_bank1_read_req_cnt_Q <= 'd0;
      ch0_bank2_read_req_cnt_Q <= 'd0;
      ch0_bank3_read_req_cnt_Q <= 'd0;
      ch1_bank0_read_req_cnt_Q <= 'd0;
      ch1_bank1_read_req_cnt_Q <= 'd0;
      ch1_bank2_read_req_cnt_Q <= 'd0;
      ch1_bank3_read_req_cnt_Q <= 'd0;
      ch2_bank0_read_req_cnt_Q <= 'd0;
      ch2_bank1_read_req_cnt_Q <= 'd0;
      ch2_bank2_read_req_cnt_Q <= 'd0;
      ch2_bank3_read_req_cnt_Q <= 'd0;
    end
    else begin
      // channel 0
      if (ch0_read_req_kickoff & ~ch0_read_resp_kickoff) begin
        if (mcash_ch0_req_bank0) begin
          ch0_bank0_read_req_cnt_Q <= ch0_bank0_read_req_cnt_Q + 'd1;
        end
        else if (mcash_ch0_req_bank1) begin
          ch0_bank1_read_req_cnt_Q <= ch0_bank1_read_req_cnt_Q + 'd1;
        end
        else if (mcash_ch0_req_bank2) begin
          ch0_bank2_read_req_cnt_Q <= ch0_bank2_read_req_cnt_Q + 'd1;
        end
        else if (mcash_ch0_req_bank3) begin
          ch0_bank3_read_req_cnt_Q <= ch0_bank3_read_req_cnt_Q + 'd1;
        end
      end
      else if (~ch0_read_req_kickoff & ch0_read_resp_kickoff) begin
        if (mcash_ch0_rtn_bank0) begin
          ch0_bank0_read_req_cnt_Q <= ch0_bank0_read_req_cnt_Q - 'd1;
        end
        else if (mcash_ch0_rtn_bank1) begin
          ch0_bank1_read_req_cnt_Q <= ch0_bank1_read_req_cnt_Q - 'd1;
        end
        else if (mcash_ch0_rtn_bank2) begin
          ch0_bank2_read_req_cnt_Q <= ch0_bank2_read_req_cnt_Q - 'd1;
        end
        else if (mcash_ch0_rtn_bank3) begin
          ch0_bank3_read_req_cnt_Q <= ch0_bank3_read_req_cnt_Q - 'd1;
        end
      end
      // channel 1
      if (ch1_read_req_kickoff & ~ch1_read_resp_kickoff) begin
        if (mcash_ch1_req_bank0) begin
          ch1_bank0_read_req_cnt_Q <= ch1_bank0_read_req_cnt_Q + 'd1;
        end
        else if (mcash_ch1_req_bank1) begin
          ch1_bank1_read_req_cnt_Q <= ch1_bank1_read_req_cnt_Q + 'd1;
        end
        else if (mcash_ch1_req_bank2) begin
          ch1_bank2_read_req_cnt_Q <= ch1_bank2_read_req_cnt_Q + 'd1;
        end
        else if (mcash_ch1_req_bank3) begin
          ch1_bank3_read_req_cnt_Q <= ch1_bank3_read_req_cnt_Q + 'd1;
        end
      end
      else if (~ch1_read_req_kickoff & ch1_read_resp_kickoff) begin
        if (mcash_ch1_rtn_bank0) begin
          ch1_bank0_read_req_cnt_Q <= ch1_bank0_read_req_cnt_Q - 'd1;
        end
        else if (mcash_ch1_rtn_bank1) begin
          ch1_bank1_read_req_cnt_Q <= ch1_bank1_read_req_cnt_Q - 'd1;
        end
        else if (mcash_ch1_rtn_bank2) begin
          ch1_bank2_read_req_cnt_Q <= ch1_bank2_read_req_cnt_Q - 'd1;
        end
        else if (mcash_ch1_rtn_bank3) begin
          ch1_bank3_read_req_cnt_Q <= ch1_bank3_read_req_cnt_Q - 'd1;
        end
      end
      // channel 2
      if (ch2_read_req_kickoff & ~ch2_read_resp_kickoff) begin
        if (mcash_ch2_req_bank0) begin
          ch2_bank0_read_req_cnt_Q <= ch2_bank0_read_req_cnt_Q + 'd1;
        end
        else if (mcash_ch2_req_bank1) begin
          ch2_bank1_read_req_cnt_Q <= ch2_bank1_read_req_cnt_Q + 'd1;
        end
        else if (mcash_ch2_req_bank2) begin
          ch2_bank2_read_req_cnt_Q <= ch2_bank2_read_req_cnt_Q + 'd1;
        end
        else if (mcash_ch2_req_bank3) begin
          ch2_bank3_read_req_cnt_Q <= ch2_bank3_read_req_cnt_Q + 'd1;
        end
      end
      else if (~ch2_read_req_kickoff & ch2_read_resp_kickoff) begin
        if (mcash_ch2_rtn_bank0) begin
          ch2_bank0_read_req_cnt_Q <= ch2_bank0_read_req_cnt_Q - 'd1;
        end
        else if (mcash_ch2_rtn_bank1) begin
          ch2_bank1_read_req_cnt_Q <= ch2_bank1_read_req_cnt_Q - 'd1;
        end
        else if (mcash_ch2_rtn_bank2) begin
          ch2_bank2_read_req_cnt_Q <= ch2_bank2_read_req_cnt_Q - 'd1;
        end
        else if (mcash_ch2_rtn_bank3) begin
          ch2_bank3_read_req_cnt_Q <= ch2_bank3_read_req_cnt_Q - 'd1;
        end
      end
    end
    
  end

  always_ff @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      ch0_rob_bank0_read_resp_cnt_Q <= 'd0;
      ch0_rob_bank1_read_resp_cnt_Q <= 'd0;
      ch0_rob_bank2_read_resp_cnt_Q <= 'd0;
      ch0_rob_bank3_read_resp_cnt_Q <= 'd0;
      ch1_rob_bank0_read_resp_cnt_Q <= 'd0;
      ch1_rob_bank1_read_resp_cnt_Q <= 'd0;
      ch1_rob_bank2_read_resp_cnt_Q <= 'd0;
      ch1_rob_bank3_read_resp_cnt_Q <= 'd0;
      ch2_rob_bank0_read_resp_cnt_Q <= 'd0;
      ch2_rob_bank1_read_resp_cnt_Q <= 'd0;
      ch2_rob_bank2_read_resp_cnt_Q <= 'd0;
      ch2_rob_bank3_read_resp_cnt_Q <= 'd0;

    end
    else begin
      // CH0 Bank0
      if (mcash_ch0_spw_buffer_push_bank0 & ~mcash_ch0_spw_buffer_pop_bank0) begin
        ch0_rob_bank0_read_resp_cnt_Q <= ch0_rob_bank0_read_resp_cnt_Q + 'd1;
      end
      else if (~mcash_ch0_spw_buffer_push_bank0 & mcash_ch0_spw_buffer_pop_bank0) begin
        ch0_rob_bank0_read_resp_cnt_Q <= ch0_rob_bank0_read_resp_cnt_Q - 'd1;
      end
      // CH0 Bank1
      if (mcash_ch0_spw_buffer_push_bank1 & ~mcash_ch0_spw_buffer_pop_bank1) begin
        ch0_rob_bank1_read_resp_cnt_Q <= ch0_rob_bank1_read_resp_cnt_Q + 'd1;
      end
      else if (~mcash_ch0_spw_buffer_push_bank1 & mcash_ch0_spw_buffer_pop_bank1) begin
        ch0_rob_bank1_read_resp_cnt_Q <= ch0_rob_bank1_read_resp_cnt_Q - 'd1;
      end
      // CH0 Bank2
      if (mcash_ch0_spw_buffer_push_bank2 & ~mcash_ch0_spw_buffer_pop_bank2) begin
        ch0_rob_bank2_read_resp_cnt_Q <= ch0_rob_bank2_read_resp_cnt_Q + 'd1;
      end
      else if (~mcash_ch0_spw_buffer_push_bank2 & mcash_ch0_spw_buffer_pop_bank2) begin
        ch0_rob_bank2_read_resp_cnt_Q <= ch0_rob_bank2_read_resp_cnt_Q - 'd1;
      end
      // CH0 Bank3
      if (mcash_ch0_spw_buffer_push_bank3 & ~mcash_ch0_spw_buffer_pop_bank3) begin
        ch0_rob_bank3_read_resp_cnt_Q <= ch0_rob_bank3_read_resp_cnt_Q + 'd1;
      end
      else if (~mcash_ch0_spw_buffer_push_bank3 & mcash_ch0_spw_buffer_pop_bank3) begin
        ch0_rob_bank3_read_resp_cnt_Q <= ch0_rob_bank3_read_resp_cnt_Q - 'd1;
      end

      // CH1 Bank0
      if (mcash_ch1_spw_buffer_push_bank0 & ~mcash_ch1_spw_buffer_pop_bank0) begin
        ch1_rob_bank0_read_resp_cnt_Q <= ch1_rob_bank0_read_resp_cnt_Q + 'd1;
      end
      else if (~mcash_ch1_spw_buffer_push_bank0 & mcash_ch1_spw_buffer_pop_bank0) begin
        ch1_rob_bank0_read_resp_cnt_Q <= ch1_rob_bank0_read_resp_cnt_Q - 'd1;
      end
      // CH1 Bank1
      if (mcash_ch1_spw_buffer_push_bank1 & ~mcash_ch1_spw_buffer_pop_bank1) begin
        ch1_rob_bank1_read_resp_cnt_Q <= ch1_rob_bank1_read_resp_cnt_Q + 'd1;
      end
      else if (~mcash_ch1_spw_buffer_push_bank1 & mcash_ch1_spw_buffer_pop_bank1) begin
        ch1_rob_bank1_read_resp_cnt_Q <= ch1_rob_bank1_read_resp_cnt_Q - 'd1;
      end
      // CH1 Bank2
      if (mcash_ch1_spw_buffer_push_bank2 & ~mcash_ch1_spw_buffer_pop_bank2) begin
        ch1_rob_bank2_read_resp_cnt_Q <= ch1_rob_bank2_read_resp_cnt_Q + 'd1;
      end
      else if (~mcash_ch1_spw_buffer_push_bank2 & mcash_ch1_spw_buffer_pop_bank2) begin
        ch1_rob_bank2_read_resp_cnt_Q <= ch1_rob_bank2_read_resp_cnt_Q - 'd1;
      end
      // CH1 Bank3
      if (mcash_ch1_spw_buffer_push_bank3 & ~mcash_ch1_spw_buffer_pop_bank3) begin
        ch1_rob_bank3_read_resp_cnt_Q <= ch1_rob_bank3_read_resp_cnt_Q + 'd1;
      end
      else if (~mcash_ch1_spw_buffer_push_bank3 & mcash_ch1_spw_buffer_pop_bank3) begin
        ch1_rob_bank3_read_resp_cnt_Q <= ch1_rob_bank3_read_resp_cnt_Q - 'd1;
      end

      // CH2 Bank0
      if (mcash_ch2_spw_buffer_push_bank0 & ~mcash_ch2_spw_buffer_pop_bank0) begin
        ch2_rob_bank0_read_resp_cnt_Q <= ch2_rob_bank0_read_resp_cnt_Q + 'd1;
      end
      else if (~mcash_ch2_spw_buffer_push_bank0 & mcash_ch2_spw_buffer_pop_bank0) begin
        ch2_rob_bank0_read_resp_cnt_Q <= ch2_rob_bank0_read_resp_cnt_Q - 'd1;
      end
      // CH2 Bank1
      if (mcash_ch2_spw_buffer_push_bank1 & ~mcash_ch2_spw_buffer_pop_bank1) begin
        ch2_rob_bank1_read_resp_cnt_Q <= ch2_rob_bank1_read_resp_cnt_Q + 'd1;
      end
      else if (~mcash_ch2_spw_buffer_push_bank1 & mcash_ch2_spw_buffer_pop_bank1) begin
        ch2_rob_bank1_read_resp_cnt_Q <= ch2_rob_bank1_read_resp_cnt_Q - 'd1;
      end
      // CH2 Bank2
      if (mcash_ch2_spw_buffer_push_bank2 & ~mcash_ch2_spw_buffer_pop_bank2) begin
        ch2_rob_bank2_read_resp_cnt_Q <= ch2_rob_bank2_read_resp_cnt_Q + 'd1;
      end
      else if (~mcash_ch2_spw_buffer_push_bank2 & mcash_ch2_spw_buffer_pop_bank2) begin
        ch2_rob_bank2_read_resp_cnt_Q <= ch2_rob_bank2_read_resp_cnt_Q - 'd1;
      end
      // CH2 Bank3
      if (mcash_ch2_spw_buffer_push_bank3 & ~mcash_ch2_spw_buffer_pop_bank3) begin
        ch2_rob_bank3_read_resp_cnt_Q <= ch2_rob_bank3_read_resp_cnt_Q + 'd1;
      end
      else if (~mcash_ch2_spw_buffer_push_bank3 & mcash_ch2_spw_buffer_pop_bank3) begin
        ch2_rob_bank3_read_resp_cnt_Q <= ch2_rob_bank3_read_resp_cnt_Q - 'd1;
      end
    end
  end

endmodule