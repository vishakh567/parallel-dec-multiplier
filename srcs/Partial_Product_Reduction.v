`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.04.2018 01:07:29
// Design Name: 
// Module Name: Partial_Product_Reduction
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

module Adder_Tree(
    input [3:0] D0,D1,D2,D3,D4,
    output [3:0] S,H,
    input wprev1,wprev2,wprev3,wprev4,
    output wnext1,wnext2,wnext3,wnext4
    );
wire [3:0] ws1,wc1,wc2,wc3,ws2,wc4,wc5,wc6,wc7,wc8,wc9,wc10;
CSA_4221 C1(D0,D1,D2,ws1,wc1);
BCD4221to5211s M1(wc1,wc2);
L1shifter_4221 X2_1(wprev1,wc2,wc3,wnext1);
BCD4221to5211s M2(wc3,wc4);
L1shifter_4221 X2_2(wprev2,wc4,wc5,wnext2);

CSA_4221 C2(ws1,D3,D4,ws2,wc6);
BCD4221to5211s M3(wc6,wc7);
L1shifter_4221 X2_3(wprev3,wc7,wc8,wnext3);
BCD4221to5211s M4(wc8,wc9);
L1shifter_4221 X2_4(wprev4,wc9,wc10,wnext4);

CSA_4221 C3(wc5,wc10,ws2,S,H);

endmodule

module Partial_Product_Reduction(
    input [43:0] PP0,PP1,PP2,PP3,PP4,
    output [43:0] S,H
    );

wire [10:1]cy1,cy2,cy3,cy4;
Adder_Tree A(PP0[3:0],PP1[3:0],PP2[3:0],PP3[3:0],PP4[3:0],
             S[3:0],H[3:0],1'b0,1'b0,1'b0,1'b0,cy1[1],cy2[1],cy3[1],cy4[1]);
genvar i;
generate
    for (i = 1; i <= 10; i = i+1)
        begin
            Adder_Tree A(PP0[4*i+3:4*i],PP1[4*i+3:4*i],PP2[4*i+3:4*i],PP3[4*i+3:4*i],
                         PP4[4*i+3:4*i],S[4*i+3:4*i],H[4*i+3:4*i],
                         cy1[i],cy2[i],cy2[i],cy3[i],cy1[i+1],cy2[i+1],cy3[i+1],cy4[i+1]);
        end
endgenerate
endmodule
