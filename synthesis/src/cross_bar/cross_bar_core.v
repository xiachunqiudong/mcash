module cross_bar_core(
  input wire          clk_i,
  input wire          rst_i,
  // channel0
  input wire          mcash_ch0_valid_i,
  input wire          mcash_ch0_ready_o,
  input wire [31:4]   mcash_ch0_addr_i,
  // channel1
  input wire          mcash_ch1_valid_i,
  input wire          mcash_ch1_ready_o,
  input wire [31:4]   mcash_ch1_addr_i,
  // channel2
  input wire          mcash_ch2_valid_i,
  input wire          mcash_ch2_ready_o,
  input wire [31:4]   mcash_ch2_addr_i
);

  wire       ch0_wr_ptr_kickoff;
  wire [2:0] ch0_wr_ptr_In;
  reg  [2:0] ch0_wr_ptr_Q;
  wire [4:0] ch0_wr_ptr_onehot;
  wire       ch0_rd_ptr_kickoff;
  wire [2:0] ch0_rd_ptr_In;
  reg  [2:0] ch0_rd_ptr_Q;
  wire [2:0] ch0_used_entry_In;
  reg  [2:0] ch0_used_entry_Q;
  wire       ch1_wr_ptr_kickoff;
  wire [2:0] ch1_wr_ptr_In;
  reg  [2:0] ch1_wr_ptr_Q;
  wire [4:0] ch1_wr_ptr_onehot;
  wire       ch1_rd_ptr_kickoff;
  wire [2:0] ch1_rd_ptr_In;
  reg  [2:0] ch1_rd_ptr_Q;
  wire [2:0] ch1_used_entry_In;
  reg  [2:0] ch1_used_entry_Q;
  wire       ch2_wr_ptr_kickoff;
  wire [2:0] ch2_wr_ptr_In;
  reg  [2:0] ch2_wr_ptr_Q;
  wire [4:0] ch2_wr_ptr_onehot;
  wire       ch2_rd_ptr_kickoff;
  wire [2:0] ch2_rd_ptr_In;
  reg  [2:0] ch2_rd_ptr_Q;
  wire [2:0] ch2_used_entry_In;
  reg  [2:0] ch2_used_entry_Q;

//--------------------------------------------------------------
//                 channel0 req buffer ctrl
//--------------------------------------------------------------
// channel0 write ptr
  assign ch0_wr_ptr_kickoff = mcash_ch0_valid_i & mcash_ch0_ready_o;
  
  assign ch0_wr_ptr_In[2:0] = ch0_wr_ptr_Q[2:0] == 3'd5
                            ? 3'd0
                            : ch0_wr_ptr_Q[2:0] + 3'd1;

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      ch0_wr_ptr_Q[2:0] <= 3'd0;
    end
    else if (ch0_wr_ptr_kickoff) begin
      ch0_wr_ptr_Q[2:0] <= ch0_wr_ptr_In[2:0];
    end
  end

  assign ch0_wr_ptr_onehot[0] = ch0_wr_ptr_Q[2:0] == 3'd0;
  assign ch0_wr_ptr_onehot[1] = ch0_wr_ptr_Q[2:0] == 3'd1;
  assign ch0_wr_ptr_onehot[2] = ch0_wr_ptr_Q[2:0] == 3'd2;
  assign ch0_wr_ptr_onehot[3] = ch0_wr_ptr_Q[2:0] == 3'd3;
  assign ch0_wr_ptr_onehot[4] = ch0_wr_ptr_Q[2:0] == 3'd4;

// channel0 read ptr
  assign ch0_rd_ptr_kickoff = ch0_used_entry_Q[2:0] != 3'd0
                            & ch0_last_entry_already_pop;

  assign ch0_rd_ptr_In[2:0] = ch0_rd_ptr_Q[2:0] == 3'd5
                            ? 3'd0
                            : ch0_rd_ptr_Q[2:0] + 3'd1;

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      ch0_rd_ptr_Q[2:0] <= 3'd0;
    end
    else if (ch0_rd_ptr_kickoff) begin
      ch0_rd_ptr_Q[2:0] <= ch0_rd_ptr_In[2:0];
    end
  end

