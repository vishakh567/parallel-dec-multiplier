`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2018 15:54:35
// Design Name: 
// Module Name: Product generator
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

module D4221to8421_Recoder(
    input [3:0] X_4221,
    output [3:0] X_BCD
    );

assign X_BCD[0] = X_4221[0] & (~X_4221[2] | (X_4221[3] & X_4221[1]));
assign X_BCD[1] = ~X_4221[2] & X_4221[1];
assign X_BCD[2] = X_4221[3] & ~X_4221[2];
assign X_BCD[3] = X_4221[3] & X_4221[2] & X_4221[1];

endmodule

module D4221to5421_Recoder(
    input [3:0] X_4221,
    output [3:0] X_5421
    );

assign X_5421[0] = (~X_4221[3] & ~X_4221[2] & X_4221[0]) | (X_4221[3] & X_4221[1] & ~X_4221[0]);
assign X_5421[1] = X_4221[3] & X_4221[1] & (X_4221[2] ^ X_4221[0]);
assign X_5421[2] = X_4221[3] & ((X_4221[2] & X_4221[1] & X_4221[0])|(~X_4221[2] & ~X_4221[1] & ~X_4221[0]));
assign X_5421[3] = X_4221[3] & (X_4221[1]|(~X_4221[2] & X_4221[0]));

endmodule

module FinalProduct_BCD(
    input [43:0] S,
    input [43:0] H,
    output [31:0] P
    );

wire [43:0] W, IntS, IntH, Hx2;
wire [10:1] cy;
D4221to8421_Recoder Recoder(S[3:0],W[3:0]);
Four_bit_Adder Adder(W[3:0],4'b0110,1'b0,IntS[3:0],cy[1]);
D4221to5421_Recoder Recoder2(H[3:0],IntH[3:0]);

genvar i;
generate
    for (i = 1; i <= 7; i = i+1)
        begin
        D4221to8421_Recoder Recoder1(S[4*i+3:4*i],W[4*i+3:4*i]);
        Four_bit_Adder Adder(W[4*i+3:4*i],4'b0110,cy[i],IntS[4*i+3:4*i],cy[i+1]);
        D4221to5421_Recoder Recoder2(H[4*i+3:4*i],IntH[4*i+3:4*i]);
        end
endgenerate

assign Hx2 = IntH << 1;
assign P = IntS[31:0] + IntH[31:0];

endmodule
