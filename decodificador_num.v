module decodificador_num(
  enable,
  sel,
  a, b, c, d, e, f, g, dp
);
  input enable;
  input [2:0] sel;
  output a, b, c, d, e, f, g, dp;

  wire w0, w1, w2, w3, w4, w5, w6, w7;
  wire w8, w9, w10, w11, w12, w13, w14, w15;

  // A	  B	    C	    D	      E
  // E sel[3] sel[2] sel[1] sel[0]

  // A = NOT a OR (b AND NOT c AND NOT d) OR ( NOT b AND NOT c AND d)
  and and0(w0, sel[2], ~sel[1], ~sel[0]); // b AND NOT c AND NOT d
  and and1(w1, ~sel[2], ~sel[1], sel[0]); // NOT b AND NOT c AND d
  or or0(a, ~enable, w0, w1);

  // B = NOT a OR (b AND c AND NOT d) OR (b AND NOT c AND d)
  and and2(w2, sel[2], sel[1], ~sel[0]); // b AND c AND NOT d
  and and3(w3, sel[2], ~sel[1], sel[0]); // b AND NOT c AND d
  or or1(b, ~enable, w2, w3);

  // C = NOT a OR ( NOT b AND c AND NOT d)
  and and4(w4, ~sel[2], sel[1], ~sel[0]); // NOT b AND c AND NOT d
  or or2(c, ~enable, w4);

  // D = NOT a OR (b AND c AND d) OR (b AND NOT c AND NOT d) OR ( NOT b AND NOT c AND d)
  and and5(w5, sel[2], sel[1], sel[0]); // b AND c AND d
  and and6(w6, sel[2], ~sel[1], ~sel[0]); // b AND NOT c AND NOT d
  and and7(w7, ~sel[2], ~sel[1], sel[0]); // NOT b AND NOT c AND d
  or or3(d, ~enable, w5, w6, w7);

  // E = NOT a OR (b AND NOT c) OR d
  and and8(w8, sel[2], ~sel[1]); // b AND NOT c
  or or4(e, ~enable, w8, sel[0]);

  // F = NOT a OR ( NOT b AND c) OR ( NOT b AND d) OR (c AND d)
  and and9(w9, ~sel[2], sel[1]); // NOT b AND c
  and and10(w10, ~sel[2], sel[0]); // NOT b AND d
  and and11(w11, sel[1], sel[0]); // c AND d
  or or5(f, ~enable, w9, w10, w11);

  // G = NOT a OR (b AND c AND d) OR ( NOT b AND NOT c)
  and and12(w12, sel[2], sel[1], sel[0]); // b AND c AND d
  and and13(w13, ~sel[2], ~sel[1]); // NOT b AND NOT c
  or or6(g, ~enable, w12, w13);

  // DP = 1
  assign dp = 1'b1;
endmodule

module TB_Decodificador_num();
  reg enable;
  reg [2:0] sel;

  wire a, b, c, d, e, f, g, dp;

  decodificador_num decodificador_num(enable, sel, a, b, c, d, e, f, g, dp);

  initial begin
    enable = 1'b1; sel = 3'b000; #10; // 0	0	0	0	0	0	1	1 - 0
    enable = 1'b1; sel = 3'b001; #10; // 1	0	0	1	1	1	1	1 - 1
    enable = 1'b1; sel = 3'b010; #10; // 0	0	1	0	0	1	0	1 - 2
    enable = 1'b1; sel = 3'b011; #10; // 0	0	0	0	1	1	0	1 - 3
    enable = 1'b1; sel = 3'b100; #10; // 1	0	0	1	1	0	0	1 - 4
    enable = 1'b1; sel = 3'b101; #10; // 0	1	0	0	1	0	0	1 - 5
    enable = 1'b1; sel = 3'b110; #10; // 0	1	0	0	0	0	0	1 - 6
    enable = 1'b1; sel = 3'b111; #10; // 0	0	0	1	1	1	1	1 - 7

    enable = 1'b0; sel = 3'b000; #10; // 1 1 1 1 1 1 1 1
    enable = 1'b0; sel = 3'b001; #10; // 1 1 1 1 1 1 1 1
    enable = 1'b0; sel = 3'b010; #10; // 1 1 1 1 1 1 1 1
    enable = 1'b0; sel = 3'b011; #10; // 1 1 1 1 1 1 1 1
    enable = 1'b0; sel = 3'b100; #10; // 1 1 1 1 1 1 1 1
    enable = 1'b0; sel = 3'b101; #10; // 1 1 1 1 1 1 1 1
    enable = 1'b0; sel = 3'b110; #10; // 1 1 1 1 1 1 1 1
    enable = 1'b0; sel = 3'b111; #10; // 1 1 1 1 1 1 1 1
    
  end
endmodule