module gerenciador_de_ataque(
  coordColuna, coordLinha, enable,
  confirmar,
  mapa0, mapa1, mapa2, mapa3, mapa4,
  matriz0, matriz1, matriz2, matriz3, matriz4
);
  input [2:0] coordColuna, coordLinha; // coluna e linha da matriz de leds
  input enable, confirmar; // habilita a matriz de leds e confirma a selecao
  input [6:0] mapa0, mapa1, mapa2, mapa3, mapa4; // mapa final do jogo

  output reg [6:0] matriz0, matriz1, matriz2, matriz3, matriz4; // mapa atual de bits da matriz de leds

  // inicializa a matriz de leds
  initial begin
    matriz0 <= 7'b0000000;
    matriz1 <= 7'b0000000;
    matriz2 <= 7'b0000000;
    matriz3 <= 7'b0000000;
    matriz4 <= 7'b0000000;
  end

  // atualiza a matriz de leds
  always @(posedge confirmar or negedge enable) begin
    if (~enable) begin
      matriz0 <= 7'b0000000;
      matriz1 <= 7'b0000000;
      matriz2 <= 7'b0000000;
      matriz3 <= 7'b0000000;
      matriz4 <= 7'b0000000;
    end else begin
      if(coordLinha != 3'b111) begin
        if(coordColuna == 3'b000) begin
          matriz0[coordLinha] <= mapa0[coordLinha];
        end else if(coordColuna == 3'b001) begin
          matriz1[coordLinha] <= mapa1[coordLinha];
        end else if(coordColuna == 3'b010) begin
          matriz2[coordLinha] <= mapa2[coordLinha];
        end else if(coordColuna == 3'b011) begin
          matriz3[coordLinha] <= mapa3[coordLinha];
        end else if(coordColuna == 3'b100) begin
          matriz4[coordLinha] <= mapa4[coordLinha];
        end
      end
    end
  end
endmodule


module TB_gerenciador_de_ataque();
  reg [2:0] coordColuna, coordLinha;
  reg enable, confirmar;

  wire [6:0] mapa0, mapa1, mapa2, mapa3, mapa4;
  wire [6:0] matriz0, matriz1, matriz2, matriz3, matriz4;

  assign mapa0 = 7'b1110001;
  assign mapa1 = 7'b0100000;
  assign mapa2 = 7'b0000000;
  assign mapa3 = 7'b0000000;
  assign mapa4 = 7'b1110000;

  gerenciador_de_ataque gerenciador_de_ataque(.coordColuna(coordColuna), .coordLinha(coordLinha), .enable(enable), 
  .confirmar(confirmar), .mapa0(mapa0), .mapa1(mapa1), .mapa2(mapa2), .mapa3(mapa3), .mapa4(mapa4), .matriz0(matriz0), .matriz1(matriz1), .matriz2(matriz2), .matriz3(matriz3), .matriz4(matriz4));

  initial begin
    enable = 1;
    confirmar = 0;

    coordColuna = 000;  coordLinha = 000; confirmar = 1; #10;
    confirmar = 0; #10;
    coordColuna = 000;  coordLinha = 001; confirmar = 1; #10;
    confirmar = 0; #10;

    coordColuna = 001;  coordLinha = 101; confirmar = 1; #10;
    confirmar = 0; #10;

    coordColuna = 011;  coordLinha = 101; confirmar = 1; #10;
    confirmar = 0; #10;

    coordColuna = 100;  coordLinha = 110; confirmar = 1; #10;
    confirmar = 0; #10;


    enable = 0; #10;
    enable = 1; #10;

    coordColuna = 000;  coordLinha = 000; confirmar = 1; #10;
  end

endmodule