// channel0 entry num
  assign ch0_used_entry_In[2:0] =  ch0_wr_ptr_kickoff & ~ch0_rd_ptr_kickoff ? ch0_used_entry_Q[2:0] + 3'd1
                                : ~ch0_wr_ptr_kickoff &  ch0_rd_ptr_kickoff ? ch0_used_entry_Q[2:0] - 3'd1
                                :                                             ch0_used_entry_Q[2:0];

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      ch0_used_entry_Q[2:0] <= 3'd0;
    end
    else begin
      ch0_used_entry_Q[2:0] <= ch0_used_entry_In[2:0];
    end
  end

//--------------------------------------------------------------
//                 channel1 req buffer ctrl
//--------------------------------------------------------------
// channel1 write ptr
  assign ch1_wr_ptr_kickoff = mcash_ch1_valid_i & mcash_ch1_ready_o;
  
  assign ch1_wr_ptr_In[2:0] = ch1_wr_ptr_Q[2:0] == 3'd5
                            ? 3'd0
                            : ch1_wr_ptr_Q[2:0] + 3'd1;

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      ch1_wr_ptr_Q[2:0] <= 3'd0;
    end
    else if (ch1_wr_ptr_kickoff) begin
      ch1_wr_ptr_Q[2:0] <= ch1_wr_ptr_In[2:0];
    end
  end

  assign ch1_wr_ptr_onehot[0] = ch1_wr_ptr_Q[2:0] == 3'd0;
  assign ch1_wr_ptr_onehot[1] = ch1_wr_ptr_Q[2:0] == 3'd1;
  assign ch1_wr_ptr_onehot[2] = ch1_wr_ptr_Q[2:0] == 3'd2;
  assign ch1_wr_ptr_onehot[3] = ch1_wr_ptr_Q[2:0] == 3'd3;
  assign ch1_wr_ptr_onehot[4] = ch1_wr_ptr_Q[2:0] == 3'd4;

// channel1 read ptr
  assign ch1_rd_ptr_kickoff = ch1_used_entry_Q[2:0] != 3'd0
                            & ch1_last_entry_already_pop;

  assign ch1_rd_ptr_In[2:0] = ch1_rd_ptr_Q[2:0] == 3'd5
                            ? 3'd0
                            : ch1_rd_ptr_Q[2:0] + 3'd1;

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      ch1_rd_ptr_Q[2:0] <= 3'd0;
    end
    else if (ch1_rd_ptr_kickoff) begin
      ch1_rd_ptr_Q[2:0] <= ch1_rd_ptr_In[2:0];
    end
  end

// channel1 entry num
  assign ch1_used_entry_In[2:0] =  ch1_wr_ptr_kickoff & ~ch1_rd_ptr_kickoff ? ch1_used_entry_Q[2:0] + 3'd1
                                : ~ch1_wr_ptr_kickoff &  ch1_rd_ptr_kickoff ? ch1_used_entry_Q[2:0] - 3'd1
                                :                                             ch1_used_entry_Q[2:0];

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      ch1_used_entry_Q[2:0] <= 3'd0;
    end
    else begin
      ch1_used_entry_Q[2:0] <= ch1_used_entry_In[2:0];
    end
  end

//--------------------------------------------------------------
//                 channel2 req buffer ctrl
//--------------------------------------------------------------
// channel2 write ptr
  assign ch2_wr_ptr_kickoff = mcash_ch2_valid_i & mcash_ch2_ready_o;
  
  assign ch2_wr_ptr_In[2:0] = ch2_wr_ptr_Q[2:0] == 3'd5
                            ? 3'd0
                            : ch2_wr_ptr_Q[2:0] + 3'd1;

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      ch2_wr_ptr_Q[2:0] <= 3'd0;
    end
    else if (ch2_wr_ptr_kickoff) begin
      ch2_wr_ptr_Q[2:0] <= ch2_wr_ptr_In[2:0];
    end
  end

  assign ch2_wr_ptr_onehot[0] = ch2_wr_ptr_Q[2:0] == 3'd0;
  assign ch2_wr_ptr_onehot[1] = ch2_wr_ptr_Q[2:0] == 3'd1;
  assign ch2_wr_ptr_onehot[2] = ch2_wr_ptr_Q[2:0] == 3'd2;
  assign ch2_wr_ptr_onehot[3] = ch2_wr_ptr_Q[2:0] == 3'd3;
  assign ch2_wr_ptr_onehot[4] = ch2_wr_ptr_Q[2:0] == 3'd4;

