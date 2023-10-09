module display(
  clock,
  ATAQUE, PREPARACAO, DESLIGADO,
  coordColuna,
  coordLinha,
  mapa,
  vida,
  a, b, c, d, e, f, g, dp,
  d0, d1, d2, d3
);
  input clock;
  input ATAQUE, PREPARACAO, DESLIGADO;
  input [2:0] coordColuna, coordLinha;
  input [2:0] mapa;
  input [2:0] vida;

  output a, b, c, d, e, f, g, dp;
  output d0, d1, d2, d3;

  wire [1:0] contador;
  wire [7:0] dp_mapa, dp_col, dp_linha;
  wire [7:0] dp_vida;
  wire [7:0] s_d0, s_d1, s_d2, s_d3;

  wire [1:0] modo;

  wire [3:0] coordColuna4bits, coordLinha4bits, mapa4bits, vida4bits;
  
  wire d0_t, d1_t, d2_t, d3_t;
  wire ENABLE_D;

  // conversor de 3 bits para 4 bits
  assign coordColuna4bits[3] = 1'b0;
  assign coordColuna4bits[2:0] = coordColuna;
  assign coordLinha4bits[3] = 1'b0;
  assign coordLinha4bits[2:0] = coordLinha;
  assign mapa4bits[3] = 1'b0;
  assign mapa4bits[2:0] = mapa;
  assign vida4bits[3] = 1'b0;
  assign vida4bits[2:0] = vida;

  // modo preparacao
  // d0 = modo de jogo
  // d3 = mapa selecionado

  // modo ataque
  // d0 = modo de jogo
  // d1 = vida
  // d2 = coordenada de coluna
  // d3 = coordenada de linha

  // ataque = 11
  // preparacao = 10
  // desligado = 00
  or or0(modo[1], ATAQUE, PREPARACAO);
  and and0(modo[0], ATAQUE);

  // contador de 0 a 3
  contador contador_2bits(clock, contador);
  
  assign ENABLE_D = ATAQUE | PREPARACAO;

  // demux para ativar uma coluna por vez
  demux_1x4 demux0(.Sel(contador), .E(ENABLE_D), .Out4(d0_t), .Out3(d1_t), .Out2(d2_t), .Out1(d3_t));
  
  assign d0 = ~d0_t;
  assign d1 = ~d1_t;
  assign d2 = ~d2_t;
  assign d3 = ~d3_t;

  // decodificador de modo
  decodificador_modo dm(
    1'b1,
    modo,
    s_d0[7], s_d0[6], s_d0[5], s_d0[4], s_d0[3], s_d0[2], s_d0[1], s_d0[0]
  );

  // decodificador de coordenada de coluna
  decod_col dc(
    1'b1,
    coordColuna4bits,
    dp_col[7], dp_col[6], dp_col[5], dp_col[4], dp_col[3], dp_col[2], dp_col[1], dp_col[0]
  );

  // decodificador de coordenada de linha
  decodificador_num dn1(
    1'b1,
    coordLinha4bits,
    dp_linha[7], dp_linha[6], dp_linha[5], dp_linha[4], dp_linha[3], dp_linha[2], dp_linha[1], dp_linha[0]
  );

  // decodificador de mapa
  decodificador_num dn2(
    1'b1,
    mapa4bits,
    dp_mapa[7], dp_mapa[6], dp_mapa[5], dp_mapa[4], dp_mapa[3], dp_mapa[2], dp_mapa[1], dp_mapa[0]
  );

  // decodificador de vida
  decodificador_num dn3(
    1'b1,
    vida4bits,
    dp_vida[7], dp_vida[6], dp_vida[5], dp_vida[4], dp_vida[3], dp_vida[2], dp_vida[1], dp_vida[0]
  );

  // mux da saida 1
  mux_16x8 m(
    8'b11111111, s_d1, ATAQUE, s_d1
  );

  // mux da saida 2
  mux_16x8 m0(
    8'b11111111, dp_col, ATAQUE, s_d2
  );

  // mux da saida 3
  mux_16x8 m1(
    dp_mapa, dp_linha, ATAQUE, s_d3
  );
  
  // mux da saida dos segmentos
  mux_32x8 m2(
    s_d3, s_d2, s_d1, s_d0,
    contador,
    {a, b, c, d, e, f, g, dp}
  );
endmodule