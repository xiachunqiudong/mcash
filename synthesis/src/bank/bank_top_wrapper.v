module bank_top_wrapper(
  input  wire        clk_i,
  input  wire        rst_i,
  // bank0 request
  input  wire        xbar_bank0_htu_valid_i,
  output wire        xbar_bank0_htu_allowIn_o,
  input  wire [1:0]  xbar_bank0_htu_ch_id_i,
  input  wire [1:0]  xbar_bank0_htu_opcode_i,
  input  wire [31:4] xbar_bank0_htu_addr_i,
  input  wire [7:0]  xbar_bank0_htu_wbuffer_id_i,
  // bank1 request
  input  wire        xbar_bank1_htu_valid_i,
  output wire        xbar_bank1_htu_allowIn_o,
  input  wire [1:0]  xbar_bank1_htu_ch_id_i,
  input  wire [1:0]  xbar_bank1_htu_opcode_i,
  input  wire [31:4] xbar_bank1_htu_addr_i,
  input  wire [7:0]  xbar_bank1_htu_wbuffer_id_i,
  // bank2 request
  input  wire        xbar_bank2_htu_valid_i,
  output wire        xbar_bank2_htu_allowIn_o,
  input  wire [1:0]  xbar_bank2_htu_ch_id_i,
  input  wire [1:0]  xbar_bank2_htu_opcode_i,
  input  wire [31:4] xbar_bank2_htu_addr_i,
  input  wire [7:0]  xbar_bank2_htu_wbuffer_id_i,
  // bank3 request
  input  wire        xbar_bank3_htu_valid_i,
  output wire        xbar_bank3_htu_allowIn_o,
  input  wire [1:0]  xbar_bank3_htu_ch_id_i,
  input  wire [1:0]  xbar_bank3_htu_opcode_i,
  input  wire [31:4] xbar_bank3_htu_addr_i,
  input  wire [7:0]  xbar_bank3_htu_wbuffer_id_i
);

//------------------------------------------------------------------
//                        Bank0 Instance
//------------------------------------------------------------------
  bank_top
  u_bank0_top (
    .clk_i                     (clk_i                           ),
    .rst_i                     (rst_i                           ),
    .xbar_bank_htu_valid_i     (xbar_bank0_htu_valid_i          ),
    .xbar_bank_htu_allowIn_o   (xbar_bank0_htu_allowIn_o        ),
    .xbar_bank_htu_ch_id_i     (xbar_bank0_htu_ch_id_i[1:0]     ),
    .xbar_bank_htu_opcode_i    (xbar_bank0_htu_opcode_i[1:0]    ),
    .xbar_bank_htu_addr_i      (xbar_bank0_htu_addr_i[31:4]     ),
    .xbar_bank_htu_wbuffer_id_i(xbar_bank0_htu_wbuffer_id_i[7:0])
  );

//------------------------------------------------------------------
//                        Bank1 Instance
//------------------------------------------------------------------

//------------------------------------------------------------------
//                        Bank2 Instance
//------------------------------------------------------------------

//------------------------------------------------------------------
//                        Bank3 Instance
//------------------------------------------------------------------

endmodule