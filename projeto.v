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

  wire [6:0] matriz0, matriz1, matriz2, matriz3, matriz4; // mapas de bits da matriz de leds
  wire [6:0] mapa0, mapa1, mapa2, mapa3, mapa4; // mapa final do jogo

  wire enable; // habilita/desabilita matriz de leds
  wire DESLIGADO, PREPARACAO, ATAQUE; // estados do jogo

  divisor_freq divisor_freq(clock_in, clock_out);

  decodificadorDeStatus decodificadorDeStatus(
    .A(ch7), .B(ch6),
    .DESLIGADO(DESLIGADO), .PREPARACAO(PREPARACAO), .ATAQUE(ATAQUE)
  );

  assign enable = PREPARACAO | ATAQUE;

  seletor_mapa seletor_mapa(
    .sel({btn2, btn1, btn0}),
    .confirmar(btn3), .enable(PREPARACAO),
    .mapaTemp0(matriz0), .mapaTemp1(matriz1), .mapaTemp2(matriz2), .mapaTemp3(matriz3), .mapaTemp4(matriz4),
    .mapa0(mapa0), .mapa1(mapa1), .mapa2(mapa2), .mapa3(mapa3), .mapa4(mapa4)
  );

  matriz_leds matriz_leds(
    .l0(l0), .l1(l1), .l2(l2), .l3(l3), .l4(l4), .l5(l5), .l6(l6),
    .c0(c0), .c1(c1), .c2(c2), .c3(c3), .c4(c4),
    // clock de ~ 762 Hz
    // pois dentro do modulo matriz_leds tem um divisor de frequencia secundario (contador)
    .clock(clock_out[15]), .enable(enable),
    .mapa0(matriz0), .mapa1(matriz1), .mapa2(matriz2), .mapa3(matriz3), .mapa4(matriz4)
  );

endmodule

module TB_Projeto();
  reg ch0, ch1, ch2, ch3, ch4, ch5, ch6, ch7; // chaves
  reg btn0, btn1, btn2, btn3; // botoes

  wire d0, d1, d2, d3; // digitos do display
  wire a, b, c, d, e, f, g, dp; // segmentos do display
  wire l0, l1, l2, l3, l4, l5, l6; // linhas da matriz de leds
  wire c0, c1, c2, c3, c4; // colunas da matriz de leds

  reg clock_in; // clock

  projeto projeto(
    ch0, ch1, ch2, ch3, ch4, ch5, ch6, ch7,
    btn0, btn1, btn2, btn3,
    d0, d1, d2, d3,
    a, b, c, d, e, f, g, dp,
    l0, l1, l2, l3, l4, l5, l6,
    c0, c1, c2, c3, c4,
    clock_in
  );

  initial begin
    clock_in = 0;
    forever #10 clock_in = ~clock_in;
  end

  initial begin
    ch0 = 0; ch1 = 0; ch2 = 0; ch3 = 0; ch4 = 0; ch5 = 0; ch6 = 0; ch7 = 0;
    btn0 = 0; btn1 = 0; btn2 = 0; btn3 = 0;
  end
  
endmodule