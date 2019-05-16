// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.


(LOOP)
@KBD
D=M         //get KBD value

@WHITE
D; JEQ      // if KBD=0 set color to 0, else -1
@BLACK
0; JMP

(WHITE)
@color
M=0
@COLORING
0;JMP

(BLACK)
@color
M=-1

(COLORING)
@SCREEN
D=A         //save screen reg#

@regCount   //which register to access
M=D         // set count to @SCREEN

@8191
D=A         //number of registers

@regCount
M=M+D       //add number of registers to regCount

(COUNT)
@color
D=M         //get color
@regCount   // set address to regcount
A=M


M=D        //set register to @color

@regCount
M=M-1       //subtract 1 from regcount

D=M
@SCREEN
D=D-A       //how many more registers to go

@LOOP
D;JLT      // start all over if went through all the registers

@COUNT      // otherwise, continue count loop
0;JMP