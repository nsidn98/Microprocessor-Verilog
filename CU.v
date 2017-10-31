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
module CU(addr,data_bus,opcode,addr1,addr2,addr3,load_immediate,read_write);
input [36:0] addr;
output [15:0] data_bus;
output [3:0] opcode;
output [4:0] addr1;
output [4:0] addr2;
output [4:0]addr3;
output load_immediate;
output read_write;  

assign data_bus=addr[36:21];
assign opcode[3:0]=addr[20:17];
assign load_immediate=addr[16];
assign read_write=addr[15];
assign addr1[4:0]= addr[14:10];
assign addr2[4:0]=addr[9:5];
assign addr3[4:0]=addr[4:0];


endmodule
