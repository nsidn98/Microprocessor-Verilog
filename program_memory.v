module program_memory(addr,program_addr_array,clk);

input clk
input [319:0] program_addr_array;
output addr4;

integer program_counter;
reg [31:0] temp_instruction1;
reg [31:0] temp_instruction2;
integer start_addr;
integer end_addr;
wire [3:0] opcode;
controlunit cu1(.addr(temp_instruction2),.opcode(opcode));

always @(posedge clk)
begin
	for(program_counter=0;program_counter<10;program_counter=program_counter+1)
	begin
		start_addr=(program_counter)*32;
		end_addr=(program_counter+1)*32-1;
		temp_instruction1=program_addr_array[start_addr:end_addr];
		if(temp_instruction1[31:28]='b1111)		//check for jump opcode
		begin
		//fill the code here for jump	
		end
		else 
		begin
			temp_instruction2=program_addr_array[start_addr:end_addr];
			if(temp_instruction==0)
			begin
				program_counter=9;
			end
		end	
	end
end

endmodule			