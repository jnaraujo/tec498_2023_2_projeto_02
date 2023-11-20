module contador_vida(clock, reset, S);
	input clock;
	input reset;
	output [2:0] S;

	wire [2:0] curr, next;

	controle_vida controle_vida(next, curr);

	FF_jk ff(
  	 curr[0], ~curr[0], reset, clock, next[0]
   );

	FF_jk ff2(
  	 curr[1], ~curr[1], reset, clock, next[1]
   );
	
	FF_jk ff3(
  	 curr[2], ~curr[2], reset, clock, next[2]
   );
	
	assign S = next;
endmodule

module controle_vida(E, S);
	input [2:0] E;
	output [2:0] S;

	wire w0, w1, w2, w3, w4;

	// a OR (b AND c)
	and and0 (w0, E[1], E[0]);
	or or0 (S[2], E[2], w0);

	// (a AND b) OR (b AND NOT c) OR ( NOT b AND c)
	and and1 (w1, E[2], E[1]);
	and and2(w2, E[1], ~E[0]);
	and and3(w3, ~E[1], E[0]);
	or or1 (S[1], w1, w2, w3);

	// (a AND b) OR NOT c
	and and4 (w4, E[2], E[1]);
	or or2 (S[0], w4, ~E[0]);
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