// Assuming you have a standard gray_to_binary.v file
`include "./gray_to_binary.v"

module gray_to_excess3_to_binary (
    input wire [3:0] gray_in,       // Incoming Gray code from the channel
    output wire [3:0] binary_out    // Recovered original binary number
);

    wire [3:0] excess3_val;         // Internal wire holding the decoded Excess-3 bits

    // Step 1: Instantiate your Gray to Binary converter to decode the raw bits
    // (Make sure the port names .g and .b match your gray_to_binary.v file!)
    gray_to_binary u_g2b (
        .g(gray_in),
        .b(excess3_val)
    );

    // Step 2: Subtract 3 from the Excess-3 value to get the true binary digit
    assign binary_out = excess3_val - 4'b0011;

endmodule