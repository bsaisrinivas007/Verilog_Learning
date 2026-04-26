`timescale 1ns/1ps
module tb_mux_2to1_bh;
    reg a,b,sel;
    wire out;
    mux_2to1_bh uut(
        .a(a),
        .b(b),
        .sel(sel),
        .out(out)
    );
    initial begin
        $dumpfile("mux_2to1_bh_sim.vcd");
        $dumpvars(0,tb_mux_2to1_bh);
        $display("Sel A B | Out");
        $monitor("%b   %b %b |   %b", sel, a, b, out);

        // Apply the 8 possible combinations
        {sel, a, b} = 3'b000; #10;
        {sel, a, b} = 3'b001; #10;
        {sel, a, b} = 3'b010; #10;
        {sel, a, b} = 3'b011; #10;
        {sel, a, b} = 3'b100; #10;
        {sel, a, b} = 3'b101; #10;
        {sel, a, b} = 3'b110; #10;
        {sel, a, b} = 3'b111; #10;
        $finish;

    end
endmodule