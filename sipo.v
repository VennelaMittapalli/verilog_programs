module sipo(input clk,reset,serial_in,output reg [3:0] out);
	always @(posedge clk or posedge reset) begin
		if(reset)
			out <= 4'b0000;
		else
			out <= {serial_in,out[3:1]};
	end
endmodule

module tb();
	reg clk = 1'b0;
	reg reset;
	reg serial_in;
	wire [3:0] out;
	always #1 clk = ~clk;
	sipo sipo1(clk,reset,serial_in,out);
	initial begin
		reset = 1'b1;
		#10;
		reset = 1'b0;
		#10;
		serial_in = 1'b1;
		#10;
		serial_in = 1'b0;
	end
endmodule
		
		
		
