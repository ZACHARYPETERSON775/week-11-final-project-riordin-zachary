module twos_comp(
    input [7:0] X,
    output [7:0] Y
);
    adder twos(
        .A(~X),
        .B(8'h01),
        .Y(Y)
    );
endmodule