// channel2 read ptr
  assign ch2_rd_ptr_kickoff = ch2_used_entry_Q[2:0] != 3'd0
                            & ch2_last_entry_already_pop;

  assign ch2_rd_ptr_In[2:0] = ch2_rd_ptr_Q[2:0] == 3'd5
                            ? 3'd0
                            : ch2_rd_ptr_Q[2:0] + 3'd1;

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      ch2_rd_ptr_Q[2:0] <= 3'd0;
    end
    else if (ch2_rd_ptr_kickoff) begin
      ch2_rd_ptr_Q[2:0] <= ch2_rd_ptr_In[2:0];
    end
  end

// channel2 entry num
  assign ch2_used_entry_In[2:0] =  ch2_wr_ptr_kickoff & ~ch2_rd_ptr_kickoff ? ch2_used_entry_Q[2:0] + 3'd1
                                : ~ch2_wr_ptr_kickoff &  ch2_rd_ptr_kickoff ? ch2_used_entry_Q[2:0] - 3'd1
                                :                                             ch2_used_entry_Q[2:0];

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      ch2_used_entry_Q[2:0] <= 3'd0;
    end
    else begin
      ch2_used_entry_Q[2:0] <= ch2_used_entry_In[2:0];
    end
  end


// CBE
  wire [1:0] ch0_req_bank_addr;
  wire [1:0] ch1_req_bank_addr;
  wire [1:0] ch2_req_bank_addr;
  wire       ch0_req_send_to_bank0;
  wire       ch0_req_send_to_bank1;
  wire       ch0_req_send_to_bank2;
  wire       ch0_req_send_to_bank3;
  wire       ch1_req_send_to_bank0;
  wire       ch1_req_send_to_bank1;
  wire       ch1_req_send_to_bank2;
  wire       ch1_req_send_to_bank3;
  wire       ch2_req_send_to_bank0;
  wire       ch2_req_send_to_bank1;
  wire       ch2_req_send_to_bank2;
  wire       ch2_req_send_to_bank3;

  wire [4:0] ch0_bank0_array_validate;
  wire [4:0] ch0_bank1_array_validate;
  wire [4:0] ch0_bank2_array_validate;
  wire [4:0] ch0_bank3_array_validate;
  wire [4:0] ch0_bank0_array_inValidate;
  wire [4:0] ch0_bank1_array_inValidate;
  wire [4:0] ch0_bank2_array_inValidate;
  wire [4:0] ch0_bank3_array_inValidate;
  wire [4:0] ch0_bank0_array_In;
  wire [4:0] ch0_bank1_array_In;
  wire [4:0] ch0_bank2_array_In;
  wire [4:0] ch0_bank3_array_In;
  reg  [4:0] ch0_bank0_array_Q;
  reg  [4:0] ch0_bank1_array_Q;
  reg  [4:0] ch0_bank2_array_Q;
  reg  [4:0] ch0_bank3_array_Q;

  wire [4:0] ch1_bank0_array_validate;
  wire [4:0] ch1_bank1_array_validate;
  wire [4:0] ch1_bank2_array_validate;
  wire [4:0] ch1_bank3_array_validate;
  wire [4:0] ch1_bank0_array_inValidate;
  wire [4:0] ch1_bank1_array_inValidate;
  wire [4:0] ch1_bank2_array_inValidate;
  wire [4:0] ch1_bank3_array_inValidate;
  wire [4:0] ch1_bank0_array_In;
  wire [4:0] ch1_bank1_array_In;
  wire [4:0] ch1_bank2_array_In;
  wire [4:0] ch1_bank3_array_In;
  reg  [4:0] ch1_bank0_array_Q;
  reg  [4:0] ch1_bank1_array_Q;
  reg  [4:0] ch1_bank2_array_Q;
  reg  [4:0] ch1_bank3_array_Q;

  wire [4:0] ch2_bank0_array_validate;
  wire [4:0] ch2_bank1_array_validate;
  wire [4:0] ch2_bank2_array_validate;
  wire [4:0] ch2_bank3_array_validate;
  wire [4:0] ch2_bank0_array_inValidate;
  wire [4:0] ch2_bank1_array_inValidate;
  wire [4:0] ch2_bank2_array_inValidate;
  wire [4:0] ch2_bank3_array_inValidate;
  wire [4:0] ch2_bank0_array_In;
  wire [4:0] ch2_bank1_array_In;
  wire [4:0] ch2_bank2_array_In;
  wire [4:0] ch2_bank3_array_In;
  reg  [4:0] ch2_bank0_array_Q;
  reg  [4:0] ch2_bank1_array_Q;
  reg  [4:0] ch2_bank2_array_Q;
  reg  [4:0] ch2_bank3_array_Q;

  wire [2:0] ch0_send_to_bank0_entry_id;
  wire [2:0] ch0_send_to_bank1_entry_id;
  wire [2:0] ch0_send_to_bank2_entry_id;
  wire [2:0] ch0_send_to_bank3_entry_id;

  wire ch0_has_entry_want_send_to_bank0;
  wire ch0_has_entry_want_send_to_bank1;
  wire ch0_has_entry_want_send_to_bank2;
  wire ch0_has_entry_want_send_to_bank3;


