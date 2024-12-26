module mux2by1(input i0,i1,sel, output y);
	assign y = sel?i1:i0;
endmodule

module tb();
	reg i0,i1,sel;
	wire y;
	integer i;
	mux2by1 m(i0,i1,sel,y);
	initial begin
		for(i=0;i<8;i=i+1) begin
			{i0,i1,sel} = i;
			#1;
		end
	end
endmodule
