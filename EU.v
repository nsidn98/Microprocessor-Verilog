`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:23:03 10/17/2017 
// Design Name: 
// Module Name:    EU 
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
module EU(a,b,opcode,flag,out,addr1,addr2,addr3);
output reg[7:0] a;
output reg[7:0] b;
input [3:0] opcode;
input [3:0] addr1;
input [3:0] addr2;
input [3:0] addr3;
output [3:0] flag;
output [7:0] out;
wire c;
wire d=0;
wire [7:0]temp_in_1;//to pass in the modules we need temporary registers
wire [7:0] temp_out_1;
wire [4:0] temp_addr;
memory MEMORY(.data_in(temp_in_1),.data_out(temp_out_1),.read_write(c),.addr(temp_addr));
top_model ALU(.opcode(opcode),.a(a),.b(b),.flag(flag),.out(out));

			/*memory(.data_in(temp),.data_out(a),.read_write(c),.addr(addr1));
			memory(.data_in(temp),.data_out(b),.read_write(c),.addr(addr2));
			memory(.data_in(out),.data_out(temp),.read_write(d),.addr(addr3));*/
			assign temp_in_1=d;
			assign c=0;
			assign temp_addr=addr1;
			assign temp_out_1 =a;
			
			assign temp_in_1=d;
			assign c=0;
			assign temp_addr=addr2;
			assign temp_out_1 =b;
			
			assign temp_in_1=out;
			assign c=1;
			assign temp_addr=addr3;
			assign temp_out_1 =d;
			
			

endmodule
