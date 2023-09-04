`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2018 23:56:06
// Design Name: 
// Module Name: CSA_Block
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


module CSA_4221(
    input [3:0] A,
    input [3:0] B,
    input [3:0] C,
    output [3:0] S,
    output [3:0] Co
    );
       
Full_Adder FA0 (A[0],B[0],C[0],S[0],Co[0]);
Full_Adder FA1 (A[1],B[1],C[1],S[1],Co[1]);
Full_Adder FA2 (A[2],B[2],C[2],S[2],Co[2]);
Full_Adder FA3 (A[3],B[3],C[3],S[3],Co[3]);

endmodule
