module rob_id_gen #(
  parameter ID_WIDTH = 3
)(
  input  wire                clk_i,
  input  wire                rst_i,
  input  wire                kickoff_i,
  output reg  [ID_WIDTH-1:0] rob_id_o
);

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      rob_id_o[ID_WIDTH-1:0] <= 'd0;
    end
    else if (kickoff_i) begin
      rob_id_o[ID_WIDTH-1:0] <= rob_id_o[ID_WIDTH-1:0] + 'd1;
    end
  end

endmodule