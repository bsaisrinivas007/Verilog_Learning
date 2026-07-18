`timescale 1ns/1ps
`include "RCA4.v"

module RCA4_tb;
    reg [3:0] a;
    reg [3:0] b;
    reg c0;
    wire [3:0] s;
    wire cout;

    // Standard integer variables used for loop counting
    integer i, j;

    // Instantiate the DUT positionally: (s, cout, a, b, c0)
    RCA4 dut(s, cout, a, b, c0);

    initial begin
        $dumpfile("RCA4_loop_sim.vcd");
        $dumpvars(0, RCA4_tb);

        $display("Starting comprehensive test...");
        
        c0 = 0; // Fix carry-in to 0 for this sweep

        // Nested loops to sweep through all 16 values of 'a' and '16' values of 'b'
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                
                a = i; // Assign integer value to the 4-bit reg
                b = j; // Assign integer value to the 4-bit reg
                
                #5; // Wait 5ns for the combinational logic to settle
                
                // Optional: Print out mismatching errors or status logs
                $display("a=%b, b=%b | s= %b, cout= %b", a, b, s, cout);
            end
        end

        $display("All 256 combinations simulated successfully.");
        $finish;
    end
endmodule