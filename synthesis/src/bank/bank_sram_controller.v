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
  // sc >> xbar
  output wire          sc_xbar_valid_o,
  output wire [1:0]    sc_xbar_channel_id_o,
  output wire [2:0]    sc_xbar_rob_num_o,
  output wire [127:0]  sc_xbar_data_o,
  // sc >> sub memory
  output wire          sc_biu_valid_o,
  input  wire          sc_biu_ready_i,
  output wire [255:0]  sc_biu_data_o,
  output wire [31:0]   sc_biu_strb_o,
  output wire [5:0]    sc_biu_set_way_o,
  // sc <> linefill data buffer
  output wire [5:0]    sc_linefill_data_buffer_id_o,
  input  wire [255:0]  linefill_data_buffer_data_i,
  // sc <> Wbuf
  output wire          sc_wbuf_req_valid_o,
  output wire [7:0]    sc_wbuf_req_wbuffer_id_o,
  input  wire          sc_wbuf_rtn_valid_i,
  input  wire [127:0]  sc_wbuf_rtn_data_i
);

// parameter
  parameter SC_INST_BUF_DW = 27;
  parameter SC_BUFFFER_ADDR_WIDTH = 3;

// sc request buffer
  wire                      sc_inst_buffer_push;
  wire                      sc_inst_buffer_pop;
  wire                      sc_inst_buffer_full;
  wire                      sc_inst_buffer_empty;
  wire [SC_INST_BUF_DW-1:0] sc_inst_buffer_In;
  wire [SC_INST_BUF_DW-1:0] sc_inst_buffer_Q;

// s0 inst info
  wire         s0_can_go;
  wire         s0_valid;
  wire         s0_pop;
  wire         s0_op_is_write;
  wire         s0_op_is_read;
  wire         s0_op_is_read_linefill;
  wire         s0_op_is_write_back;
  wire [5:0]   s0_set_way;
  wire [1:0]   s0_channel_id;
  wire [7:0]   s0_wbuffer_id;
  wire [2:0]   s0_rob_num;
  wire [1:0]   s0_offset0_state;
  wire [1:0]   s0_offset1_state;
  wire         s0_offset;
// cacheline info
  wire [1:0]   s0_unselect_offset_state;
  wire         s0_offset0_empty;
  wire         s0_offset0_dirty;
  wire         s0_offset1_empty;
  wire         s0_offset1_dirty;
  wire         s0_unselect_offset_empty;
  wire         s0_unselect_offset_dirty;

  wire [127:0] s0_linefill_data;

// sc data buffer
  wire         s0_lf_data_push;
  wire         s1_wb_data_push;
  wire         s1_data_bufferA_push;
  wire [127:0] s1_data_bufferA_In;
  reg  [127:0] s1_data_bufferA_Q;
  wire [127:0] s1_data_bufferB_In;
  reg  [127:0] s1_data_bufferB_Q;
  wire         s1_wb_data_in_buffer_In;
  reg          s1_wb_data_in_buffer_Q;
  wire         sc_biu_kickoff;

  wire         data_array_en;
  wire         data_array_wen;
  wire         s0_offset0_data_array_touch;
  wire         s0_offset0_data_array_en;
  wire         s0_offset0_data_array_wen;
  wire [5:0]   s0_offset0_data_array_addr;
  wire [127:0] s0_offset0_data_array_wdata;
  wire         s0_offset1_data_array_touch;
  wire         s0_offset1_data_array_en;
  wire         s0_offset1_data_array_wen;
  wire [5:0]   s0_offset1_data_array_addr;
  wire [127:0] s0_offset1_data_array_wdata;

