module seletor_mapa(
  sel, confirmar, enable,
  mapa4, mapa3, mapa2, mapa1, mapa0,
  mapaTemp4, mapaTemp3, mapaTemp2, mapaTemp1, mapaTemp0
  
  );
  input [2:0] sel;
  input confirmar, enable;
  output reg [6:0] mapa0, mapa1, mapa2, mapa3, mapa4; // mapa final do jogo
  output [6:0] mapaTemp0, mapaTemp1, mapaTemp2, mapaTemp3, mapaTemp4; // mapa temporario selecionado pelo jogador na preparacao

  initial begin
    mapa0 = 7'b0000000;
    mapa1 = 7'b0000000;
    mapa2 = 7'b0000000;
    mapa3 = 7'b0000000;
    mapa4 = 7'b0000000;
  end
  
  mux_64x8 m0(7'b0000100, 7'b1110000, 7'b1110111, 7'b0000111, 7'b0000111, 7'b1000000, 7'b0111000, 7'b1000000, sel, mapaTemp0);
  mux_64x8 m1(7'b0001100, 7'b0100000, 7'b1000010, 7'b0100001, 7'b0000010, 7'b1100000, 7'b0001001, 7'b1100111, sel, mapaTemp1);
  mux_64x8 m2(7'b1000101, 7'b0100000, 7'b0100000, 7'b0111000, 7'b1000000, 7'b1000010, 7'b0010011, 7'b1000010, sel, mapaTemp2);
  mux_64x8 m3(7'b1110001, 7'b1000010, 7'b0100000, 7'b0100010, 7'b1110001, 7'b0010010, 7'b0010001, 7'b0010010, sel, mapaTemp3);
  mux_64x8 m4(7'b1000011, 7'b1110111, 7'b1110000, 7'b0000111, 7'b1000111, 7'b1110111, 7'b0111000, 7'b1110000, sel, mapaTemp4);
  
  always @(posedge confirmar) begin
    if (enable) begin
      mapa0 <= mapaTemp0;
      mapa1 <= mapaTemp1;
      mapa2 <= mapaTemp2;
      mapa3 <= mapaTemp3;
      mapa4 <= mapaTemp4;
    end
  end
endmodule

module TB_Seletor_Mapa();
  reg [2:0] sel;
  reg confirmar, enable;

  wire [6:0] mapa0, mapa1, mapa2, mapa3, mapa4;
  wire [6:0] mapaTemp0, mapaTemp1, mapaTemp2, mapaTemp3, mapaTemp4;

  seletor_mapa seletor_mapa(.sel(sel), .enable(enable), .confirmar(confirmar), .mapa0(mapa0), .mapa1(mapa1), .mapa2(mapa2), .mapa3(mapa3), .mapa4(mapa4), .mapaTemp0(mapaTemp0), .mapaTemp1(mapaTemp1), .mapaTemp2(mapaTemp2), .mapaTemp3(mapaTemp3), .mapaTemp4(mapaTemp4));

  initial begin
    confirmar = 0;
    enable = 1;

    sel = 000; #10; // mapaTemp0 = 0000100; mapaTemp1 = 0001100; mapaTemp2 = 1000101; mapaTemp3 = 1110001; mapaTemp4 = 1000011;
    sel = 001; confirmar = 1 ;#10; // mapaTemp0 = 1110000; mapaTemp1 = 0100000; mapaTemp2 = 0100000; mapaTemp3 = 1000010; mapaTemp4 = 1110111;

    confirmar = 0; // copia o valor do mapaTemp para o mapa

    sel = 010; #10; // mapaTemp0 = 1110111; mapaTemp1 = 1000010; mapaTemp2 = 0100000; mapaTemp3 = 0100000; mapaTemp4 = 1110000;
    sel = 011; #10; // mapaTemp0 = 0000111; mapaTemp1 = 0100001; mapaTemp2 = 0111000; mapaTemp3 = 0100010; mapaTemp4 = 0000111;
    sel = 100; confirmar = 1; #10; // mapaTemp0 = 0000111; mapaTemp1 = 0000010; mapaTemp2 = 1000000; mapaTemp3 = 1110001; mapaTemp4 = 1000111;

    confirmar = 0; // copia o valor do mapaTemp para o mapa

    sel = 101; #10; // mapaTemp0 = 1000000; mapaTemp1 = 1100000; mapaTemp2 = 1000010; mapaTemp3 = 0010010; mapaTemp4 = 1110111;
    sel = 110; #10; // mapaTemp0 = 0111000; mapaTemp1 = 0001001; mapaTemp2 = 0010011; mapaTemp3 = 0010001; mapaTemp4 = 0111000;
    sel = 111; confirmar = 1; #10; // mapaTemp0 = 1000000; mapaTemp1 = 1100111; mapaTemp2 = 1000010; mapaTemp3 = 0010010; mapaTemp4 = 1110000;

    confirmar = 0; // copia o valor do mapaTemp para o mapa

    // testar com enable = 0
    enable = 0;
    sel = 001; #10; confirmar = 1 ;#10; // mapaTemp0 = 1110000; mapaTemp1 = 0100000; mapaTemp2 = 0100000; mapaTemp3 = 1000010; mapaTemp4 = 1110111;

    confirmar = 0;

    sel = 010; #10; // mapaTemp0 = 1110111; mapaTemp1 = 1000010; mapaTemp2 = 0100000; mapaTemp3 = 0100000; mapaTemp4 = 1110000;
    sel = 011; #10; confirmar = 1 ;#10; // mapaTemp0 = 0000111; mapaTemp1 = 0100001; mapaTemp2 = 0111000; mapaTemp3 = 0100010; mapaTemp4 = 0000111;

    confirmar = 0;



  end
endmodule