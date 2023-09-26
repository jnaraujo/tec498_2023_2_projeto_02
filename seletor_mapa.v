module seletor_mapa(sel, mapa4, mapa3, mapa2, mapa1, mapa0);
  input [2:0] sel;
  output [6:0] mapa0, mapa1, mapa2, mapa3, mapa4;
  
  mux_64x8 m0(7'b0000100, 7'b1110000, 7'b1110111, 7'b0000111, 7'b0000111, 7'b1000000, 7'b0111000, 7'b1000000, sel, mapa0);
  mux_64x8 m1(7'b0001100, 7'b0100000, 7'b1000010, 7'b0100001, 7'b0000010, 7'b1100000, 7'b0001001, 7'b1100111, sel, mapa1);
  mux_64x8 m2(7'b1000101, 7'b0100000, 7'b0100000, 7'b0111001, 7'b1000000, 7'b1000010, 7'b0010011, 7'b1000010, sel, mapa2);
  mux_64x8 m3(7'b1110001, 7'b1000010, 7'b0100000, 7'b0100011, 7'b1110001, 7'b0010010, 7'b0010001, 7'b0010010, sel, mapa3);
  mux_64x8 m4(7'b1000011, 7'b1110111, 7'b1110000, 7'b0000001, 7'b1000111, 7'b1110111, 7'b0111000, 7'b1110000, sel, mapa4);
endmodule

module TB_Seletor_Mapa();
  reg [2:0] sel;

  wire [6:0] mapa0, mapa1, mapa2, mapa3, mapa4;

  seletor_mapa seletor_mapa(sel, mapa4, mapa3, mapa2, mapa1, mapa0);

  initial begin
    sel = 000; #10; // mapa0 = 0000100; mapa1 = 0001100; mapa2 = 1000101; mapa3 = 1110001; mapa4 = 1000011;
    sel = 001; #10; // mapa0 = 1110000; mapa1 = 0100000; mapa2 = 0100000; mapa3 = 1000010; mapa4 = 1110111;
    sel = 010; #10; // mapa0 = 1110111; mapa1 = 1000010; mapa2 = 0100000; mapa3 = 0100000; mapa4 = 1110000;
    sel = 011; #10; // mapa0 = 0000111; mapa1 = 0100001; mapa2 = 0111001; mapa3 = 0100011; mapa4 = 0000001;
    sel = 100; #10; // mapa0 = 0000111; mapa1 = 0000010; mapa2 = 1000000; mapa3 = 1110001; mapa4 = 1000111;
    sel = 101; #10; // mapa0 = 1000000; mapa1 = 1100000; mapa2 = 1000010; mapa3 = 0010010; mapa4 = 1110111;
    sel = 110; #10; // mapa0 = 0111000; mapa1 = 0001001; mapa2 = 0010011; mapa3 = 0010001; mapa4 = 0111000;
    sel = 111; #10; // mapa0 = 1000000; mapa1 = 1100111; mapa2 = 1000010; mapa3 = 0010010; mapa4 = 1110000;
  end
endmodule