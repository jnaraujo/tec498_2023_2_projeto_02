module mux_8x1(
  a, b, c, d, e, f, g, h, sel,
  out
);
  input a, b, c, d, e, f, g, h;
  input [2:0] sel;

  output out;

  wire w0, w1, w2, w3, w4, w5, w6, w7;

  mux_4x1 m0(a, b, c, d, sel[1:0], w0);
  mux_4x1 m1(e, f, g, h, sel[1:0], w1);

  mux_2x1 m2(w0, w1, sel[2], out);

endmodule

module TB_mux_8x1();
  reg a, b, c, d, e, f, g, h;
  reg [2:0] sel;

  wire out;

  mux_8x1 mux_8x1(a, b, c, d, e, f, g, h, sel, out);

  initial begin
    sel = 000; a = 1; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0; #10; // out = 1
    sel = 001; a = 0; b = 1; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0; #10; // out = 1
    sel = 010; a = 0; b = 0; c = 1; d = 0; e = 0; f = 0; g = 0; h = 0; #10; // out = 1
    sel = 011; a = 0; b = 0; c = 0; d = 1; e = 0; f = 0; g = 0; h = 0; #10; // out = 1
    sel = 100; a = 0; b = 0; c = 0; d = 0; e = 1; f = 0; g = 0; h = 0; #10; // out = 1
    sel = 101; a = 0; b = 0; c = 0; d = 0; e = 0; f = 1; g = 0; h = 0; #10; // out = 1
    sel = 110; a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 1; h = 0; #10; // out = 1
    sel = 111; a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 1; #10; // out = 1

    sel = 000; a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0; #10; // out = 0
    sel = 001; a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0; #10; // out = 0
    sel = 010; a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0; #10; // out = 0
    sel = 011; a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0; #10; // out = 0
    sel = 100; a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0; #10; // out = 0
    sel = 101; a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0; #10; // out = 0
    sel = 110; a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0; #10; // out = 0
    sel = 111; a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0; #10; // out = 0

    sel = 000; a = 0; b = 1; c = 1; d = 1; e = 1; f = 1; g = 1; h = 1; #10; // out = 0
    sel = 001; a = 1; b = 0; c = 1; d = 1; e = 1; f = 1; g = 1; h = 1; #10; // out = 0
    sel = 010; a = 1; b = 1; c = 0; d = 1; e = 1; f = 1; g = 1; h = 1; #10; // out = 0
    sel = 011; a = 1; b = 1; c = 1; d = 0; e = 1; f = 1; g = 1; h = 1; #10; // out = 0
    sel = 100; a = 1; b = 1; c = 1; d = 1; e = 0; f = 1; g = 1; h = 1; #10; // out = 0
    sel = 101; a = 1; b = 1; c = 1; d = 1; e = 1; f = 0; g = 1; h = 1; #10; // out = 0
    sel = 110; a = 1; b = 1; c = 1; d = 1; e = 1; f = 1; g = 0; h = 1; #10; // out = 0
    sel = 111; a = 1; b = 1; c = 1; d = 1; e = 1; f = 1; g = 1; h = 0; #10; // out = 0
  end
endmodule