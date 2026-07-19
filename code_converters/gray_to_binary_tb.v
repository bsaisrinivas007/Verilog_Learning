`include "./gray_to_binary.v"
module gray_to_binary_tb;
    wire [3:0] b;
    reg [3:0] g;
    integer i;
    gray_to_binary dut (
        .g(g),
        .b(b)
    );
    initial begin
        $dumpfile("gray_to_binary.vcd");
        $dumpvars(0, gray_to_binary_tb);
        //integer i;
        $display("time \t graycode \t binary number ");
        $display("---------------------------------------------------");
        for(i=0;i<16;i=i+1) begin
            g=i;
            #5;
            //binary_to_gray(b,g);
            
            $display("%0tns \t  \t  %b  \t    %b", $time, g,b);
            #5;
            
        end
        $display("---------------------------------------------------");
        $display("done");
    end
endmodule