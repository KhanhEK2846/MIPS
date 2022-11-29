module Sign_Extend(TmpExt,I);
input [15:0]I;
output reg [31:0]TmpExt;

always@(*)
begin
	TmpExt[15:0] <= I[15:0];
	if(I[15] == 1'b0)
		TmpExt[31:16] <= 16'b0;
	else
		TmpExt[31:16] <= 16'hffff;
end
endmodule
