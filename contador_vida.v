/*
	Contador de 3 bits decrescente
*/

module contador_vida(clock, reset, S);
	input clock;
	input reset;
	output [2:0] S;

	wire clock_cr; // clock + reset
	wire [2:0] curr, next;
	wire [2:0] curr_cr; // atual + reset

	or or_clk(clock_cr, clock, reset);

	controle_vida controle_vida(next, curr);

	or or0(curr_cr[0], reset, curr[0]);
	or or1(curr_cr[1], reset, curr[1]);
	or or2(curr_cr[2], reset, curr[2]);

	FF_d d0(curr_cr[0], clock_cr, next[0]);
	FF_d d1(curr_cr[1], clock_cr, next[1]);
	FF_d d2(curr_cr[2], clock_cr, next[2]);

	assign S = next;
endmodule

module controle_vida(E, S);
	input [2:0] E;
	output [2:0] S;

	wire w0, w1, w2, w3, w4, w5;

	// (a AND b) OR (a AND c)
	and and0 (w0, E[2], E[1]);
	and and1 (w1, E[2], E[0]);
	or or0 (S[2], w0, w1);

	// (a AND NOT b AND NOT c) OR (b AND c)
	and and2 (w2, E[2], ~E[1], ~E[0]);
	and and3 (w3, E[1], E[0]);
	or or1 (S[1], w2, w3);

	// (a AND NOT c) OR (b AND NOT c)
	and and4 (w4, E[2], ~E[0]);
	and and5 (w5, E[1], ~E[0]);
	or or2 (S[0], w4, w5);
endmodule

module TB_contador_vida();
	reg clock;
	reg reset;

	wire [2:0] S;

	contador_vida contador_vida(clock, reset, S);

	initial begin
		clock = 1'b0; reset = 1'b0; #10;
		clock = 1'b1; reset = 1'b1; #10;

		clock = 1'b0; reset = 1'b0; #10;
		clock = 1'b1; reset = 1'b0; #10;
		clock = 1'b0; reset = 1'b0; #10;
		clock = 1'b1; reset = 1'b0; #10;
		clock = 1'b0; reset = 1'b0; #10;
		clock = 1'b1; reset = 1'b0; #10;
		clock = 1'b0; reset = 1'b0; #10;
		clock = 1'b1; reset = 1'b0; #10;
		clock = 1'b0; reset = 1'b0; #10;
		clock = 1'b1; reset = 1'b0; #10;
		clock = 1'b0; reset = 1'b0; #10;
		clock = 1'b1; reset = 1'b0; #10;
		clock = 1'b0; reset = 1'b0; #10;
		clock = 1'b1; reset = 1'b0; #10;
		clock = 1'b0; reset = 1'b0; #10;
		clock = 1'b1; reset = 1'b0; #10;

		clock = 1'b0; reset = 1'b0; #10;
		clock = 1'b0; reset = 1'b1; #10;
		clock = 1'b1; reset = 1'b0; #10;
		clock = 1'b0; reset = 1'b1; #10;
		clock = 1'b1; reset = 1'b0; #10;
	end
endmodule
