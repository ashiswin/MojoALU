/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module boolean_4 (
    input clk,
    input rst,
    input [7:0] op1,
    input [7:0] op2,
    input [5:0] alufn,
    output reg out
  );
  
  
  
  always @* begin
    out = 8'bxxxxxxxx;
    
    case (alufn)
      6'h18: begin
        out = op1 & op2;
      end
      6'h1e: begin
        out = op1 | op2;
      end
      6'h16: begin
        out = op1 ^ op2;
      end
      6'h11: begin
        out = ~op1;
      end
      6'h1a: begin
        out = op1;
      end
    endcase
  end
endmodule
