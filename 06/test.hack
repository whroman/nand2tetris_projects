 // This file is part of www.nand2tetris.org
 // and the book "The Elements of Computing Systems"
 // by Nisan and Schocken, MIT Press.
 // File name: projects/06/add/Add.asm
 
 // Computes R0 = 2 + 3
 
0000000000000010 @2
C_COMMAND11111 D=A
0000000000000011 @3
C_COMMAND11111 D=D+A
0000000000000000 @0
C_COMMAND11111 M=D
 
