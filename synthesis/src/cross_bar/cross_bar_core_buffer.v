module cross_bar_core_buffer(
  input  wire         clk_i,
  input  wire         rst_i,
  input  wire         mcash_ch_req_valid_i,
  input  wire         mcash_ch_req_allowIn_o,
  input  wire [1:0]   mcash_ch_req_op_i,
  input  wire [31:4]  mcash_ch_req_addr_i,
  output wire         ch_has_entry_want_send_to_bank0_o,
  output wire         ch_has_entry_want_send_to_bank1_o,
  output wire         ch_has_entry_want_send_to_bank2_o,
  output wire         ch_has_entry_want_send_to_bank3_o,
  input  wire         bank0_channel_grant_i,
  input  wire         bank1_channel_grant_i,
  input  wire         bank2_channel_grant_i,
  input  wire         bank3_channel_grant_i,
  input  wire         bank0_req_can_go_i,
  input  wire         bank1_req_can_go_i,
  input  wire         bank2_req_can_go_i,
  input  wire         bank3_req_can_go_i,
  output wire [1:0]   ch_send_to_bank0_op_o,
  output wire [1:0]   ch_send_to_bank1_op_o,
  output wire [1:0]   ch_send_to_bank2_op_o,
  output wire [1:0]   ch_send_to_bank3_op_o,
  output wire [31:4]  ch_send_to_bank0_addr_o,
  output wire [31:4]  ch_send_to_bank1_addr_o,
  output wire [31:4]  ch_send_to_bank2_addr_o,
  output wire [31:4]  ch_send_to_bank3_addr_o
);

  wire       ch_wr_ptr_kickoff;
  wire [2:0] ch_wr_ptr_In;
  reg  [2:0] ch_wr_ptr_Q;
  wire [4:0] ch_wr_ptr_dcd;
  wire       ch_rd_ptr_kickoff;
  wire [2:0] ch_rd_ptr_In;
  reg  [2:0] ch_rd_ptr_Q;
  wire [4:0] ch_rd_ptr_dcd;
  wire [2:0] ch_used_entry_In;
  reg  [2:0] ch_used_entry_Q;

  reg  [31:4] ch_addr_array_entry0_Q;
  reg  [31:4] ch_addr_array_entry1_Q;
  reg  [31:4] ch_addr_array_entry2_Q;
  reg  [31:4] ch_addr_array_entry3_Q;
  reg  [31:4] ch_addr_array_entry4_Q;

  reg  [1:0] ch_op_array_entry0_Q;
  reg  [1:0] ch_op_array_entry1_Q;
  reg  [1:0] ch_op_array_entry2_Q;
  reg  [1:0] ch_op_array_entry3_Q;
  reg  [1:0] ch_op_array_entry4_Q;

  wire       ch_req_send_to_bank0;
  wire       ch_req_send_to_bank1;
  wire       ch_req_send_to_bank2;
  wire       ch_req_send_to_bank3;
  wire [4:0] ch_bank0_array_validate;
  wire [4:0] ch_bank1_array_validate;
  wire [4:0] ch_bank2_array_validate;
  wire [4:0] ch_bank3_array_validate;
  wire [4:0] ch_bank0_array_inValidate;
  wire [4:0] ch_bank1_array_inValidate;
  wire [4:0] ch_bank2_array_inValidate;
  wire [4:0] ch_bank3_array_inValidate;
  wire [4:0] ch_bank0_array_In;
  wire [4:0] ch_bank1_array_In;
  wire [4:0] ch_bank2_array_In;
  wire [4:0] ch_bank3_array_In;
  reg  [4:0] ch_bank0_array_Q;
  reg  [4:0] ch_bank1_array_Q;
  reg  [4:0] ch_bank2_array_Q;
  reg  [4:0] ch_bank3_array_Q;
  wire       ch_bank0_last_entry_valid;
  wire       ch_bank1_last_entry_valid;
  wire       ch_bank2_last_entry_valid;
  wire       ch_bank3_last_entry_valid;
  wire       ch_last_entry_already_pop;

  wire       ch_has_entry_want_send_to_bank0;
  wire       ch_has_entry_want_send_to_bank1;
  wire       ch_has_entry_want_send_to_bank2;
  wire       ch_has_entry_want_send_to_bank3;
  wire [2:0] ch_entryID_send_to_bank0;
  wire [2:0] ch_entryID_send_to_bank1;
  wire [2:0] ch_entryID_send_to_bank2;
  wire [2:0] ch_entryID_send_to_bank3;
  wire [4:0] ch_entryID_send_to_bank0_dcd;
  wire [4:0] ch_entryID_send_to_bank1_dcd;
  wire [4:0] ch_entryID_send_to_bank2_dcd;
  wire [4:0] ch_entryID_send_to_bank3_dcd;

