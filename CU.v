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
module CU(addr,data_bus,opcode,addr1,addr2,load_immediate);
input [31:0] addr;
output [15:0] data_bus;
output [3:0] opcode;
output [4:0] addr1;
output [4:0] addr2;
output load_immediate;
output read_write;  

assign data_bus=addr[31:16];
assign opcode[3:0]=addr[15:12];
assign load_immediate=addr[11];
assign read_write=addr[10];
assign addr1[4:0]= addr[9:5];
assign addr2[4:0]=addr[4:0];


endmodule
