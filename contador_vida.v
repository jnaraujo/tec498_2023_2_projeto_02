module contador_vida(clock, reset, S);
	input clock;
	input reset;
	output [1:0] S;

	wire [1:0] curr, next;

	controle_vida controle_vida(next, curr);

	FF_jk ff(
  	curr[0], ~curr[0], reset, clock, next[0]
  );

	FF_jk ff2(
  	curr[1], ~curr[1], reset, clock, next[1]
  );
	
	assign S = next;
endmodule

module controle_vida(E, S);
	input [1:0] E;
	output [1:0] S;

	// a OR b
	or or0 (S[1], E[1], E[0]);

	// a OR NOT b
	or or1 (S[0], E[1], ~E[0]);
endmodule

module TB_contador_vida();
	reg clock;
	reg reset;

	wire [1:0] S;

	contador_vida contador_vida(clock, reset, S);

	initial begin
		reset = 1'b0; #10;

		clock = 1'b0; #10; // S = 00
		clock = 1'b1; #10; // S = 01
		clock = 1'b0; #10; // S = 01
		clock = 1'b1; #10; // S = 10
		clock = 1'b0; #10; // S = 10
		clock = 1'b1; #10; // S = 11
		clock = 1'b0; #10; // S = 11
		clock = 1'b1; #10; // S = 11

		// reset
		reset = 1'b1; #10;
		reset = 1'b0; #10;

		clock = 1'b0; #10; // S = 00
		clock = 1'b1; #10; // S = 01
		clock = 1'b0; #10; // S = 01
		clock = 1'b1; #10; // S = 10
		clock = 1'b0; #10; // S = 10

		reset = 1'b1; #10;
		reset = 1'b0; #10;

		clock = 1'b0; #10; // S = 00
		clock = 1'b1; #10; // S = 01
		clock = 1'b0; #10; // S = 01
		clock = 1'b1; #10; // S = 10
		clock = 1'b0; #10; // S = 10
	end
endmodule
