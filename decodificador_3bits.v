module decodificador_3bits(
  sel, s0, s1, s2, s3, s4, s5, s6, s7
);
  input [2:0] sel;
  output s0, s1, s2, s3, s4, s5, s6, s7;

  and and0(s0, ~sel[2], ~sel[1], ~sel[0]);
  and and1(s1, ~sel[2], ~sel[1], sel[0]);
  and and2(s2, ~sel[2], sel[1], ~sel[0]);
  and and3(s3, ~sel[2], sel[1], sel[0]);
  and and4(s4, sel[2], ~sel[1], ~sel[0]);
  and and5(s5, sel[2], ~sel[1], sel[0]);
  and and6(s6, sel[2], sel[1], ~sel[0]);
  and and7(s7, sel[2], sel[1], sel[0]);
endmodule

module TB_Decodificador_3bits();
  reg [2:0] sel;
  wire s0, s1, s2, s3, s4, s5, s6, s7;

  decodificador_3bits decodificador_3bits(sel, s0, s1, s2, s3, s4, s5, s6, s7);

  initial begin
    sel = 3'b000; #10;
    sel = 3'b001; #10;
    sel = 3'b010; #10;
    sel = 3'b011; #10;
    sel = 3'b100; #10;
    sel = 3'b101; #10;
    sel = 3'b110; #10;
    sel = 3'b111; #10;
  end
endmodule