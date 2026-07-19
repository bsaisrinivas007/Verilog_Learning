`include "./gray_to_excess3_to_binary.v"

module gray_to_excess3_to_binary_tb;
    reg [3:0] gray_in;
    wire [3:0] binary_out;
    
    // Test vectors array containing the 10 valid Gray codes from the previous experiment
    reg [3:0] gray_vectors [0:9];
    integer i;

    // Instantiate the Reverse Pipeline
    gray_to_excess3_to_binary dut (
        .gray_in(gray_in),
        .binary_out(binary_out)
    );

    initial begin
        // Populate the array with the exact Gray code sequence generated last time:
        // Dec Value:     0,    1,    2,    3,    4,    5,    6,    7,    8,    9
        gray_vectors[0] = 4'h2; // Gray for 3
        gray_vectors[1] = 4'h6; // Gray for 4
        gray_vectors[2] = 4'h7; // Gray for 5
        gray_vectors[3] = 4'h5; // Gray for 6
        gray_vectors[4] = 4'h4; // Gray for 7
        gray_vectors[5] = 4'hC; // Gray for 8 (Matches your 50ns spot check!)
        gray_vectors[6] = 4'hD; // Gray for 9
        gray_vectors[7] = 4'hF; // Gray for 10
        gray_vectors[8] = 4'hE; // Gray for 11
        gray_vectors[9] = 4'hA; // Gray for 12

        $dumpfile("reverse_pipeline_sim.vcd");
        $dumpvars(0, gray_to_excess3_to_binary_tb);
        
        $display("Time \t Input (Gray) \t Decoded Excess-3 \t Output (Recovered Binary)");
        $display("--------------------------------------------------------------------------");
        
        for(i = 0; i < 10; i = i + 1) begin
            gray_in = gray_vectors[i];
            #10;
            
            $display("%0tns \t %b (%0h) \t\t %b \t\t\t %b (%0d)", 
                     $time, gray_in, gray_in, dut.excess3_val, binary_out, binary_out);
        end
        
        $display("--------------------------------------------------------------------------");
        $display("Reverse verification complete.");
        $finish;
    end
endmodule