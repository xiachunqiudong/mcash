module bank_isu_credit_manage #(
  parameter CHANNEL_NUM = 3,
  parameter PTR_WIDTH   = 8,
  parameter DEPTH       = 1 << PTR_WIDTH
)(
  input  wire                   clk,
  input  wire                   rst,
  input  wire                   iq_enqueue,
  input  wire [PTR_WIDTH-1:0]   iq_write_ptr,
  input  wire                   htu_op_is_read,
  input  wire [1:0]             htu_ch_id,
  input  wire [PTR_WIDTH-1:0]   iq_bottom_ptr,
  input  wire [DEPTH-1:0]       iq_valid_array,
  input  wire [DEPTH-1:0]       iq_entry_req_from_ch0,
  input  wire [DEPTH-1:0]       iq_entry_req_from_ch1,
  input  wire [DEPTH-1:0]       iq_entry_req_from_ch2,
  output wire [DEPTH-1:0]       credit_allow_array,
  input  wire [CHANNEL_NUM-1:0] channels_credit_release
);

//------------------------------------------------------------
// max inst num: 256
//------------------------------------------------------------
  wire             enqueue_has_credit;

  wire                 credit_allow_array_wen;
  reg  [DEPTH-1:0]     credit_allow_array_In;
  reg  [DEPTH-1:0]     credit_allow_array_Q;
  wire [DEPTH-1:0]     iq_no_credit_array;

  reg  [DEPTH-1:0]       channel_no_credit_array      [CHANNEL_NUM-1:0];
  wire [PTR_WIDTH-1:0]   channel_credit_allocate_ptr  [CHANNEL_NUM-1:0];
  wire [CHANNEL_NUM-1:0] channels_credit_allocate;
  wire [3:0]             channels_credit_num_In       [CHANNEL_NUM-1:0];
  reg  [3:0]             channels_credit_num_Q        [CHANNEL_NUM-1:0];
  wire [CHANNEL_NUM-1:0] channels_has_credit;

  wire [CHANNEL_NUM-1:0] channels_pending_inst_num_allocate;
  wire [CHANNEL_NUM-1:0] channels_pending_inst_num_release;
  reg  [PTR_WIDTH:0]     channels_pending_inst_num_In [CHANNEL_NUM-1:0];
  reg  [PTR_WIDTH:0]     channels_pending_inst_num_Q  [CHANNEL_NUM-1:0];
  wire [CHANNEL_NUM-1:0] channels_has_pending_inst;



  genvar CHANNEL;

//------------------------------------------------------------
//                  Channel credit num
//------------------------------------------------------------
  generate
    for (CHANNEL = 0; CHANNEL < CHANNEL_NUM; CHANNEL = CHANNEL + 1) begin

      assign channels_credit_allocate[CHANNEL] = channels_has_credit[CHANNEL]
                                               & (   channels_has_pending_inst[CHANNEL]
                                                   | iq_enqueue & htu_op_is_read & (htu_ch_id[1:0] == CHANNEL[1:0])
                                                 );

      assign channels_credit_num_In[CHANNEL] =  channels_credit_allocate[CHANNEL] & ~channels_credit_release[CHANNEL] ? channels_credit_num_Q[CHANNEL] - 'd1
                                             : ~channels_credit_allocate[CHANNEL] &  channels_credit_release[CHANNEL] ? channels_credit_num_Q[CHANNEL] + 'd1
                                             : channels_credit_num_Q[CHANNEL];

      always @(posedge clk or posedge rst) begin
        if (rst) begin
          channels_credit_num_Q[CHANNEL] <= 'd8;
        end
        else begin
          channels_credit_num_Q[CHANNEL] <= channels_credit_num_In[CHANNEL];
        end
      end

    end
  endgenerate

//------------------------------------------------------------
//                  Channel pending num
//------------------------------------------------------------
  generate
    for (CHANNEL = 0; CHANNEL < CHANNEL_NUM; CHANNEL = CHANNEL + 1) begin
    
      assign channels_pending_inst_num_allocate[CHANNEL] = iq_enqueue & htu_op_is_read & (htu_ch_id[1:0] == CHANNEL[1:0])
                                                         & ( ~channels_has_credit[CHANNEL] 
                                                            | channels_has_pending_inst[CHANNEL]);

      assign channels_pending_inst_num_release[CHANNEL] = channels_has_credit[CHANNEL] & channels_has_pending_inst[CHANNEL];

      assign channels_pending_inst_num_In[CHANNEL] =  channels_pending_inst_num_allocate[CHANNEL] & ~channels_pending_inst_num_release[CHANNEL] ? channels_pending_inst_num_Q[CHANNEL] + 'd1
                                                   : ~channels_pending_inst_num_allocate[CHANNEL] &  channels_pending_inst_num_release[CHANNEL] ? channels_pending_inst_num_Q[CHANNEL] - 'd1
                                                   : channels_pending_inst_num_Q[CHANNEL];

      always @(posedge clk or posedge rst) begin
        if (rst) begin
          channels_pending_inst_num_Q[CHANNEL] <= 'd0;
        end
        else begin
          channels_pending_inst_num_Q[CHANNEL] <= channels_pending_inst_num_In[CHANNEL];
        end
      end

    end
  endgenerate

  assign iq_no_credit_array[DEPTH-1:0] = ~credit_allow_array_Q[DEPTH-1:0] & iq_valid_array[DEPTH-1:0];



  generate
    for (CHANNEL = 0; CHANNEL < CHANNEL_NUM; CHANNEL = CHANNEL + 1) begin

      assign channels_has_credit[CHANNEL] = channels_credit_num_Q[CHANNEL] != 'd0;

      assign channels_has_pending_inst[CHANNEL] = channels_pending_inst_num_Q[CHANNEL] != 'd0;

    end
  endgenerate

  assign channel_no_credit_array[0] = iq_entry_req_from_ch0[DEPTH-1:0] & iq_no_credit_array[DEPTH-1:0];
  assign channel_no_credit_array[1] = iq_entry_req_from_ch1[DEPTH-1:0] & iq_no_credit_array[DEPTH-1:0];
  assign channel_no_credit_array[2] = iq_entry_req_from_ch2[DEPTH-1:0] & iq_no_credit_array[DEPTH-1:0];


//--------------------------------------------------------------
//             Allocate credit for pending inst
//--------------------------------------------------------------
  generate
    for (CHANNEL = 0; CHANNEL < CHANNEL_NUM; CHANNEL = CHANNEL + 1) begin
      shift_priority_arb_64
      channel_shift_priority_arb_64(
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
    for (int i = 0; i < CHANNEL_NUM; i++) begin
      if (channels_pending_inst_num_release[i]) begin
        credit_allow_array_In[channel_credit_allocate_ptr[i]] = 1'b1;
      end
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

  assign credit_allow_array = credit_allow_array_Q;


endmodule