module decodificador_num(
  enable,
  sel,
  a, b, c, d, e, f, g, dp
);
  input enable;
  input [3:0] sel;
  output a, b, c, d, e, f, g, dp;

  wire w0, w1, w2, w3, w4, w5, w6, w7;
  wire w8, w9, w10, w11, w12, w13, w14, w15;

  // A	  B	    C	    D	      E
  // E sel[3] sel[2] sel[1] sel[0]

  // A = NOT a OR (b AND c) OR (b AND d) OR ( NOT b AND NOT c AND NOT d AND e) OR (c AND NOT d AND NOT e)
  and and0(w0, sel[3], sel[2]); // b AND c
  and and1(w1, sel[3], sel[1]); // b AND d
  and and2(w2, ~sel[3], ~sel[2], ~sel[1], sel[0]); // NOT b AND NOT c AND NOT d AND e
  and and3(w3, sel[2], ~sel[1], ~sel[0]); // c AND NOT d AND NOT e
  or or0(a, ~enable, w0, w1, w2, w3);

  // B = NOT a OR (b AND c) OR (b AND d) OR (c AND d AND NOT e) OR (c AND NOT d AND e)
  and and6(w4, sel[2], sel[1], ~sel[0]); // c AND d AND NOT e
  and and7(w5, sel[2], ~sel[1], sel[0]); // c AND NOT d AND e
  or or1(b, ~enable, w0, w1, w4, w5);

  // C = NOT a OR (b AND c) OR (b AND d) OR ( NOT c AND d AND NOT e)
  and and8(w6, ~sel[2], sel[1], ~sel[0]); // NOT c AND d AND NOT e
  or or2(c, ~enable, w0, w1, w6);

  // D = NOT a OR (b AND c) OR (b AND d) OR ( NOT b AND NOT c AND NOT d AND e) OR (c AND d AND e) OR (c AND NOT d AND NOT e)
  and and9(w7, sel[2], sel[1], sel[0]); // c AND d AND e
  or or3(d, ~enable, w0, w1, w2, w3, w7);

  // E = NOT a OR (b AND d) OR (c AND NOT d) OR e
  and and10(w8, sel[2], ~sel[1]); // c AND NOT d
  or or4(e, ~enable, w1, w8, sel[0]);

  // F = NOT a OR (b AND c) OR ( NOT b AND NOT c AND e) OR ( NOT c AND d) OR (d AND e)
  and and11(w9, ~sel[3], ~sel[2], sel[0]); // NOT b AND NOT c AND e
  and and12(w10, ~sel[2], sel[1]); // NOT c AND d
  and and13(w11, sel[1], sel[0]); // d AND e
  or or5(f, ~enable, w0, w9, w10, w11);

  // G = NOT a OR (b AND c) OR (b AND d) OR ( NOT b AND NOT c AND NOT d) OR (c AND d AND e)
  and and14(w12, ~sel[3], ~sel[2], ~sel[1]); // NOT b AND NOT c AND NOT d
  and and15(w13, sel[2], sel[1], sel[0]); // c AND d AND e
  or or6(g, ~enable, w0, w1, w12, w13);

  // DP = 1
  assign dp = 1'b1;
endmodule

module TB_Decodificador_num();
  reg enable;
  reg [3:0] sel;

  wire a, b, c, d, e, f, g, dp;

  decodificador_num decodificador_num(enable, sel, a, b, c, d, e, f, g, dp);

  initial begin
    enable = 1'b1; sel = 4'b0000; #10; // 0	0	0	0	0	0	1	1 - 0
    enable = 1'b1; sel = 4'b0001; #10; // 1	0	0	1	1	1	1	1 - 1
    enable = 1'b1; sel = 4'b0010; #10; // 0	0	1	0	0	1	0	1 - 2
    enable = 1'b1; sel = 4'b0011; #10; // 0	0	0	0	1	1	0	1 - 3
    enable = 1'b1; sel = 4'b0100; #10; // 1	0	0	1	1	0	0	1 - 4
    enable = 1'b1; sel = 4'b0101; #10; // 0	1	0	0	1	0	0	1 - 5
    enable = 1'b1; sel = 4'b0110; #10; // 0	1	0	0	0	0	0	1 - 6
    enable = 1'b1; sel = 4'b0111; #10; // 0	0	0	1	1	1	1	1 - 7
    enable = 1'b1; sel = 4'b1000; #10; // 0	0	0	0	0	0	0	1 - 8
    enable = 1'b1; sel = 4'b1001; #10; // 0	0	0	0	1	0	0	1 - 9

    enable = 1'b0; sel = 4'b0000; #10; // 1 1 1 1 1 1 1 1
    enable = 1'b0; sel = 4'b0001; #10; // 1 1 1 1 1 1 1 1
    enable = 1'b0; sel = 4'b0010; #10; // 1 1 1 1 1 1 1 1
    enable = 1'b0; sel = 4'b0011; #10; // 1 1 1 1 1 1 1 1
    enable = 1'b0; sel = 4'b0100; #10; // 1 1 1 1 1 1 1 1
    enable = 1'b0; sel = 4'b0101; #10; // 1 1 1 1 1 1 1 1
    enable = 1'b0; sel = 4'b0110; #10; // 1 1 1 1 1 1 1 1
    enable = 1'b0; sel = 4'b0111; #10; // 1 1 1 1 1 1 1 1
    enable = 1'b0; sel = 4'b1000; #10; // 1 1 1 1 1 1 1 1
    enable = 1'b0; sel = 4'b1001; #10; // 1 1 1 1 1 1 1 1

    // entradsa invalidas
    enable = 1'b1; sel = 4'b1010; #10; // 1 1 1 1 1 1 1 1
    enable = 1'b1; sel = 4'b1011; #10; // 1 1 1 1 1 1 1 1
    enable = 1'b1; sel = 4'b1100; #10; // 1 1 1 1 1 1 1 1
    enable = 1'b1; sel = 4'b1101; #10; // 1 1 1 1 1 1 1 1
    enable = 1'b1; sel = 4'b1110; #10; // 1 1 1 1 1 1 1 1
    enable = 1'b1; sel = 4'b1111; #10; // 1 1 1 1 1 1 1 1
    
  end
endmodule