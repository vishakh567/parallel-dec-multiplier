`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.01.2018 22:38:19
// Design Name: 
// Module Name: BCD8421to4221_16
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

module BCD8421to4221_Recoder(
    input [15:0] Xin,
    output [19:0] X_4221
    );
    
BCD8421to4221 B3( Xin[15:12],X_4221[15:12]);
BCD8421to4221 B2( Xin[11:8],X_4221[11:8]);
BCD8421to4221 B1( Xin[7:4],X_4221[7:4]);
BCD8421to4221 B0( Xin[3:0],X_4221[3:0]);
assign X_4221[19:16] = 4'b0000;

endmodule
