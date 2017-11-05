module memory(clk,memory_addr,memory_read_enable,memory_write_enable,memory_read_data,memory_write_data ,memory_result);


input clk ;
input memory_write_enable,memory_read_enable ;
input [7:0] memory_addr ,memory_write_data ; 
output reg [7:0] memory_read_data ;
output reg [7:0] memory_result;	 
reg[7:0] memory[0:255] ;	//declare 8 registers with 256 bits 
integer i;

initial begin  	//initialize memory contents to 0
  for(i=0;i<256;i=i+1)
   memory[i] <= 8'b00000000;
 end	 
	 
always @(posedge clk) 
  	begin
  		if (memory_write_enable) memory[memory_addr] = memory_write_data;
	end
	

always@(posedge clk)
begin
	memory_read_data = (memory_read_enable==1'b1) ? memory[memory_addr]:8'bxxxxxxxx ; 
	memory_result = (memory_write_enable==1'b1 ) ? memory[memory_addr]: 8'bxxxxxxxx;
end	


endmodule
