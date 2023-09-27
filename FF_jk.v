module FF_jk(
  j, k, clock, q
);
  input j, k, clock;
  output q;

  reg q;

  initial begin
    q = 1'b0;
  end

  always @(posedge clock) begin
    case ({j, k})
      2'b00: q <= q;
      2'b01: q <= 1'b0;
      2'b10: q <= 1'b1;
      2'b11: q <= ~q;
    endcase
  end
endmodule

module TB_FF_jk();
  reg j, k, clk;
  wire q;

  FF_jk FF_jk(j, k, clk, q);

  initial begin
    j = 1'b0; k = 1'b0; clk = 1'b0; #10; // q = 0
    j = 1'b0; k = 1'b0; clk = 1'b1; #10; // q = 0

    j = 1'b1; k = 1'b0; clk = 1'b0; #10; // q = 0
    j = 1'b1; k = 1'b0; clk = 1'b1; #10; // q = 1

    j = 1'b0; k = 1'b1; clk = 1'b0; #10; // q = 1
    j = 1'b0; k = 1'b1; clk = 1'b1; #10; // q = 0

    j = 1'b1; k = 1'b1; clk = 1'b0; #10; // q = 0
    j = 1'b1; k = 1'b1; clk = 1'b1; #10; // q = 1

    j = 1'b0; k = 1'b0; clk = 1'b0; #10; // q = 1
    j = 1'b0; k = 1'b0; clk = 1'b1; #10; // q = 1
  end

endmodule