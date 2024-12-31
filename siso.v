module siso(input reset, clk, serial_in, output reg serial_out);
	reg [3:0] temp;
	always @(posedge clk or posedge reset) begin
		if(reset) 
			temp <= 4'b0000;
		else begin
			temp <= {serial_in,temp[3:1]};
			serial_out <= temp[0];
		end
	end
endmodule

module tb();
	reg reset;
	reg clk = 1'b0;
	reg serial_in;
	wire serial_out;
	always #1 clk = ~clk;
	siso siso1(reset,clk,serial_in,serial_out);
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
		
			
			
