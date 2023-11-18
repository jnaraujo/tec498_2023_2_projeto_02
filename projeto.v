module projeto(
  ch0, ch1, ch2, ch3, ch4, ch5, ch6, ch7,
  btn0,
  d0, d1, d2, d3,
  a, b, c, d, e, f, g, dp,
  l0, l1, l2, l3, l4, l5, l6,
  c0, c1, c2, c3, c4,
  clock_in,
  LED_R, LED_G, LED_B
);
  input ch0, ch1, ch2, ch3, ch4, ch5, ch6, ch7; // chaves
  input btn0; // botoes

  output d0, d1, d2, d3; // digitos do display
  output a, b, c, d, e, f, g, dp; // segmentos do display

  output l0, l1, l2, l3, l4, l5, l6; // linhas da matriz de leds
  output c0, c1, c2, c3, c4; // colunas da matriz de leds

  output LED_R, LED_G, LED_B; // leds de status

  input clock_in; // clock
  wire [15:0] clock_out; // clock dividido

  wire [6:0] mapa0, mapa1, mapa2, mapa3, mapa4; // mapa final do jogo

  wire [6:0] matrizSelTemp0, matrizSelTemp1, matrizSelTemp2, matrizSelTemp3, matrizSelTemp4; // matriz temporaria selecionada pelo jogador na preparacao
  wire [6:0] matrizAtaque0, matrizAtaque1, matrizAtaque2, matrizAtaque3, matrizAtaque4; // matriz de ataque do jogador
  wire [6:0] matriz0, matriz1, matriz2, matriz3, matriz4; // bits que serao exibidos na matriz de leds

  wire [2:0] contador_0_5; // contador de 0 a 5

  wire [1:0] vida; // contador de vida do usuario

  wire lm_w0; // verifica se está em preparacao ou ataque
  wire ligarMatriz; // habilita/desabilita matriz de leds
  wire DESLIGADO, PREPARACAO, ATAQUE; // estados do jogo
  wire tem_vida; // verifica se a vida do usuario chegou a zero
  
  wire btn_l; // botao de confirmacao do ataque sem ruido
  
  divisor_freq divisor_freq(clock_in, clock_out);

  level_to_pulse level_to_pulse(btn0, clock_out[15], btn_l); // remove o ruido do botao

  contador contador(clock_out[15], contador_0_5);

  decodificadorDeStatus decodificadorDeStatus(
    .A(ch7), .B(ch6),
    .DESLIGADO(DESLIGADO), .PREPARACAO(PREPARACAO), .ATAQUE(ATAQUE)
  );

  or or_vida(tem_vida, ~vida[1], ~vida[0]); // verifica se a vida do usuario chegou a zero; a vida é zero quando vida = 11
  
  or or_lm0(lm_w0, PREPARACAO, ATAQUE); // vericica se o jogador esta em um dos modos de jogo
  and and_lm0(ligarMatriz, lm_w0, tem_vida); // habilita a matriz de leds se o jogador ainda tem vida e esta em um dos modos de jogo

  seletor_mapa seletor_mapa(
    .sel({ch1, ch0}),
    .confirmar(~btn0), .enable(PREPARACAO),
    .mapaTemp0(matrizSelTemp0), .mapaTemp1(matrizSelTemp1), .mapaTemp2(matrizSelTemp2), .mapaTemp3(matrizSelTemp3), .mapaTemp4(matrizSelTemp4),
    .mapa0(mapa0), .mapa1(mapa1), .mapa2(mapa2), .mapa3(mapa3), .mapa4(mapa4)
  );

  // gerencia o ataque do jogador
  gerenciador_de_ataque gerenciador_de_ataque(
    .coordColuna({ch5, ch4, ch3}),
    .coordLinha({ch2, ch1, ch0}), .enable(ATAQUE),
    .confirmar(~btn_l),
    .mapa0(mapa0), .mapa1(mapa1), .mapa2(mapa2), .mapa3(mapa3), .mapa4(mapa4),
    .matriz0(matrizAtaque0), .matriz1(matrizAtaque1), .matriz2(matrizAtaque2), .matriz3(matrizAtaque3), .matriz4(matrizAtaque4),
    .LED_R(LED_R), .LED_G(LED_G), .LED_B(LED_B),
    .vida(vida)
  );

  // seleciona qual dos mapas dever ser exibido na matriz de leds
  // dependendo do estado do jogo
  // se o jogo estiver desligado, tanto faz o mapa
  // ja que a matriz de leds estara desligada
  mux_2mapas_x1 mux0(matrizSelTemp0, matrizAtaque0, ATAQUE, matriz0);
  mux_2mapas_x1 mux1(matrizSelTemp1, matrizAtaque1, ATAQUE, matriz1);
  mux_2mapas_x1 mux2(matrizSelTemp2, matrizAtaque2, ATAQUE, matriz2);
  mux_2mapas_x1 mux3(matrizSelTemp3, matrizAtaque3, ATAQUE, matriz3);
  mux_2mapas_x1 mux4(matrizSelTemp4, matrizAtaque4, ATAQUE, matriz4);

  matriz_leds matriz_leds(
    .l0(l0), .l1(l1), .l2(l2), .l3(l3), .l4(l4), .l5(l5), .l6(l6),
    .c0(c0), .c1(c1), .c2(c2), .c3(c3), .c4(c4),
    .contador(contador_0_5), .enable(ligarMatriz),
    .mapa0(matriz0), .mapa1(matriz1), .mapa2(matriz2), .mapa3(matriz3), .mapa4(matriz4)
  );

  display display(
    contador_0_5,
    ATAQUE, PREPARACAO, DESLIGADO, // estados do jogo
    {ch5, ch4, ch3}, {ch2, ch1, ch0}, // coordenadas
    {ch1, ch0}, // mapa
    vida, // vida
    a, b, c, d, e, f, g, dp,
    d0, d1, d2, d3
  );

endmodule