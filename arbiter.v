module arbiter(input r1,r2,r3,reset,clk,output reg g1,g2,g3);
parameter [1:0] s0=2'b00, s1=2'b01, s2=2'b10, s3=2'b11;
reg [1:0] current_state, next_state;

always @(posedge clk or posedge reset) begin
if(reset) current_state <= s0;
else current_state <= next_state;
end

always @(current_state or r1 or r2  or r3) begin
next_state <= s0;
case(current_state)
s0:  begin if(r1) next_state <= s1;
    else if(r2) next_state <= s2;
    else if(r3) next_state <= s3;
    else next_state <= s0; end
s1: begin if(r1) next_state <= s1;
    else next_state <= s0;end
s2: begin if(r2) next_state <= s2;
    else next_state <= s0;end
s3: begin if(r3) next_state <= s3;
    else next_state <= s0;end
default: next_state <= s0;
endcase
end

always @(current_state) begin
case(current_state)
s0:  {g1,g2,g3}<=3'b000;
s1:  {g1,g2,g3}<=3'b100;
s2:  {g1,g2,g3}<=3'b010;
s3:  {g1,g2,g3}<=3'b001;
endcase
end


module arbiter_tb();

reg r1,r2,r3,reset;
reg clk=1'b1;
wire g1,g2,g3;

always #5 clk =~clk;

arbiter ar(r1,r2,r3,reset,clk,g1,g2,g3);

initial begin
reset =1'b1;
#10;
reset=1'b0;#20;
{r1,r2,r3}=3'b111;#40;
{r1,r2,r3}=3'b010;#40;
{r1,r2,r3}=3'b011;#20;
{r1,r2,r3}=3'b000;#20;
$finish;
end
endmodule
    
endmodule
