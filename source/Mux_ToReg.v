module Mux_ToReg(TmpMtR,ALU_result,TmpMem,MemToReg);
output reg [31:0] TmpMtR;
input [31:0] ALU_result,TmpMem;
input MemToReg;

always@(*)
	if(MemToReg)
		TmpMtR <= TmpMem;
	else
		TmpMtR <= ALU_result;
endmodule
