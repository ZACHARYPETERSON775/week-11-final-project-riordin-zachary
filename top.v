module top(
    input [15:0] sw,
    input btnC, // Clock
    input btnU, // Reset
    output [15:0] led, // A & B display
    output [6:0] seg,
    output [3:0] an
);
    wire [7:0] A;
    wire [7:0] B;
    wire [7:0] Y;
    wire [7:0] muxData;
    wire [7:0] BTwos;
    
    // Mux
    wire [7:0] AplusB;
    wire [7:0] AminusB;
    wire [7:0] ALShift;
    wire [7:0] ARShift;
    wire [7:0] AcompB;
    wire [7:0] AandB;
    wire [7:0] AorB;
    wire [7:0] AxorB;
    wire [7:0] AnandB;
    wire [7:0] AnorB;
    wire [7:0] AxnorB;
    wire [7:0] NotA;
    wire [7:0] ATwos;
    
    
    
    // A twos_comp
    twos_comp twos_A(
        .X(A),
        .Y(ATwos)
    );
    
    // B twos_comp
    twos_comp twos_B(
        .X(B),
        .Y(BTwos)
    );
    
    // A + B
    adder plus(
        .A(A),
        .B(B),
        .Y(AplusB)
    );
    // A - B
    adder minus(
        .A(A),
        .B(BTwos),
        .Y(AminusB)
    );
    
    shifer shift(
        .A(A),
        .R(ARShift),
        .L(ALShift)
    );
    
    memory(
        .data(muxData),
        .store(),
        .clear(btnU),
        .mem(Y)
    );
    
    assign led[15:8] = A;
    assign led[7:0] = B;

endmodule