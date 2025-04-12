module spw_buffer #(
	parameter PTR_WIDTH  = 3,
	parameter DATA_WIDTH = 128
) (
	input  wire                  clk_i,
	input  wire                  rst_i,
	input  wire                  wr_en_i,
	input  wire [PTR_WIDTH-1:0]  write_ptr_i,
	input  wire [DATA_WIDTH-1:0] write_data_i,
	input  wire                  rd_en_i,
	input  wire [PTR_WIDTH-1:0]  read_ptr_i,
	output  wire                 read_data_valid_o,
	output wire [DATA_WIDTH-1:0] read_data_o
);

	parameter DEPTH = 1 << PTR_WIDTH;

	reg [DEPTH-1:0]      valid_array_In;
	reg [DEPTH-1:0]      valid_array_Q;
	reg [DATA_WIDTH-1:0] data_array_In  [DEPTH-1:0];
	reg [DATA_WIDTH-1:0] data_array_Q   [DEPTH-1:0];

	always @(*) begin
		valid_array_In = valid_array_Q;
		if (wr_en_i) begin
			valid_array_In[write_ptr_i] = 1'b1;
		end
		if (rd_en_i) begin
			valid_array_In[read_ptr_i] = 1'b0;
		end
	end

	always @(posedge clk_i or posedge rst_i) begin
		if (rst_i) begin
			valid_array_Q <= 'b0;
		end
		else begin
			valid_array_Q <= valid_array_In;
		end
	end

	always @(*) begin
		data_array_In = data_array_Q;
		data_array_In[write_ptr_i] = write_data_i;
	end

	always @(posedge clk_i) begin
		if (wr_en_i) begin
			data_array_Q <= data_array_In;
		end
	end

	assign read_data_valid_o = valid_array_Q[read_ptr_i];
	assign read_data_o       = data_array_Q[read_ptr_i];

endmodule