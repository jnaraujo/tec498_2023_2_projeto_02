module comparador_de_igualdade(
  a, b,
  igual
);
  input [6:0] a, b;
  output igual;

  wire [6:0] a_xnor_b;
  
  xnor xnor0(a_xnor_b[0], a[0], b[0]);
  xnor xnor1(a_xnor_b[1], a[1], b[1]);
  xnor xnor2(a_xnor_b[2], a[2], b[2]);
  xnor xnor3(a_xnor_b[3], a[3], b[3]);
  xnor xnor4(a_xnor_b[4], a[4], b[4]);
  xnor xnor5(a_xnor_b[5], a[5], b[5]);
  xnor xnor6(a_xnor_b[6], a[6], b[6]);

  and and0(igual, a_xnor_b[0], a_xnor_b[1], a_xnor_b[2], a_xnor_b[3], a_xnor_b[4], a_xnor_b[5], a_xnor_b[6]);

endmodule

module TB_comparador_de_igualdade();
  reg [6:0] a, b;
  wire igual;

  comparador_de_igualdade comparador_de_igualdade(a, b, igual);

  initial begin
    // igualdades
    a = 7'b0000000; b = 7'b0000000; #10; // igual = 1
    a = 7'b1111111; b = 7'b1111111; #10; // igual = 1
    a = 7'b1000001; b = 7'b1000001; #10; // igual = 1
    a = 7'b1100011; b = 7'b1100011; #10; // igual = 1
    a = 7'b1110111; b = 7'b1110111; #10; // igual = 1
    a = 7'b1111001; b = 7'b1111001; #10; // igual = 1
    a = 7'b1111101; b = 7'b1111101; #10; // igual = 1

    // desigualdades
    a = 7'b0000000; b = 7'b1111111; #10; // igual = 0
    a = 7'b1111111; b = 7'b0000000; #10; // igual = 0
    a = 7'b1000001; b = 7'b1100011; #10; // igual = 0
    a = 7'b1100011; b = 7'b1000001; #10; // igual = 0
    a = 7'b1110111; b = 7'b1111001; #10; // igual = 0
    a = 7'b1111001; b = 7'b1110111; #10; // igual = 0
    a = 7'b1111101; b = 7'b1111110; #10; // igual = 0
  end

endmodule