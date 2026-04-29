`timescale 1ns/1ps

module tb_ripple_carry_adder;
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;
    
    // For Checker
    reg [4:0] expected; 
    integer i, j;

    rca_4bit uut (.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));

    initial begin
        $dumpfile("rca_test.vcd");
        $dumpvars(0, tb_ripple_carry_adder);
        
        A = 0; B = 0; Cin = 0;
        
        $display("Time | A + B + Cin | Result | Expected | Status");
        
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                A = i; B = j; Cin = 0;
                #1;
                
                expected = A + B + Cin;
                
                if ({Cout, Sum} === expected)
                    $display("%4t | %d + %d + %d |   %d   |    %d    | PASS", $time, A, B, Cin, {Cout, Sum}, expected);
                else
                    $display("%4t | %d + %d + %d |   %d   |    %d    | FAIL", $time, A, B, Cin, {Cout, Sum}, expected);
            end
        end
        $finish;
    end
endmodule