module shift_register#(parameter N = 4)(input clk, reset,shift_in, output reg [N-1:0] out);
	always @(posedge clk or posedge reset) begin
		if(reset) 
			out <= {N{1'b0}};
		else
			out <= {out[N-2:0],shift_in};
	end
endmodule


module tb();
	reg clk = 1'b0;
	reg reset;
	reg shift_in;
	wire [3:0] out;
	always #1 clk = ~clk;
	shift_register sr(clk,reset,shift_in,out);
	initial begin
		reset = 1'b1;
		#10;
		reset = 1'b0;
		shift_in = 1'b1;
		#10;
		shift_in = 1'b0;
		#10;
	end
endmodule
	
	