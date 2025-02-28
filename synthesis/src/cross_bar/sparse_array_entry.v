module sparse_array_entry (
  input  wire       clk_i,
  input  wire       rst_i,
  input  wire       entry_push_i,
  input  wire [7:0] entry_data_i,
  input  wire       entry_pop_i,
  output wire       entry_valid_o,
  output wire [7:0] entry_data_o
);

  wire      entry_valid_In;
  reg       entry_valid_Q;
  reg [7:0] entry_data_Q;

  assign entry_valid_In = entry_push_i ? 1'b1
                        : entry_pop_i  ? 1'b0
                        :                entry_valid_Q;

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      entry_valid_Q <= 1'b0;
    end
    else begin
      entry_valid_Q <= entry_valid_In;
    end
  end

  always @(posedge clk_i) begin
    if (entry_push_i) begin
      entry_data_Q[7:0] <= entry_data_i[7:0];
    end
  end

  assign entry_valid_o = entry_valid_Q;

  assign entry_data_o[7:0] = entry_data_Q[7:0];

endmodule