module sram_controller(
  // isu >> sc
  input  wire          isu_sc_valid_i,
  output wire          isu_sc_ready_o,
  input  wire [1:0]    isu_sc_channel_id_i,
  input  wire [2:0]    isu_sc_opcode_i,
  input  wire [6:0]    isu_sc_set_way_offset_i,
  input  wire [7:0]    isu_sc_wbuffer_id_i,
  input  wire [2:0]    isu_sc_xbar_rob_num,
  input  wire [1:0]    isu_sc_cacheline_dirty_offset0,
  input  wire [1:0]    isu_sc_cacheline_dirty_offset1,
  input  wire [255:0]  isu_sc_linefill_data,
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



endmodule