`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:09:10 10/10/2017 
// Design Name: 
// Module Name:    top_model 
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
module top_model(opcode,a,b,flag,out);
input [15:0] a;
input [15:0] b;
input [3:0] opcode;
output reg [3:0] flag;
output reg [15:0] out;
reg [16:0] temp;
// flag 0000 no flag
//		  1000 carry
//		  0010 zero flag
//		  0100 negative 


always @(*)
	begin
		case(opcode)
			4'b0000 :begin
						assign temp=a+b;
						assign out=temp[15:0];
						if(temp[16]==1) begin flag=4'b1000;end
						else begin flag=4'b0000 ;end
						$display("Addition operation");
			end
			4'b0001:begin
						assign temp=a-b;
						assign out=temp[15:0];
						if(a<b) begin flag=4'b0100;end
						else if(a==b) flag=4'b0010; 
						else assign flag=4'b0000;
						$display("Subtraction operation");
			end
			4'b0010:begin
						assign out=a&b;
						if(out==0) begin flag=4'b0010; end
						$display("AND operation");
						end
			4'b0011:begin
						assign out=a|b;
						if(out==0) begin flag=4'b0010; end
						$display("OR operation");
						end
						
			4'b0100:begin
						assign out=a^b;
						if(out==0) begin flag=4'b0010;  end
						$display("XOR operation");
						end
							
			
			4'b0101:begin
						assign out=a<<1;
						if(out==0) begin flag=4'b0010; end
						$display("Left Shift operation");
						end
						
			4'b0110:begin
						assign out=a>>1;
						if(out==0) begin flag=4'b0010;  end
						$display("Right Shift operation");
						end			
			endcase
		
			4'b0111:begin
						assign out=a;		
			endcase

end			
						
						


endmodule
