// define B (Multiplier) as R0 (RAM[0])
// define C (Multiplicand) as R1 (RAM[1])
// define A (Product) as R2 (RAM[2]), as in A = B * C

// main ********
// if B = 0 or C = 0 then
    @R0
    D=M
    @CHECK_ZERO
    D;JEQ

    @R1
    D=M
    @CHECK_ZERO
    D;JEQ

    // A := 0
    @R2
    M=0
    @END
    0;JMP

(CHECK_ZERO)
    // if B < 0 and C < 0 then
    @R0
    D=M
    @NEGATIVE_CHECK
    D;JLT

    @R1
    D=M
    @NEGATIVE_CHECK
    D;JLT

    // B := -B; C := -C
    @R0
    M=-M
    @R1
    M=-M

    // multiply()
    @MULTIPLY
    0;JMP

(NEGATIVE_CHECK)
    // else
    // if B < 0 then
    @R0
    D=M
    @NEGATIVE_B_CHECK
    D;JLT

    // if C < 0 then
    @R1
    D=M
    @NEGATIVE_C_CHECK
    D;JLT

    // multiply()
    @MULTIPLY
    0;JMP

(NEGATIVE_B_CHECK)
    // B := -B
    @R0
    M=-M

    // multiply()
    @MULTIPLY
    0;JMP

(NEGATIVE_C_CHECK)
    // C := -C
    @R1
    M=-M

    // multiply()
    @MULTIPLY
    0;JMP

(MULTIPLY)
    // function multiply():
    // i := B - 1; A := C
    @R0
    D=M
    @1
    D=D-A
    @i
    M=D
    @R1
    D=M
    @R2
    M=D

    // while i > 0 do
    (WHILE)
        @i
        D=M
        @ENDWHILE
        D;JLE

        // i := i - 1; A := A + C
        @i
        M=M-1
        @R2
        D=M
        @R1
        M=D+M

        @WHILE
        0;JMP

    (ENDWHILE)

    @END
    0;JMP

(END)