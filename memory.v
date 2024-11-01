module memory(
    input [7:0] data,
    input store,
    input clear,
    output reg [7:0] mem
);
    
    genvar i;
    generate
        for(i = 0; i < 8; i = i + 1) begin
            dff dff_loop(
                .clk(store),
                .D(data[i]),
                .preset(1'b1),
                .clear(~clear),
                .Q(mem[i])
            );
        end
    endgenerate
endmodule