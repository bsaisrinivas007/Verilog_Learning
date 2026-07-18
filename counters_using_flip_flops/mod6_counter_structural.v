`include "d_flip_flop.v"
module mod6_counter(
    input clk,
    input rst,

    output q2,
    output q2_bar,
    output q1,
    output q1_bar,
    output q0,
    output q0_bar
    
);
wire d2,d1,d0;
wire y1,y2;
wire y3,y4;



    assign d0 = q0_bar; //LSB

    and g1 (y1,q1,q0_bar);
    and g2 (y2,q2_bar,q1_bar,q0);
    or  g3 (d1,y1,y2);//d1

    and g4 (y3,q1,q0);
    and g5 (y4,q2,q0_bar);
    or  g6 (d2,y3,y4);//msb


d_flip_flop dc(clk, rst, d2, q2, q2_bar);//msb
d_flip_flop db(clk, rst, d1, q1, q1_bar);
d_flip_flop da(clk, rst, d0, q0, q0_bar);//lsb

endmodule