module LINE_BUFFER #(
    parameter LINE_WIDTH = 640,
    parameter PIXEL_DATA_WIDTH = 24,
    parameter NUM_ADDR_BITS = 10
) (
    input wire                              clk,
    input wire                              wr_en,

    // Read and Write
    input wire [PIXEL_DATA_WIDTH-1:0]       wr_data, // write 1 pixel at a time
    output wire [3*PIXEL_DATA_WIDTH-1:0]    rd_data, // return 3 pixels at a time
    input wire  [NUM_ADDR_BITS-1:0]         addr     // 10 bits needed to address 640 bits
);

    reg [PIXEL_DATA_WIDTH-1:0] mem [LINE_WIDTH-1:0];
    reg [PIXEL_DATA_WIDTH-1:0] prev_prev_read, prev_read;
    reg [3*PIXEL_DATA_WIDTH-1:0] rd_data_internal;
    assign rd_data = rd_data_internal;

    /*
    initial prev_prev_read = {PIXEL_DATA_WIDTH{1'b0}};
    initial prev_read = {PIXEL_DATA_WIDTH{1'b0}};
    */

    // write on clk rising edge if wr_en
    always@(posedge clk) begin
        if (wr_en) begin
            mem[addr] <= wr_data;
        end
        //rd_data_internal <= {mem[addr-1], mem[addr], mem[addr+1]};
        rd_data_internal <= {prev_prev_read, prev_read, mem[addr+1]};
    end
    /*
    always@(negedge clk) begin
        prev_prev_read <= prev_read;
        prev_read <= rd_data_internal[PIXEL_DATA_WIDTH-1:0];
    end
    */

endmodule