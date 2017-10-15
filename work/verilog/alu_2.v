/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_2 (
    input clk,
    input rst,
    input [5:0] alufn,
    input [7:0] op1,
    input [7:0] op2,
    input z,
    input v,
    input n,
    output reg [7:0] out,
    output reg zOut,
    output reg vOut,
    output reg nOut
  );
  
  
  
  reg [7:0] result;
  
  always @* begin
    zOut = 1'h0;
    vOut = 1'h0;
    nOut = 1'h0;
    out = 8'bxxxxxxxx;
    
    case (alufn)
      6'h00: begin
        result = op1 + op2;
        out = result;
        nOut = result[7+0-:1];
      end
      6'h01: begin
        result = op1 - op2;
        out = result;
        nOut = result[7+0-:1];
      end
      6'h02: begin
        out = op1 * op2;
      end
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
      6'h20: begin
        out = op1 << op2;
      end
      6'h21: begin
        out = op1 >> op2;
      end
      6'h33: begin
        out = op1 == op2;
      end
      6'h35: begin
        out = op1 < op2;
      end
      6'h37: begin
        out = op1 <= op2;
      end
    endcase
  end
endmodule
