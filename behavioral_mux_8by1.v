module behavioral_mux_8by1(input i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2, output reg y);
	
	always @(*) begin
		y = (~s0)&(~s1)&(~s2)&i0 || (~s2)&(~s1)&s0&i1 || (~s2)&s1&(~s0)&i2 || (~s2)&s1&s0&i3 || s2&(~s1)&(~s0)&i4 || s2&(~s1)&s0&i5 || s2&s1&(~s0)&i6 || s2&s1&s0&i7;
	end
endmodule

module tb();
	reg i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2;
	wire y;
	integer i;
	
	behavioral_mux_8by1 mux(i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,y);
	
	initial begin	
		for(i = 0; i<100; i=i+1) begin
			{i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2} = i;
			#1;
		end
	end
endmodule
		
		