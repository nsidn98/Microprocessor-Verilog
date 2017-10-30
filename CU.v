`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:30:48 10/30/2017 
// Design Name: 
// Module Name:    CU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CU(addr,number,opcode,addr1,addr2,addr3);
input [31:0] addr;
output [3:0] opcode;
output [4:0] addr1;
output [4:0] addr2;
output [4:0] addr3;
output [7:0] number;

assign opcode[3:0]=addr[31:28];
assign number[7:0]=addr[22:15];
assign addr3[4:0]= addr[14:10];
assign addr2[4:0]=addr[9:5];
assign addr1[4:0]=addr[4:0];


endmodule
