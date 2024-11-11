module alu(
    input [7:0] data,
    input [3:0] select, // Operation selector
    input perform,
    input reset,
    output reg [7:0] A,
    output reg [7:0] B,
    output reg [7:0] Y
);
    wire [7:0] AplusB;
    wire [7:0] AminusB;
    wire [7:0] AcompB;
    wire [7:0] ATwos;
    wire [7:0] BTwos;
    
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
    
    always @(posedge perform, posedge reset) begin
        if(reset) begin
            A <= 2'h00;
            B <= 2'h00;
            Y <= 2'h00;
        end else begin
            case(select)
                4'b0000: Y <= AplusB; // Not working
                4'b0001: Y <= AminusB; // Not working
                4'b0010: Y <= A << 1;
                4'b0011: Y <= A >> 1;
                4'b0100: Y <= AcompB; // Not working
                4'b0101: Y <= A & B;
                4'b0110: Y <= A | B;
                4'b0111: Y <= A ^ B;
                4'b1000: Y <= ~(A & B);
                4'b1001: Y <= ~(A | B);
                4'b1010: Y <= ~(A ^ B);
                4'b1011: Y <= ~A;
                4'b1100: Y <= ATwos; // Not working
                4'b1101: A <= Y;
                4'b1110: begin // Not working 
                    A <= B;
                    B <= A;
                end
                4'b1111: A <= data;
            endcase
        end
    end
    
endmodule