`timescale 1ns/1ps
`include "mod6_counter_behavioural.v"

module mod6_counter_behavioural_tb;
    reg clk;
    reg rst;
    wire [2:0] q;

    // Instantiate the behavioral Mod-6 counter
    mod6_counter_behavioural dut (
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    // Generate Clock: 10ns period (toggles every 5ns)
    always #5 clk = ~clk;

    initial begin
        // Setup GTKWave dump files
        $dumpfile("mod6_behavioural_sim.vcd");
        $dumpvars(0, mod6_counter_behavioural_tb);

        // Initialize and apply reset
        clk = 0;
        rst = 1;
        #12; // Release reset at 12ns
        
        rst = 0;

        // Run long enough to see the sequence multiple times
        #140;

        $display("Behavioral Mod-6 counter simulation complete!");
        $finish;
    end
endmodule