`include "./binary_to_gray.v"

module binary_to_excess3_to_gray (
    input wire [3:0] binary_in,    // Your starting raw binary number (e.g., 4'b0101)
    output wire [3:0] gray_out     // Final Gray code output
);

    wire [3:0] excess3_val;        // Internal wire to hold the intermediate Excess-3 value

    // Step 1: Add 3 to the input binary number to generate the Excess-3 representation
    assign excess3_val = binary_in + 4'b0011;

    // Step 2: Instantiate your existing binary_to_gray module 
    // to convert that Excess-3 bit pattern directly into Gray code
    binary_to_gray u_b2g (
        .b(excess3_val),   // Feed the intermediate value here
        .g(gray_out)        // Connect to final top-level output
    );

endmodule