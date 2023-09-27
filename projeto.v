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

  wire [6:0] mapa0, mapa1, mapa2, mapa3, mapa4; // mapa final do jogo

  wire [6:0] matrizSelTemp0, matrizSelTemp1, matrizSelTemp2, matrizSelTemp3, matrizSelTemp4; // matriz temporaria selecionada pelo jogador na preparacao
  wire [6:0] matrizAtaque0, matrizAtaque1, matrizAtaque2, matrizAtaque3, matrizAtaque4; // matriz de ataque do jogador
  wire [6:0] matriz0, matriz1, matriz2, matriz3, matriz4; // bits que serao exibidos na matriz de leds

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
    .mapaTemp0(matrizSelTemp0), .mapaTemp1(matrizSelTemp1), .mapaTemp2(matrizSelTemp2), .mapaTemp3(matrizSelTemp3), .mapaTemp4(matrizSelTemp4),
    .mapa0(mapa0), .mapa1(mapa1), .mapa2(mapa2), .mapa3(mapa3), .mapa4(mapa4)
  );

  // gerencia o ataque do jogador
  gerenciador_de_ataque gerenciador_de_ataque(
    .coordColuna({ch5, ch4, ch3}), .coordLinha({ch2, ch1, ch0}), .enable(ATAQUE),
    .confirmar(btn0),
    .mapa0(mapa0), .mapa1(mapa1), .mapa2(mapa2), .mapa3(mapa3), .mapa4(mapa4),
    .matriz0(matrizAtaque0), .matriz1(matrizAtaque1), .matriz2(matrizAtaque2), .matriz3(matrizAtaque3), .matriz4(matrizAtaque4)
  );

  // seleciona qual dos mapas dever ser exibido na matriz de leds
  // dependendo do estado do jogo
  // se o jogo estiver desligado, tanto faz o mapa
  // ja que a matriz de leds estara desligada
  mux_16x8 mux0(matrizSelTemp0, matrizAtaque0, PREPARACAO, matriz0);
  mux_16x8 mux1(matrizSelTemp1, matrizAtaque1, PREPARACAO, matriz1);
  mux_16x8 mux2(matrizSelTemp2, matrizAtaque2, PREPARACAO, matriz2);
  mux_16x8 mux3(matrizSelTemp3, matrizAtaque3, PREPARACAO, matriz3);
  mux_16x8 mux4(matrizSelTemp4, matrizAtaque4, PREPARACAO, matriz4);

  matriz_leds matriz_leds(
    .l0(l0), .l1(l1), .l2(l2), .l3(l3), .l4(l4), .l5(l5), .l6(l6),
    .c0(c0), .c1(c1), .c2(c2), .c3(c3), .c4(c4),
    // clock de ~ 762 Hz
    // pois dentro do modulo matriz_leds tem um divisor de frequencia secundario (contador)
    .clock(clock_out[15]), .enable(enable),
    .mapa0(matriz0), .mapa1(matriz1), .mapa2(matriz2), .mapa3(matriz3), .mapa4(matriz4)
  );

endmodule