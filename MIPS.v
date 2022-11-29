module MIPS(O,zero,Inst,clk,clr);
output zero;
output [31:0] O;
input clk,clr;
input [31:0] Inst;
wire RegDst,RegWrite,ALUSrc,MemWrite,MemRead,MemToReg;
wire [3:0] ALUcontrol;

Datapath(zero,O,Inst[25:0],RegDst,RegWrite,ALUSrc,ALUcontrol,MemWrite,MemRead,MemToReg,clk,clr);
ControlUnit(RegDst,RegWrite,ALUSrc,ALUcontrol,MemWrite,MemRead,MemToReg,Inst[31:26],Inst[5:0]);

endmodule