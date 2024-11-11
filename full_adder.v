module full_adder(
    input A,
    input B,
    input Cin,
    output Y,
    output Cout
);
    assign Y = A ^ B ^ Cin;
    assign Cout = ((A ^ B) & Cin) | (A & B);
endmodule