module full_adder(
    input A,
    input B,
    input Cin,
    output Y,
    output Cout
);
    wire X = (A ^ B);
    assign Y = X ^ Cin;
    assign Cout = (X & Cin) | (A & B);
endmodule