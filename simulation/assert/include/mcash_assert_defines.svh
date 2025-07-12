bit wait_for_assert_error = 0;
initial begin
  wait (wait_for_assert_error);
  #30 $finish;
end

  `define mcash_assert_error(MSG) \
    begin \
      $display("ASSERT_ERROR @ %0t: %m %s", $time, MSG); \
      wait_for_assert_error = 1; \
    end
