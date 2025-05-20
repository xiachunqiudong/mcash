module bank_biu_top #(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 256,
    parameter STRB_WIDTH = DATA_WIDTH / 8,
    parameter ID_WIDTH   = 8
) (
  input  wire                  clk_i,
  input  wire                  rst_i,
  // htu >> biu
  input  wire                  htu_biu_arvalid_i,
  output wire                  htu_biu_arready_o,
  input  wire [ADDR_WIDTH-1:5] htu_biu_araddr_i,
  input  wire                  htu_biu_awvalid_i,
  output wire                  htu_biu_awready_o,
  input  wire [ADDR_WIDTH-1:5] htu_biu_awaddr_i,
  input  wire [5:0]            htu_biu_set_way_i,
  // sc >> biu
  input  wire                  sc_biu_valid_i,
  output wire                  sc_biu_ready_o,
  input  wire [255:0]          sc_biu_data_i,
  input  wire [31:0]           sc_biu_strb_i,
  input  wire [5:0]            sc_biu_set_way_i,
  // biu >> isu
  output wire                  biu_isu_rvalid_o,
  input  wire                  biu_isu_rready_i,
  output wire [DATA_WIDTH-1:0] biu_isu_rdata_o,
  output wire [ID_WIDTH-1:0]   biu_isu_rid_o,
  // biu >> bus
  output wire                  biu_axi3_arvalid_o,
  input  wire                  biu_axi3_arready_i,
  output wire [ID_WIDTH-1:0]   biu_axi3_arid_o,
  output wire [ADDR_WIDTH-1:0] biu_axi3_araddr_o,
  output wire [2:0]            biu_axi3_arsize_o,
  output wire [3:0]            biu_axi3_arlen_o,
  output wire [1:0]            biu_axi3_arburst_o,
  input  wire                  biu_axi3_rvalid_i,
  output wire                  biu_axi3_rready_o,
  input  wire [ID_WIDTH-1:0]   biu_axi3_rid_i,
  input  wire [DATA_WIDTH-1:0] biu_axi3_rdata_i,
  input  wire [1:0]            biu_axi3_rresp_i,
  input  wire                  biu_axi3_rlast_i,
  output wire                  biu_axi3_awvalid_o,
  input  wire                  biu_axi3_awready_i,
  output wire [ID_WIDTH-1:0]   biu_axi3_awid_o,
  output wire [ADDR_WIDTH-1:0] biu_axi3_awaddr_o,
  output wire [3:0]            biu_axi3_awlen_o,
  output wire [2:0]            biu_axi3_awsize_o,
  output wire [1:0]            biu_axi3_awburst_o,
  output wire                  biu_axi3_wvalid_o,
  input  wire                  biu_axi3_wready_i,
  output wire [ID_WIDTH-1:0]   biu_axi3_wid_o,
  output wire [DATA_WIDTH-1:0] biu_axi3_wdata_o,
  output wire [STRB_WIDTH-1:0] biu_axi3_wstrb_o,
  output wire                  biu_axi3_wlast_o,
  input  wire                  biu_axi3_bvalid_i,
  output wire                  biu_axi3_bready_o,
  input  wire [ID_WIDTH-1:0]   biu_axi3_bid_i,
  input  wire [1:0]            biu_axi3_bresp_i
);

  wire         biu_out_valid;
  wire         biu_fifo_pop;
  wire         biu_fifo_allowIn;
  wire [32:0]  biu_din0;
  wire [32:0]  biu_din1;
  wire [32:0]  biu_dout;

//-------------------------------------------------------------------------
// BIU FIFO
// 2 inputs, 1 output
//-------------------------------------------------------------------------
  assign biu_din0[32]    = 1'b1;
  assign biu_din0[31:27] = htu_biu_set_way_i[5:0];
  assign biu_din0[26:0]  = htu_biu_awaddr_i[31:5];

  assign biu_din1[32]    = 1'b0;
  assign biu_din1[31:27] = htu_biu_set_way_i[5:0];
  assign biu_din1[26:0]  = htu_biu_araddr_i[31:5];

  assign biu_fifo_pop  = biu_axi3_arvalid_o & biu_axi3_arready_i
                       | biu_axi3_awvalid_o & biu_axi3_awready_i;

  assign htu_biu_arready_o = biu_fifo_allowIn;
  assign htu_biu_awready_o = biu_fifo_allowIn;

  biu_fifo_2i1o #(
    .AW(3 ),
    .DW(33)
  ) biu_ctrl_fifo(
    .clk       (clk_i            ),
    .rst       (rst_i            ),
    .din0_valid(htu_biu_awvalid_i),
    .din1_valid(htu_biu_arvalid_i),
    .pop       (biu_fifo_pop     ),
    .din0      (biu_din0         ),
    .din1      (biu_din1         ),
    .allowIn   (biu_fifo_allowIn ),
    .dout_valid(biu_out_valid    ),
    .dout      (biu_dout         )
  );

//-------------------------------------------------------------------------
//                            AR channel
// to add fifo to release timing
//-------------------------------------------------------------------------
  assign biu_axi3_arvalid_o                = biu_out_valid & ~biu_dout[32];
  assign biu_axi3_arid_o[5:0]              = {2'b00, biu_dout[31:27]};
  assign biu_axi3_araddr_o[ADDR_WIDTH-1:0] = {biu_dout[26:0], 5'b00000};
  assign biu_axi3_arsize_o[2:0]            = 3'b101;  // 32 Byte
  assign biu_axi3_arlen_o[3:0]             = 4'b0000;
  assign biu_axi3_arburst_o[1:0]           = 2'b01;   // Incrementing burst

//-------------------------------------------------------------------------
//                             AW channel
//-------------------------------------------------------------------------
  assign biu_axi3_awvalid_o                = biu_out_valid & biu_dout[32];
  assign biu_axi3_awid_o[ID_WIDTH-1:0]     = {2'b00, biu_dout[31:27]};
  assign biu_axi3_awaddr_o[ADDR_WIDTH-1:0] = {biu_dout[26:0], 5'b00000};
  assign biu_axi3_awlen_o[3:0]             = 4'b0000;
  assign biu_axi3_awsize_o[2:0]            = 3'b101;
  assign biu_axi3_awburst_o[1:0]           = 2'b01;

//-------------------------------------------------------------------------
//                             R channel
//-------------------------------------------------------------------------
  assign biu_isu_rvalid_o                = biu_axi3_rvalid_i;
  assign biu_isu_rdata_o[DATA_WIDTH-1:0] = biu_axi3_rdata_i[DATA_WIDTH-1:0];
  assign biu_isu_rid_o[ID_WIDTH-1:0]     = biu_axi3_rid_i[ID_WIDTH-1:0];
  assign biu_axi3_rready_o               = biu_isu_rready_i;

//-------------------------------------------------------------------------
//                             W channel
//-------------------------------------------------------------------------
  assign biu_axi3_wvalid_o                = sc_biu_valid_i;
  assign biu_axi3_wdata_o[DATA_WIDTH-1:0] = sc_biu_data_i[255:0];
  assign biu_axi3_wstrb_o[STRB_WIDTH-1:0] = sc_biu_strb_i[31:0];
  assign biu_axi3_wid_o[ID_WIDTH-1:0]     = {2'b00, sc_biu_set_way_i[5:0]};
  assign biu_axi3_wlast_o                 = 1'b1;

  assign sc_biu_ready_o = biu_axi3_wready_i;

endmodule