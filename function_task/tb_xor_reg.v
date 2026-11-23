// File: tb_xor_reg.v
`timescale 1ns / 1ps

module tb_xor_reg;
    reg        clk;
    reg        rst_n;
    reg  [3:0] a;
    reg  [3:0] b;
    wire [3:0] y_dut;

    // Instantiate the Design Under Test (DUT)
    xor_reg u_dut (
        .clk   (clk),
        .rst_n (rst_n),
        .a     (a),
        .b     (b),
        .y     (y_dut)
    );

    // 100 MHz Clock Generation (10 ns period)
    initial clk = 1'b0;
    always #5 clk = ~clk;

    // 1. FUNCTION: Zero-time golden reference model
    function [3:0] expected_xor;
        input [3:0] x;
        input [3:0] y;
        begin
            expected_xor = x ^ y;
        end
    endfunction

    // 2. TASK: Multi-cycle stimulus driver & self-checker
 task automatic apply_and_check;
        input [3:0] test_a;   
        input [3:0] test_b;
        reg   [3:0] exp_val;
        begin
            // Drive inputs cleanly on a rising clock edge
            @(posedge clk);
            a <= test_a;
            b <= test_b;

            // Wait one clock cycle for the registered output to update
            @(posedge clk);
            #1; // Small delta delay so y_dut settles after the clock edge

            // Call the zero-time function to get expected output
            exp_val = expected_xor(test_a, test_b);

            if (y_dut === exp_val)
                $display("[PASS] t=%0t  | %b ^ %b = %b", $time, test_a, test_b, y_dut);
            else
                $display("[FAIL] t=%0t | %b ^ %b = %b (Expected: %b)", $time, test_a, test_b, y_dut, exp_val);
        end
    endtask

    // 3. Main Simulation Sequence
    initial begin
        $dumpfile("xor_wave.vcd");
        $dumpvars(0, tb_xor_reg);
        // Initialize signals
        rst_n = 1'b0;
        a     = 4'b0000;
        b     = 4'b0000;

        // Release reset after 2 clock cycles
        repeat (2) @(posedge clk);
        rst_n <= 1'b1;

        // Run test vectors using the task
        apply_and_check(4'b1010, 4'b1100);
        apply_and_check(4'b0101, 4'b0101);
        apply_and_check(4'b1111, 4'b0011);

        #20 $finish;
    end

endmodule