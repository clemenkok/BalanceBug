module RGB_TO_HSV_TB;
    reg clk, rst_n;
    reg [7:0] red, green, blue;
    wire [7:0] hue, sat, val;

    RGB_TO_HSV LB (
        .iCLK(clk),
        .iRST_N(rst_n),
        .iRed(red),
        .iGreen(green),
        .iBlue(blue),
        .oHue(hue),
        .oSat(sat),
        .oVal(val)
    );

    initial begin
        clk = 1'b0;
        repeat(20) #10 clk = ~clk; // generate a clock
    end

    initial begin
        red = 0;
        green = 0;
        blue = 0;
        rst_n = 1'b1;
        repeat(3) @(posedge clk) begin
            rst_n = 1'b1;
            red = 8'd100;
            green = 8'd150;
            blue = 8'd50;
        end
        @(posedge clk) begin
            rst_n = 1'b0;
        end
        repeat(3) @(posedge clk) begin
            rst_n = 1'b1;
            red = 8'd0;
            green = 8'd55;
            blue = 8'd105;
        end
    end

endmodule