module cross_bar_core(
  input wire          clk_i,
  input wire          rst_i,
  // channel0
  input wire          mcash_ch0_req_valid_i,
  input wire          mcash_ch0_req_allowIn_o,
  input wire [31:4]   mcash_ch0_req_addr_i,
  // channel1
  input wire          mcash_ch1_req_valid_i,
  input wire          mcash_ch1_req_allowIn_o,
  input wire [31:4]   mcash_ch1_req_addr_i,
  // channel2
  input wire          mcash_ch2_req_valid_i,
  input wire          mcash_ch2_req_allowIn_o,
  input wire [31:4]   mcash_ch2_req_addr_i
);

// CBE ctrl
  wire       ch0_wr_ptr_kickoff;
  wire [2:0] ch0_wr_ptr_In;
  reg  [2:0] ch0_wr_ptr_Q;
  wire [4:0] ch0_wr_ptr_dcd;
  wire       ch0_rd_ptr_kickoff;
  wire [2:0] ch0_rd_ptr_In;
  reg  [2:0] ch0_rd_ptr_Q;
  wire [4:0] ch0_rd_ptr_dcd;
  wire [2:0] ch0_used_entry_In;
  reg  [2:0] ch0_used_entry_Q;

  wire       ch1_wr_ptr_kickoff;
  wire [2:0] ch1_wr_ptr_In;
  reg  [2:0] ch1_wr_ptr_Q;
  wire [4:0] ch1_wr_ptr_dcd;
  wire       ch1_rd_ptr_kickoff;
  wire [2:0] ch1_rd_ptr_In;
  reg  [2:0] ch1_rd_ptr_Q;
  wire [4:0] ch1_rd_ptr_dcd;
  wire [2:0] ch1_used_entry_In;
  reg  [2:0] ch1_used_entry_Q;

  wire       ch2_wr_ptr_kickoff;
  wire [2:0] ch2_wr_ptr_In;
  reg  [2:0] ch2_wr_ptr_Q;
  wire [4:0] ch2_wr_ptr_dcd;
  wire       ch2_rd_ptr_kickoff;
  wire [2:0] ch2_rd_ptr_In;
  reg  [2:0] ch2_rd_ptr_Q;
  wire [4:0] ch2_rd_ptr_dcd;
  wire [2:0] ch2_used_entry_In;
  reg  [2:0] ch2_used_entry_Q;

  wire [1:0] ch0_req_bank_addr;
  wire [1:0] ch1_req_bank_addr;
  wire [1:0] ch2_req_bank_addr;
// CBE entry

  wire       ch0_req_send_to_bank0;
  wire       ch0_req_send_to_bank1;
  wire       ch0_req_send_to_bank2;
  wire       ch0_req_send_to_bank3;
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
  wire       ch0_bank0_last_entry_valid;
  wire       ch0_bank1_last_entry_valid;
  wire       ch0_bank2_last_entry_valid;
  wire       ch0_bank3_last_entry_valid;
  wire       ch0_last_entry_already_pop;

  wire       ch1_req_send_to_bank0;
  wire       ch1_req_send_to_bank1;
  wire       ch1_req_send_to_bank2;
  wire       ch1_req_send_to_bank3;
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
  wire       ch1_bank0_last_entry_valid;
  wire       ch1_bank1_last_entry_valid;
  wire       ch1_bank2_last_entry_valid;
  wire       ch1_bank3_last_entry_valid;
  wire       ch1_last_entry_already_pop;

  wire       ch2_req_send_to_bank0;
  wire       ch2_req_send_to_bank1;
  wire       ch2_req_send_to_bank2;
  wire       ch2_req_send_to_bank3;
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
  wire       ch2_bank0_last_entry_valid;
  wire       ch2_bank1_last_entry_valid;
  wire       ch2_bank2_last_entry_valid;
  wire       ch2_bank3_last_entry_valid;
  wire       ch2_last_entry_already_pop;

