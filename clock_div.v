module clock_div
#(
    parameter DIVIDE_BY = 17 // Or 100,000 for counter implementation
)
(
    input clock,
    input reset,
    output reg div_clock
);

    // 100 MHz input clock Divide by either 2^17 or use a counter based divider
    // to output to div_clock

    // Use the reset signal to set the initial state of your div_clock as well
    // as reset whatever div method you are using

    // If you use the 2^N divider, try instantiating the flip flops with a
    // genvar and generate block

    // If you use the counter block, try using parameters in the counter module
    // to specify the number of bits
    
    // IMPORTANT NOTE!! If you do a counter based divider, make sure to only
    // divide clock by 2 during test bench runs or your tests will fail. This
    // will automatically happen for you if you use 2^N divider and the
    // BIT_COUNT parameter
    wire [DIVIDE_BY :1] Din;
    wire [DIVIDE_BY :0] Qout;
    
    assign Qout[0] = clock;
    
    genvar i;
    generate
        for(i = 1; i <= DIVIDE_BY; i = i + 1) begin
            dff dff_div(
                .clk(Qout[i - 1]),
                .D(Din[i]),
                .preset(1'b0),
                .clear(reset),
                .Q(Qout[i]),
                .NotQ(Din[i])
            );
        end
    endgenerate
    
    always @(*) begin
        div_clock <= Qout[DIVIDE_BY];
    end
    
endmodule