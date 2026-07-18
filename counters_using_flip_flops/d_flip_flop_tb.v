`timescale 1ns/1ps
`include "d_flip_flop.v"

module d_flip_flop_tb;
    reg clk;
    reg rst;
    reg d;
    wire q;
    wire q_bar;

    // Instantiate your D Flip-Flop module
    d_flip_flop dut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q),
        .q_bar(q_bar)
    );

    // Generate Clock: 10ns period (toggles every 5ns)
    always #5 clk = ~clk;
initial begin
        $dumpfile("d_flip_flop_sim.vcd");
        $dumpvars(0, d_flip_flop_tb);

        // Initialize inputs
        clk = 0;
        rst = 1; // Assert reset immediately
        d = 0;   // Q is forced to 0
        
        // Toggle D while reset is active to prove it's ignored
        #3 d = 1; // At 3ns: D goes high, but Q must stay 0!
        #5 d = 0; // At 8ns (3+5): D goes low, Q must stay 0!
        
        #4 rst = 0; // At 12ns (8+4): De-assert reset
        
        // Normal operation continues...
        #5 d = 1;  // At 17ns: Set D high for the upcoming 25ns clock edge
        #10;     
        d = 0;
        #10;
        
        $finish;
    end
endmodule