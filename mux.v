module mux(in_1, in_0, op, out);
	input [31:0] in_1, in_0;
	input op;

	output [31:0] out;


	assign out = op ? in_1 : in_0;

endmodule
