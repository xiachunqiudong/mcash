module round_robin_arbiter #(
  parameter N = 4
)(
  input  wire         clk_i,
  input  wire         rst_i,
  input  wire [N-1:0] req_i,
  output wire [N-1:0] grant_o
);

  wire [N-1:0] req_masked;
  wire [N-1:0] higher_prior_reqs_masked;
  wire [N-1:0] grant_masked;
  wire [N-1:0] higher_prior_reqs_unmasked;
  wire [N-1:0] grant_unmasked;

  wire         grant_use_masked;
  wire         grant_use_unmasked;

  wire         higher_prior_reqs_wen;
  wire [N-1:0] higher_prior_reqs_In;
  reg  [N-1:0] higher_prior_reqs_Q;

//---------------------------------------------------------
//                Masked request arbiter
//---------------------------------------------------------
  assign req_masked[N-1:0] = req_i[N-1:0] & higher_prior_reqs_Q[N-1:0];

  assign higher_prior_reqs_masked[0] = 1'b0;

  assign higher_prior_reqs_masked[N-1:1] = req_masked[N-2:0]
                                         | higher_prior_reqs_masked[N-2:0];
  
  assign grant_masked[N-1:0] = req_masked[N-1:0]
                             & ~higher_prior_reqs_masked[N-1:0];

//---------------------------------------------------------
//               Unmasked request arbiter
//---------------------------------------------------------
  assign higher_prior_reqs_unmasked[0] = 1'b0;

  assign higher_prior_reqs_unmasked[N-1:1] = req_i[N-2:0]
                                           | higher_prior_reqs_unmasked[N-2:0];

  assign grant_unmasked[N-1:0] = req_i[N-1:0]
                               & ~higher_prior_reqs_unmasked[N-1:0];


//---------------------------------------------------------
// masked req grant   ------
//                          |------> grant
// unmasked req grant ------
//---------------------------------------------------------
  assign grant_use_masked = |grant_masked[N-1:0];
  assign grant_use_unmasked = ~grant_use_masked;

  assign grant_o[N-1:0] = {N{grant_use_unmasked}} & grant_unmasked[N-1:0]
                        | grant_masked[N-1:0];

  assign higher_prior_reqs_In[N-1:0] = {N{grant_use_masked}}   & higher_prior_reqs_masked[N-1:0]
                                   | {N{grant_use_unmasked}} & higher_prior_reqs_unmasked[N-1:0];

  assign higher_prior_reqs_wen = |req_i[N-1:0];

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      higher_prior_reqs_Q[N-1:0] <= {N{1'b1}};
    end
    else if(higher_prior_reqs_wen) begin
      higher_prior_reqs_Q[N-1:0] <= higher_prior_reqs_In[N-1:0];
    end
  end

endmodule