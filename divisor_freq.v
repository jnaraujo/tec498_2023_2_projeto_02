// Divisor de frequência de 50MHz para aproximadamente 190Hz
module divisor_freq(clock_in, clock_out);
  input clock_in;
  output reg [17:0] clock_out;

  initial begin
    clock_out = 18'b0; // inicializa clock com 0
  end

  always @ (posedge clock_in) begin
    clock_out = clock_out + 1'b1; // incrementa clock

    if (clock_out >= 18'h3FFFF) // se clock for maior ou igual a 190Hz
      clock_out = 18'b0; // reseta clock
  end
endmodule

`timescale 1ns / 1ps // define a escala de tempo
module TB_DivisorFreq();
  reg clock_in;
  wire [17:0] clock_out;

  divisor_freq divisor_freq(clock_in, clock_out);

  initial begin
    clock_in = 1'b0;
    forever #10 clock_in = ~clock_in;
  end

endmodule