module fulladder_concatenation(input [3:0]a, [3:0]b, output cout, [3:0] sum);
	assign {cout,sum[3:0]} = {a[3:0] + b[3:0]};
endmodule

module tb();
	reg [3:0]a,b;
	wire cout;
	wire [3:0] sum;

	fulladder_concatenation fac(a,b,cout,sum);
	
	initial begin
		a = 4'b0110;
		b = 4'b0111;
		#10;
		a = 4'b0001;
		b = 4'b0010;
		#10;
	end
endmodule

	
