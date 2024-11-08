// Should be called: posedge_incrementer_2bit(enable, reset, value)
// For a counter: posedge_counter_2bit(enable, count, reset, value)
module edge_counter_2bit
(
    input count,
    input reset,
    output reg [1:0] value
);
    // Could have been impilmented using t-flip-flop
    always @(posedge count, posedge reset) begin // Should use enable and reset
        if(reset) begin
            value <= 2'b00;
        end else if(count) begin
            value <= value + 1; // Increments; not counting
        end
    end
endmodule