module demux_behavioral(input i,s1,s0, output reg i0,i1,i2,i3);
	always @(i or s1 or s0) begin
		{i0,i1,i2,i3} = 4'b0000;
		case({s1,s0}) 
			2'b00: i0 = i;
			2'b01: i1 = i;
			2'b10: i2 = i;
			2'b11: i3 = i;
		endcase
	end
endmodule

module tb();
	reg i,s1,s0;
	wire i0,i1,i2,i3;
	integer j;
	demux_behavioral demux(i,s1,s0,i0,i1,i2,i3);
	initial begin
		for(j=0;j<8;j=j+1) begin
			{i,s1,s0} = j;
			#1;
		end
	end
endmodule


