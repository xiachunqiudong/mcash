module bank_htu_plru_tree(
  input  wire       clk_i,
  input  wire       rst_i,
  input  wire [7:0] access_array_i,
  output wire [7:0] oldest_way_array_o
);


//==================================================================================
//                                  6                                     level0
//               ___________________|__________________
//               |                                     |
//               5                                     4                  level1
//      _________|_______                   ___________|________
//      |                |                  |                  |  
//      3                2                  1                  0          level2
//  ____|___        _____|_____        _____|______       _____|_____
//  |       |       |         |        |           |      |          |
//  7       6       5         4        3           2      1          0  
//==================================================================================

  wire       plru_tree_node_state_wen;
  wire [6:0] plru_tree_node_state_In;
  reg  [6:0] plru_tree_node_state_Q;


// update level0
  assign plru_node6_access_old = plru_tree_node_state_Q[6]
                               ? |access_array_i[7:4]
                               : |access_array_i[3:0];

  assign plru_tree_node_state_In[6] = plru_node6_access_old
                                    ? ~plru_tree_node_state_Q[6]
                                    :  plru_tree_node_state_Q[6];

// update level1
  assign plru_node5_access_old = plru_tree_node_state_Q[5]
                               ? |access_array_i[7:6]
                               : |access_array_i[5:4];

  assign plru_node4_access_old = plru_tree_node_state_Q[4]
                               ? |access_array_i[3:2]
                               : |access_array_i[1:0];

  assign plru_tree_node_state_In[5] = plru_node5_access_old
                                    ? ~plru_tree_node_state_Q[5]
                                    :  plru_tree_node_state_Q[5];

  assign plru_tree_node_state_In[4] = plru_node4_access_old
                                    ? ~plru_tree_node_state_Q[4]
                                    :  plru_tree_node_state_Q[4];

// update level2
  assign plru_node3_access_old = plru_tree_node_state_Q[3]
                               ? access_array_i[7]
                               : access_array_i[6];

  assign plru_node2_access_old = plru_tree_node_state_Q[2]
                               ? access_array_i[5]
                               : access_array_i[4];

  assign plru_node1_access_old = plru_tree_node_state_Q[1]
                               ? access_array_i[3]
                               : access_array_i[2];

  assign plru_node0_access_old = plru_tree_node_state_Q[0]
                               ? access_array_i[1]
                               : access_array_i[0];

  assign plru_tree_node_state_In[3] = plru_node3_access_old
                                    ? ~plru_tree_node_state_Q[3]
                                    :  plru_tree_node_state_Q[3];

  assign plru_tree_node_state_In[2] = plru_node2_access_old
                                    ? ~plru_tree_node_state_Q[2]
                                    :  plru_tree_node_state_Q[2];

  assign plru_tree_node_state_In[1] = plru_node1_access_old
                                    ? ~plru_tree_node_state_Q[1]
                                    :  plru_tree_node_state_Q[1];

  assign plru_tree_node_state_In[0] = plru_node1_access_old
                                    ? ~plru_tree_node_state_Q[0]
                                    :  plru_tree_node_state_Q[0];

  assign plru_tree_node_state_wen = |access_array_i[7:0];

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      plru_tree_node_state_Q[6:0] <= 7'b0;
    end
    else if (plru_tree_node_state_wen) begin
      plru_tree_node_state_Q[6:0] <= plru_tree_node_state_In[6:0];
    end
  end

  assign oldest_way_array_o[0] = ~plru_tree_node_state_Q[6] & ~plru_tree_node_state_Q[4] & ~plru_tree_node_state_Q[0];
  assign oldest_way_array_o[1] = ~plru_tree_node_state_Q[6] & ~plru_tree_node_state_Q[4] &  plru_tree_node_state_Q[0];
  assign oldest_way_array_o[2] = ~plru_tree_node_state_Q[6] &  plru_tree_node_state_Q[4] & ~plru_tree_node_state_Q[1];
  assign oldest_way_array_o[3] = ~plru_tree_node_state_Q[6] &  plru_tree_node_state_Q[4] &  plru_tree_node_state_Q[1];
  assign oldest_way_array_o[4] =  plru_tree_node_state_Q[6] & ~plru_tree_node_state_Q[5] & ~plru_tree_node_state_Q[2];
  assign oldest_way_array_o[5] =  plru_tree_node_state_Q[6] & ~plru_tree_node_state_Q[5] &  plru_tree_node_state_Q[2];
  assign oldest_way_array_o[6] =  plru_tree_node_state_Q[6] &  plru_tree_node_state_Q[5] & ~plru_tree_node_state_Q[3];
  assign oldest_way_array_o[7] =  plru_tree_node_state_Q[6] &  plru_tree_node_state_Q[5] &  plru_tree_node_state_Q[3];

endmodule