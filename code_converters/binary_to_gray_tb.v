`include "./binary_to_gray.v"
module binary_to_gray_tb;
    reg [3:0] b;
    wire [3:0] g;
    integer i;
    binary_to_gray dut(
        .b(b),
        .g(g)
    );
    initial begin
        $dumpfile("binary_to_gray.vcd");
        $dumpvars(0, binary_to_gray_tb);
        //integer i;
        $display("time \t decimal \t binary number \t gray code");
        $display("---------------------------------------------------");
        for(i=0;i<16;i=i+1) begin
            b=i;
            #5;
            //binary_to_gray(b,g);
            
            $display("%0tns \t  %0d \t \t  %b  \t    %b", $time, b,b,g);
            #5;
            
        end
        $display("---------------------------------------------------");
        $display("done");
    end
endmodule