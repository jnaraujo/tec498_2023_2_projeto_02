module projeto(
  ch0, ch1, ch2, ch3, ch4, ch5, ch6, ch7,
  btn0, btn1, btn2, btn3,
  d0, d1, d2, d3,
  a, b, c, d, e, f, g, dp,
  l0, l1, l2, l3, l4, l5, l6,
  c0, c1, c2, c3, c4,
  clock_in
);
  input ch0, ch1, ch2, ch3, ch4, ch5, ch6, ch7; // chaves
  input btn0, btn1, btn2, btn3; // botoes

  output d0, d1, d2, d3; // digitos do display
  output a, b, c, d, e, f, g, dp; // segmentos do display

  output l0, l1, l2, l3, l4, l5, l6; // linhas da matriz de leds
  output c0, c1, c2, c3, c4; // colunas da matriz de leds

  input clock_in; // clock
  wire [17:0] clock_out; // clock dividido

  wire [6:0] mapa0, mapa1, mapa2, mapa3, mapa4; // mapas de bits da matriz de leds

  wire enable; // habilita/desabilita matriz de leds

  wire [2:0] contador; // contador de 0 até 4

  // mapa de exemplo
  assign mapa0 = 7'b0000100;
  assign mapa1 = 7'b0001100;
  assign mapa2 = 7'b1000101;
  assign mapa3 = 7'b1110001;
  assign mapa4 = 7'b1000011;

  assign enable = 1;

  divisor_freq divisor_freq(clock_in, clock_out);

  // contador de 0 até 4 - clock de 190Hz
  contador contador_04(clock_out[17], contador);

  matriz_leds matriz_leds(
    .l0(l0), .l1(l1), .l2(l2), .l3(l3), .l4(l4), .l5(l5), .l6(l6),
    .c0(c0), .c1(c1), .c2(c2), .c3(c3), .c4(c4),
    .contador(contador), .enable(enable),
    .mapa0(mapa0), .mapa1(mapa1), .mapa2(mapa2), .mapa3(mapa3), .mapa4(mapa4)
  );

endmodule
