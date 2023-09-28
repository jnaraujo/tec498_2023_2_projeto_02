module decodificador_modo(
  enable,
  sel,
  a, b, c, d, e, f, g, dp
);
  input enable;
  input [1:0] sel;

  output a, b, c, d, e, f, g, dp;

  // a = NOT a OR NOT b
  or or0(a, ~enable, ~sel[1]);
  
  // b = NOT a OR NOT b
  or or1(b, ~enable, ~sel[1]);

  // c = NOT a OR NOT b OR NOT c
  or or2(c, ~enable, ~sel[1], ~sel[0]);

  // d = 1
  assign d = 1'b1;

  // e = NOT a OR NOT b
  or or3(e, ~enable, ~sel[1]);

  // f = NOT a OR NOT b
  or or4(f, ~enable, ~sel[1]);

  // g = NOT a OR NOT b
  or or5(g, ~enable, ~sel[1]);

  // dp = 1
  assign dp = 1'b1;
endmodule

module TB_Decodificador_modo();
  reg enable;
  reg [1:0] sel;

  wire a, b, c, d, e, f, g, dp;

  decodificador_modo decodificador_modo(enable, sel, a, b, c, d, e, f, g, dp);

  initial begin
    enable = 1'b1; sel = 2'b00; #10; // 1	1	1	1	1	1	1	1
    enable = 1'b1; sel = 2'b01; #10; // 1	1	1	1	1	1	1	1
    enable = 1'b1; sel = 2'b10; #10; // 0	0	1	1	0	0	0	1 - P
    enable = 1'b1; sel = 2'b11; #10; // 0	0	0	1	0	0	0	1 - A

    enable = 1'b0; sel = 2'b00; #10; // 1	1	1	1	1	1	1	1
    enable = 1'b0; sel = 2'b01; #10; // 1	1	1	1	1	1	1	1
    enable = 1'b0; sel = 2'b10; #10; // 1	1	1	1	1	1	1	1
    enable = 1'b0; sel = 2'b11; #10; // 1	1	1	1	1	1	1	1

  end

endmodule