module bank_htu_set_entry (
  input  wire         clk_i,
  input  wire         rst_i,
  input  wire         op_is_read_i,
  input  wire         op_is_write_i,
  input  wire         op_is_flush_i,
  input  wire         op_is_invalidate_i,
  input  wire         set_hit_WV_i,
  input  wire [31:10] access_tag_i,
  input  wire         access_offset_i,
  output wire         cacheline_hit_o,
  output wire         cacheline_need_evit_o,
  output wire [31:10] evit_cacheline_tag_o,
  output wire [1:0]   cacheline_offset0_state_o,
  output wire [1:0]   cacheline_offset1_state_o,
  output wire [2:0]   access_way_o
);

  wire [7:0]   cacheline_hit_array;
  wire [7:0]   cacheline_allocate_array;
  wire [7:0]   access_way_array;
  wire [7:0]   cacheline_valid_array;
  wire [1:0]   allocate_cacheline_offset0_state;
  wire [1:0]   allocate_cacheline_offset1_state;
  wire [31:10] cacheline0_tag;
  wire [31:10] cacheline1_tag;
  wire [31:10] cacheline2_tag;
  wire [31:10] cacheline3_tag;
  wire [31:10] cacheline4_tag;
  wire [31:10] cacheline5_tag;
  wire [31:10] cacheline6_tag;
  wire [31:10] cacheline7_tag;
  wire [1:0]   cacheline0_offset0_state;
  wire [1:0]   cacheline0_offset1_state;
  wire [1:0]   cacheline1_offset0_state;
  wire [1:0]   cacheline1_offset1_state;
  wire [1:0]   cacheline2_offset0_state;
  wire [1:0]   cacheline2_offset1_state;
  wire [1:0]   cacheline3_offset0_state;
  wire [1:0]   cacheline3_offset1_state;
  wire [1:0]   cacheline4_offset0_state;
  wire [1:0]   cacheline4_offset1_state;
  wire [1:0]   cacheline5_offset0_state;
  wire [1:0]   cacheline5_offset1_state;
  wire [1:0]   cacheline6_offset0_state;
  wire [1:0]   cacheline6_offset1_state;
  wire [1:0]   cacheline7_offset0_state;
  wire [1:0]   cacheline7_offset1_state;
  wire [6:0]   plru_tree_In;
  reg  [6:0]   plru_tree_Q;


  assign cacheline_hit_o = |cacheline_hit_array[7:0];

  assign access_way_array[7:0] = {8{ cacheline_hit_o}} & cacheline_hit_array[7:0]       // cacheline hit
                               | {8{~cacheline_hit_o}} & cacheline_allocate_array[7:0]; // cacheline miss

  assign allocate_cacheline_offset0_state[1:0] = {2{cacheline_allocate_array[0]}} & cacheline0_offset0_state[1:0]
                                               | {2{cacheline_allocate_array[1]}} & cacheline1_offset0_state[1:0]
                                               | {2{cacheline_allocate_array[2]}} & cacheline2_offset0_state[1:0]
                                               | {2{cacheline_allocate_array[3]}} & cacheline3_offset0_state[1:0]
                                               | {2{cacheline_allocate_array[4]}} & cacheline4_offset0_state[1:0]
                                               | {2{cacheline_allocate_array[5]}} & cacheline5_offset0_state[1:0]
                                               | {2{cacheline_allocate_array[6]}} & cacheline6_offset0_state[1:0]
                                               | {2{cacheline_allocate_array[7]}} & cacheline7_offset0_state[1:0];

  assign allocate_cacheline_offset1_state[1:0] = {2{cacheline_allocate_array[0]}} & cacheline0_offset1_state[1:0]
                                               | {2{cacheline_allocate_array[1]}} & cacheline1_offset1_state[1:0]
                                               | {2{cacheline_allocate_array[2]}} & cacheline2_offset1_state[1:0]
                                               | {2{cacheline_allocate_array[3]}} & cacheline3_offset1_state[1:0]
                                               | {2{cacheline_allocate_array[4]}} & cacheline4_offset1_state[1:0]
                                               | {2{cacheline_allocate_array[5]}} & cacheline5_offset1_state[1:0]
                                               | {2{cacheline_allocate_array[6]}} & cacheline6_offset1_state[1:0]
                                               | {2{cacheline_allocate_array[7]}} & cacheline7_offset1_state[1:0];

