module half_subtractor(input a,b,output difference, borrow);
	assign difference = a^b;
	assign borrow = (~a)&b;
endmodule

module tb();

	reg a,b;
	wire difference, borrow;
	integer i;
	
	half_subtractor hs(a,b,difference,borrow);

	initial begin
		for(i=0;i<4;i=i+1) begin
			{a,b} = i;
			#1;
		end
	end

endmodule