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
  input  wire          sc_xbar_allowIn_i,
  output wire [1:0]    sc_xbar_channel_id_o,
  output wire [2:0]    sc_xbar_rob_num_o,
  output wire [127:0]  sc_xbar_data_o,
  // sc >> sub memory
  output wire          sc_biu_valid_o,
  input  wire          sc_biu_ready_i,
  output wire [127:0]  sc_biu_data_o,
  output wire          sc_biu_offset_o,
  output wire          sc_biu_all_offset_o,
  output wire [6:0]    sc_biu_set_way_offset_o,
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
  wire         select_offset_empty;
  wire         select_offset_dirty;
  wire         select_offset_sync;
  wire         unselect_offset_empty;
  wire         unselect_offset_dirty;
  wire         unselect_offset_sync;

  wire         linefill_offset;

  wire         sc_read_sram_once;
  wire         sc_read_sram_twice;
  wire         sram_write_cnt_incr;
  wire         sram_write_cnt_wen;
  wire [1:0]   sram_write_cnt_In;
  reg  [1:0]   sram_write_cnt_Q;
  wire [127:0] isu_sc_select_offset_linefill_data;
  wire [127:0] isu_sc_offset_linefill_data;

// sram read buffer
  wire        sram_read_data_in_bufferA;
  wire        sram_read_data_bufferA_push;
  reg [127:0] sram_read_data_buffer_Q;
  wire        sram_read_data_bufferB_push;
  wire        sram_read_data_bufferB_pop;
  wire        sram_read_data_bufferB_valid_In;
  reg         sram_read_data_bufferB_valid_Q;
  reg [127:0] sram_read_data_bufferB_Q;
  wire        sc_biu_kickoff;

  wire         sc_data_ram_en;
  wire         sc_data_ram_wen;
  wire [6:0]   sc_data_ram_addr;
  wire [127:0] sc_data_ram_wdata;
  wire [127:0] sc_data_ram_rdata;
// sc >> xbar
  wire         sc_xbar_kickoff;
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

// 1. select offset state
  assign select_offset_empty = isu_sc_select_offset_state[1:0] == 2'b00;
  assign select_offset_dirty = isu_sc_select_offset_state[1:0] == 2'b10;
  assign select_offset_sync  = isu_sc_select_offset_state[1:0] == 2'b01;

