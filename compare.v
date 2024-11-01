module compare(
    input [7:0] A,
    input [7:0] B,
    output reg [7:0] Y
);

    always @(A, B) begin
        if (A > B) begin
            Y <= 'b0000001;
        end
        else if (B > A) begin
            Y <= 'b1111111;
        end
        else begin
            Y <= 'b0000000;
        end
    end
        
endmodule