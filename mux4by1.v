module mux(input i0,i1,i2,i3,s0,s1, output y);
	always @(*) begin
		case({s1,s0}) 
			2'b00: y = i0;
			2'b01: y = i1
			2'b10: y = i2
			2'b11: y = i3;
		endcase
endmodule

module tb();
	reg i0,i1,i2,i3,s0,s1;
	wire y;
	integer i;
	initial begin
		for(i=0;i<64;i=i+1) begin
			{i0,i1,i2,i3,s0,s1} = i;
		end
	end
endmodule

	

	
