module adder(
    input [7:0] A,
    input [7:0] B,
    output [7:0] Y
);
    wire [7:0] carry = 8'b00;
    genvar i;
    generate
        for(i = 0; i < 8; i = i + 1) begin
            full_adder add(
                .A(A[i]),
                .B(B[i]),
                .Cin((i > 0) ? carry[i - 1] : 1'b0),
                .Y(Y[i]),
                .Cout(carry[i])
            );
        end
    endgenerate
endmodule