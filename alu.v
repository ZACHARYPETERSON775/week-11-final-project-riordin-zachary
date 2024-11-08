module alu(
    input [7:0] data,
    input [3:0] select, // Operation selector
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
    
    always @(posedge perform, select) begin
        if(perform) begin
            case(select)
                4'b0000: Y <= AplusB;
                4'b0001: Y <= AminusB;
                4'b0010: Y <= ALShift;
                4'b0011: Y <= ARShift;
                4'b0100: Y <= AcompB;
                4'b0101: Y <= A & B;
                4'b0110: Y <= A | B;
                4'b0111: Y <= A ^ B;
                4'b1000: Y <= ~(A & B);
                4'b1001: Y <= ~(A | B);
                4'b1010: Y <= ~(A ^ B);
                4'b1011: Y <= ~A;
                4'b1100: Y <= ATwos;
                default: Y <= Y;
            endcase
        end
    end
endmodule