// entry rr
  wire       ch0_has_entry_want_send_to_bank0;
  wire       ch0_has_entry_want_send_to_bank1;
  wire       ch0_has_entry_want_send_to_bank2;
  wire       ch0_has_entry_want_send_to_bank3;
  wire [2:0] ch0_entryID_send_to_bank0;
  wire [2:0] ch0_entryID_send_to_bank1;
  wire [2:0] ch0_entryID_send_to_bank2;
  wire [2:0] ch0_entryID_send_to_bank3;
  wire       ch1_has_entry_want_send_to_bank0;
  wire       ch1_has_entry_want_send_to_bank1;
  wire       ch1_has_entry_want_send_to_bank2;
  wire       ch1_has_entry_want_send_to_bank3;
  wire [2:0] ch1_entryID_send_to_bank0;
  wire [2:0] ch1_entryID_send_to_bank1;
  wire [2:0] ch1_entryID_send_to_bank2;
  wire [2:0] ch1_entryID_send_to_bank3;
  wire       ch2_has_entry_want_send_to_bank0;
  wire       ch2_has_entry_want_send_to_bank1;
  wire       ch2_has_entry_want_send_to_bank2;
  wire       ch2_has_entry_want_send_to_bank3;
  wire [2:0] ch2_entryID_send_to_bank0;
  wire [2:0] ch2_entryID_send_to_bank1;
  wire [2:0] ch2_entryID_send_to_bank2;
  wire [2:0] ch2_entryID_send_to_bank3;
// channel rr


//--------------------------------------------------------------
//                 channel0 req buffer ctrl
//--------------------------------------------------------------
// channel0 write ptr
  assign mcash_ch0_req_allowIn_o = ch0_used_entry_Q[2:0] < 3'd5;

  assign ch0_wr_ptr_kickoff = mcash_ch0_req_valid_i & mcash_ch0_req_allowIn_o;
  
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

  assign ch0_wr_ptr_dcd[0] = ch0_wr_ptr_Q[2:0] == 3'd0;
  assign ch0_wr_ptr_dcd[1] = ch0_wr_ptr_Q[2:0] == 3'd1;
  assign ch0_wr_ptr_dcd[2] = ch0_wr_ptr_Q[2:0] == 3'd2;
  assign ch0_wr_ptr_dcd[3] = ch0_wr_ptr_Q[2:0] == 3'd3;
  assign ch0_wr_ptr_dcd[4] = ch0_wr_ptr_Q[2:0] == 3'd4;

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

  assign ch0_rd_ptr_dcd[0] = ch0_rd_ptr_Q[2:0] == 3'd0;
  assign ch0_rd_ptr_dcd[1] = ch0_rd_ptr_Q[2:0] == 3'd1;
  assign ch0_rd_ptr_dcd[2] = ch0_rd_ptr_Q[2:0] == 3'd2;
  assign ch0_rd_ptr_dcd[3] = ch0_rd_ptr_Q[2:0] == 3'd3;
  assign ch0_rd_ptr_dcd[4] = ch0_rd_ptr_Q[2:0] == 3'd4;

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
  assign mcash_ch1_req_allowIn_o = ch1_used_entry_Q[2:0] < 3'd5;

  assign ch1_wr_ptr_kickoff = mcash_ch1_req_valid_i & mcash_ch1_req_allowIn_o;
  
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

  assign ch1_wr_ptr_dcd[0] = ch1_wr_ptr_Q[2:0] == 3'd0;
  assign ch1_wr_ptr_dcd[1] = ch1_wr_ptr_Q[2:0] == 3'd1;
  assign ch1_wr_ptr_dcd[2] = ch1_wr_ptr_Q[2:0] == 3'd2;
  assign ch1_wr_ptr_dcd[3] = ch1_wr_ptr_Q[2:0] == 3'd3;
  assign ch1_wr_ptr_dcd[4] = ch1_wr_ptr_Q[2:0] == 3'd4;

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

  assign ch1_rd_ptr_dcd[0] = ch1_rd_ptr_Q[2:0] == 3'd0;
  assign ch1_rd_ptr_dcd[1] = ch1_rd_ptr_Q[2:0] == 3'd1;
  assign ch1_rd_ptr_dcd[2] = ch1_rd_ptr_Q[2:0] == 3'd2;
  assign ch1_rd_ptr_dcd[3] = ch1_rd_ptr_Q[2:0] == 3'd3;
  assign ch1_rd_ptr_dcd[4] = ch1_rd_ptr_Q[2:0] == 3'd4;

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
  assign mcash_ch2_req_allowIn_o = ch2_used_entry_Q[2:0] < 3'd5;

  assign ch2_wr_ptr_kickoff = mcash_ch2_req_valid_i & mcash_ch2_req_allowIn_o;
  
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

  assign ch2_wr_ptr_dcd[0] = ch2_wr_ptr_Q[2:0] == 3'd0;
  assign ch2_wr_ptr_dcd[1] = ch2_wr_ptr_Q[2:0] == 3'd1;
  assign ch2_wr_ptr_dcd[2] = ch2_wr_ptr_Q[2:0] == 3'd2;
  assign ch2_wr_ptr_dcd[3] = ch2_wr_ptr_Q[2:0] == 3'd3;
  assign ch2_wr_ptr_dcd[4] = ch2_wr_ptr_Q[2:0] == 3'd4;

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

  assign ch2_rd_ptr_dcd[0] = ch2_rd_ptr_Q[2:0] == 3'd0;
  assign ch2_rd_ptr_dcd[1] = ch2_rd_ptr_Q[2:0] == 3'd1;
  assign ch2_rd_ptr_dcd[2] = ch2_rd_ptr_Q[2:0] == 3'd2;
  assign ch2_rd_ptr_dcd[3] = ch2_rd_ptr_Q[2:0] == 3'd3;
  assign ch2_rd_ptr_dcd[4] = ch2_rd_ptr_Q[2:0] == 3'd4;

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

