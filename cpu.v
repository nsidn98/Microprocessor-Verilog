`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:37:38 10/10/2017 
// Design Name: 
// Module Name:    cpu 
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
module cpu(a, b, cin, sum, cout);
input [7:0] a;
input [7:0] b;
input cin;
output [7:0]sum;
output cout;
wire[8:0] temp;
assign temp=a+b+cin;
assign sum=temp[7:0];
assign cout=temp[8];

endmodule


