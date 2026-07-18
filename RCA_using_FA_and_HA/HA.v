/*module HA( output s,c, input x,y);
    xor X1(s, x, y);
    and A1(c, x, y);

endmodule
*/
module HA(s, c, x, y);
    output s, c;
    input x, y;

    xor X1(s, x, y);
    and A1(c, x, y);
endmodule