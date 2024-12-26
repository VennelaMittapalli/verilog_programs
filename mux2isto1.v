module mux2isto1(input sel, a, b, output y);
	assign y = ((~sel)&a) || (sel&b);
endmodule 

module tb();
	reg sel, a, b;
	wire y;
	integer i;

	mux2isto1 mx(sel,a,b,y);
	
	
	initial begin
		{sel,a,b} = 3'b000;
		#1;
		{sel,a,b} = 3'b001;
		#1;
		{sel,a,b} = 3'b010;
		#1;
		{sel,a,b} = 3'b011;
		#1;
		{sel,a,b} = 3'b100;
		#1;
		{sel,a,b} = 3'b101;
		#1;
		{sel,a,b} = 3'b110;
		#1;
		{sel,a,b} = 3'b111;
		#1;
	end
endmodule
