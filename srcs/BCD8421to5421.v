`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2018 18:28:07
// Design Name: 
// Module Name: BCD8421to5421
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


module BCD8421to5421(
    input [3:0] Xi,
    output [3:0] X5421
    );

assign X5421[3] = Xi[3] | Xi[2] & (Xi[0] | Xi[1]);
assign X5421[2] = (Xi[2] & ~Xi[1] & ~Xi[0]) | (Xi[3] & Xi[0]);
assign X5421[1] = (Xi[0] & Xi[1]) | (Xi[3] & ~Xi[0]) | (~Xi[2] & Xi[1]);
assign X5421[0] = (Xi[2] & Xi[1] & ~Xi[0]) | (~Xi[3] & ~Xi[2] & Xi[0]) | (Xi[3] & ~Xi[1] & ~Xi[0]) ;

endmodule