module ringcounter(input clk, reset, output reg [3:0] out);
	always @(posedge clk or posedge reset) begin
		if(reset) 
			out <= 4'b1000;
		else 
			out <= {out[0],out[3:1]};
	end
endmodule

module tb();
	reg clk = 1'b0;
	reg reset;
	wire [3:0] out;
	always #1 clk = ~clk;

	ringcounter rc(clk,reset,out);

	initial begin
		reset = 1'b1;
		#10;
		reset = 1'b0;
		#20;
		reset = 1'b1;
	end
endmodule
		
	
	
