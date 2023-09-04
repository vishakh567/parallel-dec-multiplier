`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.01.2018 23:22:58
// Design Name: 
// Module Name: PPG_Circuit
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


module Partial_Product_Generator(
    input [15:0] X_BCD, Y_BCD,
    output [43:0] PP4,PP3,PP2,PP1,PP0
    );

wire [19:0] X1_4221, X2_4221, X3_4221, X4_4221, X5_4221;
wire [5:0] Y4,Y3,Y2,Y1,Y0;
wire [19:0] PP4w,PP3w,PP2w,PP1w,PP0w;

Generation_of_multiples Mul_Gen (X_BCD,X1_4221, X2_4221, X3_4221, X4_4221, X5_4221);
SD_Radix10_Recoder SD_Radix10_Rec (Y_BCD,Y4,Y3,Y2,Y1,Y0);

Mux_5 Select_1 (X1_4221, X2_4221, X3_4221, X4_4221, X5_4221,Y0[5:1],Y0[0],PP0w);
Mux_5 Select_2 (X1_4221, X2_4221, X3_4221, X4_4221, X5_4221,Y1[5:1],Y1[0],PP1w);
Mux_5 Select_3 (X1_4221, X2_4221, X3_4221, X4_4221, X5_4221,Y2[5:1],Y2[0],PP2w);
Mux_5 Select_4 (X1_4221, X2_4221, X3_4221, X4_4221, X5_4221,Y3[5:1],Y3[0],PP3w);
Mux_5 Select_5 (X1_4221, X2_4221, X3_4221, X4_4221, X5_4221,Y4[5:1],Y4[0],PP4w);

// 4i bit wired Left shift
assign PP0[27:0] = {3'b000,~Y0[0],Y0[0],Y0[0],Y0[0],Y0[0],PP0w};
assign PP0[43:28] = 16'b0;
assign PP1[31:0] = {4'b0000,3'b111,~Y1[0],PP1w} <<4;
assign PP1[43:32] = 12'b0;
assign PP2[35:0] = {4'b0000,3'b111,~Y2[0],PP2w} <<8;
assign PP2[43:36] = 8'b0;
assign PP3[39:0] = {4'b0000,3'b111,~Y3[0],PP3w} <<12;
assign PP3[43:40] = 4'b0;
assign PP4 = {8'b00000000,PP4w} <<16;


endmodule
