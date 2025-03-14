module bank_wbuffer(
  input  wire         clk_i,
  input  wire         rst_i,
  // sc >> Wbuf
  input  wire         rc_wbuf_req_valid_i,
  output wire         rc_wbuf_req_ready_o,
  input  wire [1:0]   rc_wbuf_req_channel_id_i,
  input  wire [7:0]   rc_wbuf_req_wbuffer_id_i,
  // Wbuf >> sc
  output wire         rc_wbuf_rtn_valid_o,
  input  wire         rc_wbuf_rtn_ready_i,
  input  wire [127:0] rc_wbuf_rtn_data_o
);

  wire         return_data_buffer_push;
  wire         return_data_buffer_pop;
  wire         return_data_buffer_valid_In;
  reg          return_data_buffer_valid_Q;
  wire [127:0] return_data_buffer_In;
  reg  [127:0] return_data_buffer_Q;

  assign rc_wbuf_req_ready_o = ~return_data_buffer_valid_Q
                             | return_data_buffer_pop;

  assign return_data_buffer_push = rc_wbuf_req_valid_i & rc_wbuf_req_ready_o;

  assign return_data_buffer_pop = rc_wbuf_rtn_valid_o & rc_wbuf_rtn_ready_i;

  assign return_data_buffer_valid_In = return_data_buffer_push ? 1'b1
                                     : return_data_buffer_pop  ? 1'b0
                                     :                           return_data_buffer_valid_Q;

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      return_data_buffer_valid_Q <= 1'b0;
    end
    else begin
      return_data_buffer_valid_Q <= return_data_buffer_valid_In;
    end
  end

  assign return_data_buffer_In[127:0] = 1'b1;

  
  always @(posedge clk_i) begin
    if (return_data_buffer_push) begin
      return_data_buffer_Q[127:0] <= return_data_buffer_In[127:0];
    end
  end

// data output
  assign rc_wbuf_rtn_valid_o = return_data_buffer_valid_Q;

  assign rc_wbuf_rtn_data_o[127:0] = return_data_buffer_Q[127:0];

endmodule 
