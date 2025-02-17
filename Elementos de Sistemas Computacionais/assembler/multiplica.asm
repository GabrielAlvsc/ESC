// B = R0
// C = R1
// A = R2

@R0
D=M 
// B = 0
@NULL
D;JEQ
@R1
D=M
// B = 0
@NULL
D;JEQ
// B = 0 or C = 0 => A = 0

@bn
M=1
@cn
M=1
@n
M=1

@R0
D=M
@NEGB
D;JLT
@R1
D=M
@NEGC
D;JLT
@MULTIPLY
0;JMP


(NEGB)
    @bn
    M=0
    @R0
    M=-M
    @R1
    D=M
    @NEGC
    D;JLT
    @MULTIPLY
    0;JMP

(NEGC)
    @cn
    M=0
    @R1
    M=-M
    @bn
    D=M
    @NEG
    D;JEQ
    @MULTIPLY
    0;JMP

(NEG)
    @n
    M=0
    @MULTIPLY
    0;JMP

(END_NEG)
    @R0
    M=-M 
    @R1
    M=-M 
    @END
    0;JMP

(END_NEGB)
    @R0
    M=-M 
    @R2
    M=-M 
    @END
    0;JMP

(END_NEGC)
    @R1
    M=-M 
    @R2
    M=-M 
    @END
    0;JMP

(NULL)
    @R2
    M=0
    @END
    0;JMP

(END)
    @END
    0;JMP

(MULTIPLY) // SE B = 3 E C = 4

    @R2
    M=0 //A = 0
    @R0
    D=M //D = 3
    @i
    M=D //i = 3

    (LOOP)

        @R1
        D=M //D = 4
        @R2
        M=D+M //A = A + C *1 A = 0 + 4 = 4 *2 A = 4 + 4 = 8 *3 A = 8 + 4 = 12
        @i
        M=M-1 //i = i - 1 *1 i = 3 - 1 = 2 *2 i = 2 - 1 = 1 *3 i = 1 - 1 = 0
        D=M //D = i
        @LOOP
        D;JGT // D(i) > 0 goto LOOP
        @END_MULTIPLY //D = 0
        0;JMP

(END_MULTIPLY)
    @n 
    D=M
    @END_NEG
    D;JEQ
    @bn
    D=M 
    @END_NEGB
    D;JEQ
    @cn
    D=M 
    @END_NEGC
    D;JEQ
    @END
    D;JMP



