module mult_12in(
    input Enable,
    input [7:0] ADD, //0000
    input [7:0] SUB, //0001
    input [7:0] SHL, //0010
    input [7:0] SHR, //0011
    input [7:0] CMP, //0100
    input [7:0] AND, //0101
    input [7:0] OR, //0110
    input [7:0] XOR, //0111
    input [7:0] NAND, //1000
    input [7:0] NOR, //1001
    input [7:0] XNOR, //1010
    input [7:0] INV, //1011
    input [7:0] NEG, //1100
    input [3:0] Sel, // Select Outputs
    output [7:0] out // Output Data
    );
    
    assign link = Enable ? (Sel == 2'b00 ? ceo : 
                Sel == 2'b01 ? me : 
                Sel == 2'b10 ? fred : jill) : 4'b0000;
    
endmodule