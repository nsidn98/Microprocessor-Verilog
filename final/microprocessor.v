module microprocessor(clk,reg_0,reg_1,reg_2,reg_3,reg_4,reg_5,flag,mem_test,ram_data,m_rd_en,m_wr_en,prog_count,instruction);

input clk; 

wire [20:0]instruction_wire ;
wire [3:0] opcode_wire;
wire [2:0] op1,op2,op3;
wire [7:0] li_data;
wire li_en;
wire alu_en;
wire [7:0]rd_data1;
wire [7:0]rd_data2;
wire [7:0]alu_outdata;
wire [3:0]flags;

wire mem_rd_en;
output reg m_rd_en; //remove
output reg m_wr_en; //remove
wire mem_wr_en;
wire [7:0] mem_out_data;
wire [7:0] m_test ;
output reg[7:0]mem_test ; //checks whether data was written to mem

output reg  [3:0] prog_count ;
wire [3:0] pc ;//program_counter
reg  [7:0] reg_array[0:5]; //reg_bank


output reg[3:0] flag ;
output reg[7:0] reg_0;
output reg[7:0] reg_1;
output reg[7:0] reg_2;
output reg[7:0] reg_3;
output reg[7:0] reg_4;
output reg[7:0] reg_5; 
output reg[20:0] instruction ;
output reg[7:0] ram_data;  //checks if data was read from mem

initial
begin 
prog_count = 4'b0000 ;
end


assign pc =prog_count ;

program_memory  fetch_inst (
								.clk(clk),
								.program_counter(pc),
								.instruction(instruction_wire)	
							);

always@(*)
begin
instruction=instruction_wire ;
end

	 
cu signal_gen (
				.instruction(instruction_wire),
				.opcode(opcode_wire),
				.op1(op1),
				.op2(op2),
				.op3(op3),
				.load_immediate_data(li_data),
				.load_immediate_enable(li_en),
				.alu_enable(alu_en),
				.memory_read_enable(mem_rd_en),
				.memory_write_enable(mem_wr_en)
			);
					
					
always@(posedge clk)
begin
if(li_en==1) reg_array[op3] = li_data ;	//load data in R[op3]
end // 


assign rd_data1 =reg_array[op1];
assign rd_data2 =reg_array[op2];


alu ALU(
			
			.alu_enable(alu_en),
			.a(rd_data1),
			.b(rd_data2),
			.opcode(opcode_wire),
			.out(alu_outdata),
			.flag_out(flags)
			);			
			
			
always@(posedge clk )
	begin 
		if(alu_en==1)
		begin 
			reg_array[op3] = alu_outdata;
			flag = flags;
		end	
	end	
		
		



memory ram(  
				.clk(clk),
				.memory_addr(li_data),
				.memory_read_enable(mem_rd_en),
				.memory_write_enable(mem_wr_en),
				.mem_read_data(mem_out_data),
				.mem_write_data(rd_data1),
				.memory_result(m_test)
				);
				
				
always@(* )
	begin 
		if(mem_rd_en==1)
		begin 
			reg_array[op1] =mem_out_data ;
		end
	end

		
		

always@(*)
//get the outputs to show n the waveform
begin		
assign reg_0 =reg_array[3'b000] ;	
assign reg_1 =reg_array[3'b001] ;	
assign reg_2 =reg_array[3'b010] ;	
assign reg_3 =reg_array[3'b011] ;	
assign reg_4 =reg_array[3'b100] ;	
assign reg_5 =reg_array[3'b101] ;	
assign m_rd_en=mem_rd_en;
assign m_wr_en=mem_wr_en;
 
end


always@(*)
begin 
  ram_data = mem_out_data;
  mem_test = m_test;
end

always@(posedge clk)
begin 
prog_count = prog_count + 4'b0001 ;//increase the counter
end




endmodule
