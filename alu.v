module alu(a, b, op, out, zero);
	input [31:0] a, b;
	input [2:0] op;

	output zero;
	output [31:0] out;

	reg [32:0] result;


	assign out = result[31:0];
	assign zero = (out == 0) ? 1 : 0;


	parameter addu = 3'b000;
	parameter subu = 3'b001;
	parameter ori = 3'b010;
	parameter lui = 3'b011;

	always@(*)
	begin
		case (op)
			addu : result = a + b;
			subu : result = a - b;
			ori : result = a | b;
			lui : result = {1'b0, b[15:0], 16'b0};
		endcase
	end

endmodule
