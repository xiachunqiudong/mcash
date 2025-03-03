module bank_ch_rr(
  input  wire       clk_i,
  input  wire       rst_i,
  input  wire [2:0] ch_req_valid_i,
  output wire [1:0] ch_req_id_o
);

  wire [1:0] ch_bottom_ptr_incr;
  wire [1:0] ch_bottom_ptr_In;
  reg  [1:0] ch_bottom_ptr_Q;
  wire [2:0] ch_bottom_ptr_onehot;
  wire [2:0] shift_ch_req_valid;

  assign ch_bottom_ptr_onehot[0] = ch_bottom_ptr_Q[1:0] == 2'd0;
  assign ch_bottom_ptr_onehot[1] = ch_bottom_ptr_Q[1:0] == 2'd1;
  assign ch_bottom_ptr_onehot[2] = ch_bottom_ptr_Q[1:0] == 2'd2;

  assign shift_ch_req_valid[2:0] = {3{ch_bottom_ptr_onehot[0]}} &  ch_req_valid_i[2:0]
                                 | {3{ch_bottom_ptr_onehot[1]}} & {ch_req_valid_i[0]  , ch_req_valid_i[2:1]}
                                 | {3{ch_bottom_ptr_onehot[2]}} & {ch_req_valid_i[1:0], ch_req_valid_i[2]};

  assign ch_bottom_ptr_incr[1:0] = shift_ch_req_valid[0] ? 2'd0
                                 : shift_ch_req_valid[1] ? 2'd1
                                 : shift_ch_req_valid[2] ? 2'd2
                                 :                         2'd0;

  assign ch_bottom_ptr_In[1:0] = (ch_bottom_ptr_Q[1:0] + ch_bottom_ptr_incr[1:0]) > 2'd2
                               ? (ch_bottom_ptr_Q[1:0] + ch_bottom_ptr_incr[1:0] - 2'd3)
                               : ch_bottom_ptr_Q[1:0] + ch_bottom_ptr_incr[1:0];

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      ch_bottom_ptr_Q[1:0] <= 2'd0;
    end
    else begin
      ch_bottom_ptr_Q[1:0] <= ch_bottom_ptr_In[1:0];
    end
  end

  assign ch_req_id_o[1:0] = ch_bottom_ptr_In[1:0];


endmodule