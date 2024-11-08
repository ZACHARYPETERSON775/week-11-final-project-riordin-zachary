module top(
    input [15:0] sw,
    input btnC, // Clock 4 ALU
    input clk, // clock for Div_Clk
    input btnU, // Reset
    output [15:0] led, // A & B display
    output [6:0] seg,
    output [3:0] an
);
    wire [7:0] Y;
    wire clock;
    wire [3:0] anode;
    
    alu alu_block(
        .data(sw[15:8]),
        .select(sw[3:0]),
        .perform(btnC),
        .reset(btnU),
        .A(led[15:8]),
        .B(led[7:0]),
        .Y(Y)
    );
    
    // Do lighting
    clock_div clock_d(
        .clock(clk),
        .reset(btnU),
        .div_clock(clock)
    );
    
    seven_seg_scanner scan(
        .div_clock(clock),
        .reset(btnU),
        .anode(anode)
    );
    
    seven_seg_decoder deco(
        .A(sw[3:0]),
        .B(0),
        .C(Y[3:0]),
        .D(Y[7:4]),
        .anode(anode),
        .segs(seg)
    );
    
    assign an = anode;

endmodule