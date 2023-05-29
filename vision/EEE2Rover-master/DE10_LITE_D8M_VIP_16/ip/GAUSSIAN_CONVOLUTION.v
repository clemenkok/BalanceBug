// 3x3 Gaussian Convolution for a single color

module GAUSSIAN_CONVOLUTION #(
    parameter PIXEL_ONE_COLOR_DATA_WIDTH = 8
) (
    input wire [3*3*PIXEL_ONE_COLOR_DATA_WIDTH-1:0]       color_matrix,
    // if return black is true, just return a black pixel
    input wire                                            return_black,
    output wire [PIXEL_ONE_COLOR_DATA_WIDTH-1:0]          conv_result
);
    
    integer i;

    // define the 3x3 gaussian kernal (multiplied by 16)
    /*
    1 2 1
    2 4 2
    1 2 1
    */

    reg  [7:0]  kernel [8:0];
    reg  [7:0]  pixel_data [8:0];
    reg  [9:0] multipled_elements [8:0];

    reg [PIXEL_ONE_COLOR_DATA_WIDTH-1 +4:0]   sum;

    assign conv_result = sum[PIXEL_ONE_COLOR_DATA_WIDTH-1:0];

    initial begin
        kernel[0] = 1;
        kernel[1] = 2;
        kernel[2] = 1;
        kernel[3] = 2;  
        kernel[4] = 4;
        kernel[5] = 2;
        kernel[6] = 1;
        kernel[7] = 2;
        kernel[8] = 1;
    end

    // combinational circuit that gives the result of the convolution
    always@* begin
        if (return_black) begin
            sum = {PIXEL_ONE_COLOR_DATA_WIDTH{1'b0}};
        end
        else begin
            for(i=0; i<9; i=i+1) begin
                pixel_data[i] = color_matrix[i*PIXEL_ONE_COLOR_DATA_WIDTH +: PIXEL_ONE_COLOR_DATA_WIDTH];
                multipled_elements[i] = (kernel[i] * pixel_data[i]);
            end
        sum = (multipled_elements[0] + multipled_elements[1] + multipled_elements[2] + multipled_elements[3] + multipled_elements[4] + multipled_elements[5] + multipled_elements[6] + multipled_elements[7] + multipled_elements[8]) >> 4;
        end
    end

endmodule