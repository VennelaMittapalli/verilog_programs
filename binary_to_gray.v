module binary_to_gray(input [3:0]bin, output [3:0]gout);
	assign gout[3] = bin[3];
	assign gout[2] = bin[3] ^ bin[2];
	assign gout[1] = bin[2] ^ bin[1];
	assign gout[0] = bin[1] ^ bin[0];
endmodule

module tb();
	reg [3:0]bin;
	wire [3:0]gout;
	binary_to_gray bg(bin,gout);
	initial begin
		bin = 4'b0110;
		#1;
	end
endmodule
