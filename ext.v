module ext(in, out, ExtOp);
	input [15:0] in;
	input ExtOp;

	output [31:0] out;


	assign out = {(ExtOp ? (in[15] ? 16'hffff : 16'b0) : 16'b0), in};

endmodule
