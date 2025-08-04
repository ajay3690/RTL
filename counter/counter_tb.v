`timescale 1ns / 1ps

module counter_tb;

    // Declare testbench signals
    reg clk;
    reg rst_n;
    wire [4:0] count;
    wire [3:0] even_count;
    wire [2:0] odd_count;

    // Instantiate the counter module
    counter c1 (
        .clk(clk),
        .rst_n(rst_n),
        .count(count),
        .even_count(even_count),
        .odd_count(odd_count)
    );

    // Clock generation: 10ns period (100 MHz)
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        rst_n = 0;

        // Apply reset
        #10;
        rst_n = 1;

        // Let the counter run for 40 cycles (adjust as needed)
        #400;

        // Finish simulation
        $stop;
    end

    // Optional: monitor values during simulation
    initial begin
        $display("Time\tclk\trst_n\tcount\teven_count\todd_count");
        $monitor("%0t\t%b\t%b\t%0d\t%0d\t\t%0d", $time, clk, rst_n, count, even_count, odd_count);
    end

endmodule
