//Trabalho feito em conjunto pelos alunos
//Lucas Humberto Jesus de Lima 12011ECP011
//Leonardo Meirelles Vecchi 12011ECP002
//Bruno Pavan Ciriani 12011ECP012

@R1
D=M
@IF
D;JEQ

@R0
D=M
@IF0
D;JEQ

@END
D=A
@retorno_novo
M=D

@DIVIDE
0;JMP

(END)
@END
0;JMP

(IF)
@DIVISION_BY_ZERO
0;JMP

(IF0)
@R2
M=0
@R3
M=0
@END
0;JMP

(DIVIDE)

@R1
D=M
@IF1
D;JLT


@R0
D=M
@IF2
D;JLT
@DIVIDE_UNSIGNED
0;JMP

(IF1)
@R1
M=-M

@retorno_novo
D=M
@retorno_antigo
M=D
@RETURN0
D=A 
@retorno_novo
M=D
@DIVIDE
0;JMP
(RETURN0)

@R1
M=-M
@R2
M=-M
@END
0;JMP


(IF2)
@R0
M=-M

@retorno_novo
D=M
@retorno_antigo
M=D
@RETURN1
D=A 
@retorno_novo
M=D
@DIVIDE  
0;JMP
(RETURN1)

@R0
M=-M
@R3
D=M
@IF3
D;JEQ

@R2
M=-M
M=M-1

@R1
D=M
@R3
M=D-M

@retorno_antigo
A=M
0;JMP

(IF3)
@R2
M=-M
@retorno_antigo
A=M
0;JMP

(DIVIDE_UNSIGNED)
@R2
M=0

@R0
D=M
@R3
M=D

(WHILE)
@R1
D=M
@R3
D=M-D
@WHILE_BODY
D;JGE

@retorno_novo 
A=M
0;JMP

(WHILE_BODY)
@R2
M=M+1

@R1
D=M
@R3
M=M-D

@WHILE
0;JMP

(DIVISION_BY_ZERO)
@R2
M=0

@32767
D=A
@R3
M=D

@END
0;JMP
