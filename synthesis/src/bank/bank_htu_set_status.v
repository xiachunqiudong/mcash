module bank_htu_set_status(
  input wire         clk_i,
  input wire         rst_i,
  input wire         set_hit_i,
  input wire [31:10] set_tag_i,
  input wire         offset_i
);

  wire [7:0] way_valid_array_In;
  reg  [7:0] way_valid_array_Q;

  wire [6:0] plru_tree_In;
  reg  [6:0] plru_tree_Q;

  wire [2:0] way0_refer_cnt_In;
  wire [2:0] way1_refer_cnt_In;
  wire [2:0] way2_refer_cnt_In;
  wire [2:0] way3_refer_cnt_In;
  wire [2:0] way4_refer_cnt_In;
  wire [2:0] way5_refer_cnt_In;
  wire [2:0] way6_refer_cnt_In;
  wire [2:0] way7_refer_cnt_In;

  reg  [2:0] way0_refer_cnt_Q;
  reg  [2:0] way1_refer_cnt_Q;
  reg  [2:0] way2_refer_cnt_Q;
  reg  [2:0] way3_refer_cnt_Q;
  reg  [2:0] way4_refer_cnt_Q;
  reg  [2:0] way5_refer_cnt_Q;
  reg  [2:0] way6_refer_cnt_Q;
  reg  [2:0] way7_refer_cnt_Q;

  wire [7:0]   way_tag_update_array;
  reg  [31:10] way0_tag_Q;
  reg  [31:10] way1_tag_Q;
  reg  [31:10] way2_tag_Q;
  reg  [31:10] way3_tag_Q;
  reg  [31:10] way4_tag_Q;
  reg  [31:10] way5_tag_Q;
  reg  [31:10] way6_tag_Q;
  reg  [31:10] way7_tag_Q;

  wire [1:0] way0_offset0_status_In;
  wire [1:0] way0_offset1_status_In;
  wire [1:0] way1_offset0_status_In;
  wire [1:0] way1_offset1_status_In;
  wire [1:0] way2_offset0_status_In;
  wire [1:0] way2_offset1_status_In;
  wire [1:0] way3_offset0_status_In;
  wire [1:0] way3_offset1_status_In;
  wire [1:0] way4_offset0_status_In;
  wire [1:0] way4_offset1_status_In;
  wire [1:0] way5_offset0_status_In;
  wire [1:0] way5_offset1_status_In;
  wire [1:0] way6_offset0_status_In;
  wire [1:0] way6_offset1_status_In;
  wire [1:0] way7_offset0_status_In;
  wire [1:0] way7_offset1_status_In;
 
  reg  [1:0] way0_offset0_status_Q;
  reg  [1:0] way0_offset1_status_Q;
  reg  [1:0] way1_offset0_status_Q;
  reg  [1:0] way1_offset1_status_Q;
  reg  [1:0] way2_offset0_status_Q;
  reg  [1:0] way2_offset1_status_Q;
  reg  [1:0] way3_offset0_status_Q;
  reg  [1:0] way3_offset1_status_Q;
  reg  [1:0] way4_offset0_status_Q;
  reg  [1:0] way4_offset1_status_Q;
  reg  [1:0] way5_offset0_status_Q;
  reg  [1:0] way5_offset1_status_Q;
  reg  [1:0] way6_offset0_status_Q;
  reg  [1:0] way6_offset1_status_Q;
  reg  [1:0] way7_offset0_status_Q;
  reg  [1:0] way7_offset1_status_Q;

  wire       cacheline_hit;
  wire [7:0] hit_way_array;
  wire [7:0] access_way_array;
  wire [7:0] oldest_way_array;

  wire [1:0] hit_way_offset_status;
  
  assign hit_way_array[0] = set_hit_i & (set_tag_i[31:10] == way0_tag_Q[31:10]) & way_valid_array_Q[0];
  assign hit_way_array[1] = set_hit_i & (set_tag_i[31:10] == way1_tag_Q[31:10]) & way_valid_array_Q[1];
  assign hit_way_array[2] = set_hit_i & (set_tag_i[31:10] == way2_tag_Q[31:10]) & way_valid_array_Q[2];
  assign hit_way_array[3] = set_hit_i & (set_tag_i[31:10] == way3_tag_Q[31:10]) & way_valid_array_Q[3];
  assign hit_way_array[4] = set_hit_i & (set_tag_i[31:10] == way4_tag_Q[31:10]) & way_valid_array_Q[4];
  assign hit_way_array[5] = set_hit_i & (set_tag_i[31:10] == way5_tag_Q[31:10]) & way_valid_array_Q[5];
  assign hit_way_array[6] = set_hit_i & (set_tag_i[31:10] == way6_tag_Q[31:10]) & way_valid_array_Q[6];
  assign hit_way_array[7] = set_hit_i & (set_tag_i[31:10] == way7_tag_Q[31:10]) & way_valid_array_Q[7];

  assign cacheline_hit = |hit_way_array[7:0];

  assign hit_way_offset_status[1:0] = {2{hit_way_array[0] & ~offset_i}} & way0_offset0_status_Q[1:0]
                                    | {2{hit_way_array[0] &  offset_i}} & way0_offset1_status_Q[1:0]
                                    | {2{hit_way_array[1] & ~offset_i}} & way1_offset0_status_Q[1:0]
                                    | {2{hit_way_array[1] &  offset_i}} & way1_offset1_status_Q[1:0]
                                    | {2{hit_way_array[2] & ~offset_i}} & way2_offset0_status_Q[1:0]
                                    | {2{hit_way_array[2] &  offset_i}} & way2_offset1_status_Q[1:0]
                                    | {2{hit_way_array[3] & ~offset_i}} & way3_offset0_status_Q[1:0]
                                    | {2{hit_way_array[3] &  offset_i}} & way3_offset1_status_Q[1:0]
                                    | {2{hit_way_array[4] & ~offset_i}} & way4_offset0_status_Q[1:0]
                                    | {2{hit_way_array[4] &  offset_i}} & way4_offset1_status_Q[1:0]
                                    | {2{hit_way_array[5] & ~offset_i}} & way5_offset0_status_Q[1:0]
                                    | {2{hit_way_array[5] &  offset_i}} & way5_offset1_status_Q[1:0]
                                    | {2{hit_way_array[6] & ~offset_i}} & way6_offset0_status_Q[1:0]
                                    | {2{hit_way_array[6] &  offset_i}} & way6_offset1_status_Q[1:0]
                                    | {2{hit_way_array[7] & ~offset_i}} & way7_offset0_status_Q[1:0]
                                    | {2{hit_way_array[7] &  offset_i}} & way7_offset1_status_Q[1:0];

