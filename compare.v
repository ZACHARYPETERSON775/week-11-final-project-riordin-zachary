module compare(
    input [7:0] A,
    input [7:0] B,
    output reg [7:0] Y
);

    always @(A, B) begin
        if (A > B) begin
            Y <= 8'b00000001;
        end
        else if (B > A) begin
            Y <= 8'b11111111;
        end
        else begin
            Y <= 8'b00000000;
        end
    end
        
endmodule