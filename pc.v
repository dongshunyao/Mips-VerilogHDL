module pc(clock, reset, in, out);
	input clock, reset;
	input [29:0] in;

	output [29:0] out;

	reg [29:0] pcnow;


	assign out = pcnow;



endmodule
