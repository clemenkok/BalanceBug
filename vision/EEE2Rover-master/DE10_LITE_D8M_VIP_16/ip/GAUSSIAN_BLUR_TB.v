// Test with line width of 8
// Pixel Data Width of 24 (3 colors)

module GAUSSIAN_BLUR_TB;
    reg clk;
    reg [10:0] x;
    reg [10:0] y;
    
    reg [7:0] curr_pixel_data;
    wire [7:0] blurred_pixel_data;

    integer write_data;
    integer i;

    // [7:0] 8 bits of data per pixel color
    // [0:63] a total of 64 pixels in 64 lines (8 lines of 8 pixels)
    reg [7:0] read_data [0:2073600];

    GAUSSIAN_BLUR #(
        .LINE_WIDTH(1920),
        .PIXEL_DATA_WIDTH(8),
        .NUM_ADDR_BITS_X(11),
        .NUM_ADDR_BITS_Y(11)
    )
        GB (
        .clk(clk),
        .x(x),
        .y(y),
        .curr_pixel_data(curr_pixel_data),
        .blurred_pixel_data(blurred_pixel_data)
    );

    initial begin
        clk = 1'b0;
        repeat(2073601*2) #10 clk = ~clk; // generate a clock
    end

    initial begin
        x = 1'b0;
        y = 1'b0;
        i = 0;
        $readmemh("test_input_output_files/rolls_blue_channel.txt", read_data);
        write_data = $fopen("test_input_output_files/rolls_blue_channel_out.txt");
        repeat(2073601) @(posedge clk) begin
            curr_pixel_data = read_data[i];
            $fdisplay(write_data, "%h", blurred_pixel_data);
            i = i + 1;
            if (x == 1919) begin
                x = 0;
                y = y + 1;
            end
            else x = x + 1;
        end
        $fclose(write_data);
    end

endmodule