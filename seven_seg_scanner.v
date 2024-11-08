module seven_seg_scanner(
    input div_clock,
    input reset,
    output reg [3:0] anode
);

    // This block should count through from zero to three, and only activate one
    // anode at a time in the seven segment displays. Keep in mind THEY ARE
    // INVERSE DRIVE, that is that 0 is on 1 is off

    // The reset line should set things back to segment 0

    // Anodes are:
    // 0: R
    // 1: RC
    // 2: LC
    // 3: L
    
    reg [1:0] num;
    wire [1:0] value = num;
    
    edge_counter_2bit counter (
        .count(div_clock),
        .reset(reset),
        .value(value)
    );
    
    always @(*)begin
        case(value)
            2'b00: num <= 0;
            2'b01: num <= 1;
            2'b10: num <= 2;
            2'b11: num <= 3;
        endcase
    end
    
    always @ (num) begin
        case(num)
            2'b00: anode <= 4'b1110;
            2'b01: anode <= 4'b1101;
            2'b10: anode <= 4'b1011;
            2'b11: anode <= 4'b0111;
        endcase
    end

endmodule