module dm(clock, reset, in, WrEn, Addr, out);
	input clock, reset, WrEn;
	input [31:0] Addr, in;

	output [31:0] out;

	reg [31:0] memory[1023:0];

	integer i;


	assign out = memory[Addr[11:2]];


	initial
	begin
		for (i = 0; i < 1024; i = i + 1) memory[i] <= 0;
	end

	always@(posedge clock, posedge reset)
	begin
		if (reset)
			for (i = 0; i < 1024; i = i + 1) memory[i] <= 0;
		else
			if (WrEn) memory[Addr[11:2]] <= in;
	end

endmodule
