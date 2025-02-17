// N = R0
// D = R1
// Q = R2
// R = R3

@dn 
M=1
@nn 
M=1


@R1
D=M 
@DIVBYZERO
D;JEQ
@R0
D=M
@END_N_ZERO
D;JEQ
@DIVIDE
0;JMP

(END_DIVIDE)
    @nn 
    D=M 
    @END_NEGN
    D;JEQ
    @dn
    D=M
    @END_NEGD
    D;JEQ
    @END
    0;JMP


(END)
    @END
    0;JMP

(END_N_ZERO)
    @R2
    M=0
    @R3
    M=0
    @END
    0;JMP

(DIVBYZERO)
    @R2
    M=0
    @32767
    D=A
    @R3
    M=D
    @END
    0;JMP

(NEGD)
    @dn
    M=0
    @R1
    M=-M
    @DIVIDE
    0;JMP

(END_NEGD)
    @R1
    M=-M 
    @R2 
    M=-M 
    @END
    0;JMP

(NEGN)
    @nn
    M=0
    @R0
    M=-M 
    @DIVIDE
    0;JMP

(END_NEGN)
    @R0
    M=-M 
    @R3 
    D=M 
    @RZERO
    D;JEQ 
    @R2
    M=-M
    M=M-1
    @R1
    D=M
    @R3
    M=D-M
    @dn
    D=M
    @END_NEGD
    D;JEQ 
    @END
    0;JMP


(RZERO)
    @R2
    M=-M
    @END
    0;JMP

(DIVIDE)
    @R1
    D=M
    @NEGD 
    D;JLT
    @R0
    D=M
    @NEGN
    D;JLT
    @DIVIDE_UNSIGNED
    0;JMP


(DIVIDE_UNSIGNED)
    @R2 
    M=0 
    @R0 
    D=M 
    @R3 
    M=D 
    @i
    M=D 
    @R1
    D=M 
    @i
    M=M-D 
    D=M
    @LOOP 
    D;JGE 
    @END_DIVIDE
    0;JMP
    (LOOP)
        @R2 
        M=M+1 
        @R1
        D=M 
        @R3 
        M=M-D
        D=M
        @i 
        M=D 
        @R1
        D=M
        @i
        M=M-D 
        D=M
        @LOOP
        D;JGE
        @END_DIVIDE
        0;JMP

