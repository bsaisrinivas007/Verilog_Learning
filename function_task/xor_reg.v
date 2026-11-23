// File: xor_reg.v
module xor_reg (
    input  wire       clk,
    input  wire       rst_n,
    input  wire [3:0] a,
    input  wire [3:0] b,
    output reg  [3:0] y
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            y <= 4'b0000;
        else
            y <= a ^ b;
    end

endmodule