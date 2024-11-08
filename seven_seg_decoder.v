module seven_seg_decoder(
    input [3:0] A,
    input [3:0] B,
    input [3:0] C,
    input [3:0] D,
    input [3:0] anode,
    output reg [6:0] segs
);

    
    
    // This module should be purely combinatorial -- no reset required. What we
    // are going to do here is simply display the correct four bit number
    // according to the table provided in the lab deliverables section

    // Recommended you do a simple behavioral implementation:
    //always @(*) begin
    //   case (anode)
    //      'b1110: selected_sig <= A
    //      'b1101: selected_sig <= B          
    //   endcase

    // You will also need a very simple decoder that assigns the segs components
    // based on the 4 bit input number to hexidecimal digit

    // For reference:
    
    reg [3:0] selected_sig;
    
    always @(*) begin
        case (anode)
            'b1110: selected_sig <= A;
            'b1101: selected_sig <= B;
            'b1011: selected_sig <= C;
            'b0111: selected_sig <= D;
        endcase
    end
    
    always @(*) begin
        case(selected_sig)
            //            GFEDCBA
            0: segs  = 7'b1000000;        
            1: segs  = 7'b1111001;        
            2: segs  = 7'b0100100;        
            3: segs  = 7'b0110000;        
            4: segs  = 7'b0011001;        
            5: segs  = 7'b0010010;        
            6: segs  = 7'b0000010;        
            7: segs  = 7'b1111000;        
            8: segs  = 7'b0000000;
            9: segs  = 7'b0010000;        
            10: segs = 7'b0001000;        
            11: segs = 7'b0000011;        
            12: segs = 7'b1000110;        
            13: segs = 7'b0100001;        
            14: segs = 7'b0000110;        
            15: segs = 7'b0001110;       
        endcase
    end

endmodule