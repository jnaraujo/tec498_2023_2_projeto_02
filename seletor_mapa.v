module seletor_mapa(sel, mapa4, mapa3, mapa2, mapa1, mapa0);
  input [2:0] sel;
  output [6:0] mapa0, mapa1, mapa2, mapa3, mapa4;

  reg [6:0] mapa0_0, mapa1_0, mapa2_0, mapa3_0, mapa4_0;
  reg [6:0] mapa0_1, mapa1_1, mapa2_1, mapa3_1, mapa4_1;
  reg [6:0] mapa0_2, mapa1_2, mapa2_2, mapa3_2, mapa4_2;
  reg [6:0] mapa0_3, mapa1_3, mapa2_3, mapa3_3, mapa4_3;
  reg [6:0] mapa0_4, mapa1_4, mapa2_4, mapa3_4, mapa4_4;
  reg [6:0] mapa0_5, mapa1_5, mapa2_5, mapa3_5, mapa4_5;
  reg [6:0] mapa0_6, mapa1_6, mapa2_6, mapa3_6, mapa4_6;
  reg [6:0] mapa0_7, mapa1_7, mapa2_7, mapa3_7, mapa4_7;

  initial begin
    mapa0_0 = 7'b0000100;
    mapa1_0 = 7'b0001100;
    mapa2_0 = 7'b1000101;
    mapa3_0 = 7'b1110001;
    mapa4_0 = 7'b1000011;

    mapa0_1 = 7'b1110000;
    mapa1_1 = 7'b0100000;
    mapa2_1 = 7'b0100000;
    mapa3_1 = 7'b1000010;
    mapa4_1 = 7'b1110111;

    mapa0_2 = 7'b1110111;
    mapa1_2 = 7'b1000010;
    mapa2_2 = 7'b0100000;
    mapa3_2 = 7'b0100000;
    mapa4_2 = 7'b1110000;

    mapa0_3 = 7'b0000111;
    mapa1_3 = 7'b0100001;
    mapa2_3 = 7'b0111001;
    mapa3_3 = 7'b0100011;
    mapa4_3 = 7'b0000001;

    mapa0_4 = 7'b0000111;
    mapa1_4 = 7'b0000010;
    mapa2_4 = 7'b1000000;
    mapa3_4 = 7'b1110001;
    mapa4_4 = 7'b1000111;

    mapa0_5 = 7'b1000000;
    mapa1_5 = 7'b1100000;
    mapa2_5 = 7'b1000010;
    mapa3_5 = 7'b0010010;
    mapa4_5 = 7'b1110111;

    mapa0_6 = 7'b0111000;
    mapa1_6 = 7'b0001001;
    mapa2_6 = 7'b0010011;
    mapa3_6 = 7'b0010001;
    mapa4_6 = 7'b0111000;

    mapa0_7 = 7'b1000000;
    mapa1_7 = 7'b1100111;
    mapa2_7 = 7'b1000010;
    mapa3_7 = 7'b0010010;
    mapa4_7 = 7'b1110000;
  end
  
  mux_8x1 m0_0(mapa0_0[0], mapa0_1[0], mapa0_2[0], mapa0_3[0], mapa0_4[0], mapa0_5[0], mapa0_6[0], mapa0_7[0], sel, mapa0[0]);
  mux_8x1 m1_0(mapa0_0[1], mapa0_1[1], mapa0_2[1], mapa0_3[1], mapa0_4[1], mapa0_5[1], mapa0_6[1], mapa0_7[1], sel, mapa0[1]);
  mux_8x1 m2_0(mapa0_0[2], mapa0_1[2], mapa0_2[2], mapa0_3[2], mapa0_4[2], mapa0_5[2], mapa0_6[2], mapa0_7[2], sel, mapa0[2]);
  mux_8x1 m3_0(mapa0_0[3], mapa0_1[3], mapa0_2[3], mapa0_3[3], mapa0_4[3], mapa0_5[3], mapa0_6[3], mapa0_7[3], sel, mapa0[3]);
  mux_8x1 m4_0(mapa0_0[4], mapa0_1[4], mapa0_2[4], mapa0_3[4], mapa0_4[4], mapa0_5[4], mapa0_6[4], mapa0_7[4], sel, mapa0[4]);
  mux_8x1 m5_0(mapa0_0[5], mapa0_1[5], mapa0_2[5], mapa0_3[5], mapa0_4[5], mapa0_5[5], mapa0_6[5], mapa0_7[5], sel, mapa0[5]);
  mux_8x1 m6_0(mapa0_0[6], mapa0_1[6], mapa0_2[6], mapa0_3[6], mapa0_4[6], mapa0_5[6], mapa0_6[6], mapa0_7[6], sel, mapa0[6]);

  mux_8x1 m0_1(mapa1_0[0], mapa1_1[0], mapa1_2[0], mapa1_3[0], mapa1_4[0], mapa1_5[0], mapa1_6[0], mapa1_7[0], sel, mapa1[0]);
  mux_8x1 m1_1(mapa1_0[1], mapa1_1[1], mapa1_2[1], mapa1_3[1], mapa1_4[1], mapa1_5[1], mapa1_6[1], mapa1_7[1], sel, mapa1[1]);
  mux_8x1 m2_1(mapa1_0[2], mapa1_1[2], mapa1_2[2], mapa1_3[2], mapa1_4[2], mapa1_5[2], mapa1_6[2], mapa1_7[2], sel, mapa1[2]);
  mux_8x1 m3_1(mapa1_0[3], mapa1_1[3], mapa1_2[3], mapa1_3[3], mapa1_4[3], mapa1_5[3], mapa1_6[3], mapa1_7[3], sel, mapa1[3]);
  mux_8x1 m4_1(mapa1_0[4], mapa1_1[4], mapa1_2[4], mapa1_3[4], mapa1_4[4], mapa1_5[4], mapa1_6[4], mapa1_7[4], sel, mapa1[4]);
  mux_8x1 m5_1(mapa1_0[5], mapa1_1[5], mapa1_2[5], mapa1_3[5], mapa1_4[5], mapa1_5[5], mapa1_6[5], mapa1_7[5], sel, mapa1[5]);
  mux_8x1 m6_1(mapa1_0[6], mapa1_1[6], mapa1_2[6], mapa1_3[6], mapa1_4[6], mapa1_5[6], mapa1_6[6], mapa1_7[6], sel, mapa1[6]);

  mux_8x1 m0_2(mapa2_0[0], mapa2_1[0], mapa2_2[0], mapa2_3[0], mapa2_4[0], mapa2_5[0], mapa2_6[0], mapa2_7[0], sel, mapa2[0]);
  mux_8x1 m1_2(mapa2_0[1], mapa2_1[1], mapa2_2[1], mapa2_3[1], mapa2_4[1], mapa2_5[1], mapa2_6[1], mapa2_7[1], sel, mapa2[1]);
  mux_8x1 m2_2(mapa2_0[2], mapa2_1[2], mapa2_2[2], mapa2_3[2], mapa2_4[2], mapa2_5[2], mapa2_6[2], mapa2_7[2], sel, mapa2[2]);
  mux_8x1 m3_2(mapa2_0[3], mapa2_1[3], mapa2_2[3], mapa2_3[3], mapa2_4[3], mapa2_5[3], mapa2_6[3], mapa2_7[3], sel, mapa2[3]);
  mux_8x1 m4_2(mapa2_0[4], mapa2_1[4], mapa2_2[4], mapa2_3[4], mapa2_4[4], mapa2_5[4], mapa2_6[4], mapa2_7[4], sel, mapa2[4]);
  mux_8x1 m5_2(mapa2_0[5], mapa2_1[5], mapa2_2[5], mapa2_3[5], mapa2_4[5], mapa2_5[5], mapa2_6[5], mapa2_7[5], sel, mapa2[5]);
  mux_8x1 m6_2(mapa2_0[6], mapa2_1[6], mapa2_2[6], mapa2_3[6], mapa2_4[6], mapa2_5[6], mapa2_6[6], mapa2_7[6], sel, mapa2[6]);

  mux_8x1 m0_3(mapa3_0[0], mapa3_1[0], mapa3_2[0], mapa3_3[0], mapa3_4[0], mapa3_5[0], mapa3_6[0], mapa3_7[0], sel, mapa3[0]);
  mux_8x1 m1_3(mapa3_0[1], mapa3_1[1], mapa3_2[1], mapa3_3[1], mapa3_4[1], mapa3_5[1], mapa3_6[1], mapa3_7[1], sel, mapa3[1]);
  mux_8x1 m2_3(mapa3_0[2], mapa3_1[2], mapa3_2[2], mapa3_3[2], mapa3_4[2], mapa3_5[2], mapa3_6[2], mapa3_7[2], sel, mapa3[2]);
  mux_8x1 m3_3(mapa3_0[3], mapa3_1[3], mapa3_2[3], mapa3_3[3], mapa3_4[3], mapa3_5[3], mapa3_6[3], mapa3_7[3], sel, mapa3[3]);
  mux_8x1 m4_3(mapa3_0[4], mapa3_1[4], mapa3_2[4], mapa3_3[4], mapa3_4[4], mapa3_5[4], mapa3_6[4], mapa3_7[4], sel, mapa3[4]);
  mux_8x1 m5_3(mapa3_0[5], mapa3_1[5], mapa3_2[5], mapa3_3[5], mapa3_4[5], mapa3_5[5], mapa3_6[5], mapa3_7[5], sel, mapa3[5]);
  mux_8x1 m6_3(mapa3_0[6], mapa3_1[6], mapa3_2[6], mapa3_3[6], mapa3_4[6], mapa3_5[6], mapa3_6[6], mapa3_7[6], sel, mapa3[6]);

  mux_8x1 m0_4(mapa4_0[0], mapa4_1[0], mapa4_2[0], mapa4_3[0], mapa4_4[0], mapa4_5[0], mapa4_6[0], mapa4_7[0], sel, mapa4[0]);
  mux_8x1 m1_4(mapa4_0[1], mapa4_1[1], mapa4_2[1], mapa4_3[1], mapa4_4[1], mapa4_5[1], mapa4_6[1], mapa4_7[1], sel, mapa4[1]);
  mux_8x1 m2_4(mapa4_0[2], mapa4_1[2], mapa4_2[2], mapa4_3[2], mapa4_4[2], mapa4_5[2], mapa4_6[2], mapa4_7[2], sel, mapa4[2]);
  mux_8x1 m3_4(mapa4_0[3], mapa4_1[3], mapa4_2[3], mapa4_3[3], mapa4_4[3], mapa4_5[3], mapa4_6[3], mapa4_7[3], sel, mapa4[3]);
  mux_8x1 m4_4(mapa4_0[4], mapa4_1[4], mapa4_2[4], mapa4_3[4], mapa4_4[4], mapa4_5[4], mapa4_6[4], mapa4_7[4], sel, mapa4[4]);
  mux_8x1 m5_4(mapa4_0[5], mapa4_1[5], mapa4_2[5], mapa4_3[5], mapa4_4[5], mapa4_5[5], mapa4_6[5], mapa4_7[5], sel, mapa4[5]);
  mux_8x1 m6_4(mapa4_0[6], mapa4_1[6], mapa4_2[6], mapa4_3[6], mapa4_4[6], mapa4_5[6], mapa4_6[6], mapa4_7[6], sel, mapa4[6]);