// s0 ctrl flow
  wire         sc_counter_incr;
  wire         sc_counter_wen;
  wire [1:0]   sc_counter_In;
  reg  [1:0]   sc_counter_Q;

  // s1 stage
  wire         s1_allowIn;
  wire         s1_push;
  wire         s1_pop;
  wire         s1_valid_In;
  reg          s1_valid_Q;
  reg          s1_offset_Q;
  reg          s1_offset0_dirty_Q;
  reg          s1_offset1_dirty_Q;
  reg          s1_op_is_read_Q;
  reg          s1_op_is_read_linefill_Q;
  reg          s1_op_is_write_back_Q;
  reg  [5:0]   s1_set_way_Q;
  reg  [1:0]   s1_channel_id_Q;
  reg  [2:0]   s1_rob_num_Q;
  wire [127:0] s1_offset0_data_array_rdata;
  wire [127:0] s1_offset1_data_array_rdata;
  wire [127:0] s1_data_array_rdata;

//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
// SC instruction buffer
// WIDTH: 27
// DEPTH: 8
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

  sync_fifo #(
    .AW(SC_BUFFFER_ADDR_WIDTH),
    .DW(SC_INST_BUF_DW)
  ) sc_inst_buffer(
    .clk  (clk_i                                ),
    .rst  (rst_i                                ),
    .push (sc_inst_buffer_push                  ),
    .din  (sc_inst_buffer_In[SC_INST_BUF_DW-1:0]),
    .pop  (sc_inst_buffer_pop                   ),
    .dout (sc_inst_buffer_Q[SC_INST_BUF_DW-1:0] ),
    .empry(sc_inst_buffer_empty                 ),
    .full (sc_inst_buffer_full                  )
  );

  assign sc_inst_buffer_push = isu_sc_valid_i & isu_sc_ready_o;
  assign sc_inst_buffer_pop  = s0_pop;

  assign sc_inst_buffer_In[SC_INST_BUF_DW-1:0] = {isu_sc_channel_id_i[1:0],               // sc_inst_buffer_In[26:25] 2 bit
                                                  isu_sc_opcode_i[2:0],                   // sc_inst_buffer_In[24:22] 3 bit
                                                  isu_sc_set_way_offset_i[6:0],           // sc_inst_buffer_In[21:15] 7 bit
                                                  isu_sc_wbuffer_id_i[7:0],               // sc_inst_buffer_In[14:7]  8 bit
                                                  isu_sc_xbar_rob_num_i[2:0],             // sc_inst_buffer_In[6:4]   3 bit
                                                  isu_sc_cacheline_dirty_offset0_i[1:0],  // sc_inst_buffer_In[3:2]   2 bit
                                                  isu_sc_cacheline_dirty_offset1_i[1:0]}; // sc_inst_buffer_In[1:0]   2 bit

//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
// ISU opcode
// 0: WRITE
// 1: READ
// 2: READ_WITH_LINEFILL
// 3: WRITE BACK
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  assign s0_channel_id[1:0]     = sc_inst_buffer_Q[26:25];
  assign s0_op_is_write         = sc_inst_buffer_Q[24:22] == 3'd0;
  assign s0_op_is_read          = sc_inst_buffer_Q[24:22] == 3'd1;
  assign s0_op_is_read_linefill = sc_inst_buffer_Q[24:22] == 3'd2;
  assign s0_op_is_write_back    = sc_inst_buffer_Q[24:22] == 3'd3;
  assign s0_set_way[5:0]        = sc_inst_buffer_Q[21:16];
  assign s0_offset              = sc_inst_buffer_Q[15];
  assign s0_wbuffer_id[7:0]     = sc_inst_buffer_Q[14:7];
  assign s0_rob_num[2:0]        = sc_inst_buffer_Q[6:4];
  assign s0_offset0_state[1:0]  = sc_inst_buffer_Q[3:2];
  assign s0_offset1_state[1:0]  = sc_inst_buffer_Q[1:0];

