module cross_bar_rob_assert(
  input logic clk_i,
  input logic rst_i,
  input logic keep_order_fifo_empty
);

  property kof_empty_assert_banks_spw_empty;
    @(posedge clk_i)
      keep_order_fifo_empty |->   ~|bank0_spw_buffer.valid_array_Q
                                & ~|bank1_spw_buffer.valid_array_Q
                                & ~|bank2_spw_buffer.valid_array_Q
                                & ~|bank3_spw_buffer.valid_array_Q;
  endproperty

  banks_spw_should_empty: assert property (kof_empty_assert_banks_spw_empty)
    else $fatal("keep order buffer empty, but banks spw buffer not empty!");

endmodule