// 2. unselect offset state
  assign unselect_offset_empty = isu_sc_unselect_offset_state[1:0] == 2'b00;
  assign unselect_offset_dirty = isu_sc_unselect_offset_state[1:0] == 2'b10;
  assign unselect_offset_sync  = isu_sc_unselect_offset_state[1:0] == 2'b01;



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

  assign sc_xbar_kickoff = sc_xbar_valid_o & sc_xbar_allowIn_i;

  assign sc_send_data_to_xbar_done_wen = isu_op_is_read_linefill & sc_xbar_kickoff
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
  assign sc_xbar_data_o[127:0] = {128{isu_op_is_read_linefill}}                     & isu_sc_offset_linefill_data[127:0]
                               | {128{isu_op_is_read &  sram_read_data_in_bufferA}} & sram_read_data_buffer_Q[127:0]
                               | {128{isu_op_is_read & ~sram_read_data_in_bufferA}} & sc_data_ram_rdata[127:0];

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
  assign sc_counter_incr = sc_wbuf_req_valid_o /*& sc_wbuf_req_ready_i*/       // incr because of write
                         | (isu_sc_valid_i & sc_counter_Q[1:0] <= 2'b10)
                           & (   isu_op_is_read                                // incr because of read
                               | isu_op_is_write_back);                        // incr because of write back

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
                                 & (~sc_read_sram_twice | (|sram_write_cnt_Q[1:0]))   // sram write done
                                 & (sc_xbar_kickoff | sc_send_data_to_xbar_done_Q);  // send data to xbar done

  assign isu_sc_write_done     = sc_wbuf_rtn_valid_i;
  assign isu_sc_read_done      = isu_op_is_read & sc_xbar_kickoff;
  assign isu_sc_wirteBack_done = 1'b0;

  assign isu_sc_req_done = read_with_linefill_done
                         | isu_sc_write_done
                         | isu_sc_read_done
                         | isu_sc_wirteBack_done;

  assign isu_sc_ready_o = isu_sc_req_done;

//---------------------------------------------------------
//                     Write to SRAM
// 1. linefill
//    - write one offset (write once)
//    - write two offset (write twice)
// 2. write (write once)
//---------------------------------------------------------

// sram write cnt
// 1. linefill once
// 2. linefill twice
  assign sram_write_cnt_incr = isu_sc_valid_i
                             & (   sc_read_sram_once  & (sram_write_cnt_Q[1:0] == 2'b00)
                                 | sc_read_sram_twice & (sram_write_cnt_Q[1:0] <= 2'b01)
                               );

  assign sram_write_cnt_wen = sram_write_cnt_incr
                            | isu_sc_req_done;

  assign sram_write_cnt_In[1:0] = isu_sc_req_done
                                ? 2'b0
                                : sram_write_cnt_Q[1:0] + 2'b1;

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      sram_write_cnt_Q[1:0] <= 2'b0;
    end
    else if (sram_write_cnt_wen) begin
      sram_write_cnt_Q[1:0] <= sram_write_cnt_In[1:0];
    end
  end

  assign sc_read_sram_once = isu_op_is_read_linefill & ~unselect_offset_empty
                           | isu_op_is_write_back    & ~unselect_offset_dirty;
  
  assign sc_read_sram_twice = isu_op_is_read_linefill & unselect_offset_empty
                            | isu_op_is_write_back    & unselect_offset_dirty;

// sram 
  assign linefill_offset = sram_write_cnt_Q[0]          // linefill next offset
                         ? ~isu_sc_set_way_offset_i[0]  // unselect offset
                         :  isu_sc_set_way_offset_i[0]; // select offset

  assign isu_sc_select_offset_linefill_data[127:0] = isu_sc_set_way_offset_i[0]
                                                   ? isu_sc_linefill_data_offset1_i[127:0]
                                                   : isu_sc_linefill_data_offset0_i[127:0];

  assign isu_sc_offset_linefill_data[127:0] = linefill_offset
                                            ? isu_sc_linefill_data_offset1_i[127:0]
                                            : isu_sc_linefill_data_offset0_i[127:0];

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
                                     & (sc_counter_Q == 2'b01);

  assign sram_read_data_in_bufferA = sc_counter_Q == 2'b10;

  always @(posedge clk_i) begin
    if (sram_read_data_bufferA_push) begin
      sram_read_data_buffer_Q[127:0] <= sc_data_ram_rdata[127:0];
    end
  end

// read bufferB
  assign sram_read_data_bufferB_push = isu_sc_valid_i
                                     & isu_op_is_write_back
                                     & (sc_counter_Q == 2'b10)
                                     & ~sram_read_data_bufferB_valid_Q;

  assign sram_read_data_bufferB_pop = isu_op_is_read
                                   & sc_xbar_kickoff;

  assign sram_read_data_bufferB_valid_In = sram_read_data_bufferB_push ? 1'b1
                                         : sram_read_data_bufferB_pop  ? 1'b0
                                                                       : sram_read_data_bufferB_valid_Q;

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      sram_read_data_bufferB_valid_Q <= 1'b0;
    end
    else begin
      sram_read_data_bufferB_valid_Q <= sram_read_data_bufferB_valid_In;
    end
  end

  always @(posedge clk_i) begin
    if (sram_read_data_bufferB_push) begin
      sram_read_data_bufferB_Q[127:0] <= sc_data_ram_rdata[127:0];
    end
  end

  assign sc_biu_data_o[127:0]         = sram_read_data_bufferB_Q[127:0];
  assign sc_biu_valid_o               = sram_read_data_bufferB_valid_Q;
  assign sc_biu_set_way_offset_o[6:0] = isu_sc_set_way_offset_i[6:0];

//=========================================================
//                      Data Ram
// WIDTH: 128
// DEPTH: 128
//=========================================================

  assign sc_data_ram_en = isu_sc_valid_i
                         & (   sc_read_sram_once     & (sram_write_cnt_Q[1:0] == 2'b00) // read once
                             | sc_read_sram_twice    & (sram_write_cnt_Q[1:0] <= 2'b01) // read twice
                             | isu_op_is_read        & (sc_counter_Q[1:0] == 2'b00)     // read
                             | isu_op_is_write       & sc_wbuf_rtn_valid_i              // write
                           );

  assign sc_data_ram_wen = isu_sc_valid_i
                         & (   sc_read_sram_once  & (sram_write_cnt_Q[1:0] == 2'b00)
                             | sc_read_sram_twice & (sram_write_cnt_Q[1:0] <= 2'b01)
                             | isu_op_is_write & sc_wbuf_rtn_valid_i
                           );

  assign sc_data_ram_addr[6:0] = {isu_sc_set_way_offset_i[6:1], linefill_offset};

  assign sc_data_ram_wdata[127:0] = {128{isu_op_is_read_linefill}} & isu_sc_offset_linefill_data[127:0]
                                  | {128{isu_op_is_write}}         & sc_wbuf_rtn_data_i[127:0];

  ram_sp #(
    .AW(7),
    .DW(128)
  ) u_data_ram (
    .CLK(clk_i                   ),
    .ME (sc_data_ram_en          ),
    .WE (sc_data_ram_wen         ),
    .ADR(sc_data_ram_addr[6:0]   ),
    .D  (sc_data_ram_wdata[127:0]),
    .Q  (sc_data_ram_rdata[127:0])
  );

endmodule