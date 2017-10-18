/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module testerFSM_2 (
    input clk,
    input rst,
    input [4:0] io_button,
    input [23:0] io_dip,
    output reg [7:0] out,
    output reg zOut,
    output reg vOut,
    output reg nOut,
    output reg [27:0] text
  );
  
  
  
  localparam MANUAL_state = 4'd0;
  localparam ADDER1_state = 4'd1;
  localparam ADDER2_state = 4'd2;
  localparam ADDER_ERR_state = 4'd3;
  localparam BOOL1_state = 4'd4;
  localparam BOOL2_state = 4'd5;
  localparam BOOL_ERR_state = 4'd6;
  localparam COMP1_state = 4'd7;
  localparam COMP2_state = 4'd8;
  localparam COMP_ERR_state = 4'd9;
  localparam SHF1_state = 4'd10;
  localparam SHF2_state = 4'd11;
  localparam SHF_ERR_state = 4'd12;
  
  reg [3:0] M_state_d, M_state_q = MANUAL_state;
  wire [8-1:0] M_alu_out;
  wire [1-1:0] M_alu_zOut;
  wire [1-1:0] M_alu_vOut;
  wire [1-1:0] M_alu_nOut;
  reg [6-1:0] M_alu_alufn;
  reg [8-1:0] M_alu_op1;
  reg [8-1:0] M_alu_op2;
  reg [1-1:0] M_alu_z;
  reg [1-1:0] M_alu_v;
  reg [1-1:0] M_alu_n;
  alu_4 alu (
    .clk(clk),
    .rst(rst),
    .alufn(M_alu_alufn),
    .op1(M_alu_op1),
    .op2(M_alu_op2),
    .z(M_alu_z),
    .v(M_alu_v),
    .n(M_alu_n),
    .out(M_alu_out),
    .zOut(M_alu_zOut),
    .vOut(M_alu_vOut),
    .nOut(M_alu_nOut)
  );
  reg [29:0] M_counter_d, M_counter_q = 1'h0;
  
  localparam DELAY = 5'h1a;
  
  always @* begin
    M_state_d = M_state_q;
    M_counter_d = M_counter_q;
    
    out = M_alu_out;
    zOut = M_alu_zOut;
    vOut = M_alu_vOut;
    nOut = M_alu_nOut;
    M_alu_z = 1'h0;
    M_alu_n = 1'h0;
    M_alu_v = 1'h0;
    M_alu_alufn = 6'h00;
    M_alu_op1 = 8'h00;
    M_alu_op2 = 8'h00;
    text = 28'he587af2;
    
    case (M_state_q)
      MANUAL_state: begin
        M_alu_alufn = io_dip[0+0+5-:6];
        M_alu_op1 = io_dip[8+7-:8];
        M_alu_op2 = io_dip[16+7-:8];
        text = 28'h0000000;
        M_counter_d = 1'h0;
        if (io_button[1+0-:1] == 1'h1) begin
          M_state_d = ADDER1_state;
        end
      end
      ADDER1_state: begin
        M_alu_alufn = 6'h00;
        M_alu_op1 = 8'h01;
        M_alu_op2 = 8'h01;
        text = 28'hc393201;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[26+0-:1] == 1'h1 && M_alu_out == 8'h02) begin
          M_counter_d = 1'h0;
          M_state_d = ADDER2_state;
        end else begin
          if (M_counter_q[26+0-:1] == 1'h1 && M_alu_out != 8'h02) begin
            M_counter_d = 1'h0;
            M_state_d = ADDER_ERR_state;
          end
        end
      end
      ADDER2_state: begin
        M_alu_alufn = 6'h01;
        M_alu_op1 = 8'h01;
        M_alu_op2 = 8'h01;
        text = 28'hc393202;
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q[26+0-:1] == 1'h1 && M_alu_out == 8'h00) begin
          M_counter_d = 1'h0;
          M_state_d = MANUAL_state;
        end else begin
          if (M_counter_q[26+0-:1] == 1'h1 && M_alu_out != 8'h00) begin
            M_counter_d = 1'h0;
            M_state_d = ADDER_ERR_state;
          end
        end
      end
      ADDER_ERR_state: begin
        M_alu_alufn = 6'h00;
        M_alu_op1 = 8'h00;
        M_alu_op2 = 8'h00;
        text = 28'hcb87264;
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_counter_q <= M_counter_d;
      M_state_q <= M_state_d;
    end
  end
  
endmodule
