module mcash_diff(
  input wire clk,
  input wire rst
);

  parameter IQ_PTR_WIDTH = 6;
  parameter IQ_DEPTH     = 1 << IQ_PTR_WIDTH;

  `define CROSS_BAR_TOP mcash_tb.u_mcash_top.u_cross_bar_top
  `define CROSS_BAR_TOP_CORE `CROSS_BAR_TOP.u_cross_bar_core
  `define BANK0_ISU_TOP mcash_tb.u_mcash_top.u_bank_top_wrapper.bank0_top.isu_top
  `define BANK1_ISU_TOP mcash_tb.u_mcash_top.u_bank_top_wrapper.bank1_top.isu_top
  `define BANK2_ISU_TOP mcash_tb.u_mcash_top.u_bank_top_wrapper.bank2_top.isu_top
  `define BANK3_ISU_TOP mcash_tb.u_mcash_top.u_bank_top_wrapper.bank3_top.isu_top

// xbar check DPIC
  import "DPI-C" function int c_xbar_bank_htu_req_check(longint cycle, byte bank_id, byte ch_id, byte entry_id, byte op, int addr, longint data);
  import "DPI-C" function int c_xbar_ch_buffers_push(longint cycle, byte ch_id, byte buffer_size, byte write_ptr, byte op, int addr, longint data);
  import "DPI-C" function int c_xbar_chs_buffer_info_check(longint cycle, byte ch, byte buffer_size, byte read_ptr, byte write_ptr, byte op_type);

// ISU check DPIC
  import "DPI-C" function int c_isu_iq_enqueue(longint cycle, byte bank, byte cacheline_inflight, byte need_linefill, byte rob_id, byte ch_id,
                                               byte opcode, byte set_way_offset, byte wbuffer_id, byte offset0_state, byte offset1_state,
                                               longint mshr_allow_array_Q, int write_ptr, int iq_size);
  import "DPI-C" function int c_isu_iq_dequeue(longint cycle, byte bank, int issue_ptr, byte ch_id, byte opcode,
                                               byte set_way_offset, byte wbuffer_id, byte rob_id, byte offset0_state, byte offset1_state,
                                               longint mshr_allow_array, longint credit_allow_array);

  import "DPI-C" function int c_iq_size_update(longint cycle, byte bank, int iq_size);

  import "DPI-C" function int c_iq_bottom_ptr_update(longint cycle, byte bank, int bottom_ptr);

  import "DPI-C" function int c_update_inflight_array(longint cycle, byte bank, byte rid, longint rdata0, longint rdata1, longint rdata2, longint rdata3);

  logic [63:0]  cycle_cnt_Q;

  logic         mcash_ch0_req_valid;
  logic         mcash_ch0_req_allowIn;
  logic [2:0]   mcash_ch0_req_op;
  logic [31:0]  mcash_ch0_req_addr;
  logic [127:0] mcash_ch0_req_data;
  logic         mcash_ch1_req_valid;
  logic         mcash_ch1_req_allowIn;
  logic [2:0]   mcash_ch1_req_op;
  logic [31:0]  mcash_ch1_req_addr;
  logic [127:0] mcash_ch1_req_data;
  logic         mcash_ch2_req_valid;
  logic         mcash_ch2_req_allowIn;
  logic [2:0]   mcash_ch2_req_op;
  logic [31:0]  mcash_ch2_req_addr;
  logic [127:0] mcash_ch2_req_data;

  logic         mcash_ch0_read_ptr_kickoff;
  logic         mcash_ch0_write_ptr_kickoff;
  logic [2:0]   mcash_ch0_req_write_ptr;
  logic [2:0]   mcash_ch0_req_read_ptr;
  logic [2:0]   mcash_ch0_buffer_size;
  logic         mcash_ch1_read_ptr_kickoff;
  logic         mcash_ch1_write_ptr_kickoff;
  logic [2:0]   mcash_ch1_req_write_ptr;
  logic [2:0]   mcash_ch1_req_read_ptr;
  logic [2:0]   mcash_ch1_buffer_size;
  logic         mcash_ch2_read_ptr_kickoff;
  logic         mcash_ch2_write_ptr_kickoff;
  logic [2:0]   mcash_ch2_req_write_ptr;
  logic [2:0]   mcash_ch2_req_read_ptr;
  logic [2:0]   mcash_ch2_buffer_size;


  logic [2:0]   ch0_entryID_send_to_bank0;
  logic [2:0]   ch0_entryID_send_to_bank1;
  logic [2:0]   ch0_entryID_send_to_bank2;
  logic [2:0]   ch0_entryID_send_to_bank3;
  logic [2:0]   ch1_entryID_send_to_bank0;
  logic [2:0]   ch1_entryID_send_to_bank1;
  logic [2:0]   ch1_entryID_send_to_bank2;
  logic [2:0]   ch1_entryID_send_to_bank3;
  logic [2:0]   ch2_entryID_send_to_bank0;
  logic [2:0]   ch2_entryID_send_to_bank1;
  logic [2:0]   ch2_entryID_send_to_bank2;
  logic [2:0]   ch2_entryID_send_to_bank3;

  logic [2:0]   xbar_bank0_ch_entryID;
  logic [2:0]   xbar_bank1_ch_entryID;
  logic [2:0]   xbar_bank2_ch_entryID;
  logic [2:0]   xbar_bank3_ch_entryID;

  logic         xbar_bank0_htu_valid;
  logic         xbar_bank0_htu_allowIn;
  logic [1:0]   xbar_bank0_htu_ch_id;
  logic [1:0]   xbar_bank0_htu_opcode;
  logic [31:0]  xbar_bank0_htu_addr;
  logic [127:0] xbar_bank0_htu_data;
  logic [7:0]   xbar_bank0_htu_wbuffer_id;
  logic         xbar_bank1_htu_valid;
  logic         xbar_bank1_htu_allowIn;
  logic [1:0]   xbar_bank1_htu_ch_id;
  logic [1:0]   xbar_bank1_htu_opcode;
  logic [31:0]  xbar_bank1_htu_addr;
  logic [127:0] xbar_bank1_htu_data;
  logic [7:0]   xbar_bank1_htu_wbuffer_id;
  logic         xbar_bank2_htu_valid;
  logic         xbar_bank2_htu_allowIn;
  logic [1:0]   xbar_bank2_htu_ch_id;
  logic [1:0]   xbar_bank2_htu_opcode;
  logic [31:0]  xbar_bank2_htu_addr;
  logic [127:0] xbar_bank2_htu_data;
  logic [7:0]   xbar_bank2_htu_wbuffer_id;
  logic         xbar_bank3_htu_valid;
  logic         xbar_bank3_htu_allowIn;
  logic [1:0]   xbar_bank3_htu_ch_id;
  logic [1:0]   xbar_bank3_htu_opcode;
  logic [31:0]  xbar_bank3_htu_addr;
  logic [127:0] xbar_bank3_htu_data;
  logic [7:0]   xbar_bank3_htu_wbuffer_id;

  logic         bank0_htu_isu_valid;
  logic         bank0_htu_isu_allowIn;
  logic         bank0_htu_isu_cacheline_inflight;
  logic         bank0_htu_isu_need_linefill;
  logic [2:0]   bank0_htu_isu_rob_id;
  logic [1:0]   bank0_htu_isu_ch_id;
  logic [1:0]   bank0_htu_isu_opcode;
  logic [6:0]   bank0_htu_isu_set_way_offset;
  logic [7:0]   bank0_htu_isu_wbuffer_id;
  logic [1:0]   bank0_htu_isu_offset0_state;
  logic [1:0]   bank0_htu_isu_offset1_state;
  logic         bank1_htu_isu_valid;
  logic         bank1_htu_isu_allowIn;
  logic         bank1_htu_isu_cacheline_inflight;
  logic         bank1_htu_isu_need_linefill;
  logic [2:0]   bank1_htu_isu_rob_id;
  logic [1:0]   bank1_htu_isu_ch_id;
  logic [1:0]   bank1_htu_isu_opcode;
  logic [6:0]   bank1_htu_isu_set_way_offset;
  logic [7:0]   bank1_htu_isu_wbuffer_id;
  logic [1:0]   bank1_htu_isu_offset0_state;
  logic [1:0]   bank1_htu_isu_offset1_state;
  logic         bank2_htu_isu_valid;
  logic         bank2_htu_isu_allowIn;
  logic         bank2_htu_isu_cacheline_inflight;
  logic         bank2_htu_isu_need_linefill;
  logic [2:0]   bank2_htu_isu_rob_id;
  logic [1:0]   bank2_htu_isu_ch_id;
  logic [1:0]   bank2_htu_isu_opcode;
  logic [6:0]   bank2_htu_isu_set_way_offset;
  logic [7:0]   bank2_htu_isu_wbuffer_id;
  logic [1:0]   bank2_htu_isu_offset0_state;
  logic [1:0]   bank2_htu_isu_offset1_state;
  logic         bank3_htu_isu_valid;
  logic         bank3_htu_isu_allowIn;
  logic         bank3_htu_isu_cacheline_inflight;
  logic         bank3_htu_isu_need_linefill;
  logic [2:0]   bank3_htu_isu_rob_id;
  logic [1:0]   bank3_htu_isu_ch_id;
  logic [1:0]   bank3_htu_isu_opcode;
  logic [6:0]   bank3_htu_isu_set_way_offset;
  logic [7:0]   bank3_htu_isu_wbuffer_id;
  logic [1:0]   bank3_htu_isu_offset0_state;
  logic [1:0]   bank3_htu_isu_offset1_state;

  logic [IQ_DEPTH-1:0]    bank0_iq_mshr_allow_array_In;
  logic [IQ_DEPTH-1:0]    bank1_iq_mshr_allow_array_In;
  logic [IQ_DEPTH-1:0]    bank2_iq_mshr_allow_array_In;
  logic [IQ_DEPTH-1:0]    bank3_iq_mshr_allow_array_In;
  logic [IQ_DEPTH-1:0]    bank0_iq_mshr_allow_array_Q;
  logic [IQ_DEPTH-1:0]    bank1_iq_mshr_allow_array_Q;
  logic [IQ_DEPTH-1:0]    bank2_iq_mshr_allow_array_Q;
  logic [IQ_DEPTH-1:0]    bank3_iq_mshr_allow_array_Q;

  logic [IQ_DEPTH-1:0]    bank0_iq_credit_allow_array_Q;
  logic [IQ_DEPTH-1:0]    bank1_iq_credit_allow_array_Q;
  logic [IQ_DEPTH-1:0]    bank2_iq_credit_allow_array_Q;
  logic [IQ_DEPTH-1:0]    bank3_iq_credit_allow_array_Q;

  logic [IQ_PTR_WIDTH-1:0] bank0_write_ptr_Q;
  logic [IQ_PTR_WIDTH-1:0] bank1_write_ptr_Q;
  logic [IQ_PTR_WIDTH-1:0] bank2_write_ptr_Q;
  logic [IQ_PTR_WIDTH-1:0] bank3_write_ptr_Q;
  logic [IQ_PTR_WIDTH:0]   bank0_iq_size_Q;
  logic [IQ_PTR_WIDTH:0]   bank1_iq_size_Q;
  logic [IQ_PTR_WIDTH:0]   bank2_iq_size_Q;
  logic [IQ_PTR_WIDTH:0]   bank3_iq_size_Q;
  logic                    bank0_bottom_ptr_wen;
  logic [IQ_PTR_WIDTH-1:0] bank0_bottom_ptr_Q;
  logic                    bank1_bottom_ptr_wen;
  logic [IQ_PTR_WIDTH-1:0] bank1_bottom_ptr_Q;
  logic                    bank2_bottom_ptr_wen;
  logic [IQ_PTR_WIDTH-1:0] bank2_bottom_ptr_Q;
  logic                    bank3_bottom_ptr_wen;
  logic [IQ_PTR_WIDTH-1:0] bank3_bottom_ptr_Q;

  logic [IQ_PTR_WIDTH-1:0] bank0_issue_ptr;
  logic [IQ_PTR_WIDTH-1:0] bank1_issue_ptr;
  logic [IQ_PTR_WIDTH-1:0] bank2_issue_ptr;
  logic [IQ_PTR_WIDTH-1:0] bank3_issue_ptr;

  logic         bank0_isu_sc_valid;
  logic         bank0_isu_sc_ready;
  logic [1:0]   bank0_isu_sc_channel_id;
  logic [2:0]   bank0_isu_sc_opcode;
  logic [6:0]   bank0_isu_sc_set_way_offset;
  logic [7:0]   bank0_isu_sc_wbuffer_id;
  logic [2:0]   bank0_isu_sc_xbar_rob_num;
  logic [1:0]   bank0_isu_sc_cacheline_dirty_offset0;
  logic [1:0]   bank0_isu_sc_cacheline_dirty_offset1;
  logic         bank1_isu_sc_valid;
  logic         bank1_isu_sc_ready;
  logic [1:0]   bank1_isu_sc_channel_id;
  logic [2:0]   bank1_isu_sc_opcode;
  logic [6:0]   bank1_isu_sc_set_way_offset;
  logic [7:0]   bank1_isu_sc_wbuffer_id;
  logic [2:0]   bank1_isu_sc_xbar_rob_num;
  logic [1:0]   bank1_isu_sc_cacheline_dirty_offset0;
  logic [1:0]   bank1_isu_sc_cacheline_dirty_offset1;
  logic         bank2_isu_sc_valid;
  logic         bank2_isu_sc_ready;
  logic [1:0]   bank2_isu_sc_channel_id;
  logic [2:0]   bank2_isu_sc_opcode;
  logic [6:0]   bank2_isu_sc_set_way_offset;
  logic [7:0]   bank2_isu_sc_wbuffer_id;
  logic [2:0]   bank2_isu_sc_xbar_rob_num;
  logic [1:0]   bank2_isu_sc_cacheline_dirty_offset0;
  logic [1:0]   bank2_isu_sc_cacheline_dirty_offset1;
  logic         bank3_isu_sc_valid;
  logic         bank3_isu_sc_ready;
  logic [1:0]   bank3_isu_sc_channel_id;
  logic [2:0]   bank3_isu_sc_opcode;
  logic [6:0]   bank3_isu_sc_set_way_offset;
  logic [7:0]   bank3_isu_sc_wbuffer_id;
  logic [2:0]   bank3_isu_sc_xbar_rob_num;
  logic [1:0]   bank3_isu_sc_cacheline_dirty_offset0;
  logic [1:0]   bank3_isu_sc_cacheline_dirty_offset1;

  logic         bank0_biu_isu_rvalid;
  logic [5:0]   bank0_biu_isu_rid;
  logic [255:0] bank0_biu_isu_rdata;
  logic         bank1_biu_isu_rvalid;
  logic [5:0]   bank1_biu_isu_rid;
  logic [255:0] bank1_biu_isu_rdata;
  logic         bank2_biu_isu_rvalid;
  logic [5:0]   bank2_biu_isu_rid;
  logic [255:0] bank2_biu_isu_rdata;
  logic         bank3_biu_isu_rvalid;
  logic [5:0]   bank3_biu_isu_rid;
  logic [255:0] bank3_biu_isu_rdata;

  always_ff @(posedge clk or posedge rst) begin
    if (rst) cycle_cnt_Q <= 'd0;
    else     cycle_cnt_Q <= cycle_cnt_Q + 'd1;
  end

  function automatic longint sv_get_cycle();
    return cycle_cnt_Q;
  endfunction

task end_simulation();
  $display("Mcash simulation end!");
  $finish;
endtask

  export "DPI-C" function sv_get_cycle;

  assign mcash_ch0_req_valid                  = `CROSS_BAR_TOP.mcash_ch0_req_valid_i;
  assign mcash_ch0_req_allowIn                = `CROSS_BAR_TOP.mcash_ch0_req_allowIn_o;
  assign mcash_ch0_req_op                     = `CROSS_BAR_TOP.mcash_ch0_req_op_i;
  assign mcash_ch0_req_addr                   = {`CROSS_BAR_TOP.mcash_ch0_req_addr_i[31:4], 4'b0};
  assign mcash_ch0_req_data                   = `CROSS_BAR_TOP.mcash_ch0_req_data_i;
  assign mcash_ch1_req_valid                  = `CROSS_BAR_TOP.mcash_ch1_req_valid_i;
  assign mcash_ch1_req_allowIn                = `CROSS_BAR_TOP.mcash_ch1_req_allowIn_o;
  assign mcash_ch1_req_op                     = `CROSS_BAR_TOP.mcash_ch1_req_op_i;
  assign mcash_ch1_req_addr                   = {`CROSS_BAR_TOP.mcash_ch1_req_addr_i[31:4], 4'b0};
  assign mcash_ch1_req_data                   = `CROSS_BAR_TOP.mcash_ch1_req_data_i;
  assign mcash_ch2_req_valid                  = `CROSS_BAR_TOP.mcash_ch2_req_valid_i;
  assign mcash_ch2_req_allowIn                = `CROSS_BAR_TOP.mcash_ch2_req_allowIn_o;
  assign mcash_ch2_req_op                     = `CROSS_BAR_TOP.mcash_ch2_req_op_i;
  assign mcash_ch2_req_addr                   = {`CROSS_BAR_TOP.mcash_ch2_req_addr_i[31:4], 4'b0};
  assign mcash_ch2_req_data                   = `CROSS_BAR_TOP.mcash_ch2_req_data_i;
  assign mcash_ch0_write_ptr_kickoff          = `CROSS_BAR_TOP.u_cross_bar_core.u_cross_bar_core_buffer_ch0.ch_wr_ptr_kickoff;
  assign mcash_ch0_read_ptr_kickoff           = `CROSS_BAR_TOP.u_cross_bar_core.u_cross_bar_core_buffer_ch0.ch_rd_ptr_kickoff;
  assign mcash_ch0_req_write_ptr              = `CROSS_BAR_TOP.u_cross_bar_core.u_cross_bar_core_buffer_ch0.ch_wr_ptr_Q;
  assign mcash_ch0_req_read_ptr               = `CROSS_BAR_TOP.u_cross_bar_core.u_cross_bar_core_buffer_ch0.ch_rd_ptr_Q;
  assign mcash_ch0_buffer_size                = `CROSS_BAR_TOP.u_cross_bar_core.u_cross_bar_core_buffer_ch0.ch_used_entry_Q;
  assign mcash_ch1_write_ptr_kickoff          = `CROSS_BAR_TOP.u_cross_bar_core.u_cross_bar_core_buffer_ch1.ch_wr_ptr_kickoff;
  assign mcash_ch1_read_ptr_kickoff           = `CROSS_BAR_TOP.u_cross_bar_core.u_cross_bar_core_buffer_ch1.ch_rd_ptr_kickoff;
  assign mcash_ch1_req_write_ptr              = `CROSS_BAR_TOP.u_cross_bar_core.u_cross_bar_core_buffer_ch1.ch_wr_ptr_Q;
  assign mcash_ch1_req_read_ptr               = `CROSS_BAR_TOP.u_cross_bar_core.u_cross_bar_core_buffer_ch1.ch_rd_ptr_Q;
  assign mcash_ch1_buffer_size                = `CROSS_BAR_TOP.u_cross_bar_core.u_cross_bar_core_buffer_ch1.ch_used_entry_Q;
  assign mcash_ch2_write_ptr_kickoff          = `CROSS_BAR_TOP.u_cross_bar_core.u_cross_bar_core_buffer_ch2.ch_wr_ptr_kickoff;
  assign mcash_ch2_read_ptr_kickoff           = `CROSS_BAR_TOP.u_cross_bar_core.u_cross_bar_core_buffer_ch2.ch_rd_ptr_kickoff;
  assign mcash_ch2_req_write_ptr              = `CROSS_BAR_TOP.u_cross_bar_core.u_cross_bar_core_buffer_ch2.ch_wr_ptr_Q;
  assign mcash_ch2_req_read_ptr               = `CROSS_BAR_TOP.u_cross_bar_core.u_cross_bar_core_buffer_ch2.ch_rd_ptr_Q;
  assign mcash_ch2_buffer_size                = `CROSS_BAR_TOP.u_cross_bar_core.u_cross_bar_core_buffer_ch2.ch_used_entry_Q;
  assign xbar_bank0_htu_valid                 = `CROSS_BAR_TOP_CORE.xbar_bank0_htu_valid_o;
  assign xbar_bank0_htu_allowIn               = `CROSS_BAR_TOP_CORE.xbar_bank0_htu_allowIn_i;
  assign xbar_bank0_htu_ch_id                 = `CROSS_BAR_TOP_CORE.xbar_bank0_htu_ch_id_o;
  assign xbar_bank0_htu_opcode                = `CROSS_BAR_TOP_CORE.xbar_bank0_htu_opcode_o;
  assign xbar_bank0_htu_addr                  = {`CROSS_BAR_TOP_CORE.xbar_bank0_htu_addr_o[31:4], 4'b0};
  assign xbar_bank0_htu_data                  = `CROSS_BAR_TOP_CORE.xbar_bank0_htu_data_o;
  assign xbar_bank0_htu_wbuffer_id            = `CROSS_BAR_TOP_CORE.xbar_bank0_htu_wbuffer_id_o;
  assign xbar_bank1_htu_valid                  = `CROSS_BAR_TOP_CORE.xbar_bank1_htu_valid_o;
  assign xbar_bank1_htu_allowIn                = `CROSS_BAR_TOP_CORE.xbar_bank1_htu_allowIn_i;
  assign xbar_bank1_htu_ch_id                  = `CROSS_BAR_TOP_CORE.xbar_bank1_htu_ch_id_o;
  assign xbar_bank1_htu_opcode                 = `CROSS_BAR_TOP_CORE.xbar_bank1_htu_opcode_o;
  assign xbar_bank1_htu_addr                   = {`CROSS_BAR_TOP_CORE.xbar_bank1_htu_addr_o[31:4], 4'b0};
  assign xbar_bank1_htu_data                   = `CROSS_BAR_TOP_CORE.xbar_bank1_htu_data_o;
  assign xbar_bank1_htu_wbuffer_id             = `CROSS_BAR_TOP_CORE.xbar_bank1_htu_wbuffer_id_o;
  assign xbar_bank2_htu_valid                 = `CROSS_BAR_TOP_CORE.xbar_bank2_htu_valid_o;
  assign xbar_bank2_htu_allowIn               = `CROSS_BAR_TOP_CORE.xbar_bank2_htu_allowIn_i;
  assign xbar_bank2_htu_ch_id                 = `CROSS_BAR_TOP_CORE.xbar_bank2_htu_ch_id_o;
  assign xbar_bank2_htu_opcode                = `CROSS_BAR_TOP_CORE.xbar_bank2_htu_opcode_o;
  assign xbar_bank2_htu_addr                  = {`CROSS_BAR_TOP_CORE.xbar_bank2_htu_addr_o[31:4], 4'b0};
  assign xbar_bank2_htu_data                  = `CROSS_BAR_TOP_CORE.xbar_bank2_htu_data_o;
  assign xbar_bank2_htu_wbuffer_id            = `CROSS_BAR_TOP_CORE.xbar_bank2_htu_wbuffer_id_o;
  assign xbar_bank3_htu_valid                 = `CROSS_BAR_TOP_CORE.xbar_bank3_htu_valid_o;
  assign xbar_bank3_htu_allowIn               = `CROSS_BAR_TOP_CORE.xbar_bank3_htu_allowIn_i;
  assign xbar_bank3_htu_ch_id                 = `CROSS_BAR_TOP_CORE.xbar_bank3_htu_ch_id_o;
  assign xbar_bank3_htu_opcode                = `CROSS_BAR_TOP_CORE.xbar_bank3_htu_opcode_o;
  assign xbar_bank3_htu_addr                  = {`CROSS_BAR_TOP_CORE.xbar_bank3_htu_addr_o[31:4], 4'b0};
  assign xbar_bank3_htu_data                  = `CROSS_BAR_TOP_CORE.xbar_bank3_htu_data_o;
  assign xbar_bank3_htu_wbuffer_id            = `CROSS_BAR_TOP_CORE.xbar_bank3_htu_wbuffer_id_o;
  assign ch0_entryID_send_to_bank0[2:0]       = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch0.ch_entryID_send_to_bank0;
  assign ch0_entryID_send_to_bank1[2:0]       = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch0.ch_entryID_send_to_bank1;
  assign ch0_entryID_send_to_bank2[2:0]       = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch0.ch_entryID_send_to_bank2;
  assign ch0_entryID_send_to_bank3[2:0]       = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch0.ch_entryID_send_to_bank3;
  assign ch1_entryID_send_to_bank0[2:0]       = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch1.ch_entryID_send_to_bank0;
  assign ch1_entryID_send_to_bank1[2:0]       = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch1.ch_entryID_send_to_bank1;
  assign ch1_entryID_send_to_bank2[2:0]       = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch1.ch_entryID_send_to_bank2;
  assign ch1_entryID_send_to_bank3[2:0]       = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch1.ch_entryID_send_to_bank3;
  assign ch2_entryID_send_to_bank0[2:0]       = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch2.ch_entryID_send_to_bank0;
  assign ch2_entryID_send_to_bank1[2:0]       = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch2.ch_entryID_send_to_bank1;
  assign ch2_entryID_send_to_bank2[2:0]       = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch2.ch_entryID_send_to_bank2;
  assign ch2_entryID_send_to_bank3[2:0]       = `CROSS_BAR_TOP_CORE.u_cross_bar_core_buffer_ch2.ch_entryID_send_to_bank3;
  assign bank0_htu_isu_valid                  = `BANK0_ISU_TOP.htu_isu_valid_i;
  assign bank0_htu_isu_allowIn                = `BANK0_ISU_TOP.htu_isu_allowIn_o;
  assign bank0_htu_isu_cacheline_inflight     = `BANK0_ISU_TOP.htu_req_cacheline_inflight;
  assign bank0_htu_isu_need_linefill          = `BANK0_ISU_TOP.htu_isu_need_linefill_i;
  assign bank0_htu_isu_rob_id[2:0]            = `BANK0_ISU_TOP.isu_rob_id[2:0];
  assign bank0_htu_isu_ch_id[1:0]             = `BANK0_ISU_TOP.htu_isu_ch_id_i[1:0];
  assign bank0_htu_isu_opcode[1:0]            = `BANK0_ISU_TOP.htu_isu_opcode_i[1:0];
  assign bank0_htu_isu_set_way_offset[6:0]    = `BANK0_ISU_TOP.htu_isu_set_way_offset_i[6:0];
  assign bank0_htu_isu_wbuffer_id[7:0]        = `BANK0_ISU_TOP.htu_isu_wbuffer_id_i[7:0];
  assign bank0_htu_isu_offset0_state[1:0]     = `BANK0_ISU_TOP.htu_isu_cacheline_offset0_state_i[1:0];
  assign bank0_htu_isu_offset1_state[1:0]     = `BANK0_ISU_TOP.htu_isu_cacheline_offset1_state_i[1:0];
  assign bank1_htu_isu_valid                  = `BANK1_ISU_TOP.htu_isu_valid_i;
  assign bank1_htu_isu_allowIn                = `BANK1_ISU_TOP.htu_isu_allowIn_o;
  assign bank1_htu_isu_cacheline_inflight     = `BANK1_ISU_TOP.htu_req_cacheline_inflight;
  assign bank1_htu_isu_need_linefill          = `BANK1_ISU_TOP.htu_isu_need_linefill_i;
  assign bank1_htu_isu_rob_id[2:0]            = `BANK1_ISU_TOP.isu_rob_id[2:0];
  assign bank1_htu_isu_ch_id[1:0]             = `BANK1_ISU_TOP.htu_isu_ch_id_i[1:0];
  assign bank1_htu_isu_opcode[1:0]            = `BANK1_ISU_TOP.htu_isu_opcode_i[1:0];
  assign bank1_htu_isu_set_way_offset[6:0]    = `BANK1_ISU_TOP.htu_isu_set_way_offset_i[6:0];
  assign bank1_htu_isu_wbuffer_id[7:0]        = `BANK1_ISU_TOP.htu_isu_wbuffer_id_i[7:0];
  assign bank1_htu_isu_offset0_state[1:0]     = `BANK1_ISU_TOP.htu_isu_cacheline_offset0_state_i[1:0];
  assign bank1_htu_isu_offset1_state[1:0]     = `BANK1_ISU_TOP.htu_isu_cacheline_offset1_state_i[1:0];
  assign bank2_htu_isu_valid                  = `BANK2_ISU_TOP.htu_isu_valid_i;
  assign bank2_htu_isu_allowIn                = `BANK2_ISU_TOP.htu_isu_allowIn_o;
  assign bank2_htu_isu_cacheline_inflight     = `BANK2_ISU_TOP.htu_req_cacheline_inflight;
  assign bank2_htu_isu_need_linefill          = `BANK2_ISU_TOP.htu_isu_need_linefill_i;
  assign bank2_htu_isu_rob_id[2:0]            = `BANK2_ISU_TOP.isu_rob_id[2:0];
  assign bank2_htu_isu_ch_id[1:0]             = `BANK2_ISU_TOP.htu_isu_ch_id_i[1:0];
  assign bank2_htu_isu_opcode[1:0]            = `BANK2_ISU_TOP.htu_isu_opcode_i[1:0];
  assign bank2_htu_isu_set_way_offset[6:0]    = `BANK2_ISU_TOP.htu_isu_set_way_offset_i[6:0];
  assign bank2_htu_isu_wbuffer_id[7:0]        = `BANK2_ISU_TOP.htu_isu_wbuffer_id_i[7:0];
  assign bank2_htu_isu_offset0_state[1:0]     = `BANK2_ISU_TOP.htu_isu_cacheline_offset0_state_i[1:0];
  assign bank2_htu_isu_offset1_state[1:0]     = `BANK2_ISU_TOP.htu_isu_cacheline_offset1_state_i[1:0];
  assign bank3_htu_isu_valid                  = `BANK3_ISU_TOP.htu_isu_valid_i;
  assign bank3_htu_isu_allowIn                = `BANK3_ISU_TOP.htu_isu_allowIn_o;
  assign bank3_htu_isu_cacheline_inflight     = `BANK3_ISU_TOP.htu_req_cacheline_inflight;
  assign bank3_htu_isu_need_linefill          = `BANK3_ISU_TOP.htu_isu_need_linefill_i;
  assign bank3_htu_isu_rob_id[2:0]            = `BANK3_ISU_TOP.isu_rob_id[2:0];
  assign bank3_htu_isu_ch_id[1:0]             = `BANK3_ISU_TOP.htu_isu_ch_id_i[1:0];
  assign bank3_htu_isu_opcode[1:0]            = `BANK3_ISU_TOP.htu_isu_opcode_i[1:0];
  assign bank3_htu_isu_set_way_offset[6:0]    = `BANK3_ISU_TOP.htu_isu_set_way_offset_i[6:0];
  assign bank3_htu_isu_wbuffer_id[7:0]        = `BANK3_ISU_TOP.htu_isu_wbuffer_id_i[7:0];
  assign bank3_htu_isu_offset0_state[1:0]     = `BANK3_ISU_TOP.htu_isu_cacheline_offset0_state_i[1:0];
  assign bank3_htu_isu_offset1_state[1:0]     = `BANK3_ISU_TOP.htu_isu_cacheline_offset1_state_i[1:0];
  assign bank0_iq_mshr_allow_array_Q          = `BANK0_ISU_TOP.u_isu_iq.mshr_allow_array_Q;
  assign bank1_iq_mshr_allow_array_Q          = `BANK1_ISU_TOP.u_isu_iq.mshr_allow_array_Q;
  assign bank2_iq_mshr_allow_array_Q          = `BANK2_ISU_TOP.u_isu_iq.mshr_allow_array_Q;
  assign bank3_iq_mshr_allow_array_Q          = `BANK3_ISU_TOP.u_isu_iq.mshr_allow_array_Q;
  assign bank0_iq_credit_allow_array_Q        = `BANK0_ISU_TOP.u_isu_iq.credit_allow_array;
  assign bank1_iq_credit_allow_array_Q        = `BANK1_ISU_TOP.u_isu_iq.credit_allow_array;
  assign bank2_iq_credit_allow_array_Q        = `BANK2_ISU_TOP.u_isu_iq.credit_allow_array;
  assign bank3_iq_credit_allow_array_Q        = `BANK3_ISU_TOP.u_isu_iq.credit_allow_array;
  assign bank0_write_ptr_Q                    = `BANK0_ISU_TOP.u_isu_iq.allocate_ptr_Q;
  assign bank1_write_ptr_Q                    = `BANK1_ISU_TOP.u_isu_iq.allocate_ptr_Q;
  assign bank2_write_ptr_Q                    = `BANK2_ISU_TOP.u_isu_iq.allocate_ptr_Q;
  assign bank3_write_ptr_Q                    = `BANK3_ISU_TOP.u_isu_iq.allocate_ptr_Q;
  assign bank0_iq_size_Q                      = `BANK0_ISU_TOP.u_isu_iq.queue_size_Q;
  assign bank1_iq_size_Q                      = `BANK1_ISU_TOP.u_isu_iq.queue_size_Q;
  assign bank2_iq_size_Q                      = `BANK2_ISU_TOP.u_isu_iq.queue_size_Q;
  assign bank3_iq_size_Q                      = `BANK3_ISU_TOP.u_isu_iq.queue_size_Q;
  assign bank0_bottom_ptr_wen             = `BANK0_ISU_TOP.u_isu_iq.bottom_ptr_wen;
  assign bank0_bottom_ptr_Q                   = `BANK0_ISU_TOP.u_isu_iq.bottom_ptr_Q;
  assign bank1_bottom_ptr_wen             = `BANK1_ISU_TOP.u_isu_iq.bottom_ptr_wen;
  assign bank1_bottom_ptr_Q                   = `BANK1_ISU_TOP.u_isu_iq.bottom_ptr_Q;
  assign bank2_bottom_ptr_wen             = `BANK2_ISU_TOP.u_isu_iq.bottom_ptr_wen;
  assign bank2_bottom_ptr_Q                   = `BANK2_ISU_TOP.u_isu_iq.bottom_ptr_Q;
  assign bank3_bottom_ptr_wen             = `BANK3_ISU_TOP.u_isu_iq.bottom_ptr_wen;
  assign bank3_bottom_ptr_Q                   = `BANK3_ISU_TOP.u_isu_iq.bottom_ptr_Q;
  assign bank0_issue_ptr                      = `BANK0_ISU_TOP.u_isu_iq.issue_ptr;
  assign bank1_issue_ptr                      = `BANK1_ISU_TOP.u_isu_iq.issue_ptr;
  assign bank2_issue_ptr                      = `BANK2_ISU_TOP.u_isu_iq.issue_ptr;
  assign bank3_issue_ptr                      = `BANK3_ISU_TOP.u_isu_iq.issue_ptr;
  assign bank0_isu_sc_valid                   = `BANK0_ISU_TOP.isu_sc_valid_o;
  assign bank0_isu_sc_ready                   = `BANK0_ISU_TOP.isu_sc_ready_i;
  assign bank0_isu_sc_channel_id              = `BANK0_ISU_TOP.isu_sc_channel_id_o; 
  assign bank0_isu_sc_opcode                  = `BANK0_ISU_TOP.isu_sc_opcode_o;
  assign bank0_isu_sc_set_way_offset          = `BANK0_ISU_TOP.isu_sc_set_way_offset_o;
  assign bank0_isu_sc_wbuffer_id              = `BANK0_ISU_TOP.isu_sc_wbuffer_id_o;
  assign bank0_isu_sc_xbar_rob_num            = `BANK0_ISU_TOP.isu_sc_xbar_rob_num_o; 
  assign bank0_isu_sc_cacheline_dirty_offset0 = `BANK0_ISU_TOP.isu_sc_cacheline_dirty_offset0_o;
  assign bank0_isu_sc_cacheline_dirty_offset1 = `BANK0_ISU_TOP.isu_sc_cacheline_dirty_offset1_o;
  assign bank1_isu_sc_valid                   = `BANK1_ISU_TOP.isu_sc_valid_o;
  assign bank1_isu_sc_ready                   = `BANK1_ISU_TOP.isu_sc_ready_i;
  assign bank1_isu_sc_channel_id              = `BANK1_ISU_TOP.isu_sc_channel_id_o; 
  assign bank1_isu_sc_opcode                  = `BANK1_ISU_TOP.isu_sc_opcode_o;
  assign bank1_isu_sc_set_way_offset          = `BANK1_ISU_TOP.isu_sc_set_way_offset_o;
  assign bank1_isu_sc_wbuffer_id              = `BANK1_ISU_TOP.isu_sc_wbuffer_id_o;
  assign bank1_isu_sc_xbar_rob_num            = `BANK1_ISU_TOP.isu_sc_xbar_rob_num_o; 
  assign bank1_isu_sc_cacheline_dirty_offset0 = `BANK1_ISU_TOP.isu_sc_cacheline_dirty_offset0_o;
  assign bank1_isu_sc_cacheline_dirty_offset1 = `BANK1_ISU_TOP.isu_sc_cacheline_dirty_offset1_o;
  assign bank2_isu_sc_valid                   = `BANK2_ISU_TOP.isu_sc_valid_o;
  assign bank2_isu_sc_ready                   = `BANK2_ISU_TOP.isu_sc_ready_i;
  assign bank2_isu_sc_channel_id              = `BANK2_ISU_TOP.isu_sc_channel_id_o; 
  assign bank2_isu_sc_opcode                  = `BANK2_ISU_TOP.isu_sc_opcode_o;
  assign bank2_isu_sc_set_way_offset          = `BANK2_ISU_TOP.isu_sc_set_way_offset_o;
  assign bank2_isu_sc_wbuffer_id              = `BANK2_ISU_TOP.isu_sc_wbuffer_id_o;
  assign bank2_isu_sc_xbar_rob_num            = `BANK2_ISU_TOP.isu_sc_xbar_rob_num_o; 
  assign bank2_isu_sc_cacheline_dirty_offset0 = `BANK2_ISU_TOP.isu_sc_cacheline_dirty_offset0_o;
  assign bank2_isu_sc_cacheline_dirty_offset1 = `BANK2_ISU_TOP.isu_sc_cacheline_dirty_offset1_o;
  assign bank3_isu_sc_valid                   = `BANK3_ISU_TOP.isu_sc_valid_o;
  assign bank3_isu_sc_ready                   = `BANK3_ISU_TOP.isu_sc_ready_i;
  assign bank3_isu_sc_channel_id              = `BANK3_ISU_TOP.isu_sc_channel_id_o; 
  assign bank3_isu_sc_opcode                  = `BANK3_ISU_TOP.isu_sc_opcode_o;
  assign bank3_isu_sc_set_way_offset          = `BANK3_ISU_TOP.isu_sc_set_way_offset_o;
  assign bank3_isu_sc_wbuffer_id              = `BANK3_ISU_TOP.isu_sc_wbuffer_id_o;
  assign bank3_isu_sc_xbar_rob_num            = `BANK3_ISU_TOP.isu_sc_xbar_rob_num_o; 
  assign bank3_isu_sc_cacheline_dirty_offset0 = `BANK3_ISU_TOP.isu_sc_cacheline_dirty_offset0_o;
  assign bank3_isu_sc_cacheline_dirty_offset1 = `BANK3_ISU_TOP.isu_sc_cacheline_dirty_offset1_o;
  assign bank0_biu_isu_rvalid                 = `BANK0_ISU_TOP.biu_isu_rvalid_i;
  assign bank0_biu_isu_rdata                  = `BANK0_ISU_TOP.biu_isu_rdata_i;
  assign bank0_biu_isu_rid                    = `BANK0_ISU_TOP.biu_isu_rid_i;
  assign bank1_biu_isu_rvalid                 = `BANK1_ISU_TOP.biu_isu_rvalid_i;
  assign bank1_biu_isu_rdata                  = `BANK1_ISU_TOP.biu_isu_rdata_i;
  assign bank1_biu_isu_rid                    = `BANK1_ISU_TOP.biu_isu_rid_i;
  assign bank2_biu_isu_rvalid                 = `BANK2_ISU_TOP.biu_isu_rvalid_i;
  assign bank2_biu_isu_rdata                  = `BANK2_ISU_TOP.biu_isu_rdata_i;
  assign bank2_biu_isu_rid                    = `BANK2_ISU_TOP.biu_isu_rid_i;
  assign bank3_biu_isu_rvalid                 = `BANK3_ISU_TOP.biu_isu_rvalid_i;
  assign bank3_biu_isu_rdata                  = `BANK3_ISU_TOP.biu_isu_rdata_i;
  assign bank3_biu_isu_rid                    = `BANK3_ISU_TOP.biu_isu_rid_i;


  always_comb begin
    // bank0
    if      (xbar_bank0_htu_ch_id == 'd0) xbar_bank0_ch_entryID = ch0_entryID_send_to_bank0;
    else if (xbar_bank0_htu_ch_id == 'd1) xbar_bank0_ch_entryID = ch1_entryID_send_to_bank0;
    else if (xbar_bank0_htu_ch_id == 'd2) xbar_bank0_ch_entryID = ch2_entryID_send_to_bank0;
    else                                  xbar_bank0_ch_entryID = 'd0;
    // bank1
    if      (xbar_bank1_htu_ch_id == 'd0) xbar_bank1_ch_entryID = ch0_entryID_send_to_bank1;
    else if (xbar_bank1_htu_ch_id == 'd1) xbar_bank1_ch_entryID = ch1_entryID_send_to_bank1;
    else if (xbar_bank1_htu_ch_id == 'd2) xbar_bank1_ch_entryID = ch2_entryID_send_to_bank1;
    else                                  xbar_bank1_ch_entryID = 'd0;
    // bank2
    if      (xbar_bank2_htu_ch_id == 'd0) xbar_bank2_ch_entryID = ch0_entryID_send_to_bank2;
    else if (xbar_bank2_htu_ch_id == 'd1) xbar_bank2_ch_entryID = ch1_entryID_send_to_bank2;
    else if (xbar_bank2_htu_ch_id == 'd2) xbar_bank2_ch_entryID = ch2_entryID_send_to_bank2;
    else                                  xbar_bank2_ch_entryID = 'd0;
    // bank3
    if      (xbar_bank3_htu_ch_id == 'd0) xbar_bank3_ch_entryID = ch0_entryID_send_to_bank3;
    else if (xbar_bank3_htu_ch_id == 'd1) xbar_bank3_ch_entryID = ch1_entryID_send_to_bank3;
    else if (xbar_bank3_htu_ch_id == 'd2) xbar_bank3_ch_entryID = ch2_entryID_send_to_bank3;
    else                                  xbar_bank3_ch_entryID = 'd0;
  end


  // xbar -> bank check
  int ch0_buffer_info_check_ret;
  int ch1_buffer_info_check_ret;
  int ch2_buffer_info_check_ret;

  always_ff @(posedge clk) begin
    // check xbar to banks req
    if (xbar_bank0_htu_valid & xbar_bank0_htu_allowIn) begin
      if(c_xbar_bank_htu_req_check(cycle_cnt_Q, 0, xbar_bank0_htu_ch_id, xbar_bank0_ch_entryID, xbar_bank0_htu_opcode, xbar_bank0_htu_addr, xbar_bank0_htu_data)) begin
        end_simulation();
      end
    end
    if (xbar_bank1_htu_valid & xbar_bank1_htu_allowIn) begin
      if(c_xbar_bank_htu_req_check(cycle_cnt_Q, 1, xbar_bank1_htu_ch_id, xbar_bank1_ch_entryID, xbar_bank1_htu_opcode, xbar_bank1_htu_addr, xbar_bank1_htu_data)) begin
        end_simulation();
      end
    end
    if (xbar_bank2_htu_valid & xbar_bank2_htu_allowIn) begin
      if(c_xbar_bank_htu_req_check(cycle_cnt_Q, 2, xbar_bank2_htu_ch_id, xbar_bank2_ch_entryID, xbar_bank2_htu_opcode, xbar_bank2_htu_addr, xbar_bank2_htu_data)) begin
        end_simulation();
      end
    end
    if (xbar_bank3_htu_valid & xbar_bank3_htu_allowIn) begin
      if(c_xbar_bank_htu_req_check(cycle_cnt_Q, 3, xbar_bank3_htu_ch_id, xbar_bank3_ch_entryID, xbar_bank3_htu_opcode, xbar_bank3_htu_addr, xbar_bank3_htu_data)) begin
        end_simulation();
      end
    end

    // push data into cross bar buffer
    if (mcash_ch0_req_valid & mcash_ch0_req_allowIn) begin
      if(c_xbar_ch_buffers_push(cycle_cnt_Q, 0, mcash_ch0_buffer_size, mcash_ch0_req_write_ptr, mcash_ch0_req_op, mcash_ch0_req_addr, mcash_ch0_req_data)) begin
        // $display("cycle %d buffer size %d", cycle_cnt_Q, mcash_ch0_buffer_size);
        end_simulation();
      end
    end
    if (mcash_ch1_req_valid & mcash_ch1_req_allowIn) begin
      if(c_xbar_ch_buffers_push(cycle_cnt_Q, 1, mcash_ch1_buffer_size, mcash_ch1_req_write_ptr, mcash_ch1_req_op, mcash_ch1_req_addr, mcash_ch1_req_data)) begin
        end_simulation();
      end
    end
    if (mcash_ch2_req_valid & mcash_ch2_req_allowIn) begin
      if(c_xbar_ch_buffers_push(cycle_cnt_Q, 2, mcash_ch2_buffer_size, mcash_ch2_req_write_ptr, mcash_ch2_req_op, mcash_ch2_req_addr, mcash_ch2_req_data))begin
        end_simulation();
      end
    end

    //-----------------------------------------------------
    // check xbar buffer status
    // 1. buffer size
    // 2. buffer read ptr
    // 2. buffer write ptr
    //-----------------------------------------------------
    // op typte:
    // 0 -> push
    // 1 -> pop
    // 2 -> push and pop
    //-----------------------------------------------------
    if (mcash_ch0_read_ptr_kickoff & mcash_ch0_write_ptr_kickoff) begin
      ch0_buffer_info_check_ret = c_xbar_chs_buffer_info_check(cycle_cnt_Q, 0, mcash_ch0_buffer_size, mcash_ch0_req_read_ptr, mcash_ch0_req_write_ptr, 2);
    end
    else if (mcash_ch0_write_ptr_kickoff) begin
      ch0_buffer_info_check_ret = c_xbar_chs_buffer_info_check(cycle_cnt_Q, 0, mcash_ch0_buffer_size, mcash_ch0_req_read_ptr, mcash_ch0_req_write_ptr, 0);
    end
    else if (mcash_ch0_read_ptr_kickoff) begin
      ch0_buffer_info_check_ret = c_xbar_chs_buffer_info_check(cycle_cnt_Q, 0, mcash_ch0_buffer_size, mcash_ch0_req_read_ptr, mcash_ch0_req_write_ptr, 1);
    end

    if (ch0_buffer_info_check_ret) begin
      end_simulation();
    end

    if (mcash_ch1_read_ptr_kickoff & mcash_ch1_write_ptr_kickoff) begin
      ch1_buffer_info_check_ret = c_xbar_chs_buffer_info_check(cycle_cnt_Q, 1, mcash_ch1_buffer_size, mcash_ch1_req_read_ptr, mcash_ch1_req_write_ptr, 2);
    end
    else if (mcash_ch1_write_ptr_kickoff) begin
      ch1_buffer_info_check_ret = c_xbar_chs_buffer_info_check(cycle_cnt_Q, 1, mcash_ch1_buffer_size, mcash_ch1_req_read_ptr, mcash_ch1_req_write_ptr, 0);
    end
    else if (mcash_ch1_read_ptr_kickoff) begin
      ch1_buffer_info_check_ret = c_xbar_chs_buffer_info_check(cycle_cnt_Q, 1, mcash_ch1_buffer_size, mcash_ch1_req_read_ptr, mcash_ch1_req_write_ptr, 1);
    end

    if (ch1_buffer_info_check_ret) begin
      end_simulation();
    end

    if (mcash_ch2_read_ptr_kickoff & mcash_ch2_write_ptr_kickoff) begin
      ch2_buffer_info_check_ret = c_xbar_chs_buffer_info_check(cycle_cnt_Q, 2, mcash_ch2_buffer_size, mcash_ch2_req_read_ptr, mcash_ch2_req_write_ptr, 2);
    end
    else if (mcash_ch2_write_ptr_kickoff) begin
      ch2_buffer_info_check_ret = c_xbar_chs_buffer_info_check(cycle_cnt_Q, 2, mcash_ch2_buffer_size, mcash_ch2_req_read_ptr, mcash_ch2_req_write_ptr, 0);
    end
    else if (mcash_ch2_read_ptr_kickoff) begin
      ch2_buffer_info_check_ret = c_xbar_chs_buffer_info_check(cycle_cnt_Q, 2, mcash_ch2_buffer_size, mcash_ch2_req_read_ptr, mcash_ch2_req_write_ptr, 1);
    end

    if (ch2_buffer_info_check_ret) begin
      end_simulation();
    end


  end
  int bank0_isu_iq_dequeue_ret;
  int bank1_isu_iq_dequeue_ret;
  int bank2_isu_iq_dequeue_ret;
  int bank3_isu_iq_dequeue_ret;

  always_ff @(posedge clk) begin

    if (bank0_bottom_ptr_wen) begin
      if(c_iq_bottom_ptr_update(cycle_cnt_Q, 0, bank0_bottom_ptr_Q)) begin
        end_simulation();
      end
    end
    if (bank1_bottom_ptr_wen) begin
      if(c_iq_bottom_ptr_update(cycle_cnt_Q, 1, bank1_bottom_ptr_Q)) begin
        end_simulation();
      end
    end
    if (bank2_bottom_ptr_wen) begin
      if(c_iq_bottom_ptr_update(cycle_cnt_Q, 2, bank2_bottom_ptr_Q)) begin
        end_simulation();
      end
    end
    if (bank3_bottom_ptr_wen) begin
      if(c_iq_bottom_ptr_update(cycle_cnt_Q, 3, bank3_bottom_ptr_Q)) begin
        end_simulation();
      end
    end

    // ISU iq dequeue
    if (bank0_isu_sc_valid & bank0_isu_sc_ready) begin
      bank0_isu_iq_dequeue_ret = c_isu_iq_dequeue(cycle_cnt_Q, 0, bank0_issue_ptr, bank0_isu_sc_channel_id, bank0_isu_sc_opcode, bank0_isu_sc_set_way_offset, bank0_isu_sc_wbuffer_id, 
                                                  bank0_isu_sc_xbar_rob_num, bank0_isu_sc_cacheline_dirty_offset0, bank0_isu_sc_cacheline_dirty_offset1, 
                                                  bank0_iq_mshr_allow_array_Q, bank0_iq_credit_allow_array_Q);
      if (bank0_isu_iq_dequeue_ret) begin
        end_simulation();
      end
    end

    if (bank1_isu_sc_valid & bank1_isu_sc_ready) begin
      bank1_isu_iq_dequeue_ret = c_isu_iq_dequeue(cycle_cnt_Q, 1, bank1_issue_ptr, bank1_isu_sc_channel_id, bank1_isu_sc_opcode, bank1_isu_sc_set_way_offset, bank1_isu_sc_wbuffer_id, 
                                                  bank1_isu_sc_xbar_rob_num, bank1_isu_sc_cacheline_dirty_offset0, bank1_isu_sc_cacheline_dirty_offset1, 
                                                  bank1_iq_mshr_allow_array_Q, bank1_iq_credit_allow_array_Q);
      if (bank1_isu_iq_dequeue_ret) begin
        end_simulation();
      end
    end

    if (bank2_isu_sc_valid & bank2_isu_sc_ready) begin
      bank2_isu_iq_dequeue_ret = c_isu_iq_dequeue(cycle_cnt_Q, 2, bank2_issue_ptr, bank2_isu_sc_channel_id, bank2_isu_sc_opcode, bank2_isu_sc_set_way_offset, bank2_isu_sc_wbuffer_id, 
                                                  bank2_isu_sc_xbar_rob_num, bank2_isu_sc_cacheline_dirty_offset0, bank2_isu_sc_cacheline_dirty_offset1, 
                                                  bank2_iq_mshr_allow_array_Q, bank2_iq_credit_allow_array_Q);
      if (bank2_isu_iq_dequeue_ret) begin
        end_simulation();
      end
    end

    if (bank3_isu_sc_valid & bank3_isu_sc_ready) begin
      bank3_isu_iq_dequeue_ret = c_isu_iq_dequeue(cycle_cnt_Q, 3, bank3_issue_ptr, bank3_isu_sc_channel_id, bank3_isu_sc_opcode, bank3_isu_sc_set_way_offset, bank3_isu_sc_wbuffer_id, 
                                                  bank3_isu_sc_xbar_rob_num, bank3_isu_sc_cacheline_dirty_offset0, bank3_isu_sc_cacheline_dirty_offset1, 
                                                  bank3_iq_mshr_allow_array_Q, bank3_iq_credit_allow_array_Q);
      if (bank3_isu_iq_dequeue_ret) begin
        end_simulation();
      end
    end

    // ISU iq enqueue
    if (bank0_htu_isu_valid & bank0_htu_isu_allowIn) begin
      if (c_isu_iq_enqueue(cycle_cnt_Q, 0, bank0_htu_isu_cacheline_inflight, bank0_htu_isu_need_linefill, bank0_htu_isu_rob_id[2:0], 
                           bank0_htu_isu_ch_id[1:0], bank0_htu_isu_opcode[1:0], bank0_htu_isu_set_way_offset[6:0], bank0_htu_isu_wbuffer_id[7:0],
                           bank0_htu_isu_offset0_state[1:0], bank0_htu_isu_offset1_state[1:0], bank0_iq_mshr_allow_array_Q[63:0], bank0_write_ptr_Q, bank0_iq_size_Q)) begin
          end_simulation();
        end
    end

    if (bank1_htu_isu_valid & bank1_htu_isu_allowIn) begin
      if (c_isu_iq_enqueue(cycle_cnt_Q, 1, bank1_htu_isu_cacheline_inflight, bank1_htu_isu_need_linefill, bank1_htu_isu_rob_id[2:0], 
                           bank1_htu_isu_ch_id[1:0], bank1_htu_isu_opcode[1:0], bank1_htu_isu_set_way_offset[6:0], bank1_htu_isu_wbuffer_id[7:0],
                           bank1_htu_isu_offset0_state[1:0], bank1_htu_isu_offset1_state[1:0], bank1_iq_mshr_allow_array_Q[63:0], bank1_write_ptr_Q, bank1_iq_size_Q)) begin
          end_simulation();
        end
    end

    if (bank2_htu_isu_valid & bank2_htu_isu_allowIn) begin
      if (c_isu_iq_enqueue(cycle_cnt_Q, 2, bank2_htu_isu_cacheline_inflight, bank2_htu_isu_need_linefill, bank2_htu_isu_rob_id[2:0], 
                           bank2_htu_isu_ch_id[1:0], bank2_htu_isu_opcode[1:0], bank2_htu_isu_set_way_offset[6:0], bank2_htu_isu_wbuffer_id[7:0],
                           bank2_htu_isu_offset0_state[1:0], bank2_htu_isu_offset1_state[1:0], bank2_iq_mshr_allow_array_Q[63:0], bank2_write_ptr_Q, bank2_iq_size_Q)) begin
          end_simulation();
        end
    end

    if (bank3_htu_isu_valid & bank3_htu_isu_allowIn) begin
      if (c_isu_iq_enqueue(cycle_cnt_Q, 3, bank3_htu_isu_cacheline_inflight, bank3_htu_isu_need_linefill, bank3_htu_isu_rob_id[2:0], 
                           bank3_htu_isu_ch_id[1:0], bank3_htu_isu_opcode[1:0], bank3_htu_isu_set_way_offset[6:0], bank3_htu_isu_wbuffer_id[7:0],
                           bank3_htu_isu_offset0_state[1:0], bank3_htu_isu_offset1_state[1:0], bank3_iq_mshr_allow_array_Q[63:0], bank3_write_ptr_Q, bank3_iq_size_Q)) begin
          end_simulation();
        end
    end

    if (bank0_biu_isu_rvalid) begin
      c_update_inflight_array(cycle_cnt_Q, 0, bank0_biu_isu_rid, bank0_biu_isu_rdata[63:0], bank0_biu_isu_rdata[127:64], bank0_biu_isu_rdata[191:128], bank0_biu_isu_rdata[255:192]);
    end
    if (bank1_biu_isu_rvalid) begin
      c_update_inflight_array(cycle_cnt_Q, 1, bank1_biu_isu_rid, bank1_biu_isu_rdata[63:0], bank1_biu_isu_rdata[127:64], bank1_biu_isu_rdata[191:128], bank1_biu_isu_rdata[255:192]);
    end
    if (bank2_biu_isu_rvalid) begin
      c_update_inflight_array(cycle_cnt_Q, 2, bank2_biu_isu_rid, bank2_biu_isu_rdata[63:0], bank2_biu_isu_rdata[127:64], bank2_biu_isu_rdata[191:128], bank2_biu_isu_rdata[255:192]);
    end
    if (bank3_biu_isu_rvalid) begin
      c_update_inflight_array(cycle_cnt_Q, 3, bank3_biu_isu_rid, bank3_biu_isu_rdata[63:0], bank3_biu_isu_rdata[127:64], bank3_biu_isu_rdata[191:128], bank3_biu_isu_rdata[255:192]);
    end

    if (bank0_bottom_ptr_wen) begin
      if(c_iq_size_update(cycle_cnt_Q, 0, bank0_iq_size_Q)) begin
        end_simulation();
      end
    end

    if (bank1_bottom_ptr_wen) begin
      if(c_iq_size_update(cycle_cnt_Q, 1, bank1_iq_size_Q)) begin
        end_simulation();
      end
    end

    if (bank2_bottom_ptr_wen) begin
      if(c_iq_size_update(cycle_cnt_Q, 2, bank2_iq_size_Q)) begin
        end_simulation();
      end
    end

    if (bank3_bottom_ptr_wen) begin
      if(c_iq_size_update(cycle_cnt_Q, 3, bank3_iq_size_Q)) begin
        end_simulation();
      end
    end

  end



// 

//---------------------------------------------------------------------------
//
//

  parameter NUM_BANK = 4;

  logic [NUM_BANK-1:0] banks_iq_full;
  logic [9:0]          banks_iq_full_cnt_Q [NUM_BANK-1:0];

  assign banks_iq_full[0] = bank0_iq_size_Q == IQ_DEPTH;
  assign banks_iq_full[1] = bank1_iq_size_Q == IQ_DEPTH;
  assign banks_iq_full[2] = bank2_iq_size_Q == IQ_DEPTH;
  assign banks_iq_full[3] = bank3_iq_size_Q == IQ_DEPTH;

generate
  for (genvar i = 0; i < NUM_BANK; i++) begin
    // Bank iq full cnt
    always_ff @(posedge clk or posedge rst) begin
      if (rst) begin
        banks_iq_full_cnt_Q[i] <= 'd0;
      end
      else if (banks_iq_full[i]) begin
        banks_iq_full_cnt_Q[i] <= banks_iq_full_cnt_Q[i] + 'd1;
      end
      else begin
        banks_iq_full_cnt_Q[i] <= 'd0;
      end
    end
    
    // Bank iq full cnt
    always_ff @(posedge clk) begin
      if (&banks_iq_full_cnt_Q[i]) begin
        $display("MCASH DEBUG -> BANK%0d isu iq full over %d cycle, stop simulation!", i, banks_iq_full_cnt_Q[i]);
        if (i == 0) begin
          $display("MCASH DEBUG -> BANK0 Bottom Pointer Num is %0d!", bank0_bottom_ptr_Q);
          $display("MCASH DEBUG -> BANK0 credit_allow_array[%0d] is %0s!", bank0_bottom_ptr_Q, bank0_iq_credit_allow_array_Q[bank0_bottom_ptr_Q] ? "Active" : "Unactive");
          $display("MCASH DEBUG -> BANK0 mshr_allow_array[%0d] is %0s!", bank0_bottom_ptr_Q, bank0_iq_mshr_allow_array_Q[bank0_bottom_ptr_Q] ? "Active" : "Unactive");
        end
        else if (i == 1) begin
          $display("MCASH DEBUG -> BANK1 Bottom Pointer Num is %0d!", bank1_bottom_ptr_Q);
          $display("MCASH DEBUG -> BANK1 credit_allow_array[%0d] is %0s!", bank1_bottom_ptr_Q, bank1_iq_credit_allow_array_Q[bank1_bottom_ptr_Q] ? "Active" : "Unactive");
          $display("MCASH DEBUG -> BANK1 mshr_allow_array[%0d] is %0s!", bank1_bottom_ptr_Q, bank1_iq_mshr_allow_array_Q[bank1_bottom_ptr_Q] ? "Active" : "Unactive");
        end
        else if (i == 2) begin
          $display("MCASH DEBUG -> BANK2 Bottom Pointer Num is %0d!", bank2_bottom_ptr_Q);
          $display("MCASH DEBUG -> BANK2 credit_allow_array[%0d] is %0s!", bank2_bottom_ptr_Q, bank2_iq_credit_allow_array_Q[bank2_bottom_ptr_Q] ? "Active" : "Unactive");
          $display("MCASH DEBUG -> BANK2 mshr_allow_array[%0d] is %0s!", bank2_bottom_ptr_Q, bank2_iq_mshr_allow_array_Q[bank2_bottom_ptr_Q] ? "Active" : "Unactive");
        end
        else begin
          $display("MCASH DEBUG -> BANK3 Bottom Pointer Num is %0d!", bank3_bottom_ptr_Q);
          $display("MCASH DEBUG -> BANK3 credit_allow_array[%0d] is %0s!", bank3_bottom_ptr_Q, bank3_iq_credit_allow_array_Q[bank3_bottom_ptr_Q] ? "Active" : "Unactive");
          $display("MCASH DEBUG -> BANK3 mshr_allow_array[%0d] is %0s!", bank3_bottom_ptr_Q, bank3_iq_mshr_allow_array_Q[bank3_bottom_ptr_Q] ? "Active" : "Unactive");
        end
        $finish;
      end
    end
  end
endgenerate



endmodule