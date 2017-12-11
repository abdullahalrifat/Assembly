.MODEL SMALL
.STACK 100H

.DATA   
 
  VALUE DB 'HELLO$'
  STAR DB '*$'
  SPACE DB ' $'    
 LN DB 0Ah, 0Dh, '$' 
.CODE

 MAIN PROC 
    
    MOV AX, @DATA
    MOV DS,AX
    
    
   INPUT: 
    MOV AH,1
    INT 21H
    MOV CL,AL 
    SUB CL,48
    
    MOV BL,1
    MOV BH,CL
    MOV CH,1
    
    ;MOV AH,1
    ;INT 21H
    ;MOV CL,AL
    ;SUB CL,48
    
    ;IF(X<Y) 
    COMPARE:
        CMP BL,CL
        JLE PRINT
     
        JMP SECOND
    COMPAREN:
        CMP BH,BL
        JGE PRINTN
        CMP BH,CL
        INC BL
        MOV BH,CL
        JMP COMPARE 
    PRINTN:
        
        LEA DX,STAR
        MOV AH,9 
        ;MOV DL,BH
        ;ADD DL,48
        ;MOV AH,2  
        INT 21H
        DEC BH
        JMP COMPAREN
    COMPARESPACE:
        CMP CH,BL
        JL PRINTSPACE
        MOV CH,1
        JMP COMPAREN
    PRINTSPACE:
        LEA DX,SPACE
        MOV AH,9 
        ;MOV DL,BH
        ;ADD DL,48
        ;MOV AH,2  
        INT 21H
        INC CH
        JMP COMPARESPACE  
    PRINT:
        LEA DX,LN
        MOV AH,9  
        INT 21H
        
        ;LEA DX,VALUE
        ;MOV AH,9 
        ;MOV DL,BL
       ; ADD DL,48
        ;MOV AH,2  
        ;INT 21H    
        
        ;LEA DX,LN
        ;MOV AH,9  
        ;INT 21H 
        JMP COMPARESPACE
        JMP COMPAREN
        JMP COMPARE
     SECOND:
         MOV BL,2
         MOV BH,1
         MOV CH,1
         JMP COMPARE22
    COMPARESPACE22:
        CMP CH,CL
        JL PRINTSPACE22
        MOV CH,1
        JMP COMPAREN22
    PRINTSPACE22:
        LEA DX,SPACE
        MOV AH,9 
        ;MOV DL,BH
        ;ADD DL,48
        ;MOV AH,2  
        INT 21H
        INC CH
        JMP COMPARESPACE22      
    COMPARE22:
        CMP BL,CL
        JLE PRINT22
        CMP BL,CL
        JMP EXIT
    COMPAREN22:
        CMP BH,BL
        JLE PRINTN22
        CMP BH,CL
        INC BL
        MOV BH,1
        JMP COMPARE22 
    PRINTN22:
        
        LEA DX,STAR
        MOV AH,9 
        ;MOV DL,BH
        ;ADD DL,48
        ;MOV AH,2  
        INT 21H
        INC BH
        JMP COMPAREN22
       
    PRINT22:
        LEA DX,LN
        MOV AH,9  
        INT 21H
        
        ;LEA DX,VALUE
        ;MOV AH,9 
        ;MOV DL,BL
       ; ADD DL,48
        ;MOV AH,2  
        ;INT 21H    
        
        ;LEA DX,LN
        ;MOV AH,9  
        ;INT 21H 
        JMP COMPARESPACE22
        JMP COMPAREN22
        JMP COMPARE22
    EXIT:
        MOV AH,1  
 MAIN ENDP 

END MAIN