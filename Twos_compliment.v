module twos_comp(
    input [7:0] X,
    output [7:0] Y
);
    wire NotX = ~X;
    adder add(
        .A(NotX),
        .B(1'b0),
        .Y(Y)
    );
endmodule