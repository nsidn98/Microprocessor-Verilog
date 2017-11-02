'timescale 1ns/1ps

module eu(a,b,opcode,number,flag1,out1,addr1,addr2,addr3):
output [7:0] a;
output [7:0] b;
input [3:0] opcode;
input [4:0] addr1;
input [4:0] addr2;
input [4:0] addr3;
input [7:0] number;
output [3:0] flag1;
output [7:0] out1;
reg c;
reg [4:0] address;
reg [7:0] temp1;
reg [7:0] temp2;


	MEMORY m1(.data_in(out1),.data_out(a),.read_write(c),.addr(address))
	always @(opcode)
	begin
		c=0;
		address=addr1;
		temp1=a;
		address=addr2;
		temp2=a;
		c=1;
	end
	
	alu ALU1(.opcode(opcode),.a(temp1),.b(temp2),.flag(flag1),.out(out1))
	// address=addr3;
	//

endmodule		