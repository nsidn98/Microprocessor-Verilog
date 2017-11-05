file=open('/Users/siddharthnayak/Downloads/cpu/code.txt','r')

lines=[]
for line in file:
	lines.append(line) 
	
	
lines1=[]
lines2=[]	
for i in range(len(lines)):
	lines1.append(lines[i].partition('\n')[0])	#to get rid of '\n'
	lines2.append(lines1[i].partition(';')[0])	#to get rid of ';'
	
file.close()	
	
words=[]
for word in lines2:
	words.append(word.split())	
	
ch=[]
for i in range(len(words)):
	for j in range(len(words[i])):
		ch.append(words[i][j].split(','))

#############################################################
#parsing of the string is over	

def generate_opcode(instr):
	if(instr=='ADD'):
		return '0000'
	elif(instr=='SUB'):
		return '0001'
	elif(instr=='AND'):
		return '0010'
	elif(instr=='OR'):
		return '0011'
	elif(instr=='LSL'):#logical shift left
		return '0100'
	elif(instr=='LSR'):
		return '0101'	
	elif(instr=='XOR'):
		return '0110'		
	elif(instr=='LDI'):
		return '1000'
	elif(instr=='STR'):
		return '1010'	
	elif(instr=='RD'):
		return '1001'				
	
def generate_register_number(register):
	if(register== 'R0'):
		return '000'
	if(register=='R1'):
		return '001'
	if(register=='R2'):
		return '010'
	if(register=='R3'):
		return '011'
	if(register=='R4'):
		return '100'
	if(register=='R5'):
		return '101'
		
def generate_number(number):
    return ''.join(str(1 & int(number) >> i) for i in range(64)[::-1])
    
def give_address(count_addr):
	return ''.join(str(1 & int(number) >> i) for i in range(64)[::-1]),count_addr+8  #it will update the address value    

opcode=[]
op1=[]
op2=[]
op3=[]
load_immediate_data=[]
for i in range(len(ch)):
	if(i%2==0):
		opcode.append(generate_opcode(ch[i]))
	elif i%2==1:
		for j in range(len(ch[i][j])):
			if '#' in ch[i][j]:
				a=ch[i][j].partition('#')[2]
				load_immediate_data.append(int(generate_number(a)))
			elif '#' not in ch[i][j]:
				if len(ch[i])==2:
					if ((opcode!=1010)|(opcode!=1001)):
						op1.append('000')
						op2.append('000')
						op3.append(generate_register_number(ch[i][j]))	
					elif ((opcode==1010)|(opcode==1001)):
						op1.append(generate_register_number(ch[i][j]))
						op2.append('000')
						op3.append('000')
				elif len(ch[i])==3:
					if j==0:
						op1.append(generate_register_number(ch[i][j]))
					elif j==1:
						op2.append(generate_register_number(ch[i][j]))	
					elif j==2:
						op3.append(generate_register_number(ch[i][j]))	
					

