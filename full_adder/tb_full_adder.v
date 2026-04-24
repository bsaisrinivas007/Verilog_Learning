
`timescale 1ns/1ps
module tb_full_adder;
    reg a, b,cin;
    wire sum, cout;
    full_adder uut ( 
        .a(a),
        .b(b),
        .sum(sum),
        .cout(cout),
        .cin(cin)

    );
    initial begin
        $dumpfile("full_adder_sim.vcd");
        $dumpvars(0,tb_full_adder);
        //$monitor("Time=%0t | a=%b b=%b | S=%b c=%b",$time,$a,$b,$sum,$carry);
        a=0;b=0;cin=0;#1;
        a=0;b=0;cin=1;#1;
        a=0;b=1;cin=0;#1;
        a=0;b=1;cin=1;#1;
        a=1;b=0;cin=0;#1;
        a=1;b=0;cin=1;#1;
        a=1;b=1;cin=0;#1;
        a=1;b=1;cin=1;#1;
        
        $finish;
    end
endmodule