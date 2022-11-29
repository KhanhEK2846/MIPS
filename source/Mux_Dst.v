module Mux_Dst(Tmp_Dst,I0,I1,RegDst);
output reg [4:0]Tmp_Dst;
input [4:0]I0,I1;
input RegDst;

always@(*)
	if(RegDst)
		Tmp_Dst <= I1;
	else
		Tmp_Dst <= I0;

endmodule
