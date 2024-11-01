module logic(
    input A[7:0],
    input B[7:0],
    output CMP[7:0],
    output AND[7:0],
    output OR[7:0],
    output XOR[7:0],
    output NAND[7:0],
    output NOR[7:0],
    output XNOR[7:0],
    output INV[7:0],
    output NEG[7:0]
);
    //CMP
    
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