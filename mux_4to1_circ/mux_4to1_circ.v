module mux_4to1_circ(
    input a,b,
    input [1:0] s,
    output reg z

);
    //wire connections for each of the inputs
    wire i0,i1,i2,i3;
    assign i0 = a & b;
    assign i1 = a | b;
    assign i2 = a ^ b;
    assign i3 =~(a ^ b);
    always @(*) begin
        case(s)
            2'b00: z=i0;
            2'b01: z=i1;
            2'b10: z=i2;
            2'b11: z=i3;
            default: z=1'b0;
        endcase
    end

endmodule