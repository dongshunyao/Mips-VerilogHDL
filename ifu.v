module ifu(clock, reset, zero, nPC_sel, jumpCrt, ins);
	input clock, reset, zero, nPC_sel, jumpCrt;

	output [31:0] ins;

	wire [15:0] imm;
	wire [29:0] pcout, npcout;
	wire [25:0] tarAddr;


	assign imm = ins[15:0];
	assign tarAddr = ins[25:0];


	npc npc1(.jumpCrt(jumpCrt), .nPC_sel(nPC_sel), .zero(zero), .imm(imm), .pc(pcout), .out(npcout), .tarAddr(tarAddr));
	pc pc1(.clock(clock), .reset(reset), .in(npcout), .out(pcout));
	im im1(.Addr(pcout[9:0]), .out(ins));

endmodule
