module execute(instruction);
  input [52:0] instruction;
  wire [52:0] reg_instruction;
wire [15:0] reg_data_bus_1;
wire [15:0] reg_data_bus_2;
wire [4:0] reg_addr1;
wire [4:0] reg_addr2;
wire [4:0] reg_addr3;
wire [15:0] reg_out;
wire reg_opcode_enable;
wire reg_load_immediate;
wire reg_read_write;
wire [3:0] reg_opcode;
wire [3:0] reg_flag_register;
wire [15:0] reg_out;
output [15:0] out;
output [3:0] flag;

  CU CU_1(.addr(reg_instruction),.data_bus_1(reg_data_bus_1),.data_bus_2(reg_data_bus_2),.opcode(reg_opcode),.addr1(reg_addr1),.addr2(reg_addr2),.addr3(reg_addr3),.load_immediate(reg_load_immediate),.read_write(reg_read_write));
//a,b,opcode,flag,out,addr1,addr2,addr3
  EU EU_1(.a(reg_data_bus_1),.b(reg_data_bus_2),.opcode(reg_opcode),.flag(reg_flag_register),.out(reg_out),.addr1(reg_addr1),.addr2(reg_addr2),.addr3(reg_addr3));
//input example:0000000000000010-0000000000000001-0000-00000-00001-00010-1-0;
//memory MEMORY_1(.data_in(temp_in_1),.data_out(temp_out_1),.read_write(c),.addr(temp_addr));
//top_model ALU_1(.opcode(opcode),.a(a),.b(b),.flag(flag),.out(out));

  always @(instruction)
    begin
      assign reg_instruction=instruction;
      assign output =reg_out;
      assign flag=reg_flag;
    end  


endmodule
