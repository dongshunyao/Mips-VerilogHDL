module rf(busW, RegWr, RegDst, rd, rt, RA, RB, busA, busB, clock, reset);
	input clock, reset, RegWr, RegDst;
	input [4:0] rd, rt, RA, RB;
	input [31:0] busW;

	output [31:0] busA, busB;

	reg [31:0] register[31:0];

	wire [4:0] RW;

	integer i;


	assign RW = RegDst ? rd : rt;
	assign busA = register[RA];
	assign busB = register[RB];


	initial
	begin
		for (i = 0; i < 32; i = i + 1) register[i] <= 0;
	end

	always@(posedge clock, posedge reset)
	begin
		if (reset)
			for (i = 0; i < 32; i = i + 1) register[i] <= 0;
		else
			if (RegWr && RW != 0) register[RW] = busW;
	end

endmodule
