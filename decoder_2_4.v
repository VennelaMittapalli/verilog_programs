module decoder(input a,b,output d0,d1,d2,d3);
  assign d3 = a?(b?1'b1:1'b0):1'b0;
  assign d2 = a?(b?1'b0:1'b1):1'b0;
          assign d1 = a?1'b0:(b?1'b1:1'b0);
          assign d0 = a?1'b0:(b?1'b0:1'b1);
endmodule

module decoder1(input a,b,output d0,d1,d2,d3);
	wire not1,not2;
	not (not1,a);
	not (not2,b);
	and (d0,not1,not2);
	and (d1,not1,b);
	and (d2,a,not2);
	and (d3,a,b);
endmodule

module decoder2(input a,b, output d0,d1,d2,d3);
	case({a,b}) 
		2'b00: d0 = 1'b1;
		2'b01: d1 = 1'b1;
		2'b10: d2 = 1'b1;
		2'b11: d3 = 1'b1;
		default : {d3,d2,d1,d0} = 4'b0000;
	endcase
endmodule
	



module tb();

  reg a,b;
  
  wire d0,d1,d2,d3;
  
  decoder1 d(a,b,d0,d1,d2,d3);
  
initial begin
  {a,b} = 2'b11;
  
  #1;
    $display("%b",{d0,d1,d2,d3});

end
endmodule
