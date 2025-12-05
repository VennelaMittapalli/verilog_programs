module async_fifo(input rclk,wclk,reset,we,re,input [7:0]data_in, output empty,full,reg [7:0]data_out);
reg [7:0]mem[15:0];
reg [4:0]fifo_counter;
reg [3:0] read_ptr = 4'd0;
reg [3:0] write_ptr =4'd0;
integer i;

assign full=(fifo_counter>5'b01111)?1'b1:1'b0;
assign empty=(fifo_counter==5'b00000)?1'b1:1'b0;

always @(posedge wclk or posedge rclk or posedge reset) begin
if(reset) fifo_counter <= 5'd0;
else if(we&&!full) fifo_counter<= fifo_counter + 1'b1;
else if(re&&!empty) fifo_counter<= fifo_counter -1'b1;

else fifo_counter <= fifo_counter;
end

always @(posedge wclk or posedge reset) begin
if(reset) begin
for(i=0;i<16;i=i+1) begin
mem[i]=4'd0;
end
write_ptr <= 4'd0;
end
else if(we&&!full) begin 
mem[write_ptr] <= data_in;
write_ptr <= write_ptr+1;
end
else 
write_ptr <= write_ptr;
end

always @(posedge rclk or posedge reset) begin
if(reset) begin
data_out <= 8'd0;
read_ptr <= 4'd0;
end
else if(re&& !empty) begin
data_out <= mem[read_ptr];
read_ptr <= read_ptr + 1;
end
else read_ptr <= read_ptr;
end


endmodule
