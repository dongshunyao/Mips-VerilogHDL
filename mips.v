module mips(clock, reset);
	input clock, reset;

	wire [31:0] ins, busW, busA, busB, aluout, aluinB, extout, dmout;
	wire [15:0] imm;
	wire [4:0] rd, rt, rs;
	wire zero, nPC_sel, RegWr, RegDst, ExtOp, ALUSrc, ALUctr, MemWr, MemtoReg, jumpCtr;


	assign rd = ins[15:11];
	assign rt = ins[20:16];
	assign rs = ins[25:21];
	assign imm = ins[15:0];


	ifu ifu1(.clock(clock), .reset(reset), .zero(zero), .nPC_sel(nPC_sel), .jumpCtr(jumpCtr), .ins(ins));
	ctrl ctrl1(.ins(ins), .nPC_sel(nPC_sel), .RegWr(RegWr), .RegDst(RegDst), .ExtOp(ExtOp), .ALUSrc(ALUSrc), .ALUctr(ALUctr), .MemWr(MemWr), .MemtoReg(MemtoReg), .jumpCtr(jumpCtr));
	rf rf1(.busW(busW), .RegWr(RegWr), .RegDst(RegDst), .rd(rd), .rt(rt), .RA(rs), .RB(rt), .busA(busA), .busB(busB), .clock(clock), .reset(reset));
	alu alu1(.a(busA), .b(aluinB), .op(ALUctr), .out(aluout), .zero(zero));
	ext ext1(.in(imm), .out(extout), .ExtOp(ExtOp));
	mux mux1(.in_1(extout), .in_0(busB), .op(ALUSrc), .out(aluinB));
	dm dm1(.clock(clock), .reset(reset), .in(busB), .WrEn(MemWr), .Addr(aluout), .out(dmout));
	mux mux2(.in_1(dmout), .in_0(aluout), .op(MemtoReg), .out(busW));

endmodule
