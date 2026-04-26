module mux_2to1_bh(
    input a,b,sel,
    output reg out
);
    always @(*) begin
        if (sel==1'b1)
            out=b;

        else
            out=a;
    end
endmodule
