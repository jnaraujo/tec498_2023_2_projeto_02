module mux_5x1(a, b, c, d, e, sel, out);
  input a, b, c, d, e;
  input [2:0] sel;

  output out;

  wire w0, w1, w2, w3, w4, w5, w6, w7, w8, w9;

  mux_4x1 mux_4x1_0(a, b, c, d, sel[1:0], w0);
  mux_4x1 mux_4x1_1(e, 0, 0, 0, sel[1:0], w1);

  mux_2x1 mux_2x1_0(w0, w1, sel[2], out);
endmodule

module TB_mux_5x1();
  reg a, b, c, d, e;
  reg [2:0] sel;

  wire out;

  mux_5x1 mux_5x1(a, b, c, d, e, sel, out);

  initial begin
    sel = 000; a = 1; b = 0; c = 0; d = 0; e = 0; #10; // out = 1
    sel = 001; a = 0; b = 1; c = 0; d = 0; e = 0; #10; // out = 1
    sel = 010; a = 0; b = 0; c = 1; d = 0; e = 0; #10; // out = 1
    sel = 011; a = 0; b = 0; c = 0; d = 1; e = 0; #10; // out = 1
    sel = 100; a = 0; b = 0; c = 0; d = 0; e = 1; #10; // out = 1

    sel = 000; a = 0; b = 0; c = 0; d = 0; e = 0; #10; // out = 0
    sel = 001; a = 0; b = 0; c = 0; d = 0; e = 0; #10; // out = 0
    sel = 010; a = 0; b = 0; c = 0; d = 0; e = 0; #10; // out = 0
    sel = 011; a = 0; b = 0; c = 0; d = 0; e = 0; #10; // out = 0
    sel = 100; a = 0; b = 0; c = 0; d = 0; e = 0; #10; // out = 0

    sel = 000; a = 0; b = 1; c = 1; d = 1; e = 1; #10; // out = 0
    sel = 001; a = 1; b = 0; c = 1; d = 1; e = 1; #10; // out = 0
    sel = 010; a = 1; b = 1; c = 0; d = 1; e = 1; #10; // out = 0
    sel = 011; a = 1; b = 1; c = 1; d = 0; e = 1; #10; // out = 0
    sel = 100; a = 1; b = 1; c = 1; d = 1; e = 0; #10; // out = 0

    // casos invalidos
    sel = 101; a = 1; b = 1; c = 1; d = 1; e = 1; #10; // out = 0
    sel = 110; a = 1; b = 1; c = 1; d = 1; e = 1; #10; // out = 0
    sel = 111; a = 1; b = 1; c = 1; d = 1; e = 1; #10; // out = 0
    
  end
endmodule