module full_adder_structural(input a,b,cin, output sum, carry);
	wire w1,w2,w3;
	xor(sum,a,b,cin);
	and(w1,a,b);
	and(w2,b,cin);
	and(w3,cin,a);
	or(carry,w1,w2,w3);
endmodule

module tb();
	reg a,b,cin;
	wire sum,carry;
	integer i;
	full_adder_structural fas(a,b,cin,sum,carry);
	initial begin
		for(i=0;i<8;i=i+1) begin
		{a,b,cin} = i;
		#1;
		end
	end
endmodule

