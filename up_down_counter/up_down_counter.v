module up_down_counter #(
    parameter Width=4 )
    (
    input clk,
    input rst,
    input up_down,
    output reg [Width-1:0] q
);



always @(posedge clk or posedge rst) begin
    if (rst) begin
        q<=1'd0;
    end
    else begin
        if (up_down) begin
            q <= q + 1'b1;
        end
        else begin
            q<= q - 1'b1;
    end
  
    end
end
endmodule