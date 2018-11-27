module im(Addr, out, reset);
	input reset;
	input [9:0] Addr;

	output [31:0] out;

	reg [31:0] memory[1023:0];

	integer i;

	assign out = memory[Addr];


	initial
	begin
		$readmemh("code.txt", memory);
	end

	always@(posedge reset)
	begin
		for (i = 0; i < 1024; i = i + 1) memory[i] = 0;
		$readmemh("code.txt", memory);
	end

endmodule
