`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.01.2018 21:27:03
// Design Name: 
// Module Name: BCD2Radix10_TB
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


module BCD2Radix10_TB(
    );
    
reg [3:0] Yi;
reg yspi;
wire y5i,y4i,y3i,y2i,y1i,ysi;

BCD2SDRadix10 UUT(.Yi(Yi),.yspi(yspi),.y5i(y5i),
              .y4i(y4i),.y3i(y3i),.y2i(y2i),
              .y1i(y1i),.ysi(ysi));

initial
    begin
    
    Yi = 4'b0000; yspi = 0;
    #10
    Yi = 4'b0001; yspi = 0;
    #10
    Yi = 4'b0010; yspi = 0;
    #10
    Yi = 4'b0011; yspi = 0;
    #10
    Yi = 4'b0100; yspi = 0;
    #10
    Yi = 4'b0101; yspi = 0;
    #10
    Yi = 4'b0110; yspi = 0;
    #10
    Yi = 4'b0111; yspi = 0;
    #10
    Yi = 4'b1000; yspi = 0;
    #10
    Yi = 4'b1001; yspi = 0;
    #10
    Yi = 4'b0000; yspi = 1;
    #10
    Yi = 4'b0001; yspi = 1;
    #10
    Yi = 4'b0010; yspi = 1;
    #10
    Yi = 4'b0011; yspi = 1;
    #10
    Yi = 4'b0100; yspi = 1;
    #10
    Yi = 4'b0101; yspi = 1;
    #10
    Yi = 4'b0110; yspi = 1;
    #10
    Yi = 4'b0111; yspi = 1;
    #10
    Yi = 4'b1000; yspi = 1;
    #10
    Yi = 4'b1001; yspi = 1;
    
    end    
endmodule
