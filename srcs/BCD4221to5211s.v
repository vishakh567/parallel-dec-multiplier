`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2018 22:13:27
// Design Name: 
// Module Name: BCD4221to5211s
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

module BCD4221to5211s(
    input [3:0] X_4221,
    output [3:0] X_5211s
    );

assign X_5211s[3] = X_4221[2] | (X_4221[3] & (X_4221[0] | X_4221[1]));
assign X_5211s[2] = X_4221[2] | (X_4221[1] & X_4221[0]) | (~X_4221[3] & X_4221[1]) |
                    (X_4221[3] & ~X_4221[1] & ~X_4221[0]);
assign X_5211s[1] = (X_4221[2] & X_4221[0]) | (X_4221[3] & ~X_4221[1] & ~X_4221[0]);
assign X_5211s[0] = X_4221[2] | (X_4221[3] ^ X_4221[0]);

endmodule
