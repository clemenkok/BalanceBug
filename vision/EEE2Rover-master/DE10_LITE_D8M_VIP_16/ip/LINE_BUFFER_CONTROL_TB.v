// Test with line width of 8
// Pixel Data Width of 8 too

module LINE_BUFFER_CONTROL_TB;
    reg clk;
    reg [2:0] x;
    reg [2:0] y;
    reg [7:0] wr_data;
    wire [23:0] top_row_data, mid_row_data, bottom_row_data;
    wire rd_valid;

    // [7:0] 8 bits of data per pixel
    // [0:63] a total of 64 pixels in 64 lines (8 lines of 8 pixels)
    reg [7:0] read_data [0:63];

    integer i;

    LINE_BUFFER_CONTROL #(
        .LINE_WIDTH(8),
        .PIXEL_DATA_WIDTH(8),
        .NUM_ADDR_BITS_X(3),
        .NUM_ADDR_BITS_Y(3)
        )
        LBC (
            .clk(clk),
            .x(x),
            .y(y),
            .wr_data(wr_data),
            .top_row_data(top_row_data),
            .mid_row_data(mid_row_data),
            .bottom_row_data(bottom_row_data),
            .rd_valid(rd_valid)
        );

    initial begin
        clk = 1'b0;
        repeat(300) #10 clk = ~clk; // generate a clock
    end

    initial begin
        x = 1'b0;
        y = 1'b0;
        i = 0;
        $readmemb("test_input_output_files/line_buffer_control_input.txt", read_data);
        repeat(60) @(posedge clk) begin
            wr_data = read_data[i]; 
            i = i + 1;
            if (x == 7) begin
                x = 0;
                y = y + 1;
            end
            else x = x + 1;
        end
    end

endmodule