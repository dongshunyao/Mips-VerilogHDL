module ctrl(ins, nPC_sel, RegWr, RegDst, ExtOp, ALUSrc, ALUctr, MemWr, MemtoReg, jumpCtr);
	input [31:0] ins;

	output reg [2:0] ALUctr;
	output reg nPC_sel, RegWr, RegDst, ExtOp, ALUSrc, MemWr, MemtoReg, jumpCtr;

	wire [5:0] opcode, funct;


	assign opcode = ins[31:26];
	assign funct = ins[5:0];


	initial
	begin
		nPC_sel = 0;
		RegWr = 0;
		RegDst = 0;
		ExtOp = 0;
		ALUSrc = 0;
		MemWr = 0;
		MemtoReg = 0;
		jumpCtr = 0;
		ALUctr = 3'b100;
	end

	parameter R = 6'b000000;
	parameter ori = 6'b001101;
	parameter lw = 6'b100011;
	parameter sw = 6'b101011;
	parameter beq = 6'b000100;
	parameter j = 6'b000010;
	parameter lui = 6'b001111;

	always@(*)
	begin
		case (opcode)
			R:
			begin
				nPC_sel = 0;
				RegWr = 1;
				RegDst = 1;
				ExtOp = 0;
				ALUSrc = 0;
				MemWr = 0;
				MemtoReg = 0;
				jumpCtr = 0;
				case (funct)
					6'b100001: ALUctr = 3'b000;
					6'b100011: ALUctr = 3'b001;
				endcase
			end

			ori:
			begin
				nPC_sel = 0;
				RegWr = 1;
				RegDst = 0;
				ExtOp = 0;
				ALUSrc = 1;
				MemWr = 0;
				MemtoReg = 0;
				jumpCtr = 0;
				ALUctr = 3'b010;
			end

			lw:
			begin
				nPC_sel = 0;
				RegWr = 1;
				RegDst = 0;
				ExtOp = 1;
				ALUSrc = 1;
				MemWr = 0;
				MemtoReg = 1;
				jumpCtr = 0;
				ALUctr = 3'b000;
			end

			sw:
			begin
				nPC_sel = 0;
				RegWr = 0;
				RegDst = 0;
				ExtOp = 1;
				ALUSrc = 1;
				MemWr = 1;
				MemtoReg = 0;
				jumpCtr = 0;
				ALUctr = 3'b000;
			end

			beq:
			begin
				nPC_sel = 1;
				RegWr = 0;
				RegDst = 0;
				ExtOp = 0;
				ALUSrc = 0;
				MemWr = 0;
				MemtoReg = 0;
				jumpCtr = 0;
				ALUctr = 3'b001;
			end

			j:
			begin
				nPC_sel = 0;
				RegWr = 0;
				RegDst = 0;
				ExtOp = 0;
				ALUSrc = 0;
				MemWr = 0;
				MemtoReg = 0;
				jumpCtr = 1;
				ALUctr = 3'b100;
			end

			lui:
			begin
				nPC_sel = 0;
				RegWr = 1;
				RegDst = 0;
				ExtOp = 0;
				ALUSrc = 1;
				MemWr = 0;
				MemtoReg = 0;
				jumpCtr = 0;
				ALUctr = 3'b011;
			end
		endcase
	end

endmodule
