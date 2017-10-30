`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:57:46 10/30/2017
// Design Name:   EU
// Module Name:   C:/Users/bond/Desktop/73 & 101/mini project/mini_project/EU_test.v
// Project Name:  mini_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: EU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module EU_test;

	// Inputs
	reg [3:0] opcode;
	reg [4:0] addr1;
	reg [4:0] addr2;
	reg [4:0] addr3;

	// Outputs
	wire [7:0] a;
	wire [7:0] b;
	wire [3:0] flag;
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	EU uut (
		.a(a), 
		.b(b), 
		.opcode(opcode), 
		.flag(flag), 
		.out(out), 
		.addr1(addr1), 
		.addr2(addr2), 
		.addr3(addr3)
	);

	initial begin
		// Initialize Inputs
		opcode = 0;
		addr1 = 0;
		addr2 = 0;
		addr3 = 0;

		// Wait 100 ns for global reset to finish
		#100;
		addr1 = 1;
		addr2 = 2;
		addr3 = 3;

        
		// Add stimulus here

	end
      
endmodule

