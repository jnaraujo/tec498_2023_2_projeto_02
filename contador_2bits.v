/*
	Contador de 2 bits
*/

module contador_2bits(clock, S);
	input clock;
	output [1:0] S;

	wire w0, w1;

	FF_jk FF_jk1(1'b1, 1'b1, 1'b0, clock, w0);
	FF_jk FF_jk2(1'b1, 1'b1, 1'b0, ~w0, w1);

	assign S = {w1, w0};
endmodule