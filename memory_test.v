`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:36:10 10/24/2017
// Design Name:   memory
// Module Name:   C:/Users/bond/Desktop/73 & 101/mini project/mini_project/memory_test.v
// Project Name:  mini_project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module memory_test;

	// Inputs
	reg [7:0] data_in;
	reg read_write;
	reg [4:0] addr;

	// Outputs
	wire [7:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	memory uut (
		.data_in(data_in), 
		.data_out(data_out), 
		.read_write(read_write), 
		.addr(addr)
	);

	initial begin
		// Initialize Inputs
		data_in = 0;
		read_write = 0;
		addr = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		data_in = 6;
		read_write = 1;
		addr =10;

		#100;
		data_in = 6;
		read_write = 0;
		addr =10;
	end
      
endmodule