//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
// ISU cacheline state
// 0: empty
// 1: sync
// 2: dirty
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  assign s0_unselect_offset_state[1:0] = s0_offset ? s0_offset0_state[1:0]
                                                   : s0_offset1_state[1:0];

  assign s0_unselect_offset_empty = s0_unselect_offset_state[1:0] == 2'b00;
  assign s0_unselect_offset_dirty = s0_unselect_offset_state[1:0] == 2'b10;

  assign s0_offset0_empty = s0_offset0_state[1:0] == 2'b00;
  assign s0_offset0_dirty = s0_offset0_state[1:0] == 2'b10;
  assign s0_offset1_empty = s0_offset1_state[1:0] == 2'b00;
  assign s0_offset1_dirty = s0_offset1_state[1:0] == 2'b10;

//---------------------------------------------------------
// S0 stage
// 1. read:               send en to sram
// 2. write:              send en and wen to sram when get data from wbuffer
// 3. read with linefill: send en and wen to sram
// 4. write back:         send en to sram
//---------------------------------------------------------
  assign s0_valid = ~sc_inst_buffer_empty;

  assign s0_can_go = ~s0_op_is_write
                   | (sc_counter_Q[1:0] != 2'b00);

  assign s0_pop = s0_valid & s1_allowIn & s0_can_go;

  assign isu_sc_ready_o = ~sc_inst_buffer_full;

//==================================================================
//                    S0 Ctrl flow
// SC counter
// 2'b00
//------------------------------------------------------------------
// 1. read/read_with_linefill/write_back send request to sram
// 2. write: send request to wbuffer
//------------------------------------------------------------------
// 2'b01
// 1. write: get wdata from wbuffer and send request to sram
//==================================================================
  assign sc_counter_incr = s0_valid
                         & ( (s0_op_is_read_linefill | s0_op_is_write_back | s0_op_is_read) & sc_counter_Q[1:0] == 2'b00
                            | s0_op_is_write & sc_counter_Q[1:0] < 2'b10
                           );

  assign sc_counter_wen = sc_counter_incr
                        | s0_pop;

  assign sc_counter_In[1:0] = s0_pop ? 2'b00 : sc_counter_Q[1:0] + 2'b01;

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      sc_counter_Q[1:0] <= 2'b00;
    end
    else if (sc_counter_wen) begin
      sc_counter_Q[1:0] <= sc_counter_In[1:0];
    end
  end

//---------------------------------------------------------
//              S0 send request to wBuffer
//---------------------------------------------------------
  assign sc_wbuf_req_valid_o = s0_valid
                             & s0_op_is_write
                             & (sc_counter_Q[1:0] == 2'b00);

  assign sc_wbuf_req_wbuffer_id_o[7:0] = s0_wbuffer_id[7:0];

//---------------------------------------------------------
//          S0 send request to linefill buffer
//---------------------------------------------------------
  assign sc_linefill_data_buffer_id_o[5:0] = s0_set_way[5:0];

//---------------------------------------------------------
// S1 stage
// 1. read :               send rdata to xbar
// 2. read with linefill : send linefill data to xbar
// 3. write back:          send rdata to biu
//---------------------------------------------------------
  assign s1_push = s0_valid & s1_allowIn & ~s0_op_is_write;

  assign s1_pop = s1_valid_Q
                & (  s1_op_is_read_Q
                   | s1_op_is_read_linefill_Q
                   | s1_op_is_write_back_Q & sc_biu_ready_i);
 
  assign s1_allowIn = ~s1_valid_Q | s1_pop;

  assign s1_valid_In = s1_push ? 1'b1
                     : s1_pop  ? 1'b0
                     :           s1_valid_Q;
  
  DFF_RST0 #(.WIDTH(1)) s1_valid_reg (
    .CLK(clk_i      ),
    .RST(rst_i      ),
    .WEN(1'b1       ),
    .D  (s1_valid_In),
    .Q  (s1_valid_Q )
  );

  DFF #(.WIDTH(17)) s1_info_reg (
    .CLK(clk_i),
    .WEN(s1_push),
    .D  ({s0_op_is_read,
          s0_op_is_read_linefill,
          s0_op_is_write_back,
          s0_offset0_dirty,
          s0_offset1_dirty,
          s0_set_way[5:0],
          s0_offset,
          s0_channel_id[1:0],
          s0_rob_num[2:0]
         }),
    .Q  ({s1_op_is_read_Q,
          s1_op_is_read_linefill_Q,
          s1_op_is_write_back_Q,
          s1_offset0_dirty_Q,
          s1_offset1_dirty_Q,
          s1_set_way_Q[5:0],
          s1_offset_Q,
          s1_channel_id_Q[1:0],
          s1_rob_num_Q[2:0]}));

  assign data_array_en = s0_valid
                       & (   (s0_op_is_read_linefill | s0_op_is_write_back | s0_op_is_read) & sc_counter_Q[1:0] == 2'b00
                           |  s0_op_is_write                                                & sc_counter_Q[1:0] == 2'b01
                         );

  assign data_array_wen = s0_valid
                        & (   s0_op_is_read_linefill & sc_counter_Q[1:0] == 2'b00
                            | s0_op_is_write         & sc_counter_Q[1:0] == 2'b01
                          );

//---------------------------------------------------------
// S1 data buffer
// receive data from:
// 1. s0 linefill data
// 2. s1 write back data from sram
//---------------------------------------------------------
  assign s0_lf_data_push = s0_valid & s1_allowIn & s0_op_is_read_linefill;

  assign s1_wb_data_push = s1_valid_Q & s1_op_is_write_back_Q & ~s1_wb_data_in_buffer_Q;

  assign s1_wb_data_in_buffer_In = s1_pop          ? 1'b0
                                 : s1_wb_data_push ? 1'b1
                                 :                   s1_wb_data_in_buffer_Q;

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      s1_wb_data_in_buffer_Q <= 1'b0;
    end
    else begin
      s1_wb_data_in_buffer_Q <= s1_wb_data_in_buffer_In;
    end
  end

  assign s1_offset0_need_evit = ~s1_offset_Q
                              | (s1_op_is_write_back_Q & s1_offset0_dirty_Q);

  assign s1_offset1_need_evit = s1_offset_Q
                              | (s1_op_is_write_back_Q & s1_offset1_dirty_Q);

  assign s0_linefill_data[127:0] = s0_offset
                                 ? linefill_data_buffer_data_i[255:128]
                                 : linefill_data_buffer_data_i[127:0];

  assign s1_data_bufferA_In[127:0] = s0_lf_data_push
                                   ? s0_linefill_data[127:0]
                                   : {128{s1_offset0_need_evit}} & s1_offset0_data_array_rdata[127:0];

  assign s1_data_bufferB_In[127:0] = {128{s1_offset1_need_evit}} & s1_offset1_data_array_rdata[127:0];

  assign s1_data_bufferA_push = s0_lf_data_push  // s0 linefill data push
                              | s1_wb_data_push; // s1 write back data push

  always @(posedge clk_i) begin
    if (s1_data_bufferA_push) begin
      s1_data_bufferA_Q[127:0] <= s1_data_bufferA_In[127:0];
    end
    if (s1_wb_data_push) begin
      s1_data_bufferB_Q[127:0] <= s1_data_bufferB_In[127:0];
    end
  end

//---------------------------------------------------------
// S1 write back: send wdata to biu
//---------------------------------------------------------
  assign sc_biu_valid_o = s1_valid_Q & s1_op_is_write_back_Q;

  assign sc_biu_data_o[255:0] = {256{ s1_wb_data_in_buffer_Q}} & {s1_data_bufferB_Q[127:0] , s1_data_bufferA_Q[127:0]}
                              | {256{~s1_wb_data_in_buffer_Q}} & {s1_data_bufferB_In[127:0], s1_data_bufferA_In[127:0]};

  assign sc_biu_strb_o[31:0]   = {{16{s1_offset1_need_evit}}, {16{s1_offset0_need_evit}}};

  assign sc_biu_set_way_o[5:0] = s1_set_way_Q[5:0];

//---------------------------------------------------------
//                        SC to Xbar
// 1. Read
// 2. Linefill and read
//---------------------------------------------------------

// sc to xbar ctrl path
  assign sc_xbar_valid_o = s1_valid_Q
                         & (   s1_op_is_read_Q
                             | s1_op_is_read_linefill_Q
                           );

  assign s1_data_array_rdata[127:0] = s1_offset_Q
                                    ? s1_offset1_data_array_rdata[127:0]
                                    : s1_offset0_data_array_rdata[127:0];

  assign sc_xbar_data_o[127:0] = {128{s1_op_is_read_linefill_Q}} & s1_data_bufferA_Q[127:0]
                               | {128{s1_op_is_read_Q}}          & s1_data_array_rdata[127:0];

  assign sc_xbar_channel_id_o[1:0] = s1_channel_id_Q[1:0];

  assign sc_xbar_rob_num_o[2:0] = s1_rob_num_Q[2:0];

//--------------------------------------------------------------------
//                    Data array: offset0
// Witdh: 128
// Depth: 64
//--------------------------------------------------------------------
  assign s0_offset0_data_array_touch = ~s0_offset
                                     | (s0_op_is_read_linefill & s0_offset0_empty)
                                     | (s0_op_is_write_back    & s0_offset0_dirty);

  assign s0_offset0_data_array_en = s0_offset0_data_array_touch & data_array_en;

  assign s0_offset0_data_array_wen = s0_offset0_data_array_touch & data_array_wen;

  assign s0_offset0_data_array_addr[5:0] = s0_set_way[5:0];

  assign s0_offset0_data_array_wdata[127:0] = {128{s0_op_is_read_linefill}} & linefill_data_buffer_data_i[127:0]
                                            | {128{s0_op_is_write}}         & sc_wbuf_rtn_data_i[127:0];

  ram_sp #(
    .AW(6),
    .DW(128)
  ) s0_offset0_data_array (
    .CLK(clk_i                             ),
    .ME (s0_offset0_data_array_en          ),
    .WE (s0_offset0_data_array_wen         ),
    .ADR(s0_offset0_data_array_addr[5:0]   ),
    .D  (s0_offset0_data_array_wdata[127:0]),
    .Q  (s1_offset0_data_array_rdata[127:0])
  );

