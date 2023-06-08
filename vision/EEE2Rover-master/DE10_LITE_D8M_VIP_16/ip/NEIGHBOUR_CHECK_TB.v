module NEIGHBOUR_CHECK_TB;
    reg clk;
    reg [2:0] x, y; //8 rows of 8 pixels
    reg threshold_met;

    wire [2:0] label;

    NEIGHBOUR_CHECK #(
        .LINE_WIDTH(8),
        .NUM_ADDR_BITS_X(3),
        .NUM_ADDR_BITS_Y(3)
        ) 
        NC (
        .clk(clk),
        .in_valid(1'b1),
        .x(x),
        .y(y),
        .threshold_met(threshold_met),
        .label(label)
    );

    initial begin
        clk = 1'b0;
        repeat(200) #10 clk = ~clk; // generate a clock
    end

    initial begin

        // test writing

        // first line
        x = 0;
        y = 0;
        threshold_met = 0;
        repeat(8) @(negedge clk) begin
            threshold_met = 0;
            x = x + 1;
        end

        x = 0;
        y = 1;
        repeat(5) @(negedge clk) begin
            threshold_met = 1;
            x = x + 1;
        end
        repeat(3) @(negedge clk) begin
            threshold_met = 0;
            x = x + 1;
        end

        x = 0;
        y = 2;
        repeat(4) @(negedge clk) begin
            threshold_met = 1;
            x = x + 1;
        end
        repeat(4) @(negedge clk) begin
            threshold_met = 0;
            x = x + 1;
        end

        x = 0;
        y = 3;
        repeat(4) @(negedge clk) begin
            threshold_met = 0;
            x = x + 1;
        end
        repeat(4) @(negedge clk) begin
            threshold_met = 1;
            x = x + 1;
        end

        x = 0;
        y = 4;
        repeat(4) @(negedge clk) begin
            threshold_met = 0;
            x = x + 1;
        end

        x = 0;
        y = 5;
        repeat(4) @(negedge clk) begin
            threshold_met = 1;
            x = x + 1;
        end

        x = 0;
        y = 6;
        repeat(4) @(negedge clk) begin
            threshold_met = 0;
            x = x + 1;
        end
        repeat(4) @(negedge clk) begin
            threshold_met = 1;
            x = x + 1;
        end

        x = 0;
        y = 7;
        repeat(4) @(negedge clk) begin
            threshold_met = 0;
            x = x + 1;
        end
        repeat(4) @(negedge clk) begin
            threshold_met = 1;
            x = x + 1;
        end
    

    end



endmodule