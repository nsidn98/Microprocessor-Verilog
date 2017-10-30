`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:11:48 10/17/2017 
// Design Name: 
// Module Name:    memory 
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
module memory(data_in,data_out,read_write,addr);
input [7:0] data_in;
input read_write;
input [4:0] addr;
output reg [7:0] data_out;
reg[7:0] reg_array[31:0];
integer i;
//wire index;
//assign index=addr[0]+(addr[1]*2)+(addr[2]*4)+(addr[3]*8)+(addr[4]*16);

always @(read_write)
begin
	if (read_write == 1)
	begin
  		reg_array[addr] <= data_in ;// store 
	end
	else
	begin 
		data_out <= reg_array[addr];//load
	end
end	
endmodule
