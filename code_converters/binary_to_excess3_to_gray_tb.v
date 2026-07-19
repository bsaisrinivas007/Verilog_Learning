`include "./binary_to_excess3_to_gray.v"
`timescale 1ns/1ps
module binary_to_excess3_to_gray_tb;
    reg [3:0] binary_in;    // Stimulus: Raw binary input
    wire [3:0] gray_out;    // Monitor: Output from the pipeline
    integer i;

    // Instantiate the Top-Level Pipeline Module
    binary_to_excess3_to_gray dut (
        .binary_in(binary_in),
        .gray_out(gray_out)
    );

    initial begin
        // Setup VCD file generation for GTKWave
        $dumpfile("pipeline_sim.vcd");
        $dumpvars(0, binary_to_excess3_to_gray_tb);
        
        $display("Time \t Input (Binary) \t Expected Excess-3 \t \t Output (Gray)");
        $display("--------------------------------------------------------------------------");
        
        // Loop through decimal values 0 to 9
        for(i = 0; i < 10; i = i + 1) begin
            binary_in = i;
            #10; // Wait 10ns for logic propagation and viewing clarity
            
            $display("%0tns \t %b (%0d) \t\t %b (%0d) \t\t\t %b", 
                     $time, binary_in, binary_in, (binary_in + 4'b0011), (binary_in + 3), gray_out);
        end
        
        $display("--------------------------------------------------------------------------");
        $display("Simulation complete successfully.");
        $finish;
    end

endmodule