`include "FA.v"
//module RCA4( output s[3:0], cout, input a[3:0], b[3:0], c0);

//module RCA4( output [3:0] s, cout, input [3:0] a, [3:0] b,  c0);
 // Width goes BEFORE the name
// Width goes BEFORE the name
module RCA4(output [3:0] s, output cout, input [3:0] a, input [3:0] b, input c0);
wire c1, c2, c3;
FA fa0(s[0], c1, a[0], b[0], c0);
FA fa1(s[1], c2, a[1], b[1], c1);
FA fa2(s[2], c3, a[2], b[2], c2);
FA fa3(s[3], cout, a[3], b[3], c3);

endmodule