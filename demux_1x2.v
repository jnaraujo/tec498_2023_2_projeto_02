module demux_1x2(Sel, E, Out2, Out1);
  input Sel, E;
  output Out2, Out1;

  assign Out2 = Sel & E;
  assign Out1 = ~Sel & E;
endmodule

module TB_demux_1x2;
  reg Sel, E;
  wire Out2, Out1;

  demux_1x2 demux_1x2(Sel, E, Out2, Out1);

  initial begin
    Sel = 0; E = 0; #10; // Out2 = 0, Out1 = 0
    Sel = 0; E = 1; #10; // Out2 = 0, Out1 = 1
    Sel = 1; E = 0; #10; // Out2 = 0, Out1 = 0
    Sel = 1; E = 1; #10; // Out2 = 1, Out1 = 0
  end
endmodule