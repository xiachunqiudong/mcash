module bank_isu_credit_manage #(
  parameter CHANNEL_NUM = 3,
  parameter PTR_WIDTH   = 6,
  parameter DEPTH       = 1 << PTR_WIDTH
)(
  input  wire                 clk,
  input  wire                 rst,
  input  wire                 iq_enqueue,
  input  wire                 htu_op_is_read,
  input  wire [1:0]           htu_ch_id,
  input  wire [PTR_WIDTH-1:0] iq_write_ptr,
  input  wire [PTR_WIDTH-1:0] iq_bottom_ptr,
  input  wire [DEPTH-1:0]     iq_valid_array,
  output wire [DEPTH-1:0]     credit_allow_array
);

//------------------------------------------------------------
// max inst num: 256
//------------------------------------------------------------
  wire             enqueue_has_credit;

  wire                 credit_allow_array_wen;
  reg  [DEPTH-1:0]     credit_allow_array_In;
  reg  [DEPTH-1:0]     credit_allow_array_Q;
  wire [DEPTH-1:0]     iq_no_credit_array;

  wire [DEPTH-1:0]     channel_no_credit_array     [CHANNEL_NUM-1:0];
  wire [PTR_WIDTH-1:0] channel_credit_allocate_ptr [CHANNEL_NUM-1:0];
  wire [3:0]           channels_credit_num_Q       [CHANNEL_NUM-1:0];
  wire [PTR_WIDTH:0]   channels_pending_inst_num_Q [CHANNEL_NUM-1:0];

  wire [CHANNEL_NUM-1:0] channels_has_credit;
  wire [CHANNEL_NUM-1:0] channels_has_pending_inst;

  assign iq_no_credit_array[DEPTH-1:0] = ~credit_allow_array_Q[DEPTH-1:0] & iq_valid_array[DEPTH-1:0];

  genvar CHANNEL;

  generate
    for (CHANNEL = 0; CHANNEL < CHANNEL_NUM; CHANNEL = CHANNEL + 1) begin

      assign channels_has_credit[CHANNEL] = channels_credit_num_Q[CHANNEL] != 'd0;

      assign channels_has_pending_inst[CHANNEL] = channels_pending_inst_num_Q[CHANNEL] != 'd0;

      // channel no credit array
      always @(*) begin
        channel_no_credit_array[CHANNEL] = iq_no_credit_array[DEPTH-1:0];
        for (int i = 0; i < DEPTH; i = i + 1) begin
          if (ch_id_array[i] != CHANNEL) begin
            channel_no_credit_array[CHANNEL][i] = 1'b0;
          end
        end
      end

    end
  endgenerate

//--------------------------------------------------------------
//             Allocate credit for pending inst
//--------------------------------------------------------------
  generate
    for (CHANNEL = 0; CHANNEL < CHANNEL_NUM; CHANNEL = CHANNEL + 1) begin
      shift_priority_arb_256
      channel_shift_priority_arb_256(
        .valid_array_i(channel_no_credit_array[CHANNEL]    ),
        .bottom_ptr_i (iq_bottom_ptr                       ),
        .select_ptr_o (channel_credit_allocate_ptr[CHANNEL])
      );
    end
  endgenerate

//--------------------------------------------------------------
//           enqueue inst credit allow
//--------------------------------------------------------------
  assign enqueue_inst_has_credit = htu_op_is_read
                                 ? ~channels_has_pending_inst[htu_ch_id] & channels_has_credit[htu_ch_id]
                                 : 1'b1;

  always @(*) begin
    credit_allow_array_In = credit_allow_array_Q;
    if (iq_enqueue) begin
      credit_allow_array_In[iq_write_ptr] = enqueue_inst_has_credit;
    end
  end

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      credit_allow_array_Q <= 'b0;
    end
    else begin
      credit_allow_array_Q <= credit_allow_array_In;
    end
  end

endmodule