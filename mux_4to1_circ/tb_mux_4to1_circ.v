`timescale 1ns / 1ps

module tb_mux_4to1_circ;

    // 1. Declare inputs as regs and outputs as wires
    reg a;
    reg b;
    reg [1:0] s;
    wire z;
    
    // Variables for the checker
    reg expected_z;
    integer i, j;

    // 2. Instantiate the Unit Under Test (UUT)
    mux_4to1_circ uut (
        .a(a), 
        .b(b), 
        .s(s), 
        .z(z)
    );

    // 3. Helper function for readable logs
    function [31:0] get_gate_name;
        input [1:0] select;
        begin
            case(select)
                2'b00: get_gate_name = "AND ";
                2'b01: get_gate_name = "OR  ";
                2'b10: get_gate_name = "XOR ";
                2'b11: get_gate_name = "XNOR";
            endcase
        end
    endfunction

    // 4. Stimulus process
    initial begin
        // Initialize for GTKWave
        $dumpfile("mux_4to1_circ.vcd");
        $dumpvars(0, tb_mux_4to1_circ);

        // Initialize signals
        a = 0; b = 0; s = 0;

        $display("Time | Sel | Gate | a b | Actual | Expected | Result");
        $display("------------------------------------------------------");

        // Outer loop: Change Select every 4ns
        for (i = 0; i < 4; i = i + 1) begin
            s = i;
            
            // Inner loop: Change a,b every 1ns
            for (j = 0; j < 4; j = j + 1) begin
                {a, b} = j; 
                #1; // Wait for logic to settle

                // --- THE CHECKER ---
                case(s)
                    2'b00: expected_z = a & b;
                    2'b01: expected_z = a | b;
                    2'b10: expected_z = a ^ b;
                    2'b11: expected_z = ~(a ^ b);
                endcase

                if (z === expected_z) begin
                    $display("%4t | %b  | %s | %b %b |   %b    |    %b     | PASS", 
                             $time, s, get_gate_name(s), a, b, z, expected_z);
                end else begin
                    $display("%4t | %b  | %s | %b %b |   %b    |    %b     | FAIL!", 
                             $time, s, get_gate_name(s), a, b, z, expected_z);
                end
            end
        end

        //#10;
        $display("------------------------------------------------------");
        $display("Simulation Finished.");
        $finish;
    end
      
endmodule