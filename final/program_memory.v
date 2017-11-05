module program_memory(clk, program_counter,instruction);

input clk ;
input [3:0] program_counter;
output reg [20:0] instruction ;
reg[20:0] program_memory[0:15] ;//16 instructions with 21 bits as instructions
	 

initial
begin
	
	 program_memory[4'b0000] = 21'b1000 000 000 001 00000011; //load 3 in r1
	 program_memory[4'b0001] = 21'b100000000001000000101; //load 5 in r2
	 program_memory[4'b0010] = 21'b000000101001100000000;//add r1 and r2 and store in r3
	 program_memory[4'b0011] = 21'b101001100000000000001;//write to memory
	 program_memory[4'b0100] = 21'b100110000000000000001;//read from memory
	
end
	 
	 
	
 
 always@(posedge clk) 
 begin
 instruction = program_memory[program_counter] ;
 end

endmodule

