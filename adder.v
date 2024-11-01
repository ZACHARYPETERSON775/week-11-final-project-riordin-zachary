module adder(
    input [7:0] A,
    input [7:0] B,
    output [7:0] Y
);
    wire [8:0] carry = 0;
    genvar i;
    generate
        for(i = 0; i < 8; i = i + 1) begin
            full_adder loop(
                .A(A[i]),
                .B(B[i]),
                .Cin(carry[i]),
                .Y(Y[i]),
                .Cout(carry[i + 1])
                );
        end
    endgenerate
endmodule