// if any offset is dirty, then this cacheline needs to be write back to sub memory.
  assign cacheline_need_evit_o = allocate_cacheline_offset0_state[1:0] == 2'b10
                               | allocate_cacheline_offset1_state[1:0] == 2'b10;

  assign evit_cacheline_tag_o[31:10] = {22{cacheline_allocate_array[0]}} & cacheline0_tag[31:10]
                                     | {22{cacheline_allocate_array[1]}} & cacheline1_tag[31:10]
                                     | {22{cacheline_allocate_array[2]}} & cacheline2_tag[31:10]
                                     | {22{cacheline_allocate_array[3]}} & cacheline3_tag[31:10]
                                     | {22{cacheline_allocate_array[4]}} & cacheline4_tag[31:10]
                                     | {22{cacheline_allocate_array[5]}} & cacheline5_tag[31:10]
                                     | {22{cacheline_allocate_array[6]}} & cacheline6_tag[31:10]
                                     | {22{cacheline_allocate_array[7]}} & cacheline7_tag[31:10];

  assign cacheline_offset0_state_o[1:0] = {2{access_way_array[0]}} & cacheline0_offset0_state[1:0]
                                        | {2{access_way_array[1]}} & cacheline1_offset0_state[1:0]
                                        | {2{access_way_array[2]}} & cacheline2_offset0_state[1:0]
                                        | {2{access_way_array[3]}} & cacheline3_offset0_state[1:0]
                                        | {2{access_way_array[4]}} & cacheline4_offset0_state[1:0]
                                        | {2{access_way_array[5]}} & cacheline5_offset0_state[1:0]
                                        | {2{access_way_array[6]}} & cacheline6_offset0_state[1:0]
                                        | {2{access_way_array[7]}} & cacheline7_offset0_state[1:0];

  assign cacheline_offset1_state_o[1:0] = {2{access_way_array[0]}} & cacheline0_offset1_state[1:0]
                                        | {2{access_way_array[1]}} & cacheline1_offset1_state[1:0]
                                        | {2{access_way_array[2]}} & cacheline2_offset1_state[1:0]
                                        | {2{access_way_array[3]}} & cacheline3_offset1_state[1:0]
                                        | {2{access_way_array[4]}} & cacheline4_offset1_state[1:0]
                                        | {2{access_way_array[5]}} & cacheline5_offset1_state[1:0]
                                        | {2{access_way_array[6]}} & cacheline6_offset1_state[1:0]
                                        | {2{access_way_array[7]}} & cacheline7_offset1_state[1:0];

  assign access_way_o[2:0] = {3{access_way_array[0]}} & 3'd0
                           | {3{access_way_array[1]}} & 3'd1
                           | {3{access_way_array[2]}} & 3'd2
                           | {3{access_way_array[3]}} & 3'd3
                           | {3{access_way_array[4]}} & 3'd4
                           | {3{access_way_array[5]}} & 3'd5
                           | {3{access_way_array[6]}} & 3'd6
                           | {3{access_way_array[7]}} & 3'd7;

//--------------------------------------------------------------
//                     Cache line state
//--------------------------------------------------------------

// cacheline0
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
    .cacheline_valid_o   (cacheline_valid_array[0]     ),
    .cacheline_tag_o     (cacheline0_tag[31:10]        ),
    .cacheline_allocate_i(cacheline_allocate_array[0]  ),
    .cacheline_hit_o     (cacheline_hit_array[0]       ),
    .offset0_state_o     (cacheline0_offset0_state[1:0]),
    .offset1_state_o     (cacheline0_offset1_state[1:0])
  );

