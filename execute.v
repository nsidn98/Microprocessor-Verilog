module execute(instruction);
input [31:0] instruction;
wire [31:0] reg_instruction;
wire [15:0] reg_data_bus;
wire [4:0] reg_addr1;
wire [4:0] reg_addr2;
wire [4:0] reg_addr3;
wire [15:0] reg_out;
wire reg_read;
wire reg_write;
wire reg_opcode_enable;
wire [3:0] reg_opcode;
wire [3:0] reg_flag_register;
reg opcode_enable;
integer count=0;

CU CU_1(.addr(reg_instruction),.data_bus(reg_data_bus),.opcode(reg_opcode),.addr1(reg_addr1),.read(reg_read),.write(reg_write),.opcode_enable(reg_opcode_enable),.flag_register(reg_flag_register));

EU EU_1();

memory MEMORY_1(.data_in(temp_in_1),.data_out(temp_out_1),.read_write(c),.addr(temp_addr));
top_model ALU_1(.opcode(opcode),.a(a),.b(b),.flag(flag),.out(out));


always @(posedge opcode_enable)
begin

end

endmodule
