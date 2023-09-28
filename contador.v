/*
	Contador de 0 até 4
	Entrada: clock
	Saída: S
*/

module contador(clock, S);
	input clock;
	output [2:0] S;

	wire w0, w1, w2;

	wire reset;

	FF_jk FF_jk1(1'b1, 1'b1, reset, clock, w0);
	FF_jk FF_jk2(1'b1, 1'b1, reset, ~w0, w1);
	FF_jk FF_jk3(1'b1, 1'b1, reset, ~w1, w2);

	and and0(reset, w2, ~w1, w0);

	assign S = {w2, w1, w0};
endmodule

// module contador(clock, S);
// 	input clock;
// 	output reg [2:0] S;

// 	initial begin
// 		S = 3'b000;
// 	end

// 	always @(posedge clock)
// 	begin
// 		if (S == 3'b100)
// 			S <= 3'b000;
// 		else
// 			S <= S + 1'b1;
// 	end

// endmodule

module TB_contador;
	reg clock;
	wire [2:0] S;

	contador contador(clock, S);

	initial begin
		clock = 1'b0; #10; // S = 000
		clock = 1'b1; #10; // S = 001
		clock = 1'b0; #10; // S = 001
		clock = 1'b1; #10; // S = 010
		clock = 1'b0; #10; // S = 010
		clock = 1'b1; #10; // S = 011
		clock = 1'b0; #10; // S = 011
		clock = 1'b1; #10; // S = 100
		clock = 1'b0; #10; // S = 100
		clock = 1'b1; #10; // S = 000
		clock = 1'b0; #10; // S = 000
		clock = 1'b1; #10; // S = 001
		clock = 1'b0; #10; // S = 001
		clock = 1'b1; #10; // S = 010
		clock = 1'b0; #10; // S = 010
		clock = 1'b1; #10; // S = 011
		clock = 1'b0; #10; // S = 011
		clock = 1'b1; #10; // S = 100
	end
endmodule
