//ainda a fazer:
//função muktiplicação
//testar
//refatorar





//retorna o produto de B e C, 
//que estão salvos em R0 e R1, respectivamente
//salva o resultado em R2 
//usa R3,R4 e R5 auxiliarmente


//if A -> if B<0 and C<0: 
//logica do if:
//caso B>=0 e C>=0, pula pro else
//caso não seja, segue sequencialmente
//para o corpo do if

//condição 1 do if
@R0
D=M
@ELSE_A
D;JEG

//condição 2 do ifA
@R1
D=M
@ELSE_A
D;JEG

//corpo do if
@R0
D=M
@R3
M=-D

@R1
D=M
@R4
M=-D
@R5
M=0

@END_IF
0;JMP

//else do if A
(ELSE_A)

//if B-> if B>0:
@R0
D=M
@ELSE_B
D;JEG

//corpo do if B:

@R0
D=M
@R3
M=-D

@R1
D=M
@R4
M=D

@R5
M=1

@END_IF
0;JMP
//else do if B:

(ELSE_B)

//if C-> if C>0:
@R1
D=M
@ELSE_C
D;JEG

//corpo do if B:

@R0
D=M
@R3
M=D

@R1
D=M
@R4
M=-D

@R5
M=1

@END_IF
0;JMP
//else do if C:

(ELSE_C)

//corpo do else C
@R0
D=M
@R3
M=D

@R1
D=M
@R4
M=D

@R5
M=0

@END_IF
0;JMP

(END_IF)

@FUNC_PRODUTO
0;JMP

(FUNC_PRODUCT_RETURN)

@R5
D=M
@END_MAIN
D;JGT

@R2
M=-M

(END_MAIN)
@END_MAIN
0;JMP


