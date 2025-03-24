module bank_htu_set_entry (
  input wire         clk_i,
  input wire         rst_i,
  input wire         op_is_read_i,
  input wire         op_is_write_i,
  input wire         op_is_flush_i,
  input wire         op_is_invalidate_i,
  input wire         set_hit_WV_i,
  input wire [31:10] access_tag_i,
  input wire         access_offset_i
);

  wire       cacheline_hit_WV;
  wire       cacheline_miss_WV;
  wire [7:0] cacheline_hit_array;
  wire [7:0] cacheline_allocate_array;
  wire [7:0] access_way_array;
  wire [7:0] oldest_way_array;
  wire [1:0] cacheline0_offset0_state;
  wire [1:0] cacheline0_offset1_state;
  wire [1:0] cacheline1_offset0_state;
  wire [1:0] cacheline1_offset1_state;
  wire [1:0] cacheline2_offset0_state;
  wire [1:0] cacheline2_offset1_state;
  wire [1:0] cacheline3_offset0_state;
  wire [1:0] cacheline3_offset1_state;
  wire [1:0] cacheline4_offset0_state;
  wire [1:0] cacheline4_offset1_state;
  wire [1:0] cacheline5_offset0_state;
  wire [1:0] cacheline5_offset1_state;
  wire [1:0] cacheline6_offset0_state;
  wire [1:0] cacheline6_offset1_state;
  wire [1:0] cacheline7_offset0_state;
  wire [1:0] cacheline7_offset1_state;
  wire [6:0] plru_tree_In;
  reg  [6:0] plru_tree_Q;

