module LINE_BUFFER_TB;
    reg clk, wr_en;
    wire [23:0] rd_data;
    reg [7:0] wr_data;
    reg [2:0] addr;


    LINE_BUFFER #(
        .LINE_WIDTH(8),
        .PIXEL_DATA_WIDTH(8),
        .NUM_ADDR_BITS(3)
        ) 
        LB (
        .clk(clk),
        .wr_en(wr_en),
        .wr_data(wr_data),
        .rd_data(rd_data),
        .addr(addr)
    );

    initial begin
        clk = 1'b0;
        repeat(50) #10 clk = ~clk; // generate a clock
    end

    initial begin

        // test writing
        wr_en = 1;
        wr_data = 8'd240;
        addr = 3'd0;
        repeat(3) @(negedge clk) begin // wait for reset
            wr_data = wr_data + 1;
            addr = addr + 1;
        end
        @(negedge clk) begin
            wr_data = wr_data + 1;
        end
        repeat(3) @(negedge clk) begin // wait for reset
            wr_data = wr_data + 1;
            addr = addr + 1;
        end

        // test reading
        @(negedge clk) begin
            wr_en = 0;
            addr = 3'd0;
        end
        repeat(6) @(negedge clk) begin // wait for reset
            addr = addr + 1;
        end
    
    end

endmodule