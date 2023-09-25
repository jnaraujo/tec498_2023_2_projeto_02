module mux_2x1(a, b, sel, out);
	input a, b, sel;

	output out;

	assign out = ~sel & a | sel & b;
endmodule

module TB_mux_2x1();
	reg a, b, sel;
	wire out;

	mux_2x1 mux_2x1(a, b, sel, out);

	initial begin
		sel = 0; a = 0; b = 0; #10; // out = 0
		sel = 0; a = 0; b = 1; #10; // out = 0
		sel = 0; a = 1; b = 0; #10; // out = 1
		sel = 0; a = 1; b = 1; #10; // out = 1
		sel = 1; a = 0; b = 0; #10; // out = 0
		sel = 1; a = 0; b = 1; #10; // out = 1
		sel = 1; a = 1; b = 0; #10; // out = 0
		sel = 1; a = 1; b = 1; #10; // out = 1
	end
endmodule
