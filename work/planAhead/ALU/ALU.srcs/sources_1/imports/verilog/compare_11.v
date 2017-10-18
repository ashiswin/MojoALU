/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module compare_11 (
    input [5:0] alufn,
    input z,
    input v,
    input n,
    output reg [7:0] out
  );
  
  
  
  always @* begin
    out = 8'h00;
    
    case (alufn)
      6'h33: begin
        out[0+0-:1] = z;
      end
      6'h35: begin
        out = n ^ v;
      end
      6'h37: begin
        out = z | (n ^ v);
      end
    endcase
  end
endmodule