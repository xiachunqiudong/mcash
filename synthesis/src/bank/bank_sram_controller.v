module bank_sram_controller(
  input  wire          clk_i,
  input  wire          rst_i,
  // isu >> sc
  input  wire          isu_sc_valid_i,
  output wire          isu_sc_ready_o,
  input  wire [1:0]    isu_sc_channel_id_i,
  input  wire [2:0]    isu_sc_opcode_i,
  input  wire [6:0]    isu_sc_set_way_offset_i,
  input  wire [7:0]    isu_sc_wbuffer_id_i,
  input  wire [2:0]    isu_sc_xbar_rob_num_i,
  input  wire [1:0]    isu_sc_cacheline_dirty_offset0_i,
  input  wire [1:0]    isu_sc_cacheline_dirty_offset1_i,
  input  wire [127:0]  isu_sc_linefill_data_offset0_i,
  input  wire [127:0]  isu_sc_linefill_data_offset1_i,
  // sc >> xbar
  output wire          sc_xbar_valid_o,
  output wire [1:0]    sc_xbar_channel_id_o,
  output wire [2:0]    sc_xbar_rob_num_o,
  output wire [127:0]  sc_xbar_data_o,
  // sc >> sub memory
  output wire          sc_biu_valid_o,
  input  wire          sc_biu_ready_i,
  output wire [255:0]  sc_biu_data_o,
  output wire [15:0]   sc_biu_strb_o,
  output wire [5:0]    sc_biu_set_way_o,
  // sc >> Wbuf
  output wire          sc_wbuf_req_valid_o,
  output wire [7:0]    sc_wbuf_req_wbuffer_id_o,
  // Wbuf >> sc
  input  wire          sc_wbuf_rtn_valid_i,
  input  wire [127:0]  sc_wbuf_rtn_data_i
);

// isu op info
  wire         isu_op_is_write;
  wire         isu_op_is_read;
  wire         isu_op_is_read_linefill;
  wire         isu_op_is_write_back;
  wire         isu_sc_offset;
// cacheline info
  wire [1:0]   isu_sc_select_offset_state;
  wire [1:0]   isu_sc_unselect_offset_state;
  wire         offset0_empty;
  wire         offset0_dirty;
  wire         offset1_empty;
  wire         offset1_dirty;
  wire         unselect_offset_empty;
  wire         unselect_offset_dirty;

  wire [127:0] isu_sc_offset_linefill_data;

// sram read buffer
  wire         sram_read_data_in_buffer;
  wire         sram_read_data_bufferA_push;
  wire [255:0] sram_read_data_buffer_In;
  reg  [255:0] sram_read_data_buffer_Q;
  wire         sc_biu_kickoff;

  wire         data_array_en;
  wire         data_array_wen;
  wire         offset0_data_array_touch;
  wire         offset0_data_array_en;
  wire         offset0_data_array_wen;
  wire [5:0]   offset0_data_array_addr;
  wire [127:0] offset0_data_array_wdata;
  wire [127:0] offset0_data_array_rdata;
  wire         offset1_data_array_touch;
  wire         offset1_data_array_en;
  wire         offset1_data_array_wen;
  wire [5:0]   offset1_data_array_addr;
  wire [127:0] offset1_data_array_wdata;
  wire [127:0] offset1_data_array_rdata;

// sc >> xbar
  wire         sc_send_data_to_xbar_done_wen;
  wire         sc_send_data_to_xbar_done_In;
  reg          sc_send_data_to_xbar_done_Q;

// sc ctrl flow
  wire         sc_counter_incr;
  wire         sc_counter_init;
  wire         sc_counter_wen;
  wire [1:0]   sc_counter_In;
  reg  [1:0]   sc_counter_Q;
  wire         read_with_linefill_done;
  wire         isu_sc_write_done;
  wire         isu_sc_read_done;
  wire         isu_sc_req_done;

//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
// ISU opcode
// 0: WRITE
// 1: READ
// 2: READ_WITH_LINEFILL
// 3: WRITE BACK
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  assign isu_op_is_write         = isu_sc_opcode_i[2:0] == 3'd0;
  assign isu_op_is_read          = isu_sc_opcode_i[2:0] == 3'd1;
  assign isu_op_is_read_linefill = isu_sc_opcode_i[2:0] == 3'd2;
  assign isu_op_is_write_back    = isu_sc_opcode_i[2:0] == 3'd3;


  // 0 -> offset 0
  // 1 -> offset 1
  assign isu_sc_offset = isu_sc_set_way_offset_i[0];

  assign isu_sc_select_offset_state[1:0] = isu_sc_offset ? isu_sc_cacheline_dirty_offset1_i[1:0]
                                                         : isu_sc_cacheline_dirty_offset0_i[1:0];

  assign isu_sc_unselect_offset_state[1:0] = isu_sc_offset ? isu_sc_cacheline_dirty_offset0_i[1:0]
                                                           : isu_sc_cacheline_dirty_offset1_i[1:0];

