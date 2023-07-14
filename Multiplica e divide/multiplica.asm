//Trabalho feito em conjunto pelos alunos
//Lucas Humberto Jesus de Lima 12011ECP011
//Leonardo Meirelles Vecchi 12011ECP002
//Bruno Pavan Ciriani 12011ECP012

@R0
D=M
@IFA
D;JEQ 

@R1
D=M
@IFA
D;JEQ 

//inicio do primeiro else
@R0
D=M
@ANDB
D;JLT

@ELSEB
0;JMP

(ANDB)
@R1
D=M
@IFB
D;JLT

(ELSEB)

//inicio do segundo else
@R0
D=M
@IFC
D;JLT

//inicio do terceiro else
@R1
D=M
@IFD
D;JLT

//inicio do quarto else
@MULTIPLICA
0;JMP
//fim do quarto else

@ENDIFD
0;JMP

(IFD)

//inicio do quarto if
@R1
M=-M
//sets r6 = 2
@2
D=A
@R6
M=D
//@MULTIPLICA
0;JMP
(IFVERIFYC)
@R1
M=-M
@R2
M=-M
//reset R6
@R6
M=0
//fim do quarto if

(ENDIFD)
//fim do terceiro else

@ENDIFC
0;JMP

(IFC)

//inicio do terceiro if
@R0
M=-M
//sets r6 = 3
@3
D=A
@R6
M=D
@MULTIPLICA
0;JMP
(IFVERIFYB)
@R0
M=-M
@R2
M=-M
//reset R6
@R6
M=0
//fim do terceiro if

(ENDIFC)
//fim do segundo else

@ENDIFB
0;JMP

(IFB)

//inicio do segundo if
@R0
M=-M
@R1
M=-M
//sets r6 = 1
@R6
M=1
@MULTIPLICA
0;JMP
(IFVERIFYA)
@R0
M=-M
@R1
M=-M
//reset R6
@R6
M=0
//fim do segundo if

(ENDIFB)
//fim do primeiro else

@ENDIFA
0;JMP

(IFA)

//inicio primeiro if
@R2
M=0
//fim do primeiro if

(ENDIFA)

(END_MAIN)
@END_MAIN
0;JMP

(MULTIPLICA)

@R5
M=1

@R0
D=M
@i
M=D
@R2
M=0

(WHILE)

@R5
M=M+1

@i
D=M
@WHILE_BODY
D;JGT

@ENDWHILE
0;JMP

(WHILE_BODY)

@i
M=M-1
@R1
D=M
@R2
M=D+M

@WHILE
0;JMP

(ENDWHILE)

//verify return b
@3
D=A
@R7
M=D

//if

@R6
D=M
@R7
D=D-M
@IFVERIFYB
D;JEQ

@ENDIFVERIFYB
0;JMP
(ENDIFVERIFYB)

//verify return c
@2
D=A
@R7
M=D

//if

@R6
D=M
@R7
D=D-M
@IFVERIFYC
D;JEQ

@ENDIFVERIFYC
0;JMP
(ENDIFVERIFYC)

//verify return c
@R7
M=1

//if

@R6
D=M
@R7
D=D-M
@IFVERIFYA
D;JEQ

@ENDIFVERIFYA
0;JMP
(ENDIFVERIFYA)

@END_MAIN
0;JMP