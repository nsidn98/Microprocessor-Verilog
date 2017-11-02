`timescale 1ns / 1ps


module controlunit(instruction,number,opcode,addr1,addr2,addr3,flag_CU,output_CU);

input [31:0]instruction;
output [3:0] opcode;
output [4:0] addr1;
output [4:0] addr2;
output [4:0] addr3;
output [7:0] number;
output [7:0] output_CU;
output [7:0] flag_CU;


//break the instruction

assign opcode[3:0] = instruction[31:28];
assign number[7:0] = instruction[22:15];
assign addr3[4:0] = instruction[14:10];
assign addr2[4:0] = instruction[9:5];
assign addr1[4:0] = instruction[4:0];

eu EU(.opcode(opcode),.number(number),.flag1(flag_CU),.out1(outpu_CU),.addr1(addr1),.addr2(addr2),.addr3(addr3));

endmodule