//--------------------------------------------------------------
//           channel cache request bank mapping
//--------------------------------------------------------------
  assign ch0_req_bank_addr[1:0] = mcash_ch0_addr_i[8:7];
  assign ch1_req_bank_addr[1:0] = mcash_ch1_addr_i[8:7];
  assign ch2_req_bank_addr[1:0] = mcash_ch2_addr_i[8:7];

  assign ch0_req_send_to_bank0 = ch0_req_bank_addr[1:0] == 2'd0;
  assign ch0_req_send_to_bank1 = ch0_req_bank_addr[1:0] == 2'd1;
  assign ch0_req_send_to_bank2 = ch0_req_bank_addr[1:0] == 2'd2;
  assign ch0_req_send_to_bank3 = ch0_req_bank_addr[1:0] == 2'd3;

  assign ch1_req_send_to_bank0 = ch1_req_bank_addr[1:0] == 2'd0;
  assign ch1_req_send_to_bank1 = ch1_req_bank_addr[1:0] == 2'd1;
  assign ch1_req_send_to_bank2 = ch1_req_bank_addr[1:0] == 2'd2;
  assign ch1_req_send_to_bank3 = ch1_req_bank_addr[1:0] == 2'd3;

  assign ch2_req_send_to_bank0 = ch2_req_bank_addr[1:0] == 2'd0;
  assign ch2_req_send_to_bank1 = ch2_req_bank_addr[1:0] == 2'd1;
  assign ch2_req_send_to_bank2 = ch2_req_bank_addr[1:0] == 2'd2;
  assign ch2_req_send_to_bank3 = ch2_req_bank_addr[1:0] == 2'd3;

