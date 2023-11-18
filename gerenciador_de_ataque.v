module gerenciador_de_ataque(
  coordColuna, coordLinha, enable,
  confirmar,
  mapa0, mapa1, mapa2, mapa3, mapa4,
  matriz0, matriz1, matriz2, matriz3, matriz4,
  LED_R, LED_G, LED_B,
  vida
);
  input [2:0] coordColuna, coordLinha; // coluna e linha da matriz de leds
  input enable, confirmar; // habilita a matriz de leds e confirma a selecao
  input [6:0] mapa0, mapa1, mapa2, mapa3, mapa4; // mapa final do jogo

  output reg [6:0] matriz0, matriz1, matriz2, matriz3, matriz4; // mapa atual de bits da matriz de leds
  output LED_R, LED_G, LED_B; // leds de status
  output [1:0] vida; // contador de vida do usuario

  wire igual0, igual1, igual2, igual3, igual4; // verifica se o jogador acertou o alvo
  wire errou_ataque; // verifica se o jogador errou o alvo
  wire diminuir_vida; // diminui a vida do usuario

  initial begin
    // inicializa a matriz de leds
    matriz0 = 7'b0000000;
    matriz1 = 7'b0000000;
    matriz2 = 7'b0000000;
    matriz3 = 7'b0000000;
    matriz4 = 7'b0000000;
  end

  wire l0, l1, l2, l3, l4, l5, l6; // linhas da matriz de leds
  wire c0, c1, c2, c3, c4; // colunas da matriz de leds
  wire w0, w1, w2; // fios para ligar os leds de status
  wire [6:0] tempCol0, tempCol1, tempCol2, tempCol3, tempCol4; // saidas dos multiplexadores
  wire [6:0] outMapa0, outMapa1, outMapa2, outMapa3, outMapa4; // saidas dos multiplexadores

  // decodifica a coluna e a linha da matriz de leds
  decodificador_3bits d0(.sel(coordLinha), .s0(l0), .s1(l1), .s2(l2), .s3(l3), .s4(l4), .s5(l5), .s6(l6), .s7());
  decodificador_3bits d1(.sel(coordColuna), .s0(c0), .s1(c1), .s2(c2), .s3(c3), .s4(c4), .s5(), .s6(), .s7());

  // escolhe qual mapa sera mostrado na matriz de leds
  mux_2mapas_x1 mux0(matriz0, mapa0, c0, tempCol0);
  mux_2mapas_x1 mux1(matriz1, mapa1, c1, tempCol1);
  mux_2mapas_x1 mux2(matriz2, mapa2, c2, tempCol2);
  mux_2mapas_x1 mux3(matriz3, mapa3, c3, tempCol3);
  mux_2mapas_x1 mux4(matriz4, mapa4, c4, tempCol4);

  // seleciona qual linha da matriz de leds sera atualizada
  mux_2x1 mux5(matriz0[0], tempCol0[0], l0, outMapa0[0]);
  mux_2x1 mux6(matriz0[1], tempCol0[1], l1, outMapa0[1]);
  mux_2x1 mux7(matriz0[2], tempCol0[2], l2, outMapa0[2]);
  mux_2x1 mux8(matriz0[3], tempCol0[3], l3, outMapa0[3]);
  mux_2x1 mux9(matriz0[4], tempCol0[4], l4, outMapa0[4]);
  mux_2x1 mux10(matriz0[5], tempCol0[5], l5, outMapa0[5]);
  mux_2x1 mux11(matriz0[6], tempCol0[6], l6, outMapa0[6]);

  mux_2x1 mux12(matriz1[0], tempCol1[0], l0, outMapa1[0]);
  mux_2x1 mux13(matriz1[1], tempCol1[1], l1, outMapa1[1]);
  mux_2x1 mux14(matriz1[2], tempCol1[2], l2, outMapa1[2]);
  mux_2x1 mux15(matriz1[3], tempCol1[3], l3, outMapa1[3]);
  mux_2x1 mux16(matriz1[4], tempCol1[4], l4, outMapa1[4]);
  mux_2x1 mux17(matriz1[5], tempCol1[5], l5, outMapa1[5]);
  mux_2x1 mux18(matriz1[6], tempCol1[6], l6, outMapa1[6]);

  mux_2x1 mux19(matriz2[0], tempCol2[0], l0, outMapa2[0]);
  mux_2x1 mux20(matriz2[1], tempCol2[1], l1, outMapa2[1]);
  mux_2x1 mux21(matriz2[2], tempCol2[2], l2, outMapa2[2]);
  mux_2x1 mux22(matriz2[3], tempCol2[3], l3, outMapa2[3]);
  mux_2x1 mux23(matriz2[4], tempCol2[4], l4, outMapa2[4]);
  mux_2x1 mux24(matriz2[5], tempCol2[5], l5, outMapa2[5]);
  mux_2x1 mux25(matriz2[6], tempCol2[6], l6, outMapa2[6]);

  mux_2x1 mux26(matriz3[0], tempCol3[0], l0, outMapa3[0]);
  mux_2x1 mux27(matriz3[1], tempCol3[1], l1, outMapa3[1]);
  mux_2x1 mux28(matriz3[2], tempCol3[2], l2, outMapa3[2]);
  mux_2x1 mux29(matriz3[3], tempCol3[3], l3, outMapa3[3]);
  mux_2x1 mux30(matriz3[4], tempCol3[4], l4, outMapa3[4]);
  mux_2x1 mux31(matriz3[5], tempCol3[5], l5, outMapa3[5]);
  mux_2x1 mux32(matriz3[6], tempCol3[6], l6, outMapa3[6]);

  mux_2x1 mux33(matriz4[0], tempCol4[0], l0, outMapa4[0]);
  mux_2x1 mux34(matriz4[1], tempCol4[1], l1, outMapa4[1]);
  mux_2x1 mux35(matriz4[2], tempCol4[2], l2, outMapa4[2]);
  mux_2x1 mux36(matriz4[3], tempCol4[3], l3, outMapa4[3]);
  mux_2x1 mux37(matriz4[4], tempCol4[4], l4, outMapa4[4]);
  mux_2x1 mux38(matriz4[5], tempCol4[5], l5, outMapa4[5]);
  mux_2x1 mux39(matriz4[6], tempCol4[6], l6, outMapa4[6]);

  always @(posedge confirmar or negedge enable) begin
    if (~enable) begin
      matriz0 = 7'b0000000;
      matriz1 = 7'b0000000;
      matriz2 = 7'b0000000;
      matriz3 = 7'b0000000;
      matriz4 = 7'b0000000;
    end
    else begin
      if (confirmar) begin
        matriz0 = outMapa0;
        matriz1 = outMapa1;
        matriz2 = outMapa2;
        matriz3 = outMapa3;
        matriz4 = outMapa4;
      end
    end
  end

  // verifica se o jogador acertou o alvo
  comparador_de_igualdade cdi(matriz0, outMapa0, igual0);
  comparador_de_igualdade cd1(matriz1, outMapa1, igual1);
  comparador_de_igualdade cd2(matriz2, outMapa2, igual2);
  comparador_de_igualdade cd3(matriz3, outMapa3, igual3);
  comparador_de_igualdade cd4(matriz4, outMapa4, igual4);

  // se ele acertou o alvo, errou_ataque vai ser 0
  // ja que o mapa sera diferente
  and and0(errou_ataque, igual0, igual1, igual2, igual3, igual4);

  and and3(diminuir_vida, errou_ataque, confirmar, enable);
  // contador de vida do usuario
  contador_vida contador_vida(.clock(diminuir_vida), .reset(~enable), .S(vida));


  // controla os leds de status
  and and1(w0, errou_ataque, enable);
  and and2(w1, ~errou_ataque, enable);

  // se o jogador errou o ataque, o led vermelho acende
  FF_jk FF_jk1(
  	w0, ~w0, ~enable, confirmar, LED_R
  );

  // se o jogador acertou o ataque, o led verde acende
  FF_jk FF_jk2(
  	w1, ~w1, ~enable, confirmar, LED_G
  );

  assign LED_B = 1'b0; // led azul sempre desligado
