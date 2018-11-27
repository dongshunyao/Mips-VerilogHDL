module test();
	reg clock, reset;

	initial
	begin
		clock = 0;
		#5 reset = 1;
        #5 reset = 0;
	end

	always #20 clock = ~clock;

	mips mips(.clock(clock), .reset(reset));

endmodule
