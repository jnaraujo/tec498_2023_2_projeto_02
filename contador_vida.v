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
	
	or or0 (S[1], E[1], E[0]);
	or or1 (S[0], E[1], ~E[0]);
endmodule

module TB_contador_vida();
	reg clock;
	reg reset;

	wire [1:0] S;

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