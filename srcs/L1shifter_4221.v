`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.04.2018 00:19:19
// Design Name: 
// Module Name: L1shifter_4221
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


module L1shifter_4221(
    input W_prev,
    input [3:0] W_5211,
    output [3:0] W,
    output Carryout
    );

assign W = {W_5211[2],W_5211[1],W_5211[0],W_prev};
assign Carryout = W_5211[3];
endmodule
