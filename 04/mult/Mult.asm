// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[3], respectively.)

    // Define counter, @i
    @i
    M=0

    // Initialize @R2 as 0
    @R2
    M=0

// Loop @R0 times
(LOOP)
    // Call counter
    @i
    D=M // D = i

    // Check if loop should continue or end
    @R0
    D=M - D // D = @R0 - i
    @END
    D;JLE // If (@R0 - i <= 0) goto END
    
    // Add to @R2
    @R1
    D=M // D = R1
    @R2
    M=M+D // R2 = R2 + R1

    // Increment counter, @i
    @i
    M=M+1 // i = i + 1
    
    @LOOP
    0;JMP

(END)
    @END
    0;JMP
