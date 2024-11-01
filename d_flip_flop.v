module dff(
	input clk,
	input D,
	input preset, // Low Enable
	input clear, // Low Enable
	output reg Q,
	output NotQ
);
	assign NotQ = ~Q;
	always @(posedge clk, preset, clear) begin
		if(clk && preset && clear) begin
			Q <= D;
		end else if(!preset) begin
			Q <= 1'b1;
		end else if(!clear) begin
			Q <= 1'b0;
		end
	end
endmodule