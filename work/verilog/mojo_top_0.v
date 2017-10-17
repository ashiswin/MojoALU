/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
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
  alu_2 alu (
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
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    M_alu_alufn = io_dip[0+0+5-:6];
    M_alu_op1 = io_dip[8+7-:8];
    M_alu_op2 = io_dip[16+7-:8];
    M_alu_z = 1'h0;
    M_alu_n = 1'h0;
    M_alu_v = 1'h0;
    io_led[0+7-:8] = M_alu_out;
    io_led[8+0+0-:1] = M_alu_zOut;
    io_led[8+1+0-:1] = M_alu_vOut;
    io_led[8+2+0-:1] = M_alu_nOut;
  end
endmodule
