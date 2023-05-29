`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module GAUSSIAN_CONVOLUTION_TB;

    reg [3*3*8-1:0] color_matrix;
    wire [7:0]       conv_result;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;  

    reg return_black;

    GAUSSIAN_CONVOLUTION CONV (
        .color_matrix(color_matrix),
        .conv_result(conv_result),
        .return_black(return_black)
    );
    
    initial // initial block executes only once
        begin
            return_black = 0;
            // values for a and b
            color_matrix = {8'd255, 8'd255, 8'd255, 8'd255, 8'd255, 8'd255, 8'd255, 8'd255, 8'd255};
            #period; // wait for period 

            color_matrix = {8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0};
            #period;

            color_matrix = {8'd255, 8'd10, 8'd45, 8'd65, 8'd36, 8'd47, 8'd53, 8'd111, 8'd200};
            #period;

            return_black = 1;

            color_matrix = {8'd255, 8'd255, 8'd255, 8'd255, 8'd255, 8'd255, 8'd255, 8'd255, 8'd255};
            #period; // wait for period 

            color_matrix = {8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0, 8'd0};
            #period;

            color_matrix = {8'd255, 8'd10, 8'd45, 8'd65, 8'd36, 8'd47, 8'd53, 8'd111, 8'd200};
            #period;

        end
endmodule