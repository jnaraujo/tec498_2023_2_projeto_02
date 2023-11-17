module matriz_leds(
  l0, l1, l2, l3, l4, l5, l6,
  c0, c1, c2, c3, c4,
  contador, enable,
  mapa0, mapa1, mapa2, mapa3, mapa4
);
  output l0, l1, l2, l3, l4, l5, l6, c0, c1, c2, c3, c4; // linhas e colunas da matriz de leds
  input [2:0] contador; // contador de 0 a 7
  input [6:0] mapa0, mapa1, mapa2, mapa3, mapa4; // mapas de bits da matriz de leds
  input enable; // habilita/desabilita matriz de leds

  wire w_l0, w_l1, w_l2, w_l3, w_l4, w_l5, w_l6; // linhas da matriz de leds

  // demux para ativar uma coluna por vez
  demux_1x5 d0(.Sel(contador), .E(enable), .Out5(c4), .Out4(c3), .Out3(c2), .Out2(c1), .Out1(c0));

  // mux para selecionar o mapa de bits da linha
  mux_5x1 mux0(.a(mapa0[6]), .b(mapa1[6]), .c(mapa2[6]), .d(mapa3[6]), .e(mapa4[6]), .sel(contador), .out(w_l0));
  mux_5x1 mux1(.a(mapa0[5]), .b(mapa1[5]), .c(mapa2[5]), .d(mapa3[5]), .e(mapa4[5]), .sel(contador), .out(w_l1));
  mux_5x1 mux2(.a(mapa0[4]), .b(mapa1[4]), .c(mapa2[4]), .d(mapa3[4]), .e(mapa4[4]), .sel(contador), .out(w_l2));
  mux_5x1 mux3(.a(mapa0[3]), .b(mapa1[3]), .c(mapa2[3]), .d(mapa3[3]), .e(mapa4[3]), .sel(contador), .out(w_l3));
  mux_5x1 mux4(.a(mapa0[2]), .b(mapa1[2]), .c(mapa2[2]), .d(mapa3[2]), .e(mapa4[2]), .sel(contador), .out(w_l4));
  mux_5x1 mux5(.a(mapa0[1]), .b(mapa1[1]), .c(mapa2[1]), .d(mapa3[1]), .e(mapa4[1]), .sel(contador), .out(w_l5));
  mux_5x1 mux6(.a(mapa0[0]), .b(mapa1[0]), .c(mapa2[0]), .d(mapa3[0]), .e(mapa4[0]), .sel(contador), .out(w_l6));

  assign l0 = ~w_l0;
  assign l1 = ~w_l1;
  assign l2 = ~w_l2;
  assign l3 = ~w_l3;
  assign l4 = ~w_l4;
  assign l5 = ~w_l5;
  assign l6 = ~w_l6;
endmodule

module TB_matriz_leds();
  reg [2:0] contador;
  wire l0, l1, l2, l3, l4, l5, l6, c0, c1, c2, c3, c4;
  wire [6:0] mapa0, mapa1, mapa2, mapa3, mapa4;
  wire enable;

  assign mapa0 = 7'b0000100;
  assign mapa1 = 7'b0001100;
  assign mapa2 = 7'b1000101;
  assign mapa3 = 7'b1110001;
  assign mapa4 = 7'b1000011;

  assign enable = 1;

  matriz_leds matriz_leds(
    l0, l1, l2, l3, l4, l5, l6,
    c0, c1, c2, c3, c4,
    contador, enable,
    mapa0, mapa1, mapa2, mapa3, mapa4
  );

  initial begin
    contador = 3'b000; #10;
    contador = 3'b001; #10;
    contador = 3'b010; #10;
    contador = 3'b011; #10;
    contador = 3'b100; #10;

    // repete o ciclo

    contador = 3'b000; #10;
    contador = 3'b001; #10;
    contador = 3'b010; #10;
    contador = 3'b011; #10;
    contador = 3'b100; #10;
    contador = 3'b000; #10;
  end
endmodule