module gray_to_binary(input [3:0]in, output [3:0]out);
  buf (out[3],in[3]);
  xor (out[2], out[3], in[2]);
  xor (out[1], out[2], in[1]);
  xor (out[0], out[1], in[0]);
endmodule
  
module tb();

  reg [3:0] in;
  wire [3:0] out;
  gray_to_binary b1(in,out);
  
initial begin
  in = 4'b1011;
  
  #1;
  $display("%b",out);
end
endmodule