//--------------------------------------------------------------
//                Channel0: bank[0-3] array
//--------------------------------------------------------------
  assign ch0_bank0_array_validate[4:0] = {5{ch0_wr_ptr_kickoff & ch0_req_send_to_bank0}}
                                       & ch0_wr_ptr_onehot[4:0];

  assign ch0_bank1_array_validate[4:0] = {5{ch0_wr_ptr_kickoff & ch0_req_send_to_bank1}}
                                       & ch0_wr_ptr_onehot[4:0];

  assign ch0_bank2_array_validate[4:0] = {5{ch0_wr_ptr_kickoff & ch0_req_send_to_bank2}}
                                       & ch0_wr_ptr_onehot[4:0];

  assign ch0_bank3_array_validate[4:0] = {5{ch0_wr_ptr_kickoff & ch0_req_send_to_bank3}}
                                       & ch0_wr_ptr_onehot[4:0];

  assign ch0_bank0_array_In[4:0] = (ch0_bank0_array_Q[4:0] & ~ch0_bank0_array_inValidate[4:0]) // invalidate
                                 | ch0_bank0_array_validate[4:0];                              // validate

  assign ch0_bank1_array_In[4:0] = (ch0_bank1_array_Q[4:0] & ~ch0_bank1_array_inValidate[4:0]) // invalidate
                                 | ch0_bank1_array_validate[4:0];                              // validate

  assign ch0_bank2_array_In[4:0] = (ch0_bank2_array_Q[4:0] & ~ch0_bank2_array_inValidate[4:0]) // invalidate
                                 | ch0_bank2_array_validate[4:0];                              // validate

  assign ch0_bank3_array_In[4:0] = (ch0_bank3_array_Q[4:0] & ~ch0_bank3_array_inValidate[4:0]) // invalidate
                                 | ch0_bank3_array_validate[4:0];                              // validate

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      ch0_bank0_array_Q[4:0] <= 5'b0;
      ch0_bank1_array_Q[4:0] <= 5'b0;
      ch0_bank2_array_Q[4:0] <= 5'b0;
      ch0_bank3_array_Q[4:0] <= 5'b0;
    end
    else begin
      ch0_bank0_array_Q[4:0] <= ch0_bank0_array_In[4:0];
      ch0_bank1_array_Q[4:0] <= ch0_bank1_array_In[4:0];
      ch0_bank2_array_Q[4:0] <= ch0_bank2_array_In[4:0];
      ch0_bank3_array_Q[4:0] <= ch0_bank3_array_In[4:0];
    end
  end

  assign ch0_has_entry_want_send_to_bank0 = |ch0_bank0_array_Q[4:0];
  assign ch0_has_entry_want_send_to_bank1 = |ch0_bank1_array_Q[4:0];
  assign ch0_has_entry_want_send_to_bank2 = |ch0_bank2_array_Q[4:0];
  assign ch0_has_entry_want_send_to_bank3 = |ch0_bank3_array_Q[4:0];

//--------------------------------------------------------------
//                channel1: bank[0-3] array
//--------------------------------------------------------------
  assign ch1_bank0_array_validate[4:0] = {5{ch1_wr_ptr_kickoff & ch1_req_send_to_bank0}}
                                       & ch1_wr_ptr_onehot[4:0];

  assign ch1_bank1_array_validate[4:0] = {5{ch1_wr_ptr_kickoff & ch1_req_send_to_bank1}}
                                       & ch1_wr_ptr_onehot[4:0];

  assign ch1_bank2_array_validate[4:0] = {5{ch1_wr_ptr_kickoff & ch1_req_send_to_bank2}}
                                       & ch1_wr_ptr_onehot[4:0];

  assign ch1_bank3_array_validate[4:0] = {5{ch1_wr_ptr_kickoff & ch1_req_send_to_bank3}}
                                       & ch1_wr_ptr_onehot[4:0];

  assign ch1_bank0_array_In[4:0] = (ch1_bank0_array_Q[4:0] & ~ch1_bank0_array_inValidate[4:0]) // invalidate
                                 | ch1_bank0_array_validate[4:0];                              // validate

  assign ch1_bank1_array_In[4:0] = (ch1_bank1_array_Q[4:0] & ~ch1_bank1_array_inValidate[4:0]) // invalidate
                                 | ch1_bank1_array_validate[4:0];                              // validate

  assign ch1_bank2_array_In[4:0] = (ch1_bank2_array_Q[4:0] & ~ch1_bank2_array_inValidate[4:0]) // invalidate
                                 | ch1_bank2_array_validate[4:0];                              // validate

  assign ch1_bank3_array_In[4:0] = (ch1_bank3_array_Q[4:0] & ~ch1_bank3_array_inValidate[4:0]) // invalidate
                                 | ch1_bank3_array_validate[4:0];                              // validate

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      ch1_bank0_array_Q[4:0] <= 5'b0;
      ch1_bank1_array_Q[4:0] <= 5'b0;
      ch1_bank2_array_Q[4:0] <= 5'b0;
      ch1_bank3_array_Q[4:0] <= 5'b0;
    end
    else begin
      ch1_bank0_array_Q[4:0] <= ch1_bank0_array_In[4:0];
      ch1_bank1_array_Q[4:0] <= ch1_bank1_array_In[4:0];
      ch1_bank2_array_Q[4:0] <= ch1_bank2_array_In[4:0];
      ch1_bank3_array_Q[4:0] <= ch1_bank3_array_In[4:0];
    end
  end

  assign ch1_has_entry_want_send_to_bank0 = |ch1_bank0_array_Q[4:0];
  assign ch1_has_entry_want_send_to_bank1 = |ch1_bank1_array_Q[4:0];
  assign ch1_has_entry_want_send_to_bank2 = |ch1_bank2_array_Q[4:0];
  assign ch1_has_entry_want_send_to_bank3 = |ch1_bank3_array_Q[4:0];

