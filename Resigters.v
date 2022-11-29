module Resigters(O,RD1,RD2,RR1,RR2,WR,WD,RegWrite,clk,clr);
output reg [31:0] RD1,RD2,O;
input [4:0]RR1,RR2,WR;
input [31:0]WD;
input RegWrite,clk,clr;
reg [31:0]Res[4:0];

always@(posedge clk or posedge clr)
begin
	if(clr)
	begin
		Res[5'd1] <= 32'd70;
		Res[5'd2] <= 32'd101;
		Res[5'd3] <= 32'd343;
	end
	else 
		if(RegWrite)
			Res[WR] <= WD;
end
		
always@(*)
begin
	RD1 <= Res[RR1];
	RD2 <= Res[RR2];
	O <= Res[5'd1];
end

endmodule