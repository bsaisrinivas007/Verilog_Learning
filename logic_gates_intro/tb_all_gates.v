//`include "all_gates.v" 
`timescale 1ns/1ps
// Include the all_gates module file  
/*writing inputs to all_gates.v file */
module tb_all_gates;
    reg a, b; // Test inputs
    wire out_and, out_or, out_not_a, out_nand, out_nor, out_xor; // Outputs from the all_gates module
    // Instantiate the all_gates module
    all_gates uut (
        .a(a),
        .b(b),
        .out_and(out_and),
        .out_or(out_or),
        .out_not_a(out_not_a),
        .out_nand(out_nand),
        .out_nor(out_nor),
        .out_xor(out_xor)
    );
    initial begin
        $dumpfile("gates_sim.vcd"); // Create a VCD file for waveform viewing
        $dumpvars(0, tb_all_gates); // Dump all variables in the testbench
        // Test case 1: a = 0, b = 0
        a = 0; b = 0;
        #10; // Wait for 10 time units
        // Test case 2: a = 0, b = 1
        a = 0; b = 1;
        #10;
        // Test case 3: a = 1, b = 0
        a = 1; b = 0;
        #10;

        // Test case 4: a = 1, b = 1
        a = 1; b = 1;
        #10;

        $finish; // End the simulation
    end
endmodule
