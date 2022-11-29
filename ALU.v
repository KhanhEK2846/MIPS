module ALU(ALU_result,zero,ALU_control,A,B);
output reg [31:0]ALU_result;
output reg zero;
input [3:0] ALU_control;
input [31:0] A,B;

always@(*)
begin
	case(ALU_control)
	4'b0:
		ALU_result <= A & B;
	4'b1:
		ALU_result <= A | B;
	4'b0010:
		ALU_result <= A + B;
	4'b0110:
		ALU_result <= A - B;		
	4'b0111:
		if(A < B)
			ALU_result <= 32'b1;	
		else
			ALU_result <= 32'b0;	
	4'b1100:
		ALU_result <= ~(A | B);
	default:
		ALU_result <= A;
	endcase
	if(ALU_result == 32'b0)
		zero <= 1'b1;
	else
		zero <= 1'b0;
end
endmodule