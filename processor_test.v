module processor_test:

//inputs
reg [31:0] instruction;
wire [7:0] number;
wire [3:0] opcode;
wire [4:0] addr1;
wire [4:0] addr2;
wire [4:0] addr3;
wire [3:0] flag_CU;
wire [7:0] output_CU;

//Instantiate the unit
controlunit test(.instruction(instruction),.number(number),.opcode(opcode),.addr1(addr1),.addr2(addr2),.addr3(addr3),.flag_CU(flag_CU),.output_CU(output_CU));

initial begin
	//initializing the inputs
	instruction=0;

	//wait for global reset to finish
	#100

	//add stimulus here

end

endmodule
