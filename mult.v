module mult_12in(
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
    output reg [7:0] out // Output Data
    );
    
    always @(Sel) begin
        case (Sel)
            'b0000: out <= ADD;
            'b0001: out <= SUB;
            'b0010: out <= SHL;
            'b0011: out <= SHR;
            'b0100: out <= CMP;
            'b0101: out <= AND;
            'b0110: out <= OR;
            'b0111: out <= XOR;
            'b1000: out <= NAND;
            'b1001: out <= NOR;
            'b1010: out <= XNOR;
            'b1011: out <= INV;
            'b1100: out <= NEG;
        endcase
    end
    
endmodule