//--------------------------------------------------------------
//                channel2: bank[0-3] array
//--------------------------------------------------------------
  assign ch2_bank0_array_validate[4:0] = {5{ch2_wr_ptr_kickoff & ch2_req_send_to_bank0}}
                                       & ch2_wr_ptr_onehot[4:0];

  assign ch2_bank1_array_validate[4:0] = {5{ch2_wr_ptr_kickoff & ch2_req_send_to_bank1}}
                                       & ch2_wr_ptr_onehot[4:0];

  assign ch2_bank2_array_validate[4:0] = {5{ch2_wr_ptr_kickoff & ch2_req_send_to_bank2}}
                                       & ch2_wr_ptr_onehot[4:0];

  assign ch2_bank3_array_validate[4:0] = {5{ch2_wr_ptr_kickoff & ch2_req_send_to_bank3}}
                                       & ch2_wr_ptr_onehot[4:0];

  assign ch2_bank0_array_In[4:0] = (ch2_bank0_array_Q[4:0] & ~ch2_bank0_array_inValidate[4:0]) // invalidate
                                 | ch2_bank0_array_validate[4:0];                              // validate

  assign ch2_bank1_array_In[4:0] = (ch2_bank1_array_Q[4:0] & ~ch2_bank1_array_inValidate[4:0]) // invalidate
                                 | ch2_bank1_array_validate[4:0];                              // validate

  assign ch2_bank2_array_In[4:0] = (ch2_bank2_array_Q[4:0] & ~ch2_bank2_array_inValidate[4:0]) // invalidate
                                 | ch2_bank2_array_validate[4:0];                              // validate

  assign ch2_bank3_array_In[4:0] = (ch2_bank3_array_Q[4:0] & ~ch2_bank3_array_inValidate[4:0]) // invalidate
                                 | ch2_bank3_array_validate[4:0];                              // validate

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      ch2_bank0_array_Q[4:0] <= 5'b0;
      ch2_bank1_array_Q[4:0] <= 5'b0;
      ch2_bank2_array_Q[4:0] <= 5'b0;
      ch2_bank3_array_Q[4:0] <= 5'b0;
    end
    else begin
      ch2_bank0_array_Q[4:0] <= ch2_bank0_array_In[4:0];
      ch2_bank1_array_Q[4:0] <= ch2_bank1_array_In[4:0];
      ch2_bank2_array_Q[4:0] <= ch2_bank2_array_In[4:0];
      ch2_bank3_array_Q[4:0] <= ch2_bank3_array_In[4:0];
    end
  end

  assign ch2_has_entry_want_send_to_bank0 = |ch2_bank0_array_Q[4:0];
  assign ch2_has_entry_want_send_to_bank1 = |ch2_bank1_array_Q[4:0];
  assign ch2_has_entry_want_send_to_bank2 = |ch2_bank2_array_Q[4:0];
  assign ch2_has_entry_want_send_to_bank3 = |ch2_bank3_array_Q[4:0];

//--------------------------------------------------------------
//          Bank channel cache request round robin
//
// channel0------
//              |
// channel1-------------> BANK0/1/2/3
//              |
// channel2------
//--------------------------------------------------------------



endmodule