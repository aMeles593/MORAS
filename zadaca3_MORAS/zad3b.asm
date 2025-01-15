@0
D=M-1; 

@i
M=D;
@j
M=D-1;

(vanjska) 
@i
D=M;

@end_vanjska
D;JEQ  

@i
D=M;
@j
M=D-1;
(unutarnja) 
@j
D=M;

@end_unutarnja
D;JLT     

@100
D=A;
@i
A=D+M;
D=M;   
@temp1
M=D;

@100
D=A;
@j
A=D+M;
D=M;  
@temp2
M=D;

@temp1
D=M;
@temp2
D=M-D;   

@skip
D;JLE

@100
D=A;
@i
D=D+M
@temp
M=D;   

@temp2
D=M;
@temp
A=M;
M=D;

@100
D=A;
@j
D=D+M
@temp
M=D;   

@temp1
D=M;
@temp
A=M;
M=D;

(skip)

@j
M=M-1;

@unutarnja
0;JMP

(end_unutarnja)

@i
M=M-1;   // i--

@vanjska
0;JMP

(end_vanjska)

(END)
@END
0;JMP