//--------------------------------------------------------------
//                     Cache line state
//--------------------------------------------------------------
  assign cacheline_hit_WV  =  (|cacheline_hit_array[7:0]) & set_hit_WV_i;
  assign cacheline_miss_WV = ~(|cacheline_hit_array[7:0]) & set_hit_WV_i;

  assign cacheline_allocate_array[7:0] = {8{cacheline_miss_WV}} & oldest_way_array[7:0];

  bank_htu_cacheline
  cacheline0 (
    .clk_i               (clk_i                        ),
    .rst_i               (rst_i                        ),
    .set_hit_WV_i        (set_hit_WV_i                 ),
    .op_is_read_i        (op_is_read_i                 ),
    .op_is_write_i       (op_is_write_i                ),
    .op_is_flush_i       (op_is_flush_i                ),
    .op_is_invalidate_i  (op_is_invalidate_i           ),
    .access_offset1_i    (access_offset_i              ),
    .access_tag_i        (access_tag_i[31:10]          ),
    .cacheline_allocate_i(cacheline_allocate_array[0]  ),
    .cacheline_hit_o     (cacheline_hit_array[0]       ),
    .offset0_state_o     (cacheline0_offset0_state[1:0]),
    .offset1_state_o     (cacheline0_offset1_state[1:0])
  );

  bank_htu_cacheline
  cacheline1 (
    .clk_i               (clk_i                        ),
    .rst_i               (rst_i                        ),
    .set_hit_WV_i        (set_hit_WV_i                 ),
    .op_is_read_i        (op_is_read_i                 ),
    .op_is_write_i       (op_is_write_i                ),
    .op_is_flush_i       (op_is_flush_i                ),
    .op_is_invalidate_i  (op_is_invalidate_i           ),
    .access_offset1_i    (access_offset_i              ),
    .access_tag_i        (access_tag_i[31:10]          ),
    .cacheline_allocate_i(cacheline_allocate_array[1]  ),
    .cacheline_hit_o     (cacheline_hit_array[1]       ),
    .offset0_state_o     (cacheline1_offset0_state[1:0]),
    .offset1_state_o     (cacheline1_offset1_state[1:0])
  );

  bank_htu_cacheline
  cacheline2 (
    .clk_i               (clk_i                        ),
    .rst_i               (rst_i                        ),
    .set_hit_WV_i        (set_hit_WV_i                 ),
    .op_is_read_i        (op_is_read_i                 ),
    .op_is_write_i       (op_is_write_i                ),
    .op_is_flush_i       (op_is_flush_i                ),
    .op_is_invalidate_i  (op_is_invalidate_i           ),
    .access_offset1_i    (access_offset_i              ),
    .access_tag_i        (access_tag_i[31:10]          ),
    .cacheline_allocate_i(cacheline_allocate_array[2]  ),
    .cacheline_hit_o     (cacheline_hit_array[2]       ),
    .offset0_state_o     (cacheline2_offset0_state[1:0]),
    .offset1_state_o     (cacheline2_offset1_state[1:0])
  );

  bank_htu_cacheline
  cacheline3 (
    .clk_i               (clk_i                        ),
    .rst_i               (rst_i                        ),
    .set_hit_WV_i        (set_hit_WV_i                 ),
    .op_is_read_i        (op_is_read_i                 ),
    .op_is_write_i       (op_is_write_i                ),
    .op_is_flush_i       (op_is_flush_i                ),
    .op_is_invalidate_i  (op_is_invalidate_i           ),
    .access_offset1_i    (access_offset_i              ),
    .access_tag_i        (access_tag_i[31:10]          ),
    .cacheline_allocate_i(cacheline_allocate_array[3]  ),
    .cacheline_hit_o     (cacheline_hit_array[3]       ),
    .offset0_state_o     (cacheline3_offset0_state[1:0]),
    .offset1_state_o     (cacheline3_offset1_state[1:0])
  );

  bank_htu_cacheline
  cacheline4 (
    .clk_i               (clk_i                        ),
    .rst_i               (rst_i                        ),
    .set_hit_WV_i        (set_hit_WV_i                 ),
    .op_is_read_i        (op_is_read_i                 ),
    .op_is_write_i       (op_is_write_i                ),
    .op_is_flush_i       (op_is_flush_i                ),
    .op_is_invalidate_i  (op_is_invalidate_i           ),
    .access_offset1_i    (access_offset_i              ),
    .access_tag_i        (access_tag_i[31:10]          ),
    .cacheline_allocate_i(cacheline_allocate_array[4]  ),
    .cacheline_hit_o     (cacheline_hit_array[4]       ),
    .offset0_state_o     (cacheline4_offset0_state[1:0]),
    .offset1_state_o     (cacheline4_offset1_state[1:0])
  );

  bank_htu_cacheline
  cacheline5 (
    .clk_i               (clk_i                        ),
    .rst_i               (rst_i                        ),
    .set_hit_WV_i        (set_hit_WV_i                 ),
    .op_is_read_i        (op_is_read_i                 ),
    .op_is_write_i       (op_is_write_i                ),
    .op_is_flush_i       (op_is_flush_i                ),
    .op_is_invalidate_i  (op_is_invalidate_i           ),
    .access_offset1_i    (access_offset_i              ),
    .access_tag_i        (access_tag_i[31:10]          ),
    .cacheline_allocate_i(cacheline_allocate_array[5]  ),
    .cacheline_hit_o     (cacheline_hit_array[5]       ),
    .offset0_state_o     (cacheline5_offset0_state[1:0]),
    .offset1_state_o     (cacheline5_offset1_state[1:0])
  );

  bank_htu_cacheline
  cacheline6 (
    .clk_i               (clk_i                        ),
    .rst_i               (rst_i                        ),
    .set_hit_WV_i        (set_hit_WV_i                 ),
    .op_is_read_i        (op_is_read_i                 ),
    .op_is_write_i       (op_is_write_i                ),
    .op_is_flush_i       (op_is_flush_i                ),
    .op_is_invalidate_i  (op_is_invalidate_i           ),
    .access_offset1_i    (access_offset_i              ),
    .access_tag_i        (access_tag_i[31:10]          ),
    .cacheline_allocate_i(cacheline_allocate_array[6]  ),
    .cacheline_hit_o     (cacheline_hit_array[6]       ),
    .offset0_state_o     (cacheline6_offset0_state[1:0]),
    .offset1_state_o     (cacheline6_offset1_state[1:0])
  );

  bank_htu_cacheline
  cacheline7 (
    .clk_i               (clk_i                        ),
    .rst_i               (rst_i                        ),
    .set_hit_WV_i        (set_hit_WV_i                 ),
    .op_is_read_i        (op_is_read_i                 ),
    .op_is_write_i       (op_is_write_i                ),
    .op_is_flush_i       (op_is_flush_i                ),
    .op_is_invalidate_i  (op_is_invalidate_i           ),
    .access_offset1_i    (access_offset_i              ),
    .access_tag_i        (access_tag_i[31:10]          ),
    .cacheline_allocate_i(cacheline_allocate_array[7]  ),
    .cacheline_hit_o     (cacheline_hit_array[7]       ),
    .offset0_state_o     (cacheline7_offset0_state[1:0]),
    .offset1_state_o     (cacheline7_offset1_state[1:0])
  );

//--------------------------------------------------------------
//                     PLRU Tree
//--------------------------------------------------------------
  assign access_way_array[7:0] = {8{cacheline_hit_WV}}  & cacheline_hit_array[7:0]
                               | {8{cacheline_miss_WV}} & oldest_way_array[7:0];

  bank_htu_plru_tree
  u_bank_htu_plru_tree(
    .clk_i             (clk_i                ),
    .rst_i             (rst_i                ),
    .access_array_i    (access_way_array[7:0]),
    .oldest_way_array_o(oldest_way_array[7:0])
  );


endmodule