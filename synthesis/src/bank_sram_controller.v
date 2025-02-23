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
  input  wire          sc_xbar_ready_i,
  output wire [1:0]    sc_xbar_channel_id_o,
  output wire [2:0]    sc_xbar_rob_num_o,
  output wire [127:0]  sc_xbar_data_o,
  // sc >> sub memory
  output wire          sc_subm_valid_o,
  input  wire          sc_subm_ready_i,
  output wire [127:0]  sc_subm_data_o,
  output wire          sc_subm_offset_o,
  output wire          sc_subm_all_offset_o,
  output wire [6:0]    sc_subm_set_way_offset_o,
  // sc >> Wbuf
  output wire          rc_wbuf_req_valid_o,
  input  wire          rc_wbuf_req_ready_i,
  output wire [1:0]    rc_wbuf_req_channel_id_o,
  output wire [7:0]    rc_wbuf_req_wbuffer_id_o,
  // Wbuf >> sc
  input  wire          rc_wbuf_rtn_valid_i,
  output wire          rc_wbuf_rtn_ready_o,
  output wire [127:0]  rc_wbuf_rtn_data_i
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

  wire         sc_linefill_once;
  wire         sc_linefill_twice;
  wire         sram_write_cnt_wen;
  wire [1:0]   sram_write_cnt_In;
  reg  [1:0]   sram_write_cnt_Q;
  wire [127:0] isu_sc_offset_linefill_data;

  wire         sc_data_ram_en;
  wire         sc_data_ram_wen;
  wire [6:0]   sc_data_ram_addr;
  wire [127:0] sc_data_ram_wdata;
  wire [127:0] sc_data_ram_rdata;

  wire         sc_xbra_kickoff;
  wire         sc_send_data_to_xbar_done_wen;
  wire         sc_send_data_to_xbar_done_In;
  reg          sc_send_data_to_xbar_done_Q;

// sc ctrl flow
  wire         sc_counter_incr;
  wire         sc_counter_init;
  wire         sc_counter_wen;
  wire [1:0]   sc_counter_In;
  reg  [1:0]   sc_counter_Q;
  wire         isu_sc_read_with_linefill;
  wire         isu_sc_write_done;
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
// 1: dirty
// 2: sync
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

// 1. select offset state
  assign select_offset_empty = isu_sc_select_offset_state[1:0] == 2'b00;
  assign select_offset_dirty = isu_sc_select_offset_state[1:0] == 2'b01;
  assign select_offset_sync  = isu_sc_select_offset_state[1:0] == 2'b10;

// 2. unselect offset state
  assign unselect_offset_empty = isu_sc_unselect_offset_state[1:0] == 2'b00;
  assign unselect_offset_dirty = isu_sc_unselect_offset_state[1:0] == 2'b01;
  assign unselect_offset_sync  = isu_sc_unselect_offset_state[1:0] == 2'b10;



//---------------------------------------------------------
//                        SC to Xbar
// 1. Read
// 2. Linefill and read
//---------------------------------------------------------

// sc to xbar ctrl path
  assign sc_xbar_valid_o = isu_sc_valid_i
                         & (   isu_op_is_read
                             | (isu_op_is_read_linefill & ~sc_send_data_to_xbar_done_Q)
                           );

  assign sc_xbra_kickoff = sc_xbar_valid_o & sc_xbar_ready_i;

  assign sc_send_data_to_xbar_done_wen = sc_xbra_kickoff
                                       | isu_sc_req_done;

  assign sc_send_data_to_xbar_done_In = isu_sc_req_done
                                      ? 1'b0
                                      : sc_xbra_kickoff;

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      sc_send_data_to_xbar_done_Q <= 1'b0;
    end
    else if (sc_send_data_to_xbar_done_wen) begin
      sc_send_data_to_xbar_done_Q <= sc_send_data_to_xbar_done_In;
    end
  end