//--------------------------------------------------------------------
//                    Data array: offset1
// Witdh: 128
// Depth: 64
//--------------------------------------------------------------------
  assign s0_offset1_data_array_touch = s0_offset
                                     | (s0_op_is_read_linefill & s0_offset1_empty)
                                     | (s0_op_is_write_back    & s0_offset1_dirty);

  assign s0_offset1_data_array_en = s0_offset1_data_array_touch & data_array_en;

  assign s0_offset1_data_array_wen = s0_offset1_data_array_touch & data_array_wen;

  assign s0_offset1_data_array_addr[5:0] = s0_set_way[5:0];

  assign s0_offset1_data_array_wdata[127:0] = {128{s0_op_is_read_linefill}} & linefill_data_buffer_data_i[255:128]
                                            | {128{s0_op_is_write}}         & sc_wbuf_rtn_data_i[127:0];

  ram_sp #(
    .AW(6),
    .DW(128)
  ) s0_offset1_data_array (
    .CLK(clk_i                             ),
    .ME (s0_offset1_data_array_en          ),
    .WE (s0_offset1_data_array_wen         ),
    .ADR(s0_offset1_data_array_addr[5:0]   ),
    .D  (s0_offset1_data_array_wdata[127:0]),
    .Q  (s1_offset1_data_array_rdata[127:0])
  );


endmodule