`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:39:28 10/30/2017
// Design Name:   CU
// Module Name:   C:/Users/bond/Desktop/73 & 101/mini project/mini_project/CU_test.v
// Project Name:  mini_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CU_test;

	// Inputs
	reg [31:0] addr;

	// Outputs
	wire [7:0] number;
	wire [3:0] opcode;
	wire [4:0] addr1;
	wire [4:0] addr2;
	wire [4:0] addr3;

	// Instantiate the Unit Under Test (UUT)
	CU uut (
		.addr(addr), 
		.number(number), 
		.opcode(opcode), 
		.addr1(addr1), 
		.addr2(addr2), 
		.addr3(addr3)
	);

	initial begin
		// Initialize Inputs
		addr = 0;

		// Wait 100 ns for global reset to finish
		#100;
        addr='b10101111101000001010110101111010;
		// Add stimulus here

	end
      
endmodule

