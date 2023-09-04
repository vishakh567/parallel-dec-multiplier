`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2018 19:45:17
// Design Name: 
// Module Name: BCD8421to5211
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


module BCD8421to5211(
    input [3:0] Xi,
    output [3:0] X_5211
    );
    
assign X_5211[3] = Xi[3] | (Xi[2] & Xi[0]) | (~Xi[3] & Xi[2] & Xi[1]);
assign X_5211[2] = Xi[3] | (Xi[1] & Xi[0]) | (~Xi[3] & ~Xi[0] & (Xi[2] ^ Xi[1]));
assign X_5211[1] = (Xi[3] & Xi[0]) | (Xi[2] & ~Xi[1] & ~Xi[0]);
assign X_5211[0] = (Xi[2] ^ Xi[0]) | (Xi[3] & ~Xi[0]);

endmodule
