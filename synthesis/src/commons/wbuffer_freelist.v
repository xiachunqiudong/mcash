module wbuffer_freelist #(
  parameter WBUFFER_AW     = 5,
  parameter FREELIST_WIDTH = 1 << WBUFFER_AW
)(
  input  wire                  clk,
  input  wire                  rst,
  input  wire                  allocate_req,
  output wire                  allocate_allowIn,
  output reg  [WBUFFER_AW-1:0] allocate_wbufferID,
  input  wire                  free_req,
  input  wire [WBUFFER_AW-1:0] free_wbufferID
);

  reg  [FREELIST_WIDTH-1:0] freelist_In;
  reg  [FREELIST_WIDTH-1:0] freelist_Q;

  assign allocate_allowIn = |freelist_Q;

  always @(*) begin
    allocate_wbufferID = 'd0;
    for (int i = 0; i < FREELIST_WIDTH; i = i + 1) begin
      if (freelist_Q[i] == 1'b1) begin
        allocate_wbufferID = i;
        break;
      end
    end
  end

  always @(*) begin
    freelist_In = freelist_Q;
    if (free_req) begin
      freelist_In[free_wbufferID] = 1'b1;
    end
    if (allocate_req & allocate_allowIn) begin
      freelist_In[allocate_wbufferID] = 1'b0;
    end
  end

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      freelist_Q <= '1;
    end
    else begin
      freelist_Q <= freelist_In;
    end
  end

endmodule