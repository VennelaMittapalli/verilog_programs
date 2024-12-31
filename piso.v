module piso(input clk,reset,load,shift,[3:0] parallel_in,output reg serial_out);
	reg [3:0] temp;
	always @(posedge clk or posedge reset) begin
		if(reset) begin
			temp <= 4'b0000;
			serial_out <= 1'b0;
		end
		else if(load) begin
			temp <= parallel_in;
		end
		else if(shift) begin
			serial_out  <= temp[0];
			temp <= temp>>1;
		end
	end
endmodule


module tb();
	reg clk = 1'b0;
	reg reset;
	reg shift;
	reg load;
	reg [3:0] parallel_in;
	wire serial_out;
	always #1 clk = ~clk;
	piso piso1(clk,reset,load,shift,parallel_in,serial_out);
	initial begin
		reset = 1'b1;
		#10;
		reset = 1'b0;
		#10;
		load = 1'b1;
		parallel_in = 4'b0100;
		#10;
		load = 1'b0;
		shift = 1'b1;
		#10;
	end
endmodule
	
	
	
			