//--------------------------------------------------------------
//                 channel req buffer ctrl
//--------------------------------------------------------------
// channel write ptr
  assign mcash_ch_req_allowIn_o = ch_used_entry_Q[2:0] < 3'd5;

  assign ch_wr_ptr_kickoff = mcash_ch_req_valid_i & mcash_ch_req_allowIn_o;
  
  assign ch_wr_ptr_In[2:0] = ch_wr_ptr_Q[2:0] == 3'd4
                            ? 3'd0
                            : ch_wr_ptr_Q[2:0] + 3'd1;

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      ch_wr_ptr_Q[2:0] <= 3'd0;
    end
    else if (ch_wr_ptr_kickoff) begin
      ch_wr_ptr_Q[2:0] <= ch_wr_ptr_In[2:0];
    end
  end

  assign ch_wr_ptr_dcd[0] = ch_wr_ptr_Q[2:0] == 3'd0;
  assign ch_wr_ptr_dcd[1] = ch_wr_ptr_Q[2:0] == 3'd1;
  assign ch_wr_ptr_dcd[2] = ch_wr_ptr_Q[2:0] == 3'd2;
  assign ch_wr_ptr_dcd[3] = ch_wr_ptr_Q[2:0] == 3'd3;
  assign ch_wr_ptr_dcd[4] = ch_wr_ptr_Q[2:0] == 3'd4;

// channel read ptr
  assign ch_rd_ptr_kickoff = ch_used_entry_Q[2:0] != 3'd0
                            & ch_last_entry_already_pop;

  assign ch_rd_ptr_In[2:0] = ch_rd_ptr_Q[2:0] == 3'd4
                            ? 3'd0
                            : ch_rd_ptr_Q[2:0] + 3'd1;

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      ch_rd_ptr_Q[2:0] <= 3'd0;
    end
    else if (ch_rd_ptr_kickoff) begin
      ch_rd_ptr_Q[2:0] <= ch_rd_ptr_In[2:0];
    end
  end

  assign ch_rd_ptr_dcd[0] = ch_rd_ptr_Q[2:0] == 3'd0;
  assign ch_rd_ptr_dcd[1] = ch_rd_ptr_Q[2:0] == 3'd1;
  assign ch_rd_ptr_dcd[2] = ch_rd_ptr_Q[2:0] == 3'd2;
  assign ch_rd_ptr_dcd[3] = ch_rd_ptr_Q[2:0] == 3'd3;
  assign ch_rd_ptr_dcd[4] = ch_rd_ptr_Q[2:0] == 3'd4;

// channel entry num
  assign ch_used_entry_In[2:0] =  ch_wr_ptr_kickoff & ~ch_rd_ptr_kickoff ? ch_used_entry_Q[2:0] + 3'd1
                               : ~ch_wr_ptr_kickoff &  ch_rd_ptr_kickoff ? ch_used_entry_Q[2:0] - 3'd1
                               :                                           ch_used_entry_Q[2:0];

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      ch_used_entry_Q[2:0] <= 3'd0;
    end
    else begin
      ch_used_entry_Q[2:0] <= ch_used_entry_In[2:0];
    end
  end

