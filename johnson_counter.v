module johnson_counter(input reset, clk, output reg [3:0] out);
	always @(posedge clk or posedge reset) begin
		if(reset)
			out <= 4'b0000;
		else
			out <= {~out[0],out[3:1]};
	end
endmodule

module tb();
	reg reset;
	reg clk = 1'b0;
	wire [3:0] out;
	always #1 clk = ~clk;
	johnson_counter jc(reset,clk,out);
	initial begin
		reset = 1'b1;
		#10;
		reset = 1'b0;
		#10;
		reset = 1'b1;
		#10;
		reset = 1'b0;
	end
endmodule
