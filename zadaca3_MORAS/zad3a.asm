@0
D=M // Ucitaj broj iz R0 u D
@1
D=D-M // Provjera je li R0 veci od R1
@SWAP
D;JGT 
@CONTINUE
0;JMP

(SWAP)
  @0
  D=M
  @TEMP
  M=D 
  @1
  D=M
  @0
  M=D 
  @TEMP
  D=M
  @1
  M=D

(CONTINUE)

@R2
M=0


(LOOP)
  @R0
  D=M 
  @R2
  M=M+D 

  @R0
  M=M+1 

  @1
  D=M 
  @R0
  D=D-M 
  @END
  D;JLT 

  @LOOP
  0;JMP 

(END)
  @END
  0;JMP 
