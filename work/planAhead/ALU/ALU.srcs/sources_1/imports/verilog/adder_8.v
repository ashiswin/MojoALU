/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module adder_8 (
    input [5:0] alufn,
    input [7:0] op1,
    input [7:0] op2,
    output reg [7:0] out,
    output reg zOut,
    output reg vOut,
    output reg nOut
  );
  
  
  
  reg zComp;
  
  reg [7:0] result;
  
  integer i;
  
  reg [3:0] shift;
  
  reg [3:0] amant;
  
  reg [3:0] bmant;
  
  reg [3:0] aexp;
  
  reg [3:0] bexp;
  
  reg [4:0] fresult;
  
  reg [7:0] o1;
  
  reg [7:0] o2;
  
  reg [7:0] fmulres;
  
  reg [3:0] fmulexp;
  
  reg [3:0] fmulshift;
  
  always @* begin
    zOut = 1'h0;
    vOut = 1'h0;
    nOut = 1'h0;
    out = 8'h00;
    
    case (alufn)
      6'h00: begin
        result = op1 + op2;
        out = result;
        nOut = result[7+0-:1];
        vOut = (op1[7+0-:1] & op2[7+0-:1] & ~result[7+0-:1]) | (~op1[7+0-:1] & ~op2[7+0-:1] & result[7+0-:1]);
        zComp = result[0+0-:1];
        for (i = 1'h1; i < 4'h8; i = i + 1) begin
          zComp = (zComp | result[(i)*1+0-:1]);
        end
        zOut = ~zComp;
      end
      6'h01: begin
        result = op1 - op2;
        out = result;
        nOut = result[7+0-:1];
        vOut = (op1[7+0-:1] & op2[7+0-:1] & ~result[7+0-:1]) | (~op1[7+0-:1] & ~op2[7+0-:1] & result[7+0-:1]);
        zComp = result[0+0-:1];
        for (i = 1'h1; i < 4'h8; i = i + 1) begin
          zComp = (zComp | result[(i)*1+0-:1]);
        end
        zOut = ~zComp;
      end
      6'h02: begin
        out = op1 * op2;
      end
      6'h04: begin
        out = -op1;
      end
      6'h05: begin
        out = (-op1 & {4'h8{op1[7+0-:1]}}) | (op1 & {4'h8{~op1[7+0-:1]}});
      end
      6'h08: begin
        if (op1[3+3-:4] > op2[3+3-:4]) begin
          o1 = op1;
          o2 = op2;
        end else begin
          o1 = op2;
          o2 = op1;
        end
        shift = o1[3+3-:4] - o2[3+3-:4];
        amant[3+0-:1] = 1'h1;
        amant[0+2-:3] = o1[0+2-:3];
        bmant[3+0-:1] = 1'h1;
        bmant[0+2-:3] = o2[0+2-:3];
        bmant = bmant >> shift;
        fresult = amant + bmant;
        if (fresult[4+0-:1] == 1'h1) begin
          out[3+3-:4] = o1[3+3-:4] + 1'h1;
          fresult = fresult >> 1'h1;
        end else begin
          out[3+3-:4] = o1[3+3-:4];
        end
        out[0+2-:3] = fresult[0+2-:3];
      end
      6'h0a: begin
        amant[3+0-:1] = 1'h1;
        bmant[3+0-:1] = 1'h1;
        amant[0+2-:3] = op1[0+2-:3];
        bmant[0+2-:3] = op2[0+2-:3];
        aexp = op1[3+3-:4] - 4'ha;
        bexp = op2[3+3-:4] - 4'ha;
        fmulres = amant * bmant;
        fmulexp = aexp + bexp;
        fmulshift[0+0-:1] = (~fmulres[7+0-:1] & fmulres[6+0-:1]) | (~fmulres[7+0-:1] & ~fmulres[5+0-:1] & fmulres[4+0-:1]) | (~fmulres[7+0-:1] & ~fmulres[5+0-:1] & ~fmulres[3+0-:1] & fmulres[2+0-:1]) | (~fmulres[7+0-:1] & ~fmulres[5+0-:1] & ~fmulres[3+0-:1] & ~fmulres[1+0-:1] & fmulres[0+0-:1]);
        fmulshift[1+0-:1] = (~fmulres[7+0-:1] & fmulres[5+0-:1]) | (~fmulres[7+0-:1] & fmulres[6+0-:1]) | (~fmulres[7+0-:1] & ~fmulres[4+0-:1] & ~fmulres[3+0-:1] & fmulres[1+0-:1]) | (~fmulres[7+0-:1] & ~fmulres[4+0-:1] & ~fmulres[3+0-:1] & fmulres[2+0-:1]);
        fmulshift[2+0-:1] = (~fmulres[7+0-:1] & fmulres[3+0-:1]) | (~fmulres[7+0-:1] & fmulres[4+0-:1]) | (~fmulres[7+0-:1] & fmulres[5+0-:1]) | (~fmulres[7+0-:1] & fmulres[6+0-:1]);
        fmulshift[3+0-:1] = fmulres[7+0-:1];
        fmulexp = fmulexp + fmulshift - 1'h1;
        out[7+0-:1] = op1[7+0-:1] ^ op2[7+0-:1];
        out[3+3-:4] = fmulexp + 3'h7;
        if (fmulshift > 3'h4) begin
          fmulres = fmulres >> (fmulshift - 3'h4);
        end else begin
          fmulres = fmulres << (3'h4 - fmulshift);
        end
        out[0+2-:3] = fmulres[0+2-:3];
      end
      6'h09: begin
        out[7+0-:1] = op1[7+0-:1];
        if (op1[7+0-:1] == 1'h1) begin
          fmulres = -op1;
        end else begin
          fmulres = op1;
        end
        fmulshift[0+0-:1] = (~fmulres[7+0-:1] & fmulres[6+0-:1]) | (~fmulres[7+0-:1] & ~fmulres[5+0-:1] & fmulres[4+0-:1]) | (~fmulres[7+0-:1] & ~fmulres[5+0-:1] & ~fmulres[3+0-:1] & fmulres[2+0-:1]) | (~fmulres[7+0-:1] & ~fmulres[5+0-:1] & ~fmulres[3+0-:1] & ~fmulres[1+0-:1] & fmulres[0+0-:1]);
        fmulshift[1+0-:1] = (~fmulres[7+0-:1] & fmulres[5+0-:1]) | (~fmulres[7+0-:1] & fmulres[6+0-:1]) | (~fmulres[7+0-:1] & ~fmulres[4+0-:1] & ~fmulres[3+0-:1] & fmulres[1+0-:1]) | (~fmulres[7+0-:1] & ~fmulres[4+0-:1] & ~fmulres[3+0-:1] & fmulres[2+0-:1]);
        fmulshift[2+0-:1] = (~fmulres[7+0-:1] & fmulres[3+0-:1]) | (~fmulres[7+0-:1] & fmulres[4+0-:1]) | (~fmulres[7+0-:1] & fmulres[5+0-:1]) | (~fmulres[7+0-:1] & fmulres[6+0-:1]);
        fmulshift[3+0-:1] = fmulres[7+0-:1];
        if (fmulshift > 3'h4) begin
          fmulres = fmulres >> (fmulshift - 3'h4);
        end else begin
          fmulres = fmulres << (3'h4 - fmulshift);
        end
        fmulexp = fmulshift - 1'h1;
        out[3+3-:4] = fmulexp + 3'h7;
        out[0+2-:3] = fmulres[0+2-:3];
      end
      6'h0b: begin
        fmulexp = op1[3+3-:4] - 3'h7;
        amant[3+0-:1] = 1'h1;
        amant[0+2-:3] = op1[0+2-:3];
        if (fmulexp > 1'h0) begin
          if (fmulexp > 2'h3) begin
            fmulres = amant << fmulexp - 2'h3;
          end else begin
            fmulres = amant >> 2'h3 - fmulexp;
          end
        end
        if (op1[7+0-:1] == 1'h1) begin
          fmulres = -fmulres;
        end
        out = fmulres;
      end
    endcase
  end
endmodule
