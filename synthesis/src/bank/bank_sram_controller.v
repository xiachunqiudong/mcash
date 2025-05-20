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
  output wire [31:0]   sc_biu_strb_o,
  output wire [5:0]    sc_biu_set_way_o,
  // sc >> Wbuf
  output wire          sc_wbuf_req_valid_o,
  output wire [7:0]    sc_wbuf_req_wbuffer_id_o,
  // Wbuf >> sc
  input  wire          sc_wbuf_rtn_valid_i,
  input  wire [127:0]  sc_wbuf_rtn_data_i
);

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
  wire [2:0]   s0_rob_num;
  wire         s0_offset;
// cacheline info
  wire [1:0]   isu_sc_select_offset_state;
  wire [1:0]   isu_sc_unselect_offset_state;
  wire         offset0_empty;
  wire         s0_offset0_dirty;
  wire         offset1_empty;
  wire         s0_offset1_dirty;
  wire         unselect_offset_empty;
  wire         unselect_offset_dirty;

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
  reg [5:0]    s1_set_way_Q;
  reg [1:0]    s1_channel_id_Q;
  reg [2:0]    s1_rob_num_Q;
  wire [127:0] s1_offset0_data_array_rdata;
  wire [127:0] s1_offset1_data_array_rdata;
  wire [127:0] s1_data_array_rdata;

//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
// ISU opcode
// 0: WRITE
// 1: READ
// 2: READ_WITH_LINEFILL
// 3: WRITE BACK
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  assign s0_op_is_write         = isu_sc_opcode_i[2:0] == 3'd0;
  assign s0_op_is_read          = isu_sc_opcode_i[2:0] == 3'd1;
  assign s0_op_is_read_linefill = isu_sc_opcode_i[2:0] == 3'd2;
  assign s0_op_is_write_back    = isu_sc_opcode_i[2:0] == 3'd3;
  assign s0_set_way[5:0]        = isu_sc_set_way_offset_i[5:0];
  assign s0_offset              = isu_sc_set_way_offset_i[0];
  assign s0_channel_id[1:0]     = isu_sc_channel_id_i[1:0];
  assign s0_rob_num[2:0]        = isu_sc_xbar_rob_num_i[2:0];

  assign isu_sc_select_offset_state[1:0] = s0_offset ? isu_sc_cacheline_dirty_offset1_i[1:0]
                                                         : isu_sc_cacheline_dirty_offset0_i[1:0];

  assign isu_sc_unselect_offset_state[1:0] = s0_offset ? isu_sc_cacheline_dirty_offset0_i[1:0]
                                                           : isu_sc_cacheline_dirty_offset1_i[1:0];

//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
// ISU cacheline state
// 0: empty
// 1: sync
// 2: dirty
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  assign offset0_empty = isu_sc_cacheline_dirty_offset0_i[1:0] == 2'b00;
  assign s0_offset0_dirty = isu_sc_cacheline_dirty_offset0_i[1:0] == 2'b10;

  assign offset1_empty = isu_sc_cacheline_dirty_offset1_i[1:0] == 2'b00;
  assign s0_offset1_dirty = isu_sc_cacheline_dirty_offset1_i[1:0] == 2'b10;

// 2. unselect offset state
  assign unselect_offset_empty = isu_sc_unselect_offset_state[1:0] == 2'b00;
  assign unselect_offset_dirty = isu_sc_unselect_offset_state[1:0] == 2'b10;

//---------------------------------------------------------
// S0 stage
// 1. read:               send en to sram
// 2. write:              send en and wen to sram when get data from wbuffer
// 3. read with linefill: send en and wen to sram
// 4. write back:         send en to sram
//---------------------------------------------------------
  assign s0_valid = isu_sc_valid_i;

  assign s0_can_go = ~s0_op_is_write
                   | (sc_counter_Q[1:0] != 2'b00);

  assign s0_pop = s0_valid & s1_allowIn & s0_can_go;

  assign isu_sc_ready_o = s0_can_go & s1_allowIn;

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
//               send request to wBuffer
//---------------------------------------------------------
  assign sc_wbuf_req_valid_o = s0_valid
                             & s0_op_is_write
                             & (sc_counter_Q[1:0] == 2'b00);

  assign sc_wbuf_req_wbuffer_id_o[7:0] = isu_sc_wbuffer_id_i[7:0];

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
  
  always @(posedge clk_i or posedge rst_i) begin
    if(rst_i) begin
      s1_valid_Q <= 1'b0;
    end
    else begin
      s1_valid_Q <= s1_valid_In;
    end
  end

  always @(posedge clk_i) begin
    if(s1_push) begin
      s1_op_is_read_Q          <= s0_op_is_read;
      s1_op_is_read_linefill_Q <= s0_op_is_read_linefill;
      s1_op_is_write_back_Q    <= s0_op_is_write_back;
      s1_offset0_dirty_Q       <= s0_offset0_dirty;
      s1_offset1_dirty_Q       <= s0_offset1_dirty;
      s1_set_way_Q[5:0]        <= s0_set_way[5:0];
      s1_offset_Q              <= s0_offset;
      s1_channel_id_Q[1:0]     <= s0_channel_id[1:0];
      s1_rob_num_Q[2:0]        <= s0_rob_num[2:0];
    end
  end

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
                                 ? isu_sc_linefill_data_offset1_i[127:0]
                                 : isu_sc_linefill_data_offset0_i[127:0];

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
                                     | (s0_op_is_read_linefill & offset0_empty)
                                     | (s0_op_is_write_back    & s0_offset0_dirty);

  assign s0_offset0_data_array_en = s0_offset0_data_array_touch & data_array_en;

  assign s0_offset0_data_array_wen = s0_offset0_data_array_touch & data_array_wen;

  assign s0_offset0_data_array_addr[5:0] = isu_sc_set_way_offset_i[6:1];

  assign s0_offset0_data_array_wdata[127:0] = {128{s0_op_is_read_linefill}} & isu_sc_linefill_data_offset0_i[127:0]
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
                                     | (s0_op_is_read_linefill & offset1_empty)
                                     | (s0_op_is_write_back    & s0_offset1_dirty);

  assign s0_offset1_data_array_en = s0_offset1_data_array_touch & data_array_en;

  assign s0_offset1_data_array_wen = s0_offset1_data_array_touch & data_array_wen;

  assign s0_offset1_data_array_addr[5:0] = isu_sc_set_way_offset_i[6:1];

  assign s0_offset1_data_array_wdata[127:0] = {128{s0_op_is_read_linefill}} & isu_sc_linefill_data_offset1_i[127:0]
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