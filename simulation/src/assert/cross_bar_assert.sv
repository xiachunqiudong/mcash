module cross_bar_assert(
	input  logic clk_i,
	input  logic rst_i,
	output logic mcash_ch0_req_valid_i,
	input  logic mcash_ch0_req_allowIn_o,
	output logic mcash_ch1_req_valid_i,
	input  logic mcash_ch1_req_allowIn_o,
	output logic mcash_ch2_req_valid_i,
	input  logic mcash_ch2_req_allowIn_o,
	output logic mcash_ch0_rtn_valid_o,
	output logic mcash_ch1_rtn_valid_o,
	output logic mcash_ch2_rtn_valid_o
);

  `define CROSS_BAR_TOP mcash_tb.u_mcash_top.u_cross_bar_top

	logic ch0_read_req_kickoff;
	logic ch1_read_req_kickoff;
	logic ch2_read_req_kickoff;
	logic ch0_read_resp_kickoff;
	logic ch1_read_resp_kickoff;
	logic ch2_read_resp_kickoff;

	logic [9:0] ch0_read_req_cnt_Q;
	logic [9:0] ch1_read_req_cnt_Q;
	logic [9:0] ch2_read_req_cnt_Q;
	logic [9:0] ch0_rob_bank0_read_resp_cnt_Q;
	logic [9:0] ch0_rob_bank1_read_resp_cnt_Q;
	logic [9:0] ch0_rob_bank2_read_resp_cnt_Q;
	logic [9:0] ch0_rob_bank3_read_resp_cnt_Q;
	logic [9:0] ch1_rob_bank0_read_resp_cnt_Q;
	logic [9:0] ch1_rob_bank1_read_resp_cnt_Q;
	logic [9:0] ch1_rob_bank2_read_resp_cnt_Q;
	logic [9:0] ch1_rob_bank3_read_resp_cnt_Q;
	logic [9:0] ch2_rob_bank0_read_resp_cnt_Q;
	logic [9:0] ch2_rob_bank1_read_resp_cnt_Q;
	logic [9:0] ch2_rob_bank2_read_resp_cnt_Q;
	logic [9:0] ch2_rob_bank3_read_resp_cnt_Q;

	assign ch0_read_req_kickoff = mcash_ch0_req_valid_i & mcash_ch0_req_allowIn_o;
	assign ch1_read_req_kickoff = mcash_ch1_req_valid_i & mcash_ch1_req_allowIn_o;
	assign ch2_read_req_kickoff = mcash_ch2_req_valid_i & mcash_ch2_req_allowIn_o;

	assign ch0_read_resp_kickoff = mcash_ch0_rtn_valid_o;
	assign ch1_read_resp_kickoff = mcash_ch1_rtn_valid_o;
	assign ch2_read_resp_kickoff = mcash_ch2_rtn_valid_o;

	always_ff @(posedge clk_i or posedge rst_i) begin
		if (rst_i) begin
			ch0_read_req_cnt_Q <= 'd0;
			ch1_read_req_cnt_Q <= 'd0;
			ch2_read_req_cnt_Q <= 'd0;
		end
		else begin
			// channel 0
			if (ch0_read_req_kickoff & ~ch0_read_resp_kickoff) begin
				ch0_read_req_cnt_Q <= ch0_read_req_cnt_Q + 'd1;
			end
			else if (~ch0_read_req_kickoff & ch0_read_resp_kickoff) begin
				ch0_read_req_cnt_Q <= ch0_read_req_cnt_Q - 'd1;
			end
			// channel 1
			if (ch1_read_req_kickoff & ~ch1_read_resp_kickoff) begin
				ch1_read_req_cnt_Q <= ch1_read_req_cnt_Q + 'd1;
			end
			else if (~ch1_read_req_kickoff & ch1_read_resp_kickoff) begin
				ch1_read_req_cnt_Q <= ch1_read_req_cnt_Q - 'd1;
			end
			// channel 2
			if (ch2_read_req_kickoff & ~ch2_read_resp_kickoff) begin
				ch2_read_req_cnt_Q <= ch2_read_req_cnt_Q + 'd1;
			end
			else if (~ch2_read_req_kickoff & ch2_read_resp_kickoff) begin
				ch2_read_req_cnt_Q <= ch2_read_req_cnt_Q - 'd1;
			end
		end
		
	end

endmodule