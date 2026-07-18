module mod6_counter_behavioural(
    input wire clk,
    input wire rst,
    output reg [2:0] q
);

always @(posedge clk or posedge rst) begin
    if(rst) begin
        q <=3'b000;
    end
    else begin
        if(q == 3'b101) begin
            q <= 3'b000;
        end
        else begin
            q <= q + 1'b1;
        end
    end
end

endmodule