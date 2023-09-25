module FF_jk(s, r, q, clock);
  input s, r, clock;
  output q;

  reg q;

  always @(posedge clock) begin
    if (s == 1 && r == 0)
      q <= 1;
    else if (s == 0 && r == 1)
      q <= 0;
    else if (s == 1 && r == 1)
      q <= ~q;
  end
endmodule

module TB_FF_jk();
  reg s, r, clock;
  wire q;

  FF_jk FF_jk(s, r, q, clock);

  initial begin
    s = 0; r = 1; clock = 0; #10; // q = #
    s = 0; r = 1; clock = 1; #10; // q = 0

    s = 0; r = 0; clock = 0; #10; // q = 0
    s = 0; r = 0; clock = 1; #10; // q = 0
    s = 1; r = 0; clock = 0; #10; // q = 0
    s = 1; r = 0; clock = 1; #10; // q = 1
    s = 1; r = 0; clock = 0; #10; // q = 1
    s = 1; r = 0; clock = 1; #10; // q = 1
    s = 0; r = 1; clock = 0; #10; // q = 1
    s = 0; r = 1; clock = 1; #10; // q = 0
    s = 1; r = 1; clock = 0; #10; // q = 0
    s = 1; r = 1; clock = 1; #10; // q = 1
    s = 1; r = 1; clock = 0; #10; // q = 1
    s = 1; r = 1; clock = 1; #10; // q = 0

  end
endmodule