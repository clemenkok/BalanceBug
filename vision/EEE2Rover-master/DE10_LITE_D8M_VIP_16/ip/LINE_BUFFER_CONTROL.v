// This module controls 4 line buffers
// 3 previous filled lines, and 1 buffer updating the current line

// It reads the 3x3 pixel data needed to convolve with the Gaussian kernel
// from the 3 lines above the current line

// And writes the current pixel into the 4th line buffer

module LINE_BUFFER_CONTROL #(
    parameter LINE_WIDTH = 640,
    //parameter LINE_COUNT = 480,
    parameter PIXEL_DATA_WIDTH = 24,
    parameter NUM_ADDR_BITS_X = 10, // 10 bits needed to address 640 width
    parameter NUM_ADDR_BITS_Y = 9 // 9 bits needed for 480 lines
) (
    input wire                              clk,
    input wire [NUM_ADDR_BITS_X-1:0]        x, //x coordinate of pixel
    input wire [NUM_ADDR_BITS_Y-1:0]        y, //y coordinate of pixel

    // write one pixel data
    input wire [PIXEL_DATA_WIDTH-1:0]       wr_data,

    // 3 rows of output to convolve with Gaussian kernal
    output wire [3*PIXEL_DATA_WIDTH-1:0]    top_row_data,
    output wire [3*PIXEL_DATA_WIDTH-1:0]    mid_row_data,
    output wire [3*PIXEL_DATA_WIDTH-1:0]    bottom_row_data,

    output wire                             rd_valid
);

    // the read output is not valid if the 3 line buffers have not yet been filled
    // the read output is also invalid for x = 1 and x = LINE_WIDTH-1
    assign rd_valid = ~((y < 3) || (x == 0) || (x == 1) || (x == 2));

    // Determine which line is the current line and which are the 3 above
    // Start filling from line 1, 2, 3, 4, 1, 2, 3, 4...
    reg [1:0] lb_wr_select;
    
    initial lb_wr_select = 2'd0;

    always@(posedge clk) begin
        if (x == 0 && y == 0) begin
            lb_wr_select <= 2'd0;
        end
        else if (x == LINE_WIDTH-1) begin
            if (lb_wr_select == 3) lb_wr_select <= 0;
            else lb_wr_select <= lb_wr_select + 1;
        end
    end

    reg [3*PIXEL_DATA_WIDTH-1:0] top_row_data_in, mid_row_data_in, bottom_row_data_in;
    assign top_row_data = top_row_data_in;
    assign mid_row_data = mid_row_data_in;
    assign bottom_row_data = bottom_row_data_in;

    // if we are writing to one line
    // we have to read from the other lines in the correct order

    wire [3*PIXEL_DATA_WIDTH-1:0] lb0_rdata;
    wire [3*PIXEL_DATA_WIDTH-1:0] lb1_rdata;
    wire [3*PIXEL_DATA_WIDTH-1:0] lb2_rdata;
    wire [3*PIXEL_DATA_WIDTH-1:0] lb3_rdata;

    always@* begin
        case(lb_wr_select)
            0: begin   
                top_row_data_in = lb1_rdata;
                mid_row_data_in = lb2_rdata;
                bottom_row_data_in = lb3_rdata;
            end
            1: begin
                top_row_data_in = lb2_rdata;
                mid_row_data_in = lb3_rdata;
                bottom_row_data_in = lb0_rdata;
            end
            2: begin
                top_row_data_in = lb3_rdata;
                mid_row_data_in = lb0_rdata;
                bottom_row_data_in = lb1_rdata;
            end
            3: begin
                top_row_data_in = lb0_rdata;
                mid_row_data_in = lb1_rdata;
                bottom_row_data_in = lb2_rdata;
            end
        endcase
    end

    // instantiate the line buffers and have wr_en correctly set
    // and read to the correct vars
    LINE_BUFFER #(
        .LINE_WIDTH(LINE_WIDTH),
        .PIXEL_DATA_WIDTH(PIXEL_DATA_WIDTH),
        .NUM_ADDR_BITS(NUM_ADDR_BITS_X)
    )
        lb0 (
        .clk(clk),
        .wr_en(lb_wr_select == 0),
        .wr_data(wr_data),
        .rd_data(lb0_rdata),
        .addr(x)
    );

    LINE_BUFFER #(
        .LINE_WIDTH(LINE_WIDTH),
        .PIXEL_DATA_WIDTH(PIXEL_DATA_WIDTH),
        .NUM_ADDR_BITS(NUM_ADDR_BITS_X)
    )
        lb1 (
        .clk(clk),
        .wr_en(lb_wr_select == 1),
        .wr_data(wr_data),
        .rd_data(lb1_rdata),
        .addr(x)
    );

    LINE_BUFFER #(
        .LINE_WIDTH(LINE_WIDTH),
        .PIXEL_DATA_WIDTH(PIXEL_DATA_WIDTH),
        .NUM_ADDR_BITS(NUM_ADDR_BITS_X)
    )
        lb2 (
        .clk(clk),
        .wr_en(lb_wr_select == 2),
        .wr_data(wr_data),
        .rd_data(lb2_rdata),
        .addr(x)
    );

    LINE_BUFFER #(
        .LINE_WIDTH(LINE_WIDTH),
        .PIXEL_DATA_WIDTH(PIXEL_DATA_WIDTH),
        .NUM_ADDR_BITS(NUM_ADDR_BITS_X)
    )
        lb3 (
        .clk(clk),
        .wr_en(lb_wr_select == 3),
        .wr_data(wr_data),
        .rd_data(lb3_rdata),
        .addr(x)
    );
    
endmodule