//--------------------------------------------------------------
//                Channel bank[0-3] valid array
//--------------------------------------------------------------
  assign ch_req_send_to_bank0 = mcash_ch_req_addr_i[9:8] == 2'd0;
  assign ch_req_send_to_bank1 = mcash_ch_req_addr_i[9:8] == 2'd1;
  assign ch_req_send_to_bank2 = mcash_ch_req_addr_i[9:8] == 2'd2;
  assign ch_req_send_to_bank3 = mcash_ch_req_addr_i[9:8] == 2'd3;

// Validate
  assign ch_bank0_array_validate[4:0] = {5{ch_wr_ptr_kickoff & ch_req_send_to_bank0}}
                                       & ch_wr_ptr_dcd[4:0];

  assign ch_bank1_array_validate[4:0] = {5{ch_wr_ptr_kickoff & ch_req_send_to_bank1}}
                                       & ch_wr_ptr_dcd[4:0];

  assign ch_bank2_array_validate[4:0] = {5{ch_wr_ptr_kickoff & ch_req_send_to_bank2}}
                                       & ch_wr_ptr_dcd[4:0];

  assign ch_bank3_array_validate[4:0] = {5{ch_wr_ptr_kickoff & ch_req_send_to_bank3}}
                                       & ch_wr_ptr_dcd[4:0];

// Innvalidate
  assign ch_bank0_array_inValidate[4:0] = ch_entryID_send_to_bank0_dcd[4:0] & {5{bank0_channel_grant_i & bank0_req_can_go_i}};
  assign ch_bank1_array_inValidate[4:0] = ch_entryID_send_to_bank1_dcd[4:0] & {5{bank1_channel_grant_i & bank1_req_can_go_i}};
  assign ch_bank2_array_inValidate[4:0] = ch_entryID_send_to_bank2_dcd[4:0] & {5{bank2_channel_grant_i & bank2_req_can_go_i}};
  assign ch_bank3_array_inValidate[4:0] = ch_entryID_send_to_bank3_dcd[4:0] & {5{bank3_channel_grant_i & bank3_req_can_go_i}};

  assign ch_bank0_array_In[4:0] = (ch_bank0_array_Q[4:0] & ~ch_bank0_array_inValidate[4:0]) // invalidate
                                 | ch_bank0_array_validate[4:0];                              // validate

  assign ch_bank1_array_In[4:0] = (ch_bank1_array_Q[4:0] & ~ch_bank1_array_inValidate[4:0]) // invalidate
                                 | ch_bank1_array_validate[4:0];                              // validate

  assign ch_bank2_array_In[4:0] = (ch_bank2_array_Q[4:0] & ~ch_bank2_array_inValidate[4:0]) // invalidate
                                 | ch_bank2_array_validate[4:0];                              // validate

  assign ch_bank3_array_In[4:0] = (ch_bank3_array_Q[4:0] & ~ch_bank3_array_inValidate[4:0]) // invalidate
                                 | ch_bank3_array_validate[4:0];                              // validate

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      ch_bank0_array_Q[4:0] <= 5'b0;
      ch_bank1_array_Q[4:0] <= 5'b0;
      ch_bank2_array_Q[4:0] <= 5'b0;
      ch_bank3_array_Q[4:0] <= 5'b0;
    end
    else begin
      ch_bank0_array_Q[4:0] <= ch_bank0_array_In[4:0];
      ch_bank1_array_Q[4:0] <= ch_bank1_array_In[4:0];
      ch_bank2_array_Q[4:0] <= ch_bank2_array_In[4:0];
      ch_bank3_array_Q[4:0] <= ch_bank3_array_In[4:0];
    end
  end

  assign ch_bank0_last_entry_valid = |(ch_bank0_array_Q[4:0] & ch_rd_ptr_dcd[4:0]);
  assign ch_bank1_last_entry_valid = |(ch_bank1_array_Q[4:0] & ch_rd_ptr_dcd[4:0]);
  assign ch_bank2_last_entry_valid = |(ch_bank2_array_Q[4:0] & ch_rd_ptr_dcd[4:0]);
  assign ch_bank3_last_entry_valid = |(ch_bank3_array_Q[4:0] & ch_rd_ptr_dcd[4:0]);

  assign ch_last_entry_already_pop = ~(   ch_bank0_last_entry_valid
                                        | ch_bank1_last_entry_valid
                                        | ch_bank2_last_entry_valid
                                        | ch_bank3_last_entry_valid);

