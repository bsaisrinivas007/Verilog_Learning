`include "sr_flip_flop.v"
module d_flip_flop(
    input clk,
    input rst,
    input d,
    output q,
    output  q_bar
    );
    wire d_bar;
    assign d_bar = ~d;
    sr_flip_flop sr1 (clk, rst, d, d_bar, q, q_bar); // calling instance of sr module with conditions to get d flip flop directly.
endmodule