module all_gates (
    input a, b,
    output out_and,
    output out_or,
    output out_not_a,
    output out_nand,
    output out_nor,
    output out_xor
);

    // Basic logic operations
    assign out_and   = a & b;       // AND gate
    assign out_or    = a | b;       // OR gate
    assign out_not_a = ~a;          // NOT gate (inverting input A)
    assign out_nand  = ~(a & b);    // NAND gate
    assign out_nor   = ~(a | b);    // NOR gate
    assign out_xor   = a ^ b;       // XOR gate

endmodule