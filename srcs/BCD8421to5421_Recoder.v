`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.01.2018 23:09:25
// Design Name: 
// Module Name: BCD8421to5421_16
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

module BCD8421to5421_Recoder(
    input [15:0] Xin,
    output [15:0] X_5421
    );

BCD8421to5421 A3( Xin[15:12],X_5421[15:12]);
BCD8421to5421 A2( Xin[11:8],X_5421[11:8]);
BCD8421to5421 A1( Xin[7:4],X_5421[7:4]);
BCD8421to5421 A0( Xin[3:0],X_5421[3:0]);

endmodule