//--------------------------------------------------------------
//           channel cache request bank mapping
//--------------------------------------------------------------
  assign ch0_req_bank_addr[1:0] = mcash_ch0_req_addr_i[8:7];
  assign ch1_req_bank_addr[1:0] = mcash_ch1_req_addr_i[8:7];
  assign ch2_req_bank_addr[1:0] = mcash_ch2_req_addr_i[8:7];

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
                                       & ch0_wr_ptr_dcd[4:0];

  assign ch0_bank1_array_validate[4:0] = {5{ch0_wr_ptr_kickoff & ch0_req_send_to_bank1}}
                                       & ch0_wr_ptr_dcd[4:0];

  assign ch0_bank2_array_validate[4:0] = {5{ch0_wr_ptr_kickoff & ch0_req_send_to_bank2}}
                                       & ch0_wr_ptr_dcd[4:0];

  assign ch0_bank3_array_validate[4:0] = {5{ch0_wr_ptr_kickoff & ch0_req_send_to_bank3}}
                                       & ch0_wr_ptr_dcd[4:0];

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

  assign ch0_bank0_last_entry_valid = |(ch0_bank0_array_Q[4:0] & ch0_rd_ptr_dcd[4:0]);
  assign ch0_bank1_last_entry_valid = |(ch0_bank1_array_Q[4:0] & ch0_rd_ptr_dcd[4:0]);
  assign ch0_bank2_last_entry_valid = |(ch0_bank2_array_Q[4:0] & ch0_rd_ptr_dcd[4:0]);
  assign ch0_bank3_last_entry_valid = |(ch0_bank3_array_Q[4:0] & ch0_rd_ptr_dcd[4:0]);

  assign ch0_last_entry_already_pop = ~(  ch0_bank0_last_entry_valid
                                        | ch0_bank1_last_entry_valid
                                        | ch0_bank2_last_entry_valid
                                        | ch0_bank3_last_entry_valid);

//--------------------------------------------------------------
//                channel1: bank[0-3] array
//--------------------------------------------------------------
  assign ch1_bank0_array_validate[4:0] = {5{ch1_wr_ptr_kickoff & ch1_req_send_to_bank0}}
                                       & ch1_wr_ptr_dcd[4:0];

  assign ch1_bank1_array_validate[4:0] = {5{ch1_wr_ptr_kickoff & ch1_req_send_to_bank1}}
                                       & ch1_wr_ptr_dcd[4:0];

  assign ch1_bank2_array_validate[4:0] = {5{ch1_wr_ptr_kickoff & ch1_req_send_to_bank2}}
                                       & ch1_wr_ptr_dcd[4:0];

  assign ch1_bank3_array_validate[4:0] = {5{ch1_wr_ptr_kickoff & ch1_req_send_to_bank3}}
                                       & ch1_wr_ptr_dcd[4:0];

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

  assign ch1_bank0_last_entry_valid = |(ch1_bank0_array_Q[4:0] & ch1_rd_ptr_dcd[4:0]);
  assign ch1_bank1_last_entry_valid = |(ch1_bank1_array_Q[4:0] & ch1_rd_ptr_dcd[4:0]);
  assign ch1_bank2_last_entry_valid = |(ch1_bank2_array_Q[4:0] & ch1_rd_ptr_dcd[4:0]);
  assign ch1_bank3_last_entry_valid = |(ch1_bank3_array_Q[4:0] & ch1_rd_ptr_dcd[4:0]);

  assign ch1_last_entry_already_pop = ~(  ch1_bank0_last_entry_valid
                                        | ch1_bank1_last_entry_valid
                                        | ch1_bank2_last_entry_valid
                                        | ch1_bank3_last_entry_valid);

