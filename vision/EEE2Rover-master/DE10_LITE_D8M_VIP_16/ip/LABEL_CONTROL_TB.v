// test with 8 lines of 8 bits

module LABEL_CONTROL_TB;
    reg clk, rst;
    reg [2:0] input_label;
    reg [2:0] x, y; // 3 bits for 8 lines of 8 bits

    wire [2:0] y_lower, y_upper;

    LABEL_CONTROL #(
        .NUM_ADDR_BITS_X(3),
        .NUM_ADDR_BITS_Y(3)
        ) 
        LB (
        .clk(clk),
        .input_label(input_label),
        .in_valid(1'b1),
        .x(x),
        .y(y),
        .rst(rst),
        .y_lower(y_lower),
        .y_upper(y_upper)
    );

    initial begin
        clk = 1'b0;
        repeat(200) #10 clk = ~clk; // generate a clock
    end

    initial begin

        // test writing
        rst = 1;

        // first line
        x = 0;
        y = 0;
        repeat(8) @(negedge clk) begin
            rst = 0;
            input_label = 0;
            x = x + 1;
        end

        x = 0;
        y = 1;
        repeat(5) @(negedge clk) begin
            input_label = 1;
            x = x + 1;
        end
        repeat(3) @(negedge clk) begin
            input_label = 0;
            x = x + 1;
        end

        x = 0;
        y = 2;
        repeat(4) @(negedge clk) begin
            input_label = 1;
            x = x + 1;
        end
        repeat(4) @(negedge clk) begin
            input_label = 0;
            x = x + 1;
        end

        x = 0;
        y = 3;
        repeat(4) @(negedge clk) begin
            input_label = 1;
            x = x + 1;
        end
        repeat(4) @(negedge clk) begin
            input_label = 2;
            x = x + 1;
        end

        x = 0;
        y = 4;
        repeat(4) @(negedge clk) begin
            input_label = 0;
            x = x + 1;
        end

        x = 0;
        y = 5;
        repeat(4) @(negedge clk) begin
            input_label = 2;
            x = x + 1;
        end

        x = 0;
        y = 6;
        repeat(4) @(negedge clk) begin
            input_label = 0;
            x = x + 1;
        end
        repeat(4) @(negedge clk) begin
            input_label = 2;
            x = x + 1;
        end

        x = 0;
        y = 7;
        repeat(4) @(negedge clk) begin
            input_label = 0;
            x = x + 1;
        end
        repeat(4) @(negedge clk) begin
            input_label = 2;
            x = x + 1;
        end
    

    end


endmodule