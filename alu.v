module alu(
    input [7:0] data,
    input [3:0] op_sel, // Operation selector
    input perform,
    input reset,
    output reg [7:0] A,
    output reg [7:0] B,
    output reg [7:0] Y
);
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

endmodule