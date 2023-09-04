`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.01.2018 21:04:51
// Design Name: 
// Module Name: BCD2SDRadix10
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


module SD_Radix10(
    input [3:0] Y,
    input yspi,
    output y5i,
    output y4i,
    output y3i,
    output y2i,
    output y1i,
    output ysi
    );

assign ysi = Y[3] | Y[2] & (Y[1] | Y[0]);
assign y5i = Y[2] & ~Y[1] & (Y[0] ^ yspi);
assign y4i = yspi & Y[0] & (Y[2] ^ Y[1]) | ~yspi & Y[2] & ~Y[0];
assign y3i = Y[1] & (Y[0] ^ yspi);
assign y2i = ~yspi & ~Y[0] & (Y[3] | ~Y[2] & Y[1]) | yspi & ~Y[3] & Y[0] & ~(Y[2] ^ Y[1]);
assign y1i = ~(Y[2] | Y[1]) & (Y[0] ^ yspi);

endmodule

module SD_Radix10_Recoder(
    input [15:0] Y_BCD,
    output [5:0] Y4,Y3,Y2,Y1,Y0 // each Yi = [y5i,y4i,y3i,y2i,y1i,ysi]
    );

SD_Radix10 S1 (Y_BCD[3:0],1'b0,Y0[5],Y0[4],Y0[3],Y0[2],Y0[1],Y0[0]);
SD_Radix10 S2 (Y_BCD[7:4],Y0[0],Y1[5],Y1[4],Y1[3],Y1[2],Y1[1],Y1[0]);
SD_Radix10 S3 (Y_BCD[11:8],Y1[0],Y2[5],Y2[4],Y2[3],Y2[2],Y2[1],Y2[0]);
SD_Radix10 S4 (Y_BCD[15:12],Y2[0],Y3[5],Y3[4],Y3[3],Y3[2],Y3[1],Y3[0]);
SD_Radix10 S5 (4'b0000,Y3[0],Y4[5],Y4[4],Y4[3],Y4[2],Y4[1],Y4[0]);

endmodule







