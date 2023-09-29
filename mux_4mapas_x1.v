module mux_4mapas_x1(
  mapa0, mapa1,
  sel,
  out
);
  input [6:0] mapa0, mapa1;
  input  sel;
  output [6:0] out;

  mux_2x1 mux0(mapa0[0], mapa1[0], sel, out[0]);
  mux_2x1 mux1(mapa0[1], mapa1[1], sel, out[1]);
  mux_2x1 mux2(mapa0[2], mapa1[2], sel, out[2]);
  mux_2x1 mux3(mapa0[3], mapa1[3], sel, out[3]);
  mux_2x1 mux4(mapa0[4], mapa1[4], sel, out[4]);
  mux_2x1 mux5(mapa0[5], mapa1[5], sel, out[5]);
  mux_2x1 mux6(mapa0[6], mapa1[6], sel, out[6]);
endmodule

module TB_mux_4mapas_x1();
  reg sel;
  reg [6:0] mapa0, mapa1;
  wire [6:0] out;

  mux_4mapas_x1 mux_4mapas_x1(mapa0, mapa1, sel, out);

  initial begin
    mapa0 = 7'b1000001;
    mapa1 = 7'b1100011;

    sel = 1'b0; #10; // out = 1000001
    sel = 1'b1; #10; // out = 1100011
  end
endmodule