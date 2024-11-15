module adder(
    input [7:0] A,
    input [7:0] B,
    output [7:0] Y
);
    wire [7:0] carry;
    genvar i;
    generate
        for(i = 1; i < 8; i = i + 1) begin
            full_adder addL(
                .A(A[i]),
                .B(B[i]),
                .Cin((i == 0) ? 1'b0 : carry[i - 1]),
                .Y(Y[i]),
                .Cout(carry[i])
            );
        end
    endgenerate
endmodule