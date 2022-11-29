module Datapath(zero,Out,Inst,RegDst,RegWrite,ALUSrc,ALUcontrol,MemWrite,MemRead,MemToReg,clk,clr);
output zero;
output [31:0]Out;
input [25:0] Inst;
input RegDst,RegWrite,ALUSrc,MemWrite,MemRead,MemToReg,clk,clr;
input [3:0]ALUcontrol;
//wire [31:0]Resigter[4:0];
//wire [31:0]Mem[31:0];
wire [4:0] Tmp_Dst;
wire [31:0]TmpExt, TmpMtR, TmpScr,ALU_result, TmpMem;
wire [31:0] RD1,RD2;

Mux_Dst(Tmp_Dst,Inst[20:16],Inst[15:11],RegDst);
Resigters(Out,RD1,RD2,Inst[25:21],Inst[20:16],Tmp_Dst,TmpMtR,RegWrite,clk,clr);
Sign_Extend(TmpExt,Inst[15:0]);
Mux_Scr(TmpScr,TmpExt,RD2,ALUSrc);
ALU(ALU_result,zero,ALUcontrol,RD1,TmpScr);
Memory(TmpMem,ALU_result,RD2,MemWrite,MemRead,clk);
Mux_ToReg(TmpMtR,ALU_result,TmpMem,MemToReg);

endmodule