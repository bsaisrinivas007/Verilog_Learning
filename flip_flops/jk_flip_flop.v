module jk_flip_flop(
    input clk,j,k,rst_n,
    output reg q,
    output qbar
);

     assign qbar=~q;
    always@(posedge clk or negedge rst_n)begin
        if(!rst_n) begin
            q<=1'b0;
        end else begin
                case({j,k})
                    2'b00:  q <= q;
                    2'b01:  q <= 0;
                    2'b10:  q <= 1;
                    2'b11:  q <= ~q;
        endcase
        end
    end
     


endmodule