//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
// ISU cacheline state
// 0: empty
// 1: sync
// 2: dirty
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  assign offset0_empty = isu_sc_cacheline_dirty_offset0_i[1:0] == 2'b00;
  assign offset0_dirty = isu_sc_cacheline_dirty_offset0_i[1:0] == 2'b10;

  assign offset1_empty = isu_sc_cacheline_dirty_offset1_i[1:0] == 2'b00;
  assign offset1_dirty = isu_sc_cacheline_dirty_offset1_i[1:0] == 2'b10;

// 2. unselect offset state
  assign unselect_offset_empty = isu_sc_unselect_offset_state[1:0] == 2'b00;
  assign unselect_offset_dirty = isu_sc_unselect_offset_state[1:0] == 2'b10;



//---------------------------------------------------------
//                        SC to Xbar
// 1. Read
// 2. Linefill and read
//---------------------------------------------------------

// sc to xbar ctrl path
  assign sc_xbar_valid_o = isu_sc_valid_i
                         & (   (isu_op_is_read & (sc_counter_Q[1:0] > 2'b00))
                             | (isu_op_is_read_linefill & ~sc_send_data_to_xbar_done_Q)
                           );

  assign sc_send_data_to_xbar_done_wen = isu_op_is_read_linefill & sc_xbar_valid_o
                                       | isu_sc_req_done;

  assign sc_send_data_to_xbar_done_In = ~isu_sc_req_done;

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      sc_send_data_to_xbar_done_Q <= 1'b0;
    end
    else if (sc_send_data_to_xbar_done_wen) begin
      sc_send_data_to_xbar_done_Q <= sc_send_data_to_xbar_done_In;
    end
  end

// sc to xbar data path
  assign isu_sc_offset_linefill_data[127:0] = isu_sc_set_way_offset_i[0]
                                            ? isu_sc_linefill_data_offset1_i[127:0]
                                            : isu_sc_linefill_data_offset0_i[127:0];

  assign sc_xbar_data_o[127:0] = {128{isu_op_is_read_linefill}}                     & isu_sc_offset_linefill_data[127:0]
                               | {128{isu_op_is_read &  sram_read_data_in_buffer}} & sram_read_data_buffer_Q[127:0]
                               | {128{isu_op_is_read & ~sram_read_data_in_buffer}} & offset0_data_array_rdata[127:0];

  assign sc_xbar_channel_id_o[1:0] = isu_sc_channel_id_i[1:0];

  assign sc_xbar_rob_num_o[2:0] = isu_sc_xbar_rob_num_i[2:0];

//---------------------------------------------------------
//                        SC to wBuffer
// ISU op: Write
//---------------------------------------------------------
  assign sc_wbuf_req_valid_o = isu_sc_valid_i
                             & isu_op_is_write
                             & (sc_counter_Q[1:0] == 2'b00);

  assign sc_wbuf_req_wbuffer_id_o[7:0] = isu_sc_wbuffer_id_i[7:0];

//==================================================================
//                    SC Ctrl flow
// SC counter
// 2'b00 -> send read enable to sram
// 2'b01 -> get read data from sram
// 2'b10 -> read data in data buffer
//==================================================================
  assign sc_counter_incr = isu_sc_valid_i
                         & (sc_counter_Q[1:0] == 2'b00)
                         & (  isu_op_is_read_linefill               // write to sram
                            | isu_op_is_write_back                  // read from sram
                            | isu_op_is_read                        // read from sram
                            | isu_op_is_write                       // write to sram
                         );

  assign sc_counter_init = isu_sc_req_done;

  assign sc_counter_wen = sc_counter_incr
                        | sc_counter_init;

  assign sc_counter_In[1:0] = sc_counter_init ? 2'b00
                            : sc_counter_incr ? sc_counter_Q[1:0] + 2'b01
                                              : sc_counter_Q[1:0];

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      sc_counter_Q[1:0] <= 2'b00;
    end
    else if (sc_counter_wen) begin
      sc_counter_Q[1:0] <= sc_counter_In[1:0];
    end
  end

  assign read_with_linefill_done = isu_op_is_read_linefill
                                 & (sc_xbar_valid_o | sc_send_data_to_xbar_done_Q);

  assign isu_sc_write_done     = sc_wbuf_rtn_valid_i;
  assign isu_sc_read_done      = isu_op_is_read & sc_xbar_valid_o;
  assign isu_sc_wirteBack_done = sc_biu_valid_o & sc_biu_ready_i;

  assign isu_sc_req_done = read_with_linefill_done
                         | isu_sc_write_done
                         | isu_sc_read_done
                         | isu_sc_wirteBack_done;

  assign isu_sc_ready_o = isu_sc_req_done;

//---------------------------------------------------------
//                     Read from SRAM
// 1. read
// 2. write back
//---------------------------------------------------------
// SC counter
// 2'b00 -> send ren to sram
// 2'b01 -> get read data from sram
// 2'b10 -> read data in data buffer
//---------------------------------------------------------
  assign sram_read_data_bufferA_push = isu_sc_valid_i
                                     & (isu_op_is_read | isu_op_is_write_back)
                                     & (sc_counter_Q[1:0] == 2'b01);

  assign sram_read_data_in_buffer = sc_counter_Q[1:0] == 2'b10;

  assign sram_read_data_need_offset0 = ~isu_sc_offset
                                     | (isu_op_is_write_back & offset0_dirty);

  assign sram_read_data_need_offset1 = isu_sc_offset
                                     | (isu_op_is_write_back & offset1_dirty);

  assign sram_read_data_buffer_In[127:0]   = {128{sram_read_data_need_offset0}} & offset0_data_array_rdata[127:0];
  assign sram_read_data_buffer_In[255:128] = {128{sram_read_data_need_offset1}} & offset1_data_array_rdata[127:0];

  always @(posedge clk_i) begin
    if (sram_read_data_bufferA_push) begin
      sram_read_data_buffer_Q[255:0] <= sram_read_data_buffer_In[255:0];
    end
  end

  assign sc_biu_valid_o        = isu_op_is_write_back & (sc_counter_Q[1:0] != 2'b00);
  assign sc_biu_data_o[255:0]  = {256{ sram_read_data_in_buffer}} & sram_read_data_buffer_Q[255:0]
                               | {256{~sram_read_data_in_buffer}} & sram_read_data_buffer_In[255:0];
  assign sc_biu_strb_o[15:0]   = {{8{sram_read_data_need_offset1}}, {8{sram_read_data_need_offset0}}};
  assign sc_biu_set_way_o[5:0] = isu_sc_set_way_offset_i[6:1];

//====================================================================
//                      Data Array
// offset0 data array
// offset1 data array
//====================================================================
  assign data_array_en = isu_sc_valid_i
                       & (   ((isu_op_is_read_linefill | isu_op_is_write_back | isu_op_is_read) & sc_counter_Q[1:0] == 2'b00)
                           | ( isu_op_is_write                                                  & sc_wbuf_rtn_valid_i)
                         );

  assign data_array_wen = isu_sc_valid_i
                        & (   (isu_op_is_read_linefill & sc_counter_Q[1:0] == 2'b00)
                            | (isu_op_is_write         & sc_wbuf_rtn_valid_i)
                          );

//--------------------------------------------------------------------
//                    Data array: offset0
// Witdh: 128
// Depth: 64
//--------------------------------------------------------------------
  assign offset0_data_array_touch = ~isu_sc_offset
                                  | (isu_op_is_read_linefill & offset0_empty)
                                  | (isu_op_is_write_back    & offset0_dirty);

  assign offset0_data_array_en = offset0_data_array_touch & data_array_en;

  assign offset0_data_array_wen = offset0_data_array_touch & data_array_wen;

  assign offset0_data_array_addr[5:0] = isu_sc_set_way_offset_i[6:1];

  assign offset0_data_array_wdata[127:0] = {128{isu_op_is_read_linefill}} & isu_sc_linefill_data_offset0_i[127:0]
                                         | {128{isu_op_is_write}}         & sc_wbuf_rtn_data_i[127:0];

  ram_sp #(
    .AW(6),
    .DW(128)
  ) offset0_data_array (
    .CLK(clk_i                          ),
    .ME (offset0_data_array_en          ),
    .WE (offset0_data_array_wen         ),
    .ADR(offset0_data_array_addr[5:0]   ),
    .D  (offset0_data_array_wdata[127:0]),
    .Q  (offset0_data_array_rdata[127:0])
  );

//--------------------------------------------------------------------
//                    Data array: offset1
// Witdh: 128
// Depth: 64
//--------------------------------------------------------------------
  assign offset1_data_array_touch = isu_sc_offset
                                | (isu_op_is_read_linefill & offset1_empty)
                                | (isu_op_is_write_back    & offset1_dirty);

  assign offset1_data_array_en = offset1_data_array_touch & data_array_en;

  assign offset1_data_array_wen = offset1_data_array_touch & data_array_wen;

  assign offset1_data_array_addr[5:0] = isu_sc_set_way_offset_i[6:1];

  assign offset1_data_array_wdata[127:0] = {128{isu_op_is_read_linefill}} & isu_sc_linefill_data_offset1_i[127:0]
                                         | {128{isu_op_is_write}}         & sc_wbuf_rtn_data_i[127:0];

  ram_sp #(
    .AW(6),
    .DW(128)
  ) offset1_data_array (
    .CLK(clk_i                          ),
    .ME (offset1_data_array_en          ),
    .WE (offset1_data_array_wen         ),
    .ADR(offset1_data_array_addr[5:0]   ),
    .D  (offset1_data_array_wdata[127:0]),
    .Q  (offset1_data_array_rdata[127:0])
  );


endmodule