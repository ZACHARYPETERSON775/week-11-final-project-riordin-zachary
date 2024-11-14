module twos_comp(
    input [7:0] X,
    output [7:0] Y
);
    wire [7:0] C;
    assign C[0] = X[0];
    assign Y[0] = X[0];
    
    genvare i;
    generate
        for(i = 1; i < 8; i = i + 1) begin
            assign C[i] = X[i] | C[i - 1];
            assign Y[i] = X[i] ^ C[i - 1];
        end
    endgenerate
endmodule