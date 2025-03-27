module rob_id_gen #(
  parameter ID_WIDTH = 3
)(
  input  wire                clk_i,
  input  wire                rst_i,
  input  wire                kickoff_i,
  input  wire [1:0]          ch_id_i,
  output wire [ID_WIDTH-1:0] rob_id_o
);

  wire [2:0]          ch_id_dcd;
  reg  [ID_WIDTH-1:0] ch0_rob_id_Q;
  reg  [ID_WIDTH-1:0] ch1_rob_id_Q;
  reg  [ID_WIDTH-1:0] ch2_rob_id_Q;

  assign ch_id_dcd[2:0] = {ch_id_i[1:0] == 2'd2,
                           ch_id_i[1:0] == 2'd1,
                           ch_id_i[1:0] == 2'd0};

  assign rob_id_o[ID_WIDTH-1:0] = {ID_WIDTH{ch_id_dcd[0]}} & ch0_rob_id_Q[ID_WIDTH-1:0]
                                | {ID_WIDTH{ch_id_dcd[1]}} & ch1_rob_id_Q[ID_WIDTH-1:0]
                                | {ID_WIDTH{ch_id_dcd[2]}} & ch2_rob_id_Q[ID_WIDTH-1:0];

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      ch0_rob_id_Q[ID_WIDTH-1:0] <= 'd0;
    end
    else if (kickoff_i & ch_id_dcd[0]) begin
      ch0_rob_id_Q[ID_WIDTH-1:0] <= ch0_rob_id_Q[ID_WIDTH-1:0] + 'd1;
    end
  end

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      ch1_rob_id_Q[ID_WIDTH-1:0] <= 'd0;
    end
    else if (kickoff_i & ch_id_dcd[1]) begin
      ch1_rob_id_Q[ID_WIDTH-1:0] <= ch1_rob_id_Q[ID_WIDTH-1:0] + 'd1;
    end
  end

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      ch2_rob_id_Q[ID_WIDTH-1:0] <= 'd0;
    end
    else if (kickoff_i & ch_id_dcd[2]) begin
      ch2_rob_id_Q[ID_WIDTH-1:0] <= ch2_rob_id_Q[ID_WIDTH-1:0] + 'd1;
    end
  end

endmodule