//module used for one color channel

module GAUSSIAN_BLUR #(
    parameter LINE_WIDTH = 640,
    //parameter LINE_COUNT = 480,
    parameter PIXEL_DATA_WIDTH = 24,
    parameter NUM_ADDR_BITS_X = 10, // 10 bits needed to address 640 width
    parameter NUM_ADDR_BITS_Y = 9 // 9 bits needed for 480 lines
) (
    input wire                              clk,
    input wire [NUM_ADDR_BITS_X-1:0]        x, //x coordinate of pixel
    input wire [NUM_ADDR_BITS_Y-1:0]        y, //y coordinate of pixel

    // current pixel data
    input wire [PIXEL_DATA_WIDTH-1:0]       curr_pixel_data,
    output wire [PIXEL_DATA_WIDTH-1:0]      blurred_pixel_data
);

wire [3*PIXEL_DATA_WIDTH-1:0] top_row_data, mid_row_data, bottom_row_data;
wire rd_valid;

integer i;

// write current_pixel_data into the line buffer
// read the 3x3 data from the line buffer too

LINE_BUFFER_CONTROL #(
    .LINE_WIDTH(LINE_WIDTH),
    .PIXEL_DATA_WIDTH(PIXEL_DATA_WIDTH),
    .NUM_ADDR_BITS_X(NUM_ADDR_BITS_X),
    .NUM_ADDR_BITS_Y(NUM_ADDR_BITS_Y)
)
    LBC(
    .clk(clk),
    .x(x),
    .y(y),
    .wr_data(curr_pixel_data),
    .top_row_data(top_row_data),
    .mid_row_data(mid_row_data),
    .bottom_row_data(bottom_row_data),
    .rd_valid(rd_valid)
);

wire [9*PIXEL_DATA_WIDTH-1:0] color_matrix;
assign color_matrix = {top_row_data, mid_row_data, bottom_row_data};

GAUSSIAN_CONVOLUTION #(
    .PIXEL_ONE_COLOR_DATA_WIDTH(PIXEL_DATA_WIDTH)
    )
    GC (
    .color_matrix(color_matrix),
    .return_black(!rd_valid),
    .conv_result(blurred_pixel_data)
);


endmodule