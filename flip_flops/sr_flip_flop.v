module sr_flip_flop(
    input s,r,clk,rst_n,
    output reg q,
    output qbar
);

    assign qbar = ~q;
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            q<=1'b0;
        end 
        else begin
            case({s,r})
                2'b00: q<=q;   //hold
                2'b01: q<=1'b0;//reset
                2'b10: q<=1'b1;//set
                2'b11: q<=1'bx;//invalid
            endcase
        end
    end





endmodule
