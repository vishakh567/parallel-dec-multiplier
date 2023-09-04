`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.02.2018 22:05:14
// Design Name: 
// Module Name: QT_BCD_Adder
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

module Full_Adder(
    input A,B,Cin,
    output S,Cout
    );
assign S = A ^ B ^ Cin;
assign Cout = (A & B) | (B & Cin) | (A & Cin);

endmodule
    
module Four_bit_Adder(
    input [3:0] X1,
    input [3:0] X2,
    input Cin,
    output [3:0] Sum,
    output Cout
    );
wire [3:0] w;   
Full_Adder FA0(X1[0],X2[0],Cin,Sum[0],w[0]);
Full_Adder FA1(X1[1],X2[1],w[0],Sum[1],w[1]);
Full_Adder FA2(X1[2],X2[2],w[1],Sum[2],w[2]);
Full_Adder FA3(X1[3],X2[3],w[2],Sum[3],Cout);

endmodule

module QT_BCD_Adder(
    input [3:0] X1,
    input [3:0] X2,
    input Cin,
    output [3:0] Sum,
    output Carry
    );
wire cout1,cout2,and1,and2,carryout;
wire [3:0]correction,SumI;

Four_bit_Adder Adder1(X1,X2,Cin,SumI,cout1);
and A1(and1,SumI[3],SumI[2]);
and A2(and2,SumI[3],SumI[1]);
or O1(carryout,cout1,and1,and2);

assign correction = {1'b0,carryout,carryout,1'b0};
Four_bit_Adder Adder2(SumI,correction,1'b0,Sum,cout2);
assign Carry = carryout;

endmodule

module Five_digit_BCD_Adder(
    input [19:0] X1, X2,
    output [19:0] sum
    );
wire [4:0] w;

QT_BCD_Adder B0(X1[3:0],X2[3:0],1'b0,sum[3:0],w[0]);
QT_BCD_Adder B1(X1[7:4],X2[7:4],w[0],sum[7:4],w[1]);
QT_BCD_Adder B2(X1[11:8],X2[11:8],w[1],sum[11:8],w[2]);
QT_BCD_Adder B3(X1[15:12],X2[15:12],w[2],sum[15:12],w[3]);
QT_BCD_Adder B4(X1[19:16],X2[19:16],w[3],sum[19:16],w[4]);
    
endmodule