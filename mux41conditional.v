module mux41(input i0,i1,i2,i3,s0,s1, output y);
	assign y = s1?(s0?i3:i2):(s0?i1:i0);
endmodule

module tb();

	reg i0,i1,i2,i3,s0,s1;
	wire y;
	integer i;
	mux41 m(i0,i1,i2,i3,s0,s1,y);
	initial begin
		for(i=0;i<64;i=i+1) begin
			{i0,i1,i2,i3,s0,s1} = i;
			#1;
		end
	end
endmodule
