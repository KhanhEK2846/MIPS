module ControlUnit(RegDst,RegWrite,ALUSrc,ALUcontrol,MemWrite,MemRead,MemToReg,Opcode,Funct);
input [5:0]Opcode, Funct;
output reg RegDst,RegWrite,ALUSrc,MemWrite,MemRead,MemToReg;
output reg [3:0]ALUcontrol;
reg [1:0]ALUOp;

always@(*)
begin
	case(Opcode)
		6'b100011: //lw
		begin
			RegDst <= 1'b0;
			ALUSrc <= 1'b1;
			MemToReg <= 1'b1;
			RegWrite <= 1'b1;
			MemRead <= 1'b1;
			MemWrite <= 1'b0;
			ALUOp <= 2'b0;
		end
		
		6'b101011: //sw
		begin
			RegDst <= 1'bx;
			ALUSrc <= 1'b1;
			MemToReg <= 1'bx;
			RegWrite <= 1'b0;
			MemRead <= 1'b0;
			MemWrite <= 1'b1;
			ALUOp <= 2'b0;
		end
		
		6'b0: //R-format
		begin
			RegDst <= 1'b1;
			ALUSrc <= 1'b0;
			MemToReg <= 1'b0;
			RegWrite <= 1'b1;
			MemRead <= 1'b0;
			MemWrite <= 1'b0;
			ALUOp <= 2'b10;
		end
	
	endcase
end

always@(*)
begin
	case(ALUOp)
		2'b00:
			ALUcontrol <= 4'b0010;
			
		2'b01:
			ALUcontrol <= 4'b0110;
			
		2'b10:
		begin
			case(Funct)
				6'b??0000:
					ALUcontrol <= 4'b0010;
					
				6'b??0100:
					ALUcontrol <= 4'b0000;	

				6'b??0101:
					ALUcontrol <= 4'b0001;					
				
			endcase
		end
			
	endcase
end


endmodule