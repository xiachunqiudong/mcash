module bank_htu_offset (
  input  wire       clk_i,
  input  wire       rst_i,
  input  wire       offset_hit_i,
  input  wire       op_is_read_i,
  input  wire       op_is_write_i,
  input  wire       cacheline_hit_i,
  input  wire       cacheline_allocate_i,
  output wire [1:0] offset_status_o
);

  parameter EMPTY = 2'b00;
  parameter SYNC  = 2'b01;
  parameter DIRTY = 2'b10;

  wire       offset_state_wen;
  wire       empty_to_sync;
  wire       empty_to_dirty;
  wire       sync_to_empty;
  wire       sync_to_dirty;
  wire       dirty_to_empty;
  wire       dirty_to_sync;
  wire       nstate_is_empty;
  wire       nstate_is_sync;
  wire       nstate_is_dirty;
  wire       offset_is_empty;
  wire       offset_is_sync;
  wire       offset_is_dirty;
  wire [1:0] offset_state_In;
  reg  [1:0] offset_state_Q;

  assign offset_is_empty = offset_state_Q[1:0] == EMPTY[1:0];
  assign offset_is_sync  = offset_state_Q[1:0] == SYNC[1:0];
  assign offset_is_dirty = offset_state_Q[1:0] == DIRTY[1:0];

  assign empty_to_sync = offset_is_empty
                       & op_is_read_i
                       & (   cacheline_hit_i & offset_hit_i
                           | cacheline_allocate_i);

  assign empty_to_dirty = offset_is_empty & op_is_write_i & offset_hit_i
                        & (cacheline_hit_i | cacheline_allocate_i);

  assign sync_to_empty = offset_is_sync & op_is_write_i
                        & cacheline_allocate_i;

  assign sync_to_dirty = offset_is_sync & op_is_write_i & offset_hit_i
                       & cacheline_hit_i;

  assign dirty_to_empty = offset_is_dirty & op_is_write_i & ~offset_hit_i
                        & cacheline_allocate_i;

  assign dirty_to_sync = offset_is_dirty & op_is_read_i
                       & cacheline_allocate_i;

  assign nstate_is_empty = sync_to_empty  | dirty_to_empty;
  assign nstate_is_sync  = empty_to_sync  | dirty_to_sync;
  assign nstate_is_dirty = empty_to_dirty | sync_to_dirty;

  assign offset_state_In[1:0] = {2{nstate_is_empty}} & EMPTY[1:0]
                              | {2{nstate_is_sync}}  & SYNC[1:0]
                              | {2{nstate_is_dirty}} & DIRTY[1:0];

  assign offset_state_wen = nstate_is_empty | nstate_is_sync | nstate_is_dirty;

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      offset_state_Q[1:0] <= EMPTY;
    end
    else if (offset_state_wen) begin
      offset_state_Q[1:0] <= offset_state_In[1:0];
    end
  end

  assign offset_status_o[1:0] = offset_state_Q[1:0];

endmodule