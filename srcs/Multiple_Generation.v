`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2018 18:20:41
// Design Name: 
// Module Name: X2_Gen
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


module Generation_of_multiples(
    input [15:0] X_BCD,
    output [19:0] X1_4221, X2_4221, X3_4221, X4_4221, X5_4221
    );

wire [19:0] X_5421,L1_shifted_X_5421,X_5211,L3_shifted_X,XBCD,X3_8421;

//X

assign XBCD[19:16] = 4'b0000;
assign XBCD[15:0] = X_BCD;
BCD8421to4221_Recoder X1_1(XBCD[15:0],X1_4221[15:0]);
BCD8421to4221    X1_2(XBCD[19:16],X1_4221[19:16]);

//X2

BCD8421to5421_Recoder X2_0(X_BCD,X_5421[15:0]);
assign X_5421[19:16] = 4'b0000;

assign L1_shifted_X_5421 = X_5421<<1;
BCD8421to4221_Recoder X2_1(L1_shifted_X_5421[15:0],X2_4221[15:0]);
BCD8421to4221    X2_2(L1_shifted_X_5421[19:16],X2_4221[19:16]);

//X3

Five_digit_BCD_Adder Adder1(XBCD,L1_shifted_X_5421,X3_8421);
BCD8421to4221_Recoder X3_1(X3_8421[15:0],X3_4221[15:0]);
BCD8421to4221    X3_2(X3_8421[19:16],X3_4221[19:16]);

//X4

BCD8421to5211 X4_0(L1_shifted_X_5421[19:16],X_5211[19:16]);
BCD8421to5211 X4_1(L1_shifted_X_5421[15:12],X_5211[15:12]);
BCD8421to5211 X4_2(L1_shifted_X_5421[11:8],X_5211[11:8]);
BCD8421to5211 X4_3(L1_shifted_X_5421[7:4],X_5211[7:4]);
BCD8421to5211 X4_4(L1_shifted_X_5421[3:0],X_5211[3:0]);

assign X4_4221 = X_5211<<1;

//X5

assign L3_shifted_X = X_BCD<<3;
assign L3_shifted_X[19] = 1'b0;

BCD5421to4221 X5_4 (L3_shifted_X[19:16],X5_4221[19:16]);
BCD5421to4221 X5_3 (L3_shifted_X[15:12],X5_4221[15:12]);
BCD5421to4221 X5_2 (L3_shifted_X[11:8],X5_4221[11:8]);
BCD5421to4221 X5_1 (L3_shifted_X[7:4],X5_4221[7:4]);
BCD5421to4221 X5_0 (L3_shifted_X[3:0],X5_4221[3:0]);

endmodule
