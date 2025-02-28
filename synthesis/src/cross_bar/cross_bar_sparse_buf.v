module cross_bar_sparse_read_buf (
  input  wire       clk_i,
  input  wire       rst_i,
  // write
  input  wire       write_valid_i,
  output wire       write_ready_o,
  input  wire [7:0] write_data_i,
  // read
  input  wire       read_valid_i,
  input  wire [2:0] read_ptr_i
  output wire       read_ready_o,
  // read return
  output wire       read_rtn_valid_o,
  input  wire       read_rtn_ready_i,
  output wire [7:0] read_rtn_data_o,
  // sparse info
  output wire [7:0] sparse_array_valid_o,
  output wire [2:0] sparse_array_bottom_ptr_o

);

  wire       write_ptr_kickoff;
  wire [2:0] write_ptr_In;
  reg  [2:0] write_ptr_Q;
  wire [7:0] write_ptr_dcd;

  wire [2:0] bottom_ptr_In;
  reg  [2:0] bottom_ptr_Q;
  wire [7:0] bottom_ptr_dcd;

  wire       read_ptr_kickoff;
  wire [7:0] read_ptr_dcd;

  wire [7:0] sparse_array_push;
  wire [7:0] sparse_array_pop;

  wire [7:0] sparse_array_valid_Q;
  wire [7:0] shift_sparse_array_valid;

