`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2018 19:47:17
// Design Name: 
// Module Name: Testbench
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


module Testbench;

reg [15:0] X_BCD, Y_BCD;
wire [43:0] PP4,PP3,PP2,PP1,PP0;

Partial_Product_Generator UUT(X_BCD, Y_BCD,PP4,PP3,PP2,PP1,PP0);

initial
    begin
        X_BCD = 16'h1235;
        Y_BCD = 16'h3454;
    end
endmodule