//--------------------------------------------------------------
//                     update plru tree
//--------------------------------------------------------------
  assign access_way_array[7:0] = hit_way_array[7:0]
                               | {8{~cacheline_hit & set_hit_i}} & oldest_way_array[7:0];

  bank_htu_plru_tree
  u_bank_htu_plru_tree(
    .clk_i             (clk_i                ),
    .rst_i             (rst_i                ),
    .access_array_i    (access_way_array[7:0]),
    .oldest_way_array_o(oldest_way_array[7:0])
  );

//--------------------------------------------------------------
//                 update way valid array
//--------------------------------------------------------------
  assign way_valid_array_In[7:0] = way_valid_array_Q[7:0]
                                 | access_way_array[7:0];

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      way_valid_array_Q[7:0] <= 'b0;
    end
    else begin
      way_valid_array_Q[7:0] <= way_valid_array_In[7:0];
    end
  end

//--------------------------------------------------------------
//                 update way tag array
//--------------------------------------------------------------
  assign way_tag_update_array[7:0] = oldest_way_array[7:0]
                                   & {8{~cacheline_hit & set_hit_i}};

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      way0_tag_Q[31:10] <= 'b0;
    end
    else if (way_tag_update_array[0]) begin
      way0_tag_Q[31:10] <= set_tag_i[31:10];
    end
  end

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      way1_tag_Q[31:10] <= 'b0;
    end
    else if (way_tag_update_array[1]) begin
      way1_tag_Q[31:10] <= set_tag_i[31:10];
    end
  end

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      way2_tag_Q[31:10] <= 'b0;
    end
    else if (way_tag_update_array[2]) begin
      way2_tag_Q[31:10] <= set_tag_i[31:10];
    end
  end

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      way3_tag_Q[31:10] <= 'b0;
    end
    else if (way_tag_update_array[3]) begin
      way3_tag_Q[31:10] <= set_tag_i[31:10];
    end
  end

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      way4_tag_Q[31:10] <= 'b0;
    end
    else if (way_tag_update_array[4]) begin
      way4_tag_Q[31:10] <= set_tag_i[31:10];
    end
  end

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      way5_tag_Q[31:10] <= 'b0;
    end
    else if (way_tag_update_array[5]) begin
      way5_tag_Q[31:10] <= set_tag_i[31:10];
    end
  end

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      way6_tag_Q[31:10] <= 'b0;
    end
    else if (way_tag_update_array[6]) begin
      way6_tag_Q[31:10] <= set_tag_i[31:10];
    end
  end

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      way7_tag_Q[31:10] <= 'b0;
    end
    else if (way_tag_update_array[7]) begin
      way7_tag_Q[31:10] <= set_tag_i[31:10];
    end
  end

endmodule