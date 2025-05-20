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
  wire         s0_op_is_write;
  wire         s0_op_is_read;
  wire         s0_op_is_read_linefill;
  wire         s0_op_is_write_back;
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

  wire [127:0] isu_sc_offset_linefill_data;

// sram read buffer
  wire         sram_read_data_in_buffer;
  wire         s1_data_buffer_push;
  wire         s1_data_buffer_pop;
  reg          s1_data_buffer_valid_In;
  reg          s1_data_buffer_valid_Q;
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

// s1 inst info
  reg  s1_offset_Q;
  reg  s1_offset0_dirty_Q;
  reg  s1_offset1_dirty_Q;
  reg  s1_op_is_read_Q;
  reg  s1_op_is_read_linefill_Q;
  reg  s1_op_is_write_back_Q;

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


  // 0 -> offset 0
  // 1 -> offset 1
  assign s0_offset = isu_sc_set_way_offset_i[0];

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

  wire s0_can_go;
  wire s0_valid;
  wire s1_allowIn;
  wire s1_push;
  wire s1_pop;
  wire s1_valid_In;
  reg  s1_valid_Q;

//---------------------------------------------------------
// S0 stage
// 1. read:               send en to sram
// 2. write:              send en and wen to sram when get data from wbuffer
// 3. read with linefill: send en and wen to sram
// 4. write back:         send en to sram
//---------------------------------------------------------
  assign s0_valid = isu_sc_valid_i;

  assign s0_can_go = ~s0_op_is_write
                   | (sc_counter_Q[1:0] == 2'b01);

  assign isu_sc_ready_o = s0_can_go & s1_allowIn;

//---------------------------------------------------------
//               send request to wBuffer
//---------------------------------------------------------
  assign sc_wbuf_req_valid_o = s0_valid
                             & s0_op_is_write
                             & (sc_counter_Q[1:0] == 2'b00);

  assign sc_wbuf_req_wbuffer_id_o[7:0] = isu_sc_wbuffer_id_i[7:0];

//---------------------------------------------------------
// S1 stage
// 1. read :      send rdata to xbar
// 2. read with linefill : send linefill data to xbar
// 3. write back: send rdata to biu
//---------------------------------------------------------
  assign s1_push = s0_valid & ~s0_op_is_write;

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
      s1_offset_Q              <= s0_offset;
      s1_offset0_dirty_Q       <= s0_offset0_dirty;
      s1_offset1_dirty_Q       <= s0_offset1_dirty;
    end
  end

  assign data_array_en = s0_valid
                       & (   ((s0_op_is_read_linefill | s0_op_is_write_back | s0_op_is_read) & sc_counter_Q[1:0] == 2'b00)
                           | s0_op_is_write & sc_counter_Q[1:0] == 2'b01
                         );

  assign data_array_wen = s0_valid
                        & (   (s0_op_is_read_linefill & sc_counter_Q[1:0] == 2'b00)
                            | s0_op_is_write & sc_counter_Q[1:0] == 2'b01
                          );

//---------------------------------------------------------
// S1 data buffer
// receive data from:
// 1. s0 linefill data
// 2. s1 write back data from sram
//---------------------------------------------------------
  assign s1_data_bufferA_push = s0_valid
                                     & (s0_op_is_read | s0_op_is_write_back)
                                     & (sc_counter_Q[1:0] == 2'b01);

  assign sram_read_data_in_buffer = sc_counter_Q[1:0] == 2'b10;

  assign sram_read_data_need_offset0 = ~s1_offset_Q
                                     | (s1_op_is_write_back_Q & s1_offset0_dirty_Q);

  assign sram_read_data_need_offset1 = s1_offset_Q
                                     | (s1_op_is_write_back_Q & s1_offset1_dirty_Q);

  assign sram_read_data_buffer_In[127:0]   = {128{sram_read_data_need_offset0}} & offset0_data_array_rdata[127:0];
  assign sram_read_data_buffer_In[255:128] = {128{sram_read_data_need_offset1}} & offset1_data_array_rdata[127:0];

  always @(posedge clk_i) begin
    if (s1_data_bufferA_push) begin
      sram_read_data_buffer_Q[255:0] <= sram_read_data_buffer_In[255:0];
    end
  end

//---------------------------------------------------------
// S1 write back: send wdata to biu
//---------------------------------------------------------
  assign sc_biu_valid_o = s1_valid_Q & s1_op_is_write_back_Q;

  assign sc_biu_data_o[255:0] = {256{ sram_read_data_in_buffer}} & sram_read_data_buffer_Q[255:0]
                              | {256{~sram_read_data_in_buffer}} & sram_read_data_buffer_In[255:0];

  assign sc_biu_strb_o[31:0]   = {{16{sram_read_data_need_offset1}}, {16{sram_read_data_need_offset0}}};

  assign sc_biu_set_way_o[5:0] = isu_sc_set_way_offset_i[6:1];


//---------------------------------------------------------
//                        SC to Xbar
// 1. Read
// 2. Linefill and read
//---------------------------------------------------------

// sc to xbar ctrl path
  assign sc_xbar_valid_o = s0_valid
                         & (   (s0_op_is_read          & (sc_counter_Q[1:0] > 2'b00))
                             | (s0_op_is_read_linefill & (sc_counter_Q[1:0] == 2'b00))
                           );

// sc to xbar data path
  assign isu_sc_offset_linefill_data[127:0] = isu_sc_set_way_offset_i[0]
                                            ? isu_sc_linefill_data_offset1_i[127:0]
                                            : isu_sc_linefill_data_offset0_i[127:0];

  assign sc_xbar_data_o[127:0] = {128{s1_op_is_read_linefill_Q}} & isu_sc_offset_linefill_data[127:0]
                               | {128{s1_op_is_read_Q}}          & offset0_data_array_rdata[127:0];

  assign sc_xbar_channel_id_o[1:0] = isu_sc_channel_id_i[1:0];

  assign sc_xbar_rob_num_o[2:0] = isu_sc_xbar_rob_num_i[2:0];


//==================================================================
//                    SC Ctrl flow
// SC counter
// 2'b00 -> send read enable to sram
// 2'b01 -> get read data from sram
// 2'b10 -> read data in data buffer
//==================================================================
  assign sc_counter_incr = s0_valid
                         & (sc_counter_Q[1:0] == 2'b00)
                         & (  s0_op_is_read_linefill               // write to sram
                            | s0_op_is_write_back                  // read from sram
                            | s0_op_is_read                        // read from sram
                            | s0_op_is_write                        // write to sram
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

  assign read_with_linefill_done = s0_op_is_read_linefill & sc_counter_Q[1:0] == 2'b01;

  assign isu_sc_write_done     = sc_wbuf_rtn_valid_i;
  assign isu_sc_read_done      = s0_op_is_read & sc_xbar_valid_o;
  assign isu_sc_wirteBack_done = sc_biu_valid_o & sc_biu_ready_i;

  assign isu_sc_req_done = read_with_linefill_done
                         | isu_sc_write_done
                         | isu_sc_read_done
                         | isu_sc_wirteBack_done;

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


//====================================================================
//                      Data Array
// offset0 data array
// offset1 data array
//====================================================================


//--------------------------------------------------------------------
//                    Data array: offset0
// Witdh: 128
// Depth: 64
//--------------------------------------------------------------------
  assign offset0_data_array_touch = ~s0_offset
                                  | (s0_op_is_read_linefill & offset0_empty)
                                  | (s0_op_is_write_back    & s0_offset0_dirty);

  assign offset0_data_array_en = offset0_data_array_touch & data_array_en;

  assign offset0_data_array_wen = offset0_data_array_touch & data_array_wen;

  assign offset0_data_array_addr[5:0] = isu_sc_set_way_offset_i[6:1];

  assign offset0_data_array_wdata[127:0] = {128{s0_op_is_read_linefill}} & isu_sc_linefill_data_offset0_i[127:0]
                                         | {128{s0_op_is_write}}         & sc_wbuf_rtn_data_i[127:0];

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
  assign offset1_data_array_touch = s0_offset
                                  | (s0_op_is_read_linefill & offset1_empty)
                                  | (s0_op_is_write_back    & s0_offset1_dirty);

  assign offset1_data_array_en = offset1_data_array_touch & data_array_en;

  assign offset1_data_array_wen = offset1_data_array_touch & data_array_wen;

  assign offset1_data_array_addr[5:0] = isu_sc_set_way_offset_i[6:1];

  assign offset1_data_array_wdata[127:0] = {128{s0_op_is_read_linefill}} & isu_sc_linefill_data_offset1_i[127:0]
                                         | {128{s0_op_is_write}}         & sc_wbuf_rtn_data_i[127:0];

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