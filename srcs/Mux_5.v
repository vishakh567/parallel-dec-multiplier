`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.01.2018 22:59:09
// Design Name: 
// Module Name: Mux_5
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Mux_5(
    input [19:0] X1_4221,
    input [19:0] X2_4221,
    input [19:0] X3_4221,
    input [19:0] X4_4221,
    input [19:0] X5_4221,
    input [5:1] yi,
    input ysi,
    output [19:0] X_out
    );

reg [19:0] Mux_out;
   
always @(*)
    begin
    case(yi)
        5'b00001 : Mux_out = X1_4221;
        5'b00010 : Mux_out = X2_4221;
        5'b00100 : Mux_out = X3_4221;
        5'b01000 : Mux_out = X4_4221;
        5'b10000 : Mux_out = X5_4221;
        default :  Mux_out = 5'b00000;
    endcase
    end
    
for (genvar i = 0; i <= 19; i = i+1)
   assign X_out[i] = Mux_out[i] ^ ysi;
   
endmodule
