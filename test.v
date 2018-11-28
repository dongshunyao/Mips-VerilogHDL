module test();
	reg clock, reset;

	initial
	begin
		clock = 0;
		reset = 0;
		#3 reset = 1;
        #3 reset = 0;
	end

	always #10 clock = ~clock;

	mips mips(.clock(clock), .reset(reset));

endmodule
