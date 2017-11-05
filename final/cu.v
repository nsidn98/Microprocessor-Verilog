module cu(instruction,opcode,op1,op2,op3,load_immediate_data,load_immediate_enable,alu_enable,memory_read_enable,memory_write_enable);
//input clk ;
input [20:0] instruction ;
output reg[3:0] opcode;
output reg[2:0] op1,op2,op3;
output reg[7:0] load_immediate_data ;
output reg load_immediate_enable,alu_enable ,memory_write_enable,memory_read_enable;



always@(*)
begin
assign opcode = instruction[20:17];
assign op1 =instruction[16:14];
assign op2=instruction[13:11];
assign op3 =instruction[10:8];
assign load_immediate_data = instruction[7:0];
end

always@(*)
case(opcode)
//decoding the given instruction
4'b0000: begin alu_enable= 1'b1;load_immediate_enable=1'b0 ;memory_read_enable=1'b0 ;memory_write_enable=1'b0 ; end//alu
4'b0001: begin alu_enable= 1'b1;load_immediate_enable=1'b0 ;memory_read_enable=1'b0 ;memory_write_enable=1'b0 ; end//alu
4'b0010: begin alu_enable= 1'b1;load_immediate_enable=1'b0 ;memory_read_enable=1'b0 ;memory_write_enable=1'b0 ; end//alu
4'b0011: begin alu_enable= 1'b1;load_immediate_enable=1'b0 ;memory_read_enable=1'b0 ;memory_write_enable=1'b0 ; end//alu
4'b0100: begin alu_enable= 1'b1;load_immediate_enable=1'b0 ;memory_read_enable=1'b0 ;memory_write_enable=1'b0 ; end//alu
4'b0101: begin alu_enable= 1'b1;load_immediate_enable=1'b0 ;memory_read_enable=1'b0 ;memory_write_enable=1'b0 ; end//alu
4'b0110: begin alu_enable= 1'b1;load_immediate_enable=1'b0 ;memory_read_enable=1'b0 ;memory_write_enable=1'b0 ; end//alu
4'b1000: begin alu_enable= 1'b0;load_immediate_enable=1'b1 ;memory_read_enable=1'b0 ;memory_write_enable=1'b0 ; end//load_immediate
4'b1001: begin alu_enable= 1'b0;load_immediate_enable=1'b0 ;memory_read_enable=1'b1 ;memory_write_enable=1'b0 ; end//memory_read
4'b1010: begin alu_enable= 1'b0;load_immediate_enable=1'b0 ;memory_read_enable=1'b0 ;memory_write_enable=1'b1 ; end//memory_write

endcase


endmodule