//-----------------------------------------------------------
//                       Wrirte ptr
//-----------------------------------------------------------
  assign write_ready_o = write_ptr_Q[2:0] != bottom_ptr_Q[2:0];

  assign write_ptr_kickoff = write_valid_i & write_ready_o;

  assign write_ptr_In[2:0] = write_ptr_Q[2:0] + 3'd1;

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      write_ptr_Q[2:0] <= 3'd0;
    end
    else if (write_ptr_kickoff) begin
      write_ptr_Q[2:0] <= write_ptr_In[2:0];
    end
  end

  assign write_ptr_dcd[7:0] = {(write_ptr_Q[2:0] == 3'b111),
                               (write_ptr_Q[2:0] == 3'b110),
                               (write_ptr_Q[2:0] == 3'b101),
                               (write_ptr_Q[2:0] == 3'b100),
                               (write_ptr_Q[2:0] == 3'b011),
                               (write_ptr_Q[2:0] == 3'b010),
                               (write_ptr_Q[2:0] == 3'b001),
                               (write_ptr_Q[2:0] == 3'b000)};

//-----------------------------------------------------------
//                       Read ptr
//-----------------------------------------------------------
  assign read_ptr_kickoff = read_valid_i & read_ready_o;

  assign read_ptr_dcd[7:0] = {(read_ptr_i[2:0] == 3'b111),
                              (read_ptr_i[2:0] == 3'b110),
                              (read_ptr_i[2:0] == 3'b101),
                              (read_ptr_i[2:0] == 3'b100),
                              (read_ptr_i[2:0] == 3'b011),
                              (read_ptr_i[2:0] == 3'b010),
                              (read_ptr_i[2:0] == 3'b001),
                              (read_ptr_i[2:0] == 3'b000)};

//-----------------------------------------------------------
//                       Bottom ptr
//-----------------------------------------------------------
  assign bottom_ptr_dcd[7:0] = {(bottom_ptr_Q[2:0] == 3'b111),
                                (bottom_ptr_Q[2:0] == 3'b110),
                                (bottom_ptr_Q[2:0] == 3'b101),
                                (bottom_ptr_Q[2:0] == 3'b100),
                                (bottom_ptr_Q[2:0] == 3'b011),
                                (bottom_ptr_Q[2:0] == 3'b010),
                                (bottom_ptr_Q[2:0] == 3'b001),
                                (bottom_ptr_Q[2:0] == 3'b000)};

  assign shift_sparse_array_valid[7:0] = {8{bottom_ptr_dcd[0]}} & sparse_array_valid_Q[7:0]
                                       | {8{bottom_ptr_dcd[1]}} & {sparse_array_valid_Q[0],   sparse_array_valid_Q[7:1]}
                                       | {8{bottom_ptr_dcd[2]}} & {sparse_array_valid_Q[1:0], sparse_array_valid_Q[7:2]}
                                       | {8{bottom_ptr_dcd[3]}} & {sparse_array_valid_Q[2:0], sparse_array_valid_Q[7:3]}
                                       | {8{bottom_ptr_dcd[4]}} & {sparse_array_valid_Q[3:0], sparse_array_valid_Q[7:4]}
                                       | {8{bottom_ptr_dcd[5]}} & {sparse_array_valid_Q[4:0], sparse_array_valid_Q[7:5]}
                                       | {8{bottom_ptr_dcd[6]}} & {sparse_array_valid_Q[5:0], sparse_array_valid_Q[7:6]}
                                       | {8{bottom_ptr_dcd[7]}} & {sparse_array_valid_Q[6:0], sparse_array_valid_Q[7]};

  assign bottom_ptr_In[2:0] = shift_sparse_array_valid[0] ? bottom_ptr_Q[2:0]
                            : shift_sparse_array_valid[1] ? bottom_ptr_Q[2:0] + 3'd1
                            : shift_sparse_array_valid[2] ? bottom_ptr_Q[2:0] + 3'd2
                            : shift_sparse_array_valid[3] ? bottom_ptr_Q[2:0] + 3'd3
                            : shift_sparse_array_valid[4] ? bottom_ptr_Q[2:0] + 3'd4
                            : shift_sparse_array_valid[5] ? bottom_ptr_Q[2:0] + 3'd5
                            : shift_sparse_array_valid[6] ? bottom_ptr_Q[2:0] + 3'd6
                            : shift_sparse_array_valid[7] ? bottom_ptr_Q[2:0] + 3'd7
                            :                               3'd7;

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      bottom_ptr_Q[2:0] <= 3'd0
    end
    else begin
      bottom_ptr_Q[2:0] <= bottom_ptr_In[2:0];
    end
  end

  assign sparse_array_bottom_ptr_o[2:0] = bottom_ptr_Q[2:0];

//-----------------------------------------------------------
//                     Sparse array
//-----------------------------------------------------------
  assign sparse_array_push[7:0] = {8{write_ptr_kickoff}} & write_ptr_dcd[7:0];

  assign sparse_array_pop[7:0] = {8{read_ptr_kickoff}} & write_ptr_dcd[7:0];

// entry 0
  sparse_array_entry
  sparse_array_entry0(
    .clk_i        (clk_i                  ),
    .rst_i        (rst_i                  ),
    .entry_push_i (sparse_array_push[0]   ),
    .entry_pop_i  (sparse_array_pop[0]    ),
    .entry_data_i (write_data_i[7:0]      ),
    .entry_valid_o(sparse_array_valid_Q[0]),
    .entry_data_o ()
  );

// entry 1
  sparse_array_entry
  sparse_array_entry1(
    .clk_i        (clk_i                  ),
    .rst_i        (rst_i                  ),
    .entry_push_i (sparse_array_push[1]   ),
    .entry_pop_i  (sparse_array_pop[1]    ),
    .entry_data_i (write_data_i[7:0]      ),
    .entry_valid_o(sparse_array_valid_Q[1]),
    .entry_data_o ()
  );

// entry 2
  sparse_array_entry
  sparse_array_entry2(
    .clk_i        (clk_i                  ),
    .rst_i        (rst_i                  ),
    .entry_push_i (sparse_array_push[2]   ),
    .entry_pop_i  (sparse_array_pop[2]    ),
    .entry_data_i (write_data_i[7:0]      ),
    .entry_valid_o(sparse_array_valid_Q[2]),
    .entry_data_o ()
  );

// entry 3
  sparse_array_entry
  sparse_array_entry3(
    .clk_i        (clk_i                  ),
    .rst_i        (rst_i                  ),
    .entry_push_i (sparse_array_push[3]   ),
    .entry_pop_i  (sparse_array_pop[3]    ),
    .entry_data_i (write_data_i[7:0]      ),
    .entry_valid_o(sparse_array_valid_Q[3]),
    .entry_data_o ()
  );

// entry 4
  sparse_array_entry
  sparse_array_entry4(
    .clk_i        (clk_i                  ),
    .rst_i        (rst_i                  ),
    .entry_push_i (sparse_array_push[4]   ),
    .entry_pop_i  (sparse_array_pop[4]    ),
    .entry_data_i (write_data_i[7:0]      ),
    .entry_valid_o(sparse_array_valid_Q[4]),
    .entry_data_o ()
  );

// entry 5
  sparse_array_entry
  sparse_array_entry5(
    .clk_i        (clk_i                  ),
    .rst_i        (rst_i                  ),
    .entry_push_i (sparse_array_push[5]   ),
    .entry_pop_i  (sparse_array_pop[5]    ),
    .entry_data_i (write_data_i[7:0]      ),
    .entry_valid_o(sparse_array_valid_Q[5]),
    .entry_data_o ()
  );

// entry 6
  sparse_array_entry
  sparse_array_entry6(
    .clk_i        (clk_i                  ),
    .rst_i        (rst_i                  ),
    .entry_push_i (sparse_array_push[6]   ),
    .entry_pop_i  (sparse_array_pop[6]    ),
    .entry_data_i (write_data_i[7:0]      ),
    .entry_valid_o(sparse_array_valid_Q[6]),
    .entry_data_o ()
  );

// entry 7
  sparse_array_entry
  sparse_array_entry7(
    .clk_i        (clk_i                  ),
    .rst_i        (rst_i                  ),
    .entry_push_i (sparse_array_push[7]   ),
    .entry_pop_i  (sparse_array_pop[7]    ),
    .entry_data_i (write_data_i[7:0]      ),
    .entry_valid_o(sparse_array_valid_Q[7]),
    .entry_data_o ()
  );



endmodule