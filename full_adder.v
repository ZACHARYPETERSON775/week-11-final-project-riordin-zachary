module full_adder(
    input A,
    input B,
    input Cin,
    output Y,
    output Cout
);
    wire X = (A ^ B);
    assign Y = X ^ Cin;
    assing Cout = (X & Cin) | (A & B);
endmodule