//--------------------------------------------------------------
//                channel2: bank[0-3] array
//--------------------------------------------------------------
  assign ch2_bank0_array_validate[4:0] = {5{ch2_wr_ptr_kickoff & ch2_req_send_to_bank0}}
                                       & ch2_wr_ptr_dcd[4:0];

  assign ch2_bank1_array_validate[4:0] = {5{ch2_wr_ptr_kickoff & ch2_req_send_to_bank1}}
                                       & ch2_wr_ptr_dcd[4:0];

  assign ch2_bank2_array_validate[4:0] = {5{ch2_wr_ptr_kickoff & ch2_req_send_to_bank2}}
                                       & ch2_wr_ptr_dcd[4:0];

  assign ch2_bank3_array_validate[4:0] = {5{ch2_wr_ptr_kickoff & ch2_req_send_to_bank3}}
                                       & ch2_wr_ptr_dcd[4:0];

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

  assign ch2_bank0_last_entry_valid = |(ch2_bank0_array_Q[4:0] & ch2_rd_ptr_dcd[4:0]);
  assign ch2_bank1_last_entry_valid = |(ch2_bank1_array_Q[4:0] & ch2_rd_ptr_dcd[4:0]);
  assign ch2_bank2_last_entry_valid = |(ch2_bank2_array_Q[4:0] & ch2_rd_ptr_dcd[4:0]);
  assign ch2_bank3_last_entry_valid = |(ch2_bank3_array_Q[4:0] & ch2_rd_ptr_dcd[4:0]);

  assign ch2_last_entry_already_pop = ~(  ch2_bank0_last_entry_valid
                                        | ch2_bank1_last_entry_valid
                                        | ch2_bank2_last_entry_valid
                                        | ch2_bank3_last_entry_valid);

//--------------------------------------------------------------
//          Channel entry cache request round robin
//
// entry0------
//            |
// entry1------
//            |  entry
// entry2---------------> Bank0/1/2/3 
//            |
// entry3------
//            |
// entry4------
//
//--------------------------------------------------------------

// channel0 entry rr
  assign ch0_has_entry_want_send_to_bank0 = |ch0_bank0_array_Q[4:0];
  assign ch0_has_entry_want_send_to_bank1 = |ch0_bank1_array_Q[4:0];
  assign ch0_has_entry_want_send_to_bank2 = |ch0_bank2_array_Q[4:0];
  assign ch0_has_entry_want_send_to_bank3 = |ch0_bank3_array_Q[4:0];

  channel_entry_rr
  ch0_bank0_entry_rr (
    .channel_array_valid_i (ch0_bank0_array_Q[4:0]        ),
    .read_ptr_i            (ch0_rd_ptr_Q[2:0]             ),
    .read_ptr_dcd_i        (ch0_rd_ptr_dcd[4:0]           ),
    .entry_id_o            (ch0_entryID_send_to_bank0[2:0])
  );

  channel_entry_rr
  ch0_bank1_entry_rr (
    .channel_array_valid_i (ch0_bank1_array_Q[4:0]        ),
    .read_ptr_i            (ch0_rd_ptr_Q[2:0]             ),
    .read_ptr_dcd_i        (ch0_rd_ptr_dcd[4:0]           ),
    .entry_id_o            (ch0_entryID_send_to_bank1[2:0])
  );

  channel_entry_rr
  ch0_bank2_entry_rr (
    .channel_array_valid_i (ch0_bank2_array_Q[4:0]        ),
    .read_ptr_i            (ch0_rd_ptr_Q[2:0]             ),
    .read_ptr_dcd_i        (ch0_rd_ptr_dcd[4:0]           ),
    .entry_id_o            (ch0_entryID_send_to_bank2[2:0])
  );

  channel_entry_rr
  ch0_bank3_entry_rr (
    .channel_array_valid_i (ch0_bank3_array_Q[4:0]        ),
    .read_ptr_i            (ch0_rd_ptr_Q[2:0]             ),
    .read_ptr_dcd_i        (ch0_rd_ptr_dcd[4:0]           ),
    .entry_id_o            (ch0_entryID_send_to_bank3[2:0])
  );

// channel1 entry rr
  assign ch1_has_entry_want_send_to_bank0 = |ch1_bank0_array_Q[4:0];
  assign ch1_has_entry_want_send_to_bank1 = |ch1_bank1_array_Q[4:0];
  assign ch1_has_entry_want_send_to_bank2 = |ch1_bank2_array_Q[4:0];
  assign ch1_has_entry_want_send_to_bank3 = |ch1_bank3_array_Q[4:0];

  channel_entry_rr
  ch1_bank0_entry_rr (
    .channel_array_valid_i (ch1_bank0_array_Q[4:0]        ),
    .read_ptr_i            (ch1_rd_ptr_Q[2:0]             ),
    .read_ptr_dcd_i        (ch1_rd_ptr_dcd[4:0]           ),
    .entry_id_o            (ch1_entryID_send_to_bank0[2:0])
  );

  channel_entry_rr
  ch1_bank1_entry_rr (
    .channel_array_valid_i (ch1_bank1_array_Q[4:0]        ),
    .read_ptr_i            (ch1_rd_ptr_Q[2:0]             ),
    .read_ptr_dcd_i        (ch1_rd_ptr_dcd[4:0]           ),
    .entry_id_o            (ch1_entryID_send_to_bank1[2:0])
  );

  channel_entry_rr
  ch1_bank2_entry_rr (
    .channel_array_valid_i (ch1_bank2_array_Q[4:0]        ),
    .read_ptr_i            (ch1_rd_ptr_Q[2:0]             ),
    .read_ptr_dcd_i        (ch1_rd_ptr_dcd[4:0]           ),
    .entry_id_o            (ch1_entryID_send_to_bank2[2:0])
  );

  channel_entry_rr
  ch1_bank3_entry_rr (
    .channel_array_valid_i (ch1_bank3_array_Q[4:0]        ),
    .read_ptr_i            (ch1_rd_ptr_Q[2:0]             ),
    .read_ptr_dcd_i        (ch1_rd_ptr_dcd[4:0]           ),
    .entry_id_o            (ch1_entryID_send_to_bank3[2:0])
  );

// channel2 entry rr
  assign ch2_has_entry_want_send_to_bank0 = |ch2_bank0_array_Q[4:0];
  assign ch2_has_entry_want_send_to_bank1 = |ch2_bank1_array_Q[4:0];
  assign ch2_has_entry_want_send_to_bank2 = |ch2_bank2_array_Q[4:0];
  assign ch2_has_entry_want_send_to_bank3 = |ch2_bank3_array_Q[4:0];

  channel_entry_rr
  ch2_bank0_entry_rr (
    .channel_array_valid_i (ch2_bank0_array_Q[4:0]        ),
    .read_ptr_i            (ch2_rd_ptr_Q[2:0]             ),
    .read_ptr_dcd_i        (ch2_rd_ptr_dcd[4:0]           ),
    .entry_id_o            (ch2_entryID_send_to_bank0[2:0])
  );

  channel_entry_rr
  ch2_bank1_entry_rr (
    .channel_array_valid_i (ch2_bank1_array_Q[4:0]        ),
    .read_ptr_i            (ch2_rd_ptr_Q[2:0]             ),
    .read_ptr_dcd_i        (ch2_rd_ptr_dcd[4:0]           ),
    .entry_id_o            (ch2_entryID_send_to_bank1[2:0])
  );

  channel_entry_rr
  ch2_bank2_entry_rr (
    .channel_array_valid_i (ch2_bank2_array_Q[4:0]        ),
    .read_ptr_i            (ch2_rd_ptr_Q[2:0]             ),
    .read_ptr_dcd_i        (ch2_rd_ptr_dcd[4:0]           ),
    .entry_id_o            (ch2_entryID_send_to_bank2[2:0])
  );

  channel_entry_rr
  ch2_bank3_entry_rr (
    .channel_array_valid_i (ch2_bank3_array_Q[4:0]        ),
    .read_ptr_i            (ch2_rd_ptr_Q[2:0]             ),
    .read_ptr_dcd_i        (ch2_rd_ptr_dcd[4:0]           ),
    .entry_id_o            (ch2_entryID_send_to_bank3[2:0])
  );

//--------------------------------------------------------------
//          Bank channel cache request round robin
//
// channel0------
//              |  channel
// channel1-----------------> BANK0/1/2/3
//              |
// channel2------
//
//--------------------------------------------------------------



endmodule