`timescale 1ns/1ps
//`include "d_flip_flop.v"
module tb_d_dlip_dlop;
    reg d,clk,rst_n;
    wire q,qbar;
    d_flip_flop uut(
        .d(d),
        .q(q),
        .qbar(qbar),
        .clk(clk),
        .rst_n(rst_n)
    );

    always #10 clk = ~clk; // 10ns high, 10ns low
    initial begin
        $dumpfile("d_flip_flop_sim.vcd");//always write this before dumpvars else file won't be saved ,cannot run simulation/simulation broken.
        $dumpvars(0,tb_d_dlip_dlop);
       // Initialize
        clk = 0; rst_n = 0; d = 0;

    // --- PULSE 1 (Edge at 10ns) ---
    // d=0, rst_n=0 -> Q should stay 0
    
    // --- PULSE 2 (Edge at 30ns) ---
        #20 d = 1; 
    // Even though d=1, rst_n is still 0. Q must stay 0.
    // This proves the Asynchronous Reset overrides Data.

    // --- PULSE 3 (Edge at 50ns) ---
        #20 rst_n = 1; d = 0; 
    // Reset is released. d=0. Q should stay 0.

    // --- PULSE 4 (Edge at 70ns) ---
        #20 d = 1; 
    // rst_n is 1. d=1. Q should finally transition to 1.

    #20 $finish; // Total Simulation Time: 80ns (to see the final state clearly)

    end
    initial begin
        $monitor("| Time=%5t    |   d=%b    |   n_rst=%b    |   q=%b    |   qbar=%b |",$time,d,rst_n,q,qbar);// terminal output to watch
    end
    
endmodule
