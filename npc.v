module npc(jumpCtr, nPC_sel, zero, imm, pc, out, tarAddr);
	input jumpCtr, nPC_sel, zero;
	input [29:0] pc;
	input [15:0] imm;
	input [25:0] tarAddr;

	output [29:0] out;

	wire [29:0] tojump, tobeq, tonext, immext;


	assign tonext = pc + 1;
	assign immext = ((imm[15] == 0) ? {14'b0, imm} : {14'b11111111111111, imm});
	assign tobeq = tonext + immext;
	assign tojump = {pc[29:26], tarAddr};
	assign out = (jumpCtr ? tojump : ((nPC_sel && zero) ? tobeq : tonext));

endmodule
