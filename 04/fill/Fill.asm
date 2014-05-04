// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// -1 produces a binary number that will fill up all 16 bits of a word

    @SCREEN
    D = A
    @pointer
    M = D

    @8191
    D = A
    @endAt
    M = D
    @pointer
    D = M
    @endAt
    M = M + D

(RESET)
    @SCREEN
    D = A
    @pointer
    M = D

    @KBD
    D = M
    @LISTENKBD
    D;JEQ
    @LOOP
    D;JNE

(LISTENKBD)
    @pointer
    A = M
    M = 0
    D = A

    @pointer
    M = M + 1

    @endAt
    D = M - D
    @RESET
    D;JLE

    @KBD
    D = M
    @LISTENKBD
    D;JEQ
    @LOOP
    D;JNE


(LOOP)
    @pointer
    A = M
    M = -1
    D = A

    @pointer
    M = M + 1

    @endAt
    D = M - D
    @RESET
    D;JLE   

    @KBD
    D = M
    @LISTENKBD
    D;JEQ
    @LOOP
    D;JNE