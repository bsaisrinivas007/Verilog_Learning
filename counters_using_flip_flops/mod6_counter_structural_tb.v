`timescale 1ns/1ps
`include "mod6_counter_structural.v"

module mod6_counter_tb;
    reg clk;
    reg rst;
    wire q2, q1, q0;
    wire q2_bar, q1_bar, q0_bar;

    // Instantiate your optimized structural Mod-6 counter
    mod6_counter dut (
        .clk(clk),
        .rst(rst),
        .q2(q2),
        .q2_bar(q2_bar),
        .q1(q1),
        .q1_bar(q1_bar),
        .q0(q0),
        .q0_bar(q0_bar)
    );

    // Generate Clock: 10ns period (toggles every 5ns)
    always #5 clk = ~clk;

    initial begin
        // Setup GTKWave dump files
        $dumpfile("mod6_structural_sim.vcd");
        $dumpvars(0, mod6_counter_tb);

        // Initialize and apply reset
        clk = 0;
        rst = 1;
        #12; // Release reset at 12ns (safely away from the 10ns clock edge)
        
        rst = 0;

        // Run long enough to watch the counter step 0 -> 1 -> 2 -> 3 -> 4 -> 5 -> 0 multiple times
        #140;

        $display("Structural Mod-6 counter simulation complete!");
        $finish;
    end
endmodule