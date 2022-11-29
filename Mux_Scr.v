module Mux_Scr(TmpScr,TmpExt,RD2,ALUSrc);
output reg [31:0] TmpScr;
input [31:0] TmpExt,RD2;
input ALUSrc;

always@(*)
	if(ALUSrc)
		TmpScr <= TmpExt;
	else
		TmpScr <= RD2;

endmodule