endmodule


module TB_gerenciador_de_ataque();
  reg [2:0] coordColuna, coordLinha;
  reg enable, confirmar;

  wire [6:0] mapa0, mapa1, mapa2, mapa3, mapa4;
  wire [6:0] matriz0, matriz1, matriz2, matriz3, matriz4;
  wire LED_R, LED_G, LED_B;
  wire [1:0] vida;

  assign mapa0 = 7'b1110001;
  assign mapa1 = 7'b0100000;
  assign mapa2 = 7'b0000000;
  assign mapa3 = 7'b0000000;
  assign mapa4 = 7'b1110000;

  gerenciador_de_ataque gerenciador_de_ataque(
    coordColuna, coordLinha, enable,
    confirmar,
    mapa0, mapa1, mapa2, mapa3, mapa4,
    matriz0, matriz1, matriz2, matriz3, matriz4,
    LED_R, LED_G, LED_B,
    vida
  );

  initial begin
    enable = 1'b1;
    confirmar = 1'b0;

    coordColuna = 3'b000;  coordLinha = 3'b000; confirmar = 1'b1; #10;
    confirmar = 1'b0; #10;
    coordColuna = 3'b000;  coordLinha = 3'b001; confirmar = 1'b1; #10;
    confirmar = 1'b0; #10;

    coordColuna = 3'b001;  coordLinha = 3'b101; confirmar = 1'b1; #10;
    confirmar = 1'b0; #10;

    coordColuna = 3'b011;  coordLinha = 3'b101; confirmar = 1'b1; #10;
    confirmar = 1'b0; #10;

    coordColuna = 3'b100;  coordLinha = 3'b110; confirmar = 1'b1; #10;
    confirmar = 1'b0; #10;


    enable = 1'b0; #10;
    enable = 1'b1; #10;

    coordColuna = 3'b000;  coordLinha = 3'b000; confirmar = 1'b1; #10;
  end

endmodule