module decoder_3_8_dataflow(input a,b,c, output y0,y1,y2,y3,y4,y5,y6,y7);
	assign y0 = ~a&~b&~c;
	assign y1 = ~a&~b&c;
	assign y2 = ~a&b&~c;
	assign y3 = ~a&b&c;
	assign y4 = a&~b&~c;
	assign y5 = a&~b&c;
	assign y6 = a&b&~c;
	assign y7 = a&b&c;
endmodule	

module decoder_3_8_structural(input a,b,c, output y0,y1,y2,y3,y4,y5,y6,y7);
	wire nota, notb, notc;
	not (nota,a);
	not (notb,b);
	not (notc,c);
	and (y0,nota,notb,notc);
	and (y1,nota,notb,c);
	and (y2,nota,b,notc);
	and (y3,nota,b,c);
	and (y4,a,notb,notc);
	and (y5,a,notb,c);
	and (y6,a,b,notc);
	and (y7,a,b,c);
endmodule
	
module decoder_3_8_behavioral(input a,b,c, output reg y0,y1,y2,y3,y4,y5,y6,y7);
	always @(a or b or c) begin
		y0 = ~a&~b&~c;
		y1 = ~a&~b&c;
		y2 = ~a&b&~c;
		y3 = ~a&b&c;
		y4 = a&~b&~c;
		y5 = a&~b&c;
		y6 = a&b&~c;
		y7 = a&b&c;
	end
endmodule

module tb();
	reg a,b,c;
	wire y0,y1,y2,y3,y4,y5,y6,y7;
	integer i;

	decoder_3_8_dataflow df(a,b,c,y0,y1,y2,y3,y4,y5,y6,y7);

	initial begin
		for( i=0; i<8; i=i+1) begin
			{a,b,c} = i;
			#1;
		end
	end
endmodule
		
