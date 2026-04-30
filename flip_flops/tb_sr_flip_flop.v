`timescale 1ns/1ps
//`include "../flip_flops/sr_flip_flop.v"
module tb_sr_flip_flop; // Removed 'slop' typo for consistency
    reg s, r, clk, rst_n;
    wire q, qbar;

    // 1. Module Instantiation
    sr_flip_flop uut(
        .s(s),
        .r(r),
        .clk(clk),
        .rst_n(rst_n),
        .q(q),
        .qbar(qbar)
    );
    always #10 clk=~clk;
        initial begin
        //$dumpvars(0,tb_sr_slip_slop);
        $dumpfile("sr_flip_flop_sim.vcd");// do not dumpvars before dumpfile the simulation might be frozen!!!!!
        $dumpvars(0,tb_sr_flip_flop);
        clk=0;
        rst_n=0;
        s=0;
        r=0;
        #15 rst_n=1;
        #10 s=1;r=0;    //set : q=1
        #10 s=0;r=0;    //hold previous q value
        #10 s=0;r=1;    //reset: q=0
        #10 s=0;r=0;    //hold previous q value
        #10 s=1;r=1;    // Invalid : q=x
        #20 $finish;
    end
    initial begin
        $monitor("Time=%0t  |rst_n=%b   |s=%b   r=%b    |q=%b   qbar=%b",$time,rst_n,s,r,q,qbar);
    end
endmodule