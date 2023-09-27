module mux_5x1(a, b, c, d, e, sel, out);
  input a, b, c, d, e;
  input [2:0] sel;

  output out;

  wire w0, w1, w2;

  mux_2x1 m1(a, b, sel[0], w0);
  mux_2x1 m2(c, d, sel[0], w1);

  mux_2x1 m3(w0, w1, sel[1], w2);

  mux_2x1 m4(w2, e, sel[2], out);
endmodule

module TB_mux_5x1();
  reg a, b, c, d, e;
  reg [2:0] sel;

  wire out;

  mux_5x1 mux_5x1(a, b, c, d, e, sel, out);

  initial begin
    sel = 3'b000; a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b0; #10; // out = 1
    sel = 3'b001; a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b0; e = 1'b0; #10; // out = 1
    sel = 3'b010; a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b0; e = 1'b0; #10; // out = 1
    sel = 3'b011; a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b1; e = 1'b0; #10; // out = 1
    sel = 3'b100; a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b1; #10; // out = 1

    sel = 3'b000; a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b0; #10; // out = 0
    sel = 3'b001; a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b0; #10; // out = 0
    sel = 3'b010; a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b0; #10; // out = 0
    sel = 3'b011; a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b0; #10; // out = 0
    sel = 3'b100; a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b0; #10; // out = 0

    sel = 3'b000; a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b1; e = 1'b1; #10; // out = 0
    sel = 3'b001; a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b1; e = 1'b1; #10; // out = 0
    sel = 3'b010; a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b1; e = 1'b1; #10; // out = 0
    sel = 3'b011; a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b0; e = 1'b1; #10; // out = 0
    sel = 3'b100; a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1; e = 1'b0; #10; // out = 0

    // casos invalidos - out = e
    sel = 3'b101; a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1; e = 1'b1; #10; // out = 1
    sel = 3'b110; a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1; e = 1'b1; #10; // out = 1
    sel = 3'b111; a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1; e = 1'b1; #10; // out = 1
    
  end
endmodule