// sc to xbar data path
  assign sc_xbar_channel_id_o[1:0] = isu_sc_channel_id_i[1:0];

  assign sc_xbar_rob_num_o[2:0] = isu_sc_xbar_rob_num_i[2:0];

//---------------------------------------------------------
//                        SC to wBuffer
// ISU op: Write
//---------------------------------------------------------
  assign rc_wbuf_req_valid_o = isu_sc_valid_i
                             & isu_op_is_write
                             & (sc_counter_Q[1:0] == 2'b00);

  assign rc_wbuf_rtn_ready_o = 1'b1;

//=========================================================
//                    SC Ctrl flow
//=========================================================
  assign sc_counter_incr = rc_wbuf_req_valid_o & rc_wbuf_req_ready_i; // incr because of write

  assign sc_counter_init = isu_sc_req_done;

  assign sc_counter_wen = sc_counter_incr
                        | sc_counter_init;

  assign sc_counter_In[1:0] = sc_counter_init ? 2'b00
                            : sc_counter_incr ? sc_counter_Q[1:0] + 2'b01
                                              : sc_counter_Q[1:0];

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      sc_counter_Q[1:0] <= 2'b0;
    end
    else if (sc_counter_wen) begin
      sc_counter_Q[1:0] <= sc_counter_In[1:0];
    end
  end

  assign isu_sc_read_with_linefill = isu_op_is_read_linefill
                                   & (~sc_linefill_twice | (|sram_write_cnt_Q[1:0]))   // sram write done
                                   & (sc_xbra_kickoff | sc_send_data_to_xbar_done_Q); // send data to xbar done

  assign isu_sc_write_done = rc_wbuf_rtn_valid_i;

  assign isu_sc_req_done = isu_sc_read_with_linefill
                         | isu_sc_write_done;

  assign isu_sc_ready_o = isu_sc_req_done;

//=========================================================
//                      Data Ram
// WIDTH: 128
// DEPTH: 128
//=========================================================

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
  assign sram_write_cnt_wen = sc_data_ram_wen | isu_sc_req_done;

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

  assign sc_linefill_once = isu_op_is_read_linefill & ~unselect_offset_empty;
  
  assign sc_linefill_twice = isu_op_is_read_linefill & unselect_offset_empty;

// sram 
  assign sc_data_ram_addr[6:0] = {isu_sc_set_way_offset_i[6:1], linefill_offset};

  assign linefill_offset = sram_write_cnt_Q[0] // linefill next offset
                         ? ~isu_sc_set_way_offset_i[0]  // unselect offset
                         :  isu_sc_set_way_offset_i[0]; // select offset

  assign isu_sc_offset_linefill_data[127:0] = linefill_offset
                                            ? isu_sc_linefill_data_offset1_i[127:0]
                                            : isu_sc_linefill_data_offset0_i[127:0];

  assign sc_data_ram_wdata[127:0] = {128{isu_op_is_read_linefill}} & isu_sc_offset_linefill_data[127:0]
                                  | {128{isu_op_is_write}}         & rc_wbuf_rtn_data_i[127:0];

//---------------------------------------------------------
//                     Read from SRAM
// 1. read
// 2. write back
//---------------------------------------------------------

  assign sc_data_ram_en = isu_sc_valid_i
                         & (   sc_linefill_once  & (sram_write_cnt_Q[1:0] == 2'b00)
                             | sc_linefill_twice & (sram_write_cnt_Q[1:0] <= 2'b01)
                             | isu_op_is_read
                             | isu_op_is_write & rc_wbuf_rtn_valid_i
                           );

  assign sc_data_ram_wen = isu_sc_valid_i
                         & (   sc_linefill_once  & (sram_write_cnt_Q[1:0] == 2'b00)
                             | sc_linefill_twice & (sram_write_cnt_Q[1:0] <= 2'b01)
                             | isu_op_is_write & rc_wbuf_rtn_valid_i
                           );

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