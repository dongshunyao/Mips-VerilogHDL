module pc(clock, reset, in, out);
	input clock, reset;
	input [29:0] in;

	output [29:0] out;

	reg [29:0] pcnow;


	assign out = pcnow;


	initial
	begin
		pcnow <= 30'h00000c00;
	end

	always@(posedge clock, posedge reset)
	begin
		if (reset) pcnow <= 30'h00000c00;
		else pcnow <= in;
	end

endmodule
