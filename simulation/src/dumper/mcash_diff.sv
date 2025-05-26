module mcash_diff(
  input wire clk
);

  `define CROSS_BAR_TOP mcash_tb.u_mcash_top.u_cross_bar_top

  import "DPI-C" function int cFunc();
  import "DPI-C" function int c_xbar_ch_buffers_push(byte ch_id, byte op, int addr, longint data);

  logic        mcash_ch0_req_valid;
  logic        mcash_ch0_req_allowIn;
  logic [2:0]  mcash_ch0_req_op;
  logic [31:0] mcash_ch0_req_addr;
  logic [63:0] mcash_ch0_req_data;

  assign mcash_ch0_req_valid   = `CROSS_BAR_TOP.mcash_ch0_req_valid_i;
  assign mcash_ch0_req_allowIn = `CROSS_BAR_TOP.mcash_ch0_req_allowIn_o;
  assign mcash_ch0_req_op      = `CROSS_BAR_TOP.mcash_ch0_req_op_i;
  assign mcash_ch0_req_addr    = {`CROSS_BAR_TOP.mcash_ch0_req_addr_i[31:4], 4'b0};
  assign mcash_ch0_req_data    = `CROSS_BAR_TOP.mcash_ch0_req_data_i;

  always_ff @(posedge clk) begin
    // push data into cross bar buffer
    if (mcash_ch0_req_valid & mcash_ch0_req_allowIn) begin
      c_xbar_ch_buffers_push(0, mcash_ch0_req_op, mcash_ch0_req_addr, mcash_ch0_req_data);
    end

  end


endmodule