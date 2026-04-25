module mux_2to1_df(
    input a,b,sel,
    output out
);
    //data flow method:- we ca directly assig the circuit equation
    assign out=(a&~sel) | (b&sel);


endmodule
