module upcounter(input clk,reset,output reg [3:0] out);
	always @(posedge clk or posedge reset) begin
		if(reset) 
			out <= 4'b0000;
		else
			out <= out + 4'b0001;
	end
endmodule


module tb();
	reg clk = 1'b0;
	reg reset;
	wire [3:0] out;
	always #1 clk = ~clk;
	upcounter upc(clk,reset,out);
	initial begin
		reset = 1'b1;
		#10;
		reset = 1'b0;
		#20;
		reset = 1'b1;
		#10;
		reset = 1'b0;
	end
endmodule