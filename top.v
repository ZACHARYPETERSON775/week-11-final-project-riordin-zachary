module top(
    input [15:0] sw,
    input btnC, // Clock
    input btnU, // Reset
    output [15:0] led, // A & B display
    output [6:0] seg,
    output [3:0] an
);
    wire [7:0] Y;
    
    alu alu_block(
        .data(sw[15:8]),
        .op_sel(sw[3:0]),
        .perform(btnC),
        .reset(btnU),
        .A(led[15:8]),
        .B(led[7:0]),
        .Y(Y)
    );
    
    // Do lighting

endmodule