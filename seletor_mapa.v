module seletor_mapa(
  sel, confirmar, enable,
  mapa4, mapa3, mapa2, mapa1, mapa0,
  mapaTemp4, mapaTemp3, mapaTemp2, mapaTemp1, mapaTemp0
);
  input [1:0] sel;
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
  
  mux_mapa m0(7'b0000100, 7'b1110000, 7'b1110111, 7'b0000111, sel, mapaTemp0);
  mux_mapa m1(7'b0001100, 7'b0100000, 7'b1000010, 7'b0100001, sel, mapaTemp1);
  mux_mapa m2(7'b1000101, 7'b0100000, 7'b0100000, 7'b0111000, sel, mapaTemp2);
  mux_mapa m3(7'b1110001, 7'b1000010, 7'b0100000, 7'b0100010, sel, mapaTemp3);
  mux_mapa m4(7'b1000011, 7'b1110111, 7'b1110000, 7'b0000111, sel, mapaTemp4);
  
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
  reg [1:0] sel;
  reg confirmar, enable;

  wire [6:0] mapa0, mapa1, mapa2, mapa3, mapa4;
  wire [6:0] mapaTemp0, mapaTemp1, mapaTemp2, mapaTemp3, mapaTemp4;

  seletor_mapa seletor_mapa(.sel(sel), .enable(enable), .confirmar(confirmar), .mapa0(mapa0), .mapa1(mapa1), .mapa2(mapa2), .mapa3(mapa3), .mapa4(mapa4), .mapaTemp0(mapaTemp0), .mapaTemp1(mapaTemp1), .mapaTemp2(mapaTemp2), .mapaTemp3(mapaTemp3), .mapaTemp4(mapaTemp4));

  initial begin
    confirmar = 1'b0;
    enable = 1'b1;

    sel = 3'b00; #10;
    sel = 3'b01; confirmar = 1'b1 ;#10;

    confirmar = 1'b0; #10;

    sel = 3'b10; #10;
    sel = 3'b11; #10;

    confirmar = 1'b1; #10;
    confirmar = 1'b0; #10;

    sel = 3'b01; #10;
    confirmar = 1'b1; #10;

    confirmar = 1'b0; #10;

    enable = 1'b0; #10;
    sel = 3'b10; #10;
    sel = 3'b11; #10;

    confirmar = 1'b1; #10;

    sel = 3'b00; #10;
    sel = 3'b01; #10;

  end
endmodule