endmodule


module TB_Seletor_Mapa();
  reg [2:0] sel;

  wire [6:0] mapa0, mapa1, mapa2, mapa3, mapa4;

  seletor_mapa seletor_mapa(sel, mapa4, mapa3, mapa2, mapa1, mapa0);

  initial begin
    sel = 000; #10; // mapa0 = 0000100; mapa1 = 0001100; mapa2 = 1000101; mapa3 = 1110001; mapa4 = 1000011;
    sel = 001; #10; // mapa0 = 1110000; mapa1 = 0100000; mapa2 = 0100000; mapa3 = 1000010; mapa4 = 1110111;
    sel = 010; #10; // mapa0 = 1110111; mapa1 = 1000010; mapa2 = 0100000; mapa3 = 0100000; mapa4 = 1110000;
    sel = 011; #10; // mapa0 = 0000111; mapa1 = 0100001; mapa2 = 0111001; mapa3 = 0100011; mapa4 = 0000001;
    sel = 100; #10; // mapa0 = 0000111; mapa1 = 0000010; mapa2 = 1000000; mapa3 = 1110001; mapa4 = 1000111;
    sel = 101; #10; // mapa0 = 1000000; mapa1 = 1100000; mapa2 = 1000010; mapa3 = 0010010; mapa4 = 1110111;
    sel = 110; #10; // mapa0 = 0111000; mapa1 = 0001001; mapa2 = 0010011; mapa3 = 0010001; mapa4 = 0111000;
    sel = 111; #10; // mapa0 = 1000000; mapa1 = 1100111; mapa2 = 1000010; mapa3 = 0010010; mapa4 = 1110000;
  end
endmodule