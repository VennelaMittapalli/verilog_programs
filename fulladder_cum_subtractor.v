module fulladder_cum_subtractor(input a,b,b_c_in, output sum, carry, difference, borrow);
	assign sum = a^b^b_c_in;
	assign difference = sum;
	assign carry = a&b || b&b_c_in || b_c_in&a;
	assign borrow = (~a)&b || b&b_c_in || b_c_in&(~a);
endmodule


module tb();
	reg a,b,b_c_in;
	wire sum,carry,difference,borrow;
	integer i;

	fulladder_cum_subtractor fas(a,b,b_c_in,sum,carry,difference,borrow);

	initial begin
		for( i=0; i<8; i=i+1) begin
			{a,b,b_c_in} = i;
			#1;
		end
	#50;
	$finish;
	end
endmodule
