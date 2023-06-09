// assigns labels

module NEIGHBOUR_CHECK #(
    parameter LINE_WIDTH = 640,
    parameter NUM_ADDR_BITS_X = 10,
    parameter NUM_ADDR_BITS_Y = 9 // 9 bits needed for 480 lines
) (
    input wire                              clk,
    input wire [NUM_ADDR_BITS_X-1:0]        x, //x coordinate of pixel
    input wire [NUM_ADDR_BITS_Y-1:0]        y, //y coordinate of pixel

    //input wire [2:0]                        current_label_ptr, // curr_label_ptr is the highest label number that HAS BEEN USED
    input wire                              threshold_met,
    input wire                              in_valid,

    output wire [2:0]                       label // 0 means no detection, 1-7 are labels for 7 distinct objects
);

wire [3*3-1:0] line0_rdata, line1_rdata;
wire [2:0] prev_pix_label;

// control which line to read or write to
reg line_wr_select_in;
initial line_wr_select_in = 1'b0;
assign line_wr_select = line_wr_select_in;

// 2 Line Buffers. 1 for row above and 1 for current, stores whether a particular pixel has THRESHOLD MET
LINE_BUFFER #(
    .LINE_WIDTH(LINE_WIDTH),
    .PIXEL_DATA_WIDTH(3), // the label
    .NUM_ADDR_BITS(NUM_ADDR_BITS_X)
)
    line0 (
    .clk(clk),
    .wr_en(line_wr_select == 0),
    .wr_data(prev_pix_label),
    .rd_data(line0_rdata),
    .addr(x),
    .in_valid(in_valid)
);

LINE_BUFFER #(
    .LINE_WIDTH(LINE_WIDTH),
    .PIXEL_DATA_WIDTH(3), // the label
    .NUM_ADDR_BITS(NUM_ADDR_BITS_X)
)
    line1 (
    .clk(clk),
    .wr_en(line_wr_select == 1),
    .wr_data(prev_pix_label),
    .rd_data(line1_rdata),
    .addr(x),
    .in_valid(in_valid)
);




//initial line_wr_select = 1'b0;

always@(posedge clk) begin
    if (in_valid) begin
        if (x == 0 && y == 0) begin
            line_wr_select_in <= 0;
        end
        else if (x == LINE_WIDTH-1) begin
            line_wr_select_in <= ~line_wr_select_in;
        end
    end
end

reg [3*3-1:0] top_row_data_in;



always@* begin
    case(line_wr_select_in)
        0: begin   
            top_row_data_in = line1_rdata;
        end
        1: begin
            top_row_data_in = line0_rdata;
        end
    endcase
end

reg [2:0] curr_label_ptr;
initial curr_label_ptr = 0;

reg [2:0] curr_label;

reg [2:0] prev_pix_label_in;
initial prev_pix_label_in = 3'b0;

assign label = prev_pix_label_in;
assign prev_pix_label = prev_pix_label_in;

// no detection if the first line is not yet filled.
always@(posedge clk) begin
    if (in_valid) begin
        if (x == 0) begin
            curr_label = 0;
            //prev_pix_label = 0;
        end
        else begin
            // if all equals to zero
            if (x == 0 || x == 1 || x == 2) begin
                curr_label = 0;
                prev_pix_label_in = 0;
            end
            if (top_row_data_in == 0 & prev_pix_label_in == 0) begin
                // if threshold not met, let label continue to be zero
                if (~threshold_met) curr_label = 0;
                else begin
                    if (curr_label_ptr == 6) curr_label = curr_label_ptr + 1;
                    else begin
                        curr_label = curr_label_ptr + 1;
                        curr_label_ptr = curr_label_ptr + 1;
                    end
                end
            end
            // if any of the top row or left pixel has a label not zero, take that value
            else if (prev_pix_label_in != 0) curr_label = prev_pix_label_in;
            else if (top_row_data_in[2:0] != 0) curr_label = top_row_data_in[2:0];
            else if (top_row_data_in[5:3] != 0) curr_label = top_row_data_in[5:3];
            else if (top_row_data_in[8:6] != 0) curr_label = top_row_data_in[8:6];
        end
    end
end

always@(posedge clk) begin
    if (in_valid) begin
        prev_pix_label_in <= curr_label;
    end
end

endmodule
