module mux2(input j0, j1, sel, output y1);
	assign y1 = sel?j1:j0;
endmodule

module mux8by2(input i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2, output y);
	wire w1,w2,w3,w4,w5,w6;
	mux2 m1(i0,i1,s0,w1);
	mux2 m2(i2,i3,s0,w2);
	mux2 m3(i4,i5,s0,w3);
	mux2 m4(i6,i7,s0,w4);
	mux2 m5(w1,w2,s1,w5);
	mux2 m6(w3,w4,s1,w6);
	mux2 m7(w5,w6,s2,y);
endmodule

module tb();
	reg i0,i1,i2,i3,i4,i5,i6,i7;
	reg s0,s1,s2;
	wire y;

	integer i;

	mux8by2 m(i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,y);

	initial begin
		for(i=0;i<100;i=i+1) begin
			{i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2} = i;
			#1;
		end
	end
endmodule
	
		
