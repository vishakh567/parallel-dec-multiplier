`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2018 20:10:37
// Design Name: 
// Module Name: BCD5421to4221
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


module BCD5421to4221(
    input [3:0] X_5421,
    output [3:0] X_4221
    );
       
assign X_4221[3] = X_5421[3] | X_5421[2];
assign X_4221[2] = X_5421[3] & (X_5421[2] | (X_5421[1] & X_5421[0]));
assign X_4221[1] = X_5421[1] | (X_5421[3] & (X_5421[2] | X_5421[0]));
assign X_4221[0] = X_5421[3] ^ X_5421[0];

endmodule
