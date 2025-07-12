module dff_xchecker #(
  parameter WIDTH = 32
) (
  input wire             CLK,
  input wire             WEN,
  input wire [WIDTH-1:0] D
);

  `include "mcash_assert_defines.svh"

  CHECK_DFF_D_X_VALUE:
    assert property (@(posedge CLK)
                      WEN |-> (^D[WIDTH-1:0] !== 1'bx)
                    )
    else `mcash_assert_error("DFF D detected a X value! This is fucking wrong.");

endmodule