module im(Addr, out);
	input [9:0] Addr;

	output [31:0] out;

	reg [31:0] memory[1023:0];


	assign out = memory[Addr];


	initial
	begin
		$readmemh("code.txt", memory);
	end

endmodule
