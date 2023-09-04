`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2018 15:43:15
// Design Name: 
// Module Name: Main
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


module Main(
    input [15:0] X_BCD,
    input [15:0] Y_BCD,
    output [31:0] Product
    );
wire [43:0] S,H;
wire [43:0] PP4,PP3,PP2,PP1,PP0;
Partial_Product_Generator PPG(X_BCD, Y_BCD,PP4,PP3,PP2,PP1,PP0);
Partial_Product_Reduction PPR(PP0,PP1,PP2,PP3,PP4,S,H);
FinalProduct_BCD Adder(S,H,Product);

endmodule
