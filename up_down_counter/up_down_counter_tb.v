`include "./up_down_counter.v"
`timescale 1ns/10ps
module up_down_counter_tb;
    reg clk;
    reg rst;
    reg up_down;
    wire [3:0] q;

    // Instantiate a 4-bit instance of the counter
    up_down_counter #(.Width(4)) dut (
        .clk(clk),
        .rst(rst),
        .up_down(up_down),
        .q(q)
    );

    // Generate a 10ns clock period (50MHz)
    always #5 clk = ~clk;

    initial begin
        // Setup GTKWave dump
        $dumpfile("counter_sim.vcd");
        $dumpvars(0, up_down_counter_tb);

        // Initialize signals
        clk = 0;
        rst = 1;
        up_down = 1;

        // Release rst after 2 clock cycles
        #15;
        rst = 0;
        //$display("--- Counting Up ---");
        
        // Let it count up for 60ns
        #60;
        
        // Change direction to down
        //$display("--- Changing Direction: Counting Down ---");
        up_down = 0;
        
        // Let it count down for 60ns
        #60;

        // Trigger rst to verify synchronous clearing behavior
        //$display("--- Triggering Synchronous rst ---");
        rst = 1;
        #10;
        rst = 0;
        
        #20;
        $finish;
    end

    // Monitor value changes in the terminal
    initial begin
        $monitor("Time = %0tns \t | rst = %b \t | Up_Down = %b \t | q = %d (%b)", 
                 $time, rst, up_down, q, q);
    end

endmodule