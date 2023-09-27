module mux_8x1(
  a, b, c, d, e, f, g, h, sel,
  out
);
  input a, b, c, d, e, f, g, h;
  input [2:0] sel;

  output out;

  wire w0, w1;

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
    sel = 3'b000; a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b0; f = 1'b0; g = 1'b0; h = 1'b0; #10; // out = 1
    sel = 3'b001; a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b0; e = 1'b0; f = 1'b0; g = 1'b0; h = 1'b0; #10; // out = 1
    sel = 3'b010; a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b0; e = 1'b0; f = 1'b0; g = 1'b0; h = 1'b0; #10; // out = 1
    sel = 3'b011; a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b1; e = 1'b0; f = 1'b0; g = 1'b0; h = 1'b0; #10; // out = 1
    sel = 3'b100; a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b1; f = 1'b0; g = 1'b0; h = 1'b0; #10; // out = 1
    sel = 3'b101; a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b0; f = 1'b1; g = 1'b0; h = 1'b0; #10; // out = 1
    sel = 3'b110; a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b0; f = 1'b0; g = 1'b1; h = 1'b0; #10; // out = 1
    sel = 3'b111; a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b0; f = 1'b0; g = 1'b0; h = 1'b1; #10; // out = 1

    sel = 3'b000; a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b0; f = 1'b0; g = 1'b0; h = 1'b0; #10; // out = 0
    sel = 3'b001; a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b0; f = 1'b0; g = 1'b0; h = 1'b0; #10; // out = 0
    sel = 3'b010; a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b0; f = 1'b0; g = 1'b0; h = 1'b0; #10; // out = 0
    sel = 3'b011; a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b0; f = 1'b0; g = 1'b0; h = 1'b0; #10; // out = 0
    sel = 3'b100; a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b0; f = 1'b0; g = 1'b0; h = 1'b0; #10; // out = 0
    sel = 3'b101; a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b0; f = 1'b0; g = 1'b0; h = 1'b0; #10; // out = 0
    sel = 3'b110; a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b0; f = 1'b0; g = 1'b0; h = 1'b0; #10; // out = 0
    sel = 3'b111; a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b0; f = 1'b0; g = 1'b0; h = 1'b0; #10; // out = 0

    sel = 3'b000; a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b1; e = 1'b1; f = 1'b1; g = 1'b1; h = 1'b1; #10; // out = 0
    sel = 3'b001; a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b1; e = 1'b1; f = 1'b1; g = 1'b1; h = 1'b1; #10; // out = 0
    sel = 3'b010; a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b1; e = 1'b1; f = 1'b1; g = 1'b1; h = 1'b1; #10; // out = 0
    sel = 3'b011; a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b0; e = 1'b1; f = 1'b1; g = 1'b1; h = 1'b1; #10; // out = 0
    sel = 3'b100; a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1; e = 1'b0; f = 1'b1; g = 1'b1; h = 1'b1; #10; // out = 0
    sel = 3'b101; a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1; e = 1'b1; f = 1'b0; g = 1'b1; h = 1'b1; #10; // out = 0
    sel = 3'b110; a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1; e = 1'b1; f = 1'b1; g = 1'b0; h = 1'b1; #10; // out = 0
    sel = 3'b111; a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1; e = 1'b1; f = 1'b1; g = 1'b1; h = 1'b0; #10; // out = 0
  end
endmodule