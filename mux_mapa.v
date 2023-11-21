module mux_mapa(
  mapa0, mapa1, mapa2, mapa3,
  sel,
  out
);
  input [6:0] mapa0, mapa1, mapa2, mapa3;
  input [1:0] sel;
  output [6:0] out;

  mux_4x1 m0(mapa0[6], mapa1[6], mapa2[6], mapa3[6], sel, out[6]);
  mux_4x1 m1(mapa0[5], mapa1[5], mapa2[5], mapa3[5], sel, out[5]);
  mux_4x1 m2(mapa0[4], mapa1[4], mapa2[4], mapa3[4], sel, out[4]);
  mux_4x1 m3(mapa0[3], mapa1[3], mapa2[3], mapa3[3], sel, out[3]);
  mux_4x1 m4(mapa0[2], mapa1[2], mapa2[2], mapa3[2], sel, out[2]);
  mux_4x1 m5(mapa0[1], mapa1[1], mapa2[1], mapa3[1], sel, out[1]);
  mux_4x1 m6(mapa0[0], mapa1[0], mapa2[0], mapa3[0], sel, out[0]);
endmodule

module TB_mux_mapa();
  reg [1:0] sel;
  reg [6:0] mapa0, mapa1, mapa2, mapa3;
  wire [6:0] out;

  mux_mapa mux_mapa(mapa0, mapa1, mapa2, mapa3, sel, out);

  initial begin
    mapa0 = 7'b1000001;
    mapa1 = 7'b1100011;
    mapa2 = 7'b1110111;
    mapa3 = 7'b1111001;

    sel = 3'b00; #10; // out = 1000001
    sel = 3'b01; #10; // out = 1100011
    sel = 3'b10; #10; // out = 1110111
    sel = 3'b11; #10; // out = 1111001
  end
endmodule