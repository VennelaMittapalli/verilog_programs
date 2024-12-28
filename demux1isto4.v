module demux(input i, s0,s1, output d0,d1,d2,d3);
	wire not0, not1;
	not (not0,s0);
	not (not1,s1);
	and (d0,i,not1,not0);
	and (d1,i,not1,s0);
	and (d2,i,s1,not0);
	and (d3,i,s1,s0);
endmodule


module tb();
	reg i,s0,s1;
	wire d0,d1,d2,d3;
	integer j;

	demux dmux(i,s0,s1,d0,d1,d2,d3);

	initial  begin
		for(j=0; j<8;j=j+1) begin
			{i,s0,s1} = j;
			#1;
		end
	end
endmodule
		