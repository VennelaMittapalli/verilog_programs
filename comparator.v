module comparator_4bit(input [3:0]ain, [3:0]bin, output reg a_greater, a_b_equal, b_greater);
	always @(*) begin
		if(ain>bin) begin
			a_greater = 1'b1;
			b_greater = 1'b0;
			a_b_equal = 1'b0;
		end
		else if(ain==bin) begin
			a_greater = 1'b0;
			b_greater = 1'b0;
			a_b_equal = 1'b1;
		end
		else begin
			a_greater = 1'b0;
			b_greater = 1'b1;
			a_b_equal = 1'b0;
		end
	end
endmodule

module tb();
	reg [3:0] ain, bin;
	wire a_greater, b_greater, a_b_equal;
	
	comparator_4bit comp(ain,bin,a_greater,a_b_equal,b_greater);

	initial begin
		ain = 4'b0011;
		bin = 4'b1100;
		#1;
	end
endmodule	