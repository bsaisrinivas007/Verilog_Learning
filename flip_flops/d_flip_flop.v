`include "../flip_flops/sr_flip_flop.v"
module d_flip_flop(
    input d,clk,rst_n,
    output  q,qbar

);
     wire s_wire=d;
    wire r_wire=~d;
    sr_flip_flop sr1(


        .s(s_wire),
        .r(r_wire),
        .clk(clk),
        .rst_n(rst_n),
        .q(q),
        .qbar(qbar)

    );
endmodule