// cacheline1
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
    .cacheline_valid_o   (cacheline_valid_array[1]     ),
    .cacheline_tag_o     (cacheline1_tag[31:10]        ),
    .cacheline_allocate_i(cacheline_allocate_array[1]  ),
    .cacheline_hit_o     (cacheline_hit_array[1]       ),
    .offset0_state_o     (cacheline1_offset0_state[1:0]),
    .offset1_state_o     (cacheline1_offset1_state[1:0])
  );

// cacheline2
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
    .cacheline_valid_o   (cacheline_valid_array[2]     ),
    .cacheline_tag_o     (cacheline2_tag[31:10]        ),
    .cacheline_allocate_i(cacheline_allocate_array[2]  ),
    .cacheline_hit_o     (cacheline_hit_array[2]       ),
    .offset0_state_o     (cacheline2_offset0_state[1:0]),
    .offset1_state_o     (cacheline2_offset1_state[1:0])
  );

// cacheline3
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
    .cacheline_valid_o   (cacheline_valid_array[3]     ),
    .cacheline_tag_o     (cacheline3_tag[31:10]        ),
    .cacheline_allocate_i(cacheline_allocate_array[3]  ),
    .cacheline_hit_o     (cacheline_hit_array[3]       ),
    .offset0_state_o     (cacheline3_offset0_state[1:0]),
    .offset1_state_o     (cacheline3_offset1_state[1:0])
  );

// cacheline4
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
    .cacheline_valid_o   (cacheline_valid_array[4]     ),
    .cacheline_tag_o     (cacheline4_tag[31:10]        ),
    .cacheline_allocate_i(cacheline_allocate_array[4]  ),
    .cacheline_hit_o     (cacheline_hit_array[4]       ),
    .offset0_state_o     (cacheline4_offset0_state[1:0]),
    .offset1_state_o     (cacheline4_offset1_state[1:0])
  );

// cacheline5
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
    .cacheline_valid_o   (cacheline_valid_array[5]     ),
    .cacheline_tag_o     (cacheline5_tag[31:10]        ),
    .cacheline_allocate_i(cacheline_allocate_array[5]  ),
    .cacheline_hit_o     (cacheline_hit_array[5]       ),
    .offset0_state_o     (cacheline5_offset0_state[1:0]),
    .offset1_state_o     (cacheline5_offset1_state[1:0])
  );

// cacheline6
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
    .cacheline_valid_o   (cacheline_valid_array[6]     ),
    .cacheline_tag_o     (cacheline6_tag[31:10]        ),
    .cacheline_allocate_i(cacheline_allocate_array[6]  ),
    .cacheline_hit_o     (cacheline_hit_array[6]       ),
    .offset0_state_o     (cacheline6_offset0_state[1:0]),
    .offset1_state_o     (cacheline6_offset1_state[1:0])
  );

// cacheline7
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
    .cacheline_valid_o   (cacheline_valid_array[7]     ),
    .cacheline_tag_o     (cacheline7_tag[31:10]        ),
    .cacheline_allocate_i(cacheline_allocate_array[7]  ),
    .cacheline_hit_o     (cacheline_hit_array[7]       ),
    .offset0_state_o     (cacheline7_offset0_state[1:0]),
    .offset1_state_o     (cacheline7_offset1_state[1:0])
  );

//--------------------------------------------------------------
//                     PLRU Tree
//--------------------------------------------------------------
  bank_htu_plru_tree
  u_bank_htu_plru_tree(
    .clk_i             (clk_i                        ),
    .rst_i             (rst_i                        ),
    .access_valid_i    (set_hit_WV_i                 ),
    .access_array_i    (access_way_array[7:0]        ),
    .oldest_way_array_o(cacheline_allocate_array[7:0])
  );


endmodule