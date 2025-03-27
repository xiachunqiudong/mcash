module bank_htu_cacheline (
  input  wire         clk_i,
  input  wire         rst_i,
  input  wire         set_hit_WV_i,
  input  wire         op_is_read_i,
  input  wire         op_is_write_i,
  input  wire         op_is_flush_i,
  input  wire         op_is_invalidate_i,
  input  wire         access_offset1_i,
  input  wire [31:10] access_tag_i,
  input  wire         cacheline_allocate_i,
  output wire         cacheline_valid_o,
  output wire [31:10] cacheline_tag_o,
  output wire         cacheline_hit_o,
  output wire [1:0]   offset0_state_o,
  output wire [1:0]   offset1_state_o
);

  reg          cacheline_valid_Q;
  reg  [31:10] cacheline_tag_Q;
  wire         cacheline_hit_WV;

  assign cacheline_valid_o = cacheline_valid_Q;

  assign cacheline_tag_o[31:10] = cacheline_tag_Q[31:10];

  assign cacheline_hit_o = cacheline_valid_Q
                         & (access_tag_i[31:10] == cacheline_tag_Q[31:10]);

  assign cacheline_hit_WV = set_hit_WV_i & cacheline_hit_o;

// cacheline valid
  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      cacheline_valid_Q <= 1'b0;
    end
    else if (cacheline_allocate_i) begin
      cacheline_valid_Q <= 1'b1;
    end
  end

// cacheline tag
  always @(posedge clk_i) begin
    if (cacheline_allocate_i) begin
      cacheline_tag_Q[31:10] <= access_tag_i[31:10];
    end
  end

// offset state
  bank_htu_offset
  offset0 (
    .clk_i               (clk_i               ),
    .rst_i               (rst_i               ),
    .offset_hit_i        (~access_offset1_i   ),
    .op_is_read_i        (op_is_read_i        ),
    .op_is_write_i       (op_is_write_i       ),
    .cacheline_hit_i     (cacheline_hit_WV    ),
    .cacheline_allocate_i(cacheline_allocate_i),
    .offset_status_o     (offset0_state_o     )
  );

  bank_htu_offset
  offset1 (
    .clk_i               (clk_i               ),
    .rst_i               (rst_i               ),
    .offset_hit_i        (access_offset1_i    ),
    .op_is_read_i        (op_is_read_i        ),
    .op_is_write_i       (op_is_write_i       ),
    .cacheline_hit_i     (cacheline_hit_WV    ),
    .cacheline_allocate_i(cacheline_allocate_i),
    .offset_status_o     (offset1_state_o     )
  );

endmodule