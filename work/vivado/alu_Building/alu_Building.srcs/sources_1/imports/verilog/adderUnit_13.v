/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module adderUnit_13 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn_signal,
    output reg [15:0] out,
    output reg z,
    output reg v,
    output reg n
  );
  
  
  
  reg [15:0] s;
  
  always @* begin
    
    case (alufn_signal[0+0-:1])
      1'h0: begin
        s = a + b;
      end
      1'h1: begin
        s = a - b;
      end
      default: begin
        s = 16'h0000;
      end
    endcase
    out = s;
    z = (~|s);
    n = s[15+0-:1];
    v = (a[15+0-:1] & (b[15+0-:1] ^ alufn_signal[0+0-:1]) & !s[15+0-:1]) | (!a[15+0-:1] & !(b[15+0-:1] ^ alufn_signal[0+0-:1]) & s[15+0-:1]);
  end
endmodule