//--------------------------------------------------------------
//                Channel bank addr array
//--------------------------------------------------------------
  always @(posedge clk_i) begin
    if (ch_wr_ptr_kickoff & ch_wr_ptr_dcd[0]) begin
      ch_addr_array_entry0_Q[31:4] <= mcash_ch_req_addr_i[31:4];
      ch_op_array_entry0_Q[1:0]    <= mcash_ch_req_op_i[1:0];
    end
    if (ch_wr_ptr_kickoff & ch_wr_ptr_dcd[1]) begin
      ch_addr_array_entry1_Q[31:4] <= mcash_ch_req_addr_i[31:4];
      ch_op_array_entry1_Q[1:0]    <= mcash_ch_req_op_i[1:0];
    end
    if (ch_wr_ptr_kickoff & ch_wr_ptr_dcd[2]) begin
      ch_addr_array_entry2_Q[31:4] <= mcash_ch_req_addr_i[31:4];
      ch_op_array_entry2_Q[1:0]    <= mcash_ch_req_op_i[1:0];
    end
    if (ch_wr_ptr_kickoff & ch_wr_ptr_dcd[3]) begin
      ch_addr_array_entry3_Q[31:4] <= mcash_ch_req_addr_i[31:4];
      ch_op_array_entry3_Q[1:0]    <= mcash_ch_req_op_i[1:0];
    end
    if (ch_wr_ptr_kickoff & ch_wr_ptr_dcd[4]) begin
      ch_addr_array_entry4_Q[31:4] <= mcash_ch_req_addr_i[31:4];
      ch_op_array_entry4_Q[1:0]    <= mcash_ch_req_op_i[1:0];
    end
  end

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
  assign ch_has_entry_want_send_to_bank0_o = |ch_bank0_array_Q[4:0];
  assign ch_has_entry_want_send_to_bank1_o = |ch_bank1_array_Q[4:0];
  assign ch_has_entry_want_send_to_bank2_o = |ch_bank2_array_Q[4:0];
  assign ch_has_entry_want_send_to_bank3_o = |ch_bank3_array_Q[4:0];

  channel_entry_rr
  ch_bank0_entry_rr (
    .channel_array_valid_i (ch_bank0_array_Q[4:0]        ),
    .read_ptr_i            (ch_rd_ptr_Q[2:0]             ),
    .read_ptr_dcd_i        (ch_rd_ptr_dcd[4:0]           ),
    .entry_id_o            (ch_entryID_send_to_bank0[2:0])
  );

  channel_entry_rr
  ch_bank1_entry_rr (
    .channel_array_valid_i (ch_bank1_array_Q[4:0]        ),
    .read_ptr_i            (ch_rd_ptr_Q[2:0]             ),
    .read_ptr_dcd_i        (ch_rd_ptr_dcd[4:0]           ),
    .entry_id_o            (ch_entryID_send_to_bank1[2:0])
  );

  channel_entry_rr
  ch_bank2_entry_rr (
    .channel_array_valid_i (ch_bank2_array_Q[4:0]        ),
    .read_ptr_i            (ch_rd_ptr_Q[2:0]             ),
    .read_ptr_dcd_i        (ch_rd_ptr_dcd[4:0]           ),
    .entry_id_o            (ch_entryID_send_to_bank2[2:0])
  );

  channel_entry_rr
  ch_bank3_entry_rr (
    .channel_array_valid_i (ch_bank3_array_Q[4:0]        ),
    .read_ptr_i            (ch_rd_ptr_Q[2:0]             ),
    .read_ptr_dcd_i        (ch_rd_ptr_dcd[4:0]           ),
    .entry_id_o            (ch_entryID_send_to_bank3[2:0])
  );

  assign ch_entryID_send_to_bank0_dcd[0] = ch_entryID_send_to_bank0[2:0] == 3'd0;
  assign ch_entryID_send_to_bank0_dcd[1] = ch_entryID_send_to_bank0[2:0] == 3'd1;
  assign ch_entryID_send_to_bank0_dcd[2] = ch_entryID_send_to_bank0[2:0] == 3'd2;
  assign ch_entryID_send_to_bank0_dcd[3] = ch_entryID_send_to_bank0[2:0] == 3'd3;
  assign ch_entryID_send_to_bank0_dcd[4] = ch_entryID_send_to_bank0[2:0] == 3'd4;

  assign ch_entryID_send_to_bank1_dcd[0] = ch_entryID_send_to_bank1[2:0] == 3'd0;
  assign ch_entryID_send_to_bank1_dcd[1] = ch_entryID_send_to_bank1[2:0] == 3'd1;
  assign ch_entryID_send_to_bank1_dcd[2] = ch_entryID_send_to_bank1[2:0] == 3'd2;
  assign ch_entryID_send_to_bank1_dcd[3] = ch_entryID_send_to_bank1[2:0] == 3'd3;
  assign ch_entryID_send_to_bank1_dcd[4] = ch_entryID_send_to_bank1[2:0] == 3'd4;

  assign ch_entryID_send_to_bank2_dcd[0] = ch_entryID_send_to_bank2[2:0] == 3'd0;
  assign ch_entryID_send_to_bank2_dcd[1] = ch_entryID_send_to_bank2[2:0] == 3'd1;
  assign ch_entryID_send_to_bank2_dcd[2] = ch_entryID_send_to_bank2[2:0] == 3'd2;
  assign ch_entryID_send_to_bank2_dcd[3] = ch_entryID_send_to_bank2[2:0] == 3'd3;
  assign ch_entryID_send_to_bank2_dcd[4] = ch_entryID_send_to_bank2[2:0] == 3'd4;

  assign ch_entryID_send_to_bank3_dcd[0] = ch_entryID_send_to_bank3[2:0] == 3'd0;
  assign ch_entryID_send_to_bank3_dcd[1] = ch_entryID_send_to_bank3[2:0] == 3'd1;
  assign ch_entryID_send_to_bank3_dcd[2] = ch_entryID_send_to_bank3[2:0] == 3'd2;
  assign ch_entryID_send_to_bank3_dcd[3] = ch_entryID_send_to_bank3[2:0] == 3'd3;
  assign ch_entryID_send_to_bank3_dcd[4] = ch_entryID_send_to_bank3[2:0] == 3'd4;

  assign ch_send_to_bank0_op_o[1:0] = {2{ch_entryID_send_to_bank0_dcd[0]}} & ch_op_array_entry0_Q[1:0]
                                    | {2{ch_entryID_send_to_bank0_dcd[1]}} & ch_op_array_entry1_Q[1:0]
                                    | {2{ch_entryID_send_to_bank0_dcd[2]}} & ch_op_array_entry2_Q[1:0]
                                    | {2{ch_entryID_send_to_bank0_dcd[3]}} & ch_op_array_entry3_Q[1:0]
                                    | {2{ch_entryID_send_to_bank0_dcd[4]}} & ch_op_array_entry4_Q[1:0];

  assign ch_send_to_bank1_op_o[1:0] = {2{ch_entryID_send_to_bank1_dcd[0]}} & ch_op_array_entry0_Q[1:0]
                                    | {2{ch_entryID_send_to_bank1_dcd[1]}} & ch_op_array_entry1_Q[1:0]
                                    | {2{ch_entryID_send_to_bank1_dcd[2]}} & ch_op_array_entry2_Q[1:0]
                                    | {2{ch_entryID_send_to_bank1_dcd[3]}} & ch_op_array_entry3_Q[1:0]
                                    | {2{ch_entryID_send_to_bank1_dcd[4]}} & ch_op_array_entry4_Q[1:0];

  assign ch_send_to_bank2_op_o[1:0] = {2{ch_entryID_send_to_bank2_dcd[0]}} & ch_op_array_entry0_Q[1:0]
                                    | {2{ch_entryID_send_to_bank2_dcd[1]}} & ch_op_array_entry1_Q[1:0]
                                    | {2{ch_entryID_send_to_bank2_dcd[2]}} & ch_op_array_entry2_Q[1:0]
                                    | {2{ch_entryID_send_to_bank2_dcd[3]}} & ch_op_array_entry3_Q[1:0]
                                    | {2{ch_entryID_send_to_bank2_dcd[4]}} & ch_op_array_entry4_Q[1:0];

  assign ch_send_to_bank3_op_o[1:0] = {2{ch_entryID_send_to_bank3_dcd[0]}} & ch_op_array_entry0_Q[1:0]
                                    | {2{ch_entryID_send_to_bank3_dcd[1]}} & ch_op_array_entry1_Q[1:0]
                                    | {2{ch_entryID_send_to_bank3_dcd[2]}} & ch_op_array_entry2_Q[1:0]
                                    | {2{ch_entryID_send_to_bank3_dcd[3]}} & ch_op_array_entry3_Q[1:0]
                                    | {2{ch_entryID_send_to_bank3_dcd[4]}} & ch_op_array_entry4_Q[1:0];

  assign ch_send_to_bank0_addr_o[31:4] = {28{ch_entryID_send_to_bank0_dcd[0]}} & ch_addr_array_entry0_Q[31:4]
                                       | {28{ch_entryID_send_to_bank0_dcd[1]}} & ch_addr_array_entry1_Q[31:4]
                                       | {28{ch_entryID_send_to_bank0_dcd[2]}} & ch_addr_array_entry2_Q[31:4]
                                       | {28{ch_entryID_send_to_bank0_dcd[3]}} & ch_addr_array_entry3_Q[31:4]
                                       | {28{ch_entryID_send_to_bank0_dcd[4]}} & ch_addr_array_entry4_Q[31:4];

  assign ch_send_to_bank1_addr_o[31:4] = {28{ch_entryID_send_to_bank1_dcd[0]}} & ch_addr_array_entry0_Q[31:4]
                                       | {28{ch_entryID_send_to_bank1_dcd[1]}} & ch_addr_array_entry1_Q[31:4]
                                       | {28{ch_entryID_send_to_bank1_dcd[2]}} & ch_addr_array_entry2_Q[31:4]
                                       | {28{ch_entryID_send_to_bank1_dcd[3]}} & ch_addr_array_entry3_Q[31:4]
                                       | {28{ch_entryID_send_to_bank1_dcd[4]}} & ch_addr_array_entry4_Q[31:4];

  assign ch_send_to_bank2_addr_o[31:4] = {28{ch_entryID_send_to_bank2_dcd[0]}} & ch_addr_array_entry0_Q[31:4]
                                       | {28{ch_entryID_send_to_bank2_dcd[1]}} & ch_addr_array_entry1_Q[31:4]
                                       | {28{ch_entryID_send_to_bank2_dcd[2]}} & ch_addr_array_entry2_Q[31:4]
                                       | {28{ch_entryID_send_to_bank2_dcd[3]}} & ch_addr_array_entry3_Q[31:4]
                                       | {28{ch_entryID_send_to_bank2_dcd[4]}} & ch_addr_array_entry4_Q[31:4];

  assign ch_send_to_bank3_addr_o[31:4] = {28{ch_entryID_send_to_bank3_dcd[0]}} & ch_addr_array_entry0_Q[31:4]
                                       | {28{ch_entryID_send_to_bank3_dcd[1]}} & ch_addr_array_entry1_Q[31:4]
                                       | {28{ch_entryID_send_to_bank3_dcd[2]}} & ch_addr_array_entry2_Q[31:4]
                                       | {28{ch_entryID_send_to_bank3_dcd[3]}} & ch_addr_array_entry3_Q[31:4]
                                       | {28{ch_entryID_send_to_bank3_dcd[4]}} & ch_addr_array_entry4_Q[31:4];

endmodule