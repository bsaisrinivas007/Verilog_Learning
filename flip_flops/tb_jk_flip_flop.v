`timescale 1ns/1ps
module tb_jk_flip_flop;
    reg j,k,rst_n,clk;
    wire q,qbar;
    integer a,b;
    jk_flip_flop uut (
        .j(j),
        .k(k),
        .clk(clk),
        .rst_n(rst_n),
        .q(q),
        .qbar(qbar)
    );
    always #10 clk = ~clk;  //20ns time period
    
    initial begin
        clk=1;j=0;k=0;//initialize
        $dumpfile("jk_flip_flop_sim.vcd");
        $dumpvars(0,tb_jk_flip_flop);
        for (a=0;a<=1;a=a+1) begin
            for (b=0;b<=3;b=b+1) begin
                {j,k}=b;
                rst_n=a;
                #20;
            end
        end
        $finish;
    end
    initial begin
        $monitor("| time=%6t    |   rst_n=%b    |   J=%b    |   K=%b    |",$time,rst_n,j,k);
    end
    
endmodule