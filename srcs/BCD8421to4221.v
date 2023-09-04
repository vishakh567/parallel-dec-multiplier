`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.01.2018 22:30:59
// Design Name: 
// Module Name: BCD8421to4221
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

module BCD8421to4221(
    input [3:0] Xi,
    output [3:0] X4221
    );

assign X4221[3] = Xi[3] | Xi[2];
assign X4221[2] = Xi[3];
assign X4221[1] = Xi[3] | Xi[1];
assign X4221[0] = Xi[0];

endmodule


