module fulladder(input a,b,cin, output sum,carry);
	wire w1,w2,w3,w4,w5,w6,w7;
	nand(w1,a,b);
	nand(w2,a,w1);
	nand(w3,b,w1);
	nand(w4,w2,w3);
	nand(w5,w4,cin);
	nand(w6,w4,w5);
	nand(w7,cin,w5);
	nand(sum,w6,w7);
	nand(carry,w1,w5);
endmodule

module fulladder_4bit(input [3:0] a,b,output cout, [3:0] sum);
	wire w1,w2,w3;
	fulladder fa1(a[0],b[0],1'b0,sum[0],w1);
	fulladder fa2(a[1],b[1],w1,sum[1],w2);
	fulladder fa3(a[2],b[2],w2,sum[2],w3);
	fulladder fa4(a[3],b[3],w3,sum[3],cout);
endmodule 

module tb();
	reg [3:0] a,b;
	wire cout;
	wire [3:0] sum;
	fulladder_4bit fa(a,b,cout,sum);
	initial begin
		a = 4'b0001;
		b = 4'b1000;
		#1;
		a = 4'b0010;
		b = 4'b0101;
		#1;
	end
endmodule

	
	
