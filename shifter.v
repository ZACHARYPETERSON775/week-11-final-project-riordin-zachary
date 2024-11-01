module shifter(
    input [7:0] A,
    output [7:0] R, // A shifted to the right
    output [7:0] L // A shifted to the left
);
    assign R = A >> 1;
    assign L = A << 1;
endmodule