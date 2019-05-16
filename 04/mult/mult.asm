// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.


@R2
M=0 // initialize R2 to zero

@i //initialize i to zero
M=0

(LOOP)
@i //counter i at R16
D=M //D=count
@R1
D=M-D //save diff b/w i and R1
@END
D;JEQ // jump to end if i=R1

@R0
D=M //set D to R0
@R2
M=M+D // add R0 to R2
@i
M=M+1 // increment i

@LOOP // go back to beginning of loop
0; JMP

(END)
@END
0;JMP
