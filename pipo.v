module pipo(input clk, reset, [3:0] parallel_in, output reg [3:0] parallel_out);
	always @(posedge clk or posedge reset) begin
		if(reset)
			parallel_out <= 4'b0000;
		else
			parallel_out <= parallel_in;
	end
endmodule

module tb();
	reg clk = 1'b0;
	reg reset;
	reg [3:0] parallel_in;
	wire [3:0] parallel_out;
	
	always #1 clk = ~clk;
	
	pipo pipo1(clk,reset,parallel_in,parallel_out);
	
	initial begin
		reset = 1'b1;
		#10;
		reset = 1'b0;
		#10;
		parallel_in = 4'b0010;
		#10;
	end

endmodule
	
	
	
