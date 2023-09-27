module demux_1x5(Sel, E, Out5, Out4, Out3, Out2, Out1);
	input [2:0] Sel;
	input E;
	output Out5, Out4, Out3, Out2, Out1;

	wire W0, W1;

	demux_1x2 d0(.Sel(Sel[2]), .E(E), .Out2(W0), .Out1(W1));
	
	demux_1x4 d1(.Sel(Sel[1:0]), .E(W0), .Out4(), .Out3(), .Out2(), .Out1(Out5));
	demux_1x4 d2(.Sel(Sel[1:0]), .E(W1), .Out4(Out4), .Out3(Out3), .Out2(Out2), .Out1(Out1));
endmodule

module TB_demux_1x5();
	reg [2:0] Sel;
	reg E;
	wire Out1, Out2, Out3, Out4, Out5;

	demux_1x5 demux_1x5(Sel, E, Out5, Out4, Out3, Out2, Out1);

	initial begin
		Sel = 3'b000; E = 1'b1; #10; // Out1 = 1, Out2 = 0, Out3 = 0, Out4 = 0, Out5 = 0
		Sel = 3'b001; E = 1'b1; #10; // Out1 = 0, Out2 = 1, Out3 = 0, Out4 = 0, Out5 = 0
		Sel = 3'b010; E = 1'b1; #10; // Out1 = 0, Out2 = 0, Out3 = 1, Out4 = 0, Out5 = 0
		Sel = 3'b011; E = 1'b1; #10; // Out1 = 0, Out2 = 0, Out3 = 0, Out4 = 1, Out5 = 0
		Sel = 3'b100; E = 1'b1; #10; // Out1 = 0, Out2 = 0, Out3 = 0, Out4 = 0, Out5 = 1

		Sel = 3'b000; E = 1'b0; #10; // Out1 = 0, Out2 = 0, Out3 = 0, Out4 = 0, Out5 = 0
		Sel = 3'b001; E = 1'b0; #10; // Out1 = 0, Out2 = 0, Out3 = 0, Out4 = 0, Out5 = 0
		Sel = 3'b010; E = 1'b0; #10; // Out1 = 0, Out2 = 0, Out3 = 0, Out4 = 0, Out5 = 0
		Sel = 3'b011; E = 1'b0; #10; // Out1 = 0, Out2 = 0, Out3 = 0, Out4 = 0, Out5 = 0
		Sel = 3'b100; E = 1'b0; #10; // Out1 = 0, Out2 = 0, Out3 = 0, Out4 = 0, Out5 = 0

		// casos inválidos
		Sel = 3'b101; E = 1'b1; #10; // Out1 = 0, Out2 = 0, Out3 = 0, Out4 = 0, Out5 = 0
		Sel = 3'b110; E = 1'b1; #10; // Out1 = 0, Out2 = 0, Out3 = 0, Out4 = 0, Out5 = 0
		Sel = 3'b111; E = 1'b1; #10; // Out1 = 0, Out2 = 0, Out3 = 0, Out4 = 0, Out5 = 0
	end
endmodule