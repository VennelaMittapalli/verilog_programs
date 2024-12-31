module updowncounter(input updown, clk, reset, output reg [3:0] out);
	always @(posedge clk or posedge reset) begin
		if(reset)
			out <= 4'b0000;
		else if(updown) 
			out <= out + 4'b0001;
		else 
			out <= out - 4'b0001;
	end
endmodule


module tb();
	reg updown, reset;
	reg clk = 1'b0;
	wire [3:0] out;
	always #1 clk = ~clk;
	updowncounter upd(updown,clk,reset,out);
	initial begin
		reset = 1'b1;
		#10;
		reset = 1'b0;
		#10;
		updown = 1'b1;
		#10;
		updown = 1'b0;
		#10;
	end
endmodule
