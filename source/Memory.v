module Memory(TmpMem,Addr,Data,MemWrite,MemRead,clk);
output reg [31:0] TmpMem;
input clk,MemWrite,MemRead;
input [31:0] Addr,Data;
reg [31:0]Mem[31:0];


always@(posedge clk)
	if(MemWrite && !MemRead)
		Mem[Addr] <= Data;
		
always@(*)
	if(!MemWrite && MemRead)
		TmpMem <= Mem[Addr];
	else
		TmpMem <= 32'bz;

endmodule
