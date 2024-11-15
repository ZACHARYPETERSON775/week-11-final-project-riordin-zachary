module twos_comp(
    input [7:0] X,
    output [7:0] Y
);
    wire [6:0] C;
    assign C[0] = X[0];
    assign Y[0] = X[0];

    genvar i, Ci;
    generate
	for(Ci = 1; Ci < 7; Ci = Ci + 1) begin
            assign C[Ci] = X[Ci] | C[Ci - 1];
        end
        for(i = 1; i < 8; i = i + 1) begin
            assign Y[i] = X[i] ^ C[i - 1];
        end
    endgenerate
endmodule