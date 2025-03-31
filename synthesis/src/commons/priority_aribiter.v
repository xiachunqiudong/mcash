module priority_arbiter #(
  parameter N = 4
)(
  input  wire [N-1:0] req_i,
  output wire [N-1:0] grant_o
);

  wire [N-1:0] prior_req;

  assign prior_req[0] = 1'b0;

  assign prior_req[N-1:1] = req_i[N-2:0]
                          | prior_req[N-2:0];

endmodule