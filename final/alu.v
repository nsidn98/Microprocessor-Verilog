module alu(alu_enable,a,b,opcode,out,flag_out);
	 
//input clk ;	 
input alu_enable;
input [7:0]a;
input [7:0]b;
input [3:0]opcode;
output reg[7:0]out;
output reg[3:0]flag_out;
reg [8:0] temp;

always@(*)
if(alu_enable==1)
	begin
		flag_out[3]=1'b0 ;	//initialize opcode=0xx0
		flag_out[0]=1'b0 ;
		temp ={a,1'b0};
	case(opcode)
		4'b0000: {flag_out[3],out}=a+b;
		4'b0001: {flag_out[3],out}=a-b;
		4'b0010:  out= a&b ;
		4'b0011:  out= a|b ;
		4'b0100:  {flag_out[0],out}= a<<b;
		4'b0101:  {out,flag_out[0]}= temp>>b ; 
		4'b0110: out=a^b;			
	endcase

	flag_out[1] = (out==7'b0)? 1'b1 :1'b0 ;//if we get a zero :->(flag)
 	flag_out[2] = out[7];
end

endmodule
