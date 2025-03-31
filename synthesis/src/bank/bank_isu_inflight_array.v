module bank_isu_inflight_array(
  input wire       clk_i,
  input wire       rst_i,
  input wire       htu_isu_linefill_valid_i,
  input wire [7:0] htu_isu_linefill_set_dcd_i,
  input wire [7:0] htu_isu_linefill_way_dcd_i,
  input wire       biu_isu_rvalid_i,
  input wire [7:0] biu_isu_set_dcd_i,
  input wire [7:0] biu_isu_way_dcd_i
);

  wire [7:0] isu_set0_inflight_array_validate;
  wire [7:0] isu_set1_inflight_array_validate;
  wire [7:0] isu_set2_inflight_array_validate;
  wire [7:0] isu_set3_inflight_array_validate;
  wire [7:0] isu_set4_inflight_array_validate;
  wire [7:0] isu_set5_inflight_array_validate;
  wire [7:0] isu_set6_inflight_array_validate;
  wire [7:0] isu_set7_inflight_array_validate;
  wire [7:0] isu_set0_inflight_array_InValidate;
  wire [7:0] isu_set1_inflight_array_InValidate;
  wire [7:0] isu_set2_inflight_array_InValidate;
  wire [7:0] isu_set3_inflight_array_InValidate;
  wire [7:0] isu_set4_inflight_array_InValidate;
  wire [7:0] isu_set5_inflight_array_InValidate;
  wire [7:0] isu_set6_inflight_array_InValidate;
  wire [7:0] isu_set7_inflight_array_InValidate;
  wire [7:0] isu_set0_inflight_array_In;
  wire [7:0] isu_set1_inflight_array_In;
  wire [7:0] isu_set2_inflight_array_In;
  wire [7:0] isu_set3_inflight_array_In;
  wire [7:0] isu_set4_inflight_array_In;
  wire [7:0] isu_set5_inflight_array_In;
  wire [7:0] isu_set6_inflight_array_In;
  wire [7:0] isu_set7_inflight_array_In;
  reg  [7:0] isu_set0_inflight_array_Q;
  reg  [7:0] isu_set1_inflight_array_Q;
  reg  [7:0] isu_set2_inflight_array_Q;
  reg  [7:0] isu_set3_inflight_array_Q;
  reg  [7:0] isu_set4_inflight_array_Q;
  reg  [7:0] isu_set5_inflight_array_Q;
  reg  [7:0] isu_set6_inflight_array_Q;
  reg  [7:0] isu_set7_inflight_array_Q;

  assign isu_set0_inflight_array_validate[7:0] = htu_isu_linefill_way_dcd_i[7:0] & {8{htu_isu_linefill_valid_i & htu_isu_linefill_set_dcd_i[0]}};
  assign isu_set1_inflight_array_validate[7:0] = htu_isu_linefill_way_dcd_i[7:0] & {8{htu_isu_linefill_valid_i & htu_isu_linefill_set_dcd_i[1]}};
  assign isu_set2_inflight_array_validate[7:0] = htu_isu_linefill_way_dcd_i[7:0] & {8{htu_isu_linefill_valid_i & htu_isu_linefill_set_dcd_i[2]}};
  assign isu_set3_inflight_array_validate[7:0] = htu_isu_linefill_way_dcd_i[7:0] & {8{htu_isu_linefill_valid_i & htu_isu_linefill_set_dcd_i[3]}};
  assign isu_set4_inflight_array_validate[7:0] = htu_isu_linefill_way_dcd_i[7:0] & {8{htu_isu_linefill_valid_i & htu_isu_linefill_set_dcd_i[4]}};
  assign isu_set5_inflight_array_validate[7:0] = htu_isu_linefill_way_dcd_i[7:0] & {8{htu_isu_linefill_valid_i & htu_isu_linefill_set_dcd_i[5]}};
  assign isu_set6_inflight_array_validate[7:0] = htu_isu_linefill_way_dcd_i[7:0] & {8{htu_isu_linefill_valid_i & htu_isu_linefill_set_dcd_i[6]}};
  assign isu_set7_inflight_array_validate[7:0] = htu_isu_linefill_way_dcd_i[7:0] & {8{htu_isu_linefill_valid_i & htu_isu_linefill_set_dcd_i[7]}};

  assign isu_set0_inflight_array_InValidate[7:0] = biu_isu_way_dcd_i[7:0] & {8{biu_isu_rvalid_i & biu_isu_set_dcd_i[0]}};
  assign isu_set1_inflight_array_InValidate[7:0] = biu_isu_way_dcd_i[7:0] & {8{biu_isu_rvalid_i & biu_isu_set_dcd_i[1]}};
  assign isu_set2_inflight_array_InValidate[7:0] = biu_isu_way_dcd_i[7:0] & {8{biu_isu_rvalid_i & biu_isu_set_dcd_i[2]}};
  assign isu_set3_inflight_array_InValidate[7:0] = biu_isu_way_dcd_i[7:0] & {8{biu_isu_rvalid_i & biu_isu_set_dcd_i[3]}};
  assign isu_set4_inflight_array_InValidate[7:0] = biu_isu_way_dcd_i[7:0] & {8{biu_isu_rvalid_i & biu_isu_set_dcd_i[4]}};
  assign isu_set5_inflight_array_InValidate[7:0] = biu_isu_way_dcd_i[7:0] & {8{biu_isu_rvalid_i & biu_isu_set_dcd_i[5]}};
  assign isu_set6_inflight_array_InValidate[7:0] = biu_isu_way_dcd_i[7:0] & {8{biu_isu_rvalid_i & biu_isu_set_dcd_i[6]}};
  assign isu_set7_inflight_array_InValidate[7:0] = biu_isu_way_dcd_i[7:0] & {8{biu_isu_rvalid_i & biu_isu_set_dcd_i[7]}};

  assign isu_set0_inflight_array_In[7:0] = isu_set0_inflight_array_validate[7:0]          // validate
                                         | (    isu_set0_inflight_array_Q[7:0]
                                             & ~isu_set0_inflight_array_InValidate[7:0]); // In-validate
  
  assign isu_set1_inflight_array_In[7:0] = isu_set1_inflight_array_validate[7:0]          // validate
                                         | (    isu_set1_inflight_array_Q[7:0]
                                             & ~isu_set1_inflight_array_InValidate[7:0]); // In-validate

  assign isu_set2_inflight_array_In[7:0] = isu_set2_inflight_array_validate[7:0]          // validate
                                         | (    isu_set2_inflight_array_Q[7:0]
                                             & ~isu_set2_inflight_array_InValidate[7:0]); // In-validate

  assign isu_set3_inflight_array_In[7:0] = isu_set3_inflight_array_validate[7:0]          // validate
                                         | (    isu_set3_inflight_array_Q[7:0]
                                             & ~isu_set3_inflight_array_InValidate[7:0]); // In-validate

  assign isu_set4_inflight_array_In[7:0] = isu_set4_inflight_array_validate[7:0]          // validate
                                         | (    isu_set4_inflight_array_Q[7:0]
                                             & ~isu_set4_inflight_array_InValidate[7:0]); // In-validate

  assign isu_set5_inflight_array_In[7:0] = isu_set5_inflight_array_validate[7:0]          // validate
                                         | (    isu_set5_inflight_array_Q[7:0]
                                             & ~isu_set5_inflight_array_InValidate[7:0]); // In-validate

  assign isu_set6_inflight_array_In[7:0] = isu_set6_inflight_array_validate[7:0]          // validate
                                         | (    isu_set6_inflight_array_Q[7:0]
                                             & ~isu_set6_inflight_array_InValidate[7:0]); // In-validate

  assign isu_set7_inflight_array_In[7:0] = isu_set7_inflight_array_validate[7:0]          // validate
                                         | (    isu_set7_inflight_array_Q[7:0]
                                             & ~isu_set7_inflight_array_InValidate[7:0]); // In-validate

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      isu_set0_inflight_array_Q[7:0] <= 8'b0;
      isu_set1_inflight_array_Q[7:0] <= 8'b0;
      isu_set2_inflight_array_Q[7:0] <= 8'b0;
      isu_set3_inflight_array_Q[7:0] <= 8'b0;
      isu_set4_inflight_array_Q[7:0] <= 8'b0;
      isu_set5_inflight_array_Q[7:0] <= 8'b0;
      isu_set6_inflight_array_Q[7:0] <= 8'b0;
      isu_set7_inflight_array_Q[7:0] <= 8'b0;
    end
    else begin
      isu_set0_inflight_array_Q[7:0] <= isu_set0_inflight_array_In[7:0];
      isu_set1_inflight_array_Q[7:0] <= isu_set1_inflight_array_In[7:0];
      isu_set2_inflight_array_Q[7:0] <= isu_set2_inflight_array_In[7:0];
      isu_set3_inflight_array_Q[7:0] <= isu_set3_inflight_array_In[7:0];
      isu_set4_inflight_array_Q[7:0] <= isu_set4_inflight_array_In[7:0];
      isu_set5_inflight_array_Q[7:0] <= isu_set5_inflight_array_In[7:0];
      isu_set6_inflight_array_Q[7:0] <= isu_set6_inflight_array_In[7:0];
      isu_set7_inflight_array_Q[7:0] <= isu_set7_inflight_array_In[7:0];
    end
  end


endmodule