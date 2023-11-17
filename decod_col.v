module decod_col(
  sel,
  a, b, c, d, e, f, g, dp
);
  input [2:0] sel;

  output a, b, c, d, e, f, g, dp;

  wire w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13;

  // NOT a OR (b AND c) OR d
  and and0(w0, sel[2], sel[1]);
  or or0(a, w0, sel[0]);

  // NOT a OR b OR (c AND NOT d) OR ( NOT c AND d)
  and and1(w1, sel[1], ~sel[0]);
  and and2(w2, ~sel[1], sel[0]);
  or or1(b, sel[2], w1, w2);

  // NOT a OR b OR (c AND NOT d)
  and and3(w3, sel[1], ~sel[0]);
  or or2(c, sel[2], w3);

  // NOT a OR (b AND c) OR (b AND d) OR ( NOT b AND NOT c AND NOT d)
  and and4(w4, sel[2], sel[1]);
  and and5(w5, sel[2], sel[0]);
  and and6(w6, ~sel[2], ~sel[1], ~sel[0]);
  or or3(d, w4, w5, w6);

  // NOT a OR (b AND c) OR (b AND d)
  and and7(w7, sel[2], sel[1]);
  and and8(w8, sel[2], sel[0]);
  or or4(e, w7, w8);

  // NOT a OR (b AND c) OR (b AND d) OR (c AND d)
  and and9(w9, sel[2], sel[1]);
  and and10(w10, sel[2], sel[0]);
  and and11(w11, sel[1], sel[0]);
  or or5(f, w9, w10, w11);

  // NOT a OR (b AND d) OR (c AND NOT d)
  and and12(w12, sel[2], sel[0]);
  and and13(w13, sel[1], ~sel[0]);
  or or6(g, w12, w13);

  // 1
  assign dp = 1'b1;
endmodule

module TB_decod_col();
reg enable;
  reg [2:0] sel;

  wire a, b, c, d, e, f, g, dp;

  decod_col decod_col(sel, a, b, c, d, e, f, g, dp);

  initial begin
    enable = 1'b1; sel = 3'b000; #10; // 0	0	0	1	0	0	0	1
    enable = 1'b1; sel = 3'b001; #10; // 1	1	0	0	0	0	0	1
    enable = 1'b1; sel = 3'b010; #10; // 0	1	1	0	0	0	1	1
    enable = 1'b1; sel = 3'b011; #10; // 1	0	0	0	0	1	1	1
    enable = 1'b1; sel = 3'b100; #10; // 0	1	1	0	0	0	0	1

    enable = 1'b1; sel = 3'b101; #10;
    enable = 1'b1; sel = 3'b110; #10;
    enable = 1'b1; sel = 3'b111; #10;
    enable = 1'b0; sel = 3'b000; #10;
    enable = 1'b0; sel = 3'b001; #10;
    enable = 1'b0; sel = 3'b010; #10;
    enable = 1'b0; sel = 3'b011; #10;
    enable = 1'b0; sel = 3'b100; #10;
    enable = 1'b0; sel = 3'b101; #10;
    enable = 1'b0; sel = 3'b110; #10;
    enable = 1'b0; sel = 3'b111; #10;
  end

endmodule