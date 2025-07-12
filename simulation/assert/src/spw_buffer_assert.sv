module spw_buffer_assert #(
  parameter PTR_WIDTH = 3,
  parameter DEPTH     = 1 << PTR_WIDTH
)(
  input  logic                 clk_i,
  input  logic                 rst_i,
  input  logic [DEPTH-1:0]     valid_array_Q,
  input  logic                 wr_en_i,
	input  logic [PTR_WIDTH-1:0] write_ptr_i
);

  property spw_write_entry_inValid;
    @(posedge clk_i)
      wr_en_i |-> valid_array_Q[write_ptr_i] == 1'b0;
  endproperty

  spw_buffer_write_valid_entry: assert property (spw_write_entry_inValid)
    else $fatal("spw buffer write a valid entry!");

endmodule