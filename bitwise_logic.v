module logic(
    input [7:0] A,
    input [7:0] B,
    output [7:0] CMP,
    output [7:0] AND,
    output [7:0] OR,
    output [7:0] XOR,
    output [7:0] NAND,
    output [7:0] NOR,
    output [7:0] XNOR,
    output [7:0] INV,
    output [7:0] NEG
);
    compare(
        .A(A),
        .B(B),
        .Y(CMP)
    );
    
    assign AND = A & B;
    
    assign OR = A | B;
    
    assign XOR = A ^ B;
    
    assign NAND = ~(A & B);
    
    assign NOR = ~(A | B);
    
    assign XNOR = ~(A ^ B);
    
    assign INV = ~A;
    
    twos_comp(
        .X(A),
        .Y(NEG)
    );
    
    

endmodule