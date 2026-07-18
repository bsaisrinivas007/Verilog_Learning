module sr_flip_flop (
    input clk,
    input rst,
    input s,
    input r,
    output reg q,
    output  q_bar
);

    assign q_bar = ~q;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= 1'b0;      // Asynchronous clear
        end else begin
            case ({s, r})
                2'b00: q <= q;    // Hold state
                2'b01: q <= 1'b0; // Reset state
                2'b10: q <= 1'b1; // Set state
                2'b11: q <= 1'bx; // Invalid state (Don't care / undefined behavior)
            endcase
        end
    end

endmodule