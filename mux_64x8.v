module mux_64x8(
  mapa0, mapa1, mapa2, mapa3, mapa4, mapa5, mapa6, mapa7,
  sel,
  out
);
  input [6:0] mapa0, mapa1, mapa2, mapa3, mapa4, mapa5, mapa6, mapa7;
  input [2:0] sel;
  output [6:0] out;

  mux_8x1 m0(mapa0[6], mapa1[6], mapa2[6], mapa3[6], mapa4[6], mapa5[6], mapa6[6], mapa7[6], sel, out[6]);
  mux_8x1 m1(mapa0[5], mapa1[5], mapa2[5], mapa3[5], mapa4[5], mapa5[5], mapa6[5], mapa7[5], sel, out[5]);
  mux_8x1 m2(mapa0[4], mapa1[4], mapa2[4], mapa3[4], mapa4[4], mapa5[4], mapa6[4], mapa7[4], sel, out[4]);
  mux_8x1 m3(mapa0[3], mapa1[3], mapa2[3], mapa3[3], mapa4[3], mapa5[3], mapa6[3], mapa7[3], sel, out[3]);
  mux_8x1 m4(mapa0[2], mapa1[2], mapa2[2], mapa3[2], mapa4[2], mapa5[2], mapa6[2], mapa7[2], sel, out[2]);
  mux_8x1 m5(mapa0[1], mapa1[1], mapa2[1], mapa3[1], mapa4[1], mapa5[1], mapa6[1], mapa7[1], sel, out[1]);
  mux_8x1 m6(mapa0[0], mapa1[0], mapa2[0], mapa3[0], mapa4[0], mapa5[0], mapa6[0], mapa7[0], sel, out[0]);
endmodule

module TB_64x8();
  reg [2:0] sel;
  reg [6:0] mapa0, mapa1, mapa2, mapa3, mapa4, mapa5, mapa6, mapa7;
  wire [6:0] out;

  mux_64x8 mux_64x8(mapa0, mapa1, mapa2, mapa3, mapa4, mapa5, mapa6, mapa7, sel, out);

  initial begin
    mapa0 = 7'b1000001;
    mapa1 = 7'b1100011;
    mapa2 = 7'b1110111;
    mapa3 = 7'b1111001;
    mapa4 = 7'b1111101;
    mapa5 = 7'b1111110;
    mapa6 = 7'b1111111;
    mapa7 = 7'b0111111;

    sel = 3'b000; #10; // out = 1000001
    sel = 3'b001; #10; // out = 1100011
    sel = 3'b010; #10; // out = 1110111
    sel = 3'b011; #10; // out = 1111001
    sel = 3'b100; #10; // out = 1111101
    sel = 3'b101; #10; // out = 1111110
    sel = 3'b110; #10; // out = 1111111
    sel = 3'b111; #10; // out = 0111111
  end
endmodule