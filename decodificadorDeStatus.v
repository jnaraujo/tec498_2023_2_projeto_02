module decodificadorDeStatus(
  A, B, DESLIGADO, PREPARACAO, ATAQUE
);
  input A, B;
  output DESLIGADO, PREPARACAO, ATAQUE;

  and and0(DESLIGADO, ~A, ~B);
  and and1(PREPARACAO, A, ~B); 
  and and2(ATAQUE, A, B);
endmodule

module TB_DecodificadorDeStatus();
  reg A, B;
  wire DESLIGADO, PREPARACAO, ATAQUE;

  decodificadorDeStatus decodificadorDeStatus(A, B, DESLIGADO, PREPARACAO, ATAQUE);

  initial begin
    A = 0; B = 0; #10; // DESLIGADO = 1; PREPARACAO = 0; ATAQUE = 0;
    A = 1; B = 0; #10; // DESLIGADO = 0; PREPARACAO = 1; ATAQUE = 0;
    A = 1; B = 1; #10; // DESLIGADO = 0; PREPARACAO = 0; ATAQUE = 1;
  end
endmodule