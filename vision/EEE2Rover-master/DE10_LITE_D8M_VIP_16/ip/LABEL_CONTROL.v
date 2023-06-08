module LABEL_CONTROL#(
    parameter NUM_ADDR_BITS_X = 10,
    parameter NUM_ADDR_BITS_Y = 9 // 9 bits needed for 480 lines
) (
    input wire                              clk,
    input wire [2:0]                        input_label,
    input wire                              in_valid,
    input wire [NUM_ADDR_BITS_X-1:0]        x, //x coordinate of pixel
    input wire [NUM_ADDR_BITS_Y-1:0]        y, //y coordinate of pixel
    input wire                              rst,

    output wire [NUM_ADDR_BITS_Y-1:0]       y_lower, 
    output wire [NUM_ADDR_BITS_Y-1:0]       y_upper         
);

integer j;

// number of pixels under each label
reg [14:0] label_pixel_num [7:0];
// y_min and y_max for each label
reg [NUM_ADDR_BITS_Y-1:0] y_min [7:0];
reg [NUM_ADDR_BITS_Y-1:0] y_max [7:0];

reg [14:0] curr_high_label_pixel_num;
initial curr_high_label_pixel_num = 0;
reg [7:0] curr_high_label;
initial curr_high_label = 1;

assign y_lower = y_min[curr_high_label];
assign y_upper = y_max[curr_high_label];
    
always@(posedge clk) begin
    if (rst) begin
        for (j=0; j < 8; j=j+1) begin
            label_pixel_num[j] <= 15'b0; //reset array
            y_min[j] <= {NUM_ADDR_BITS_Y{1'b1}};
            y_max[j] <= {NUM_ADDR_BITS_Y{1'b0}};
        end
        curr_high_label_pixel_num <= 15'b0;
        curr_high_label <= 1;
    end
    if (in_valid) begin
        // update label array when there is new input label passed to this module
        if (input_label != 0) begin
            label_pixel_num[input_label] <=  label_pixel_num[input_label] + 1;
            if (label_pixel_num[input_label] + 1 >  curr_high_label_pixel_num) begin
                curr_high_label_pixel_num <= label_pixel_num[input_label] + 1;
                curr_high_label <= input_label;
            end
            if (y < y_min[input_label]) y_min[input_label] <= y;
            if (y > y_max[input_label]) y_max[input_label] <= y;

        end
    end
end


endmodule