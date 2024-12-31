module dlatch(input data, enable, output reg q);
	always @(data or enable) begin
		if(enable)
			q = data;
	end
endmodule


module tb();
	reg data, enable;
	wire q;
	dlatch dl(data,enable,q);
	initial begin
		enable = 1'b1;
		#10;
		data = 1'b1;
		#10;
		data = 1'b0;
		#10;
		enable = 1'b0;
		
	end
endmodule
	
	