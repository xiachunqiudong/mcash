module sram_controller(
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
  input  wire [255:0]  isu_sc_linefill_data_i,
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
  input wire           rc_wbuf_rtn_valid_i,
  output wire          rc_wbuf_rtn_ready_o,
  output wire [127:0]  rc_wbuf_rtn_data_i
);


  wire       isu_op_is_write;
  wire       isu_op_is_read;
  wire       isu_op_is_read_linefill;
  wire       isu_op_is_write_back;

  wire [1:0] isu_sc_select_offset_state;
  wire [1:0] isu_sc_unselect_offset_state;

  wire       select_offset_empty;
  wire       select_offset_dirty;
  wire       select_offset_sync;

  wire       unselect_offset_empty;
  wire       unselect_offset_dirty;
  wire       unselect_offset_sync;

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


  wire sc_data_ram_cen;
  wire sc_data_ram_wen;

  assign sc_data_ram_cen = isu_sc_valid_i;

  assign sc_data_ram_wen = sc_data_ram_cen
                         & (
                              isu_op_is_read_linefill
                             | isu_op_is_write
                         );


//=========================================================
//                      Data Ram
// WIDTH:
// DEPTH:
//=========================================================

  










endmodule