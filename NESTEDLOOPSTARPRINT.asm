.MODEL SMALL
.STACK 100H

.DATA   
 
  VALUE DB 'HELLO$'
  STAR DB '*$'    
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
    MOV BH,1
    ;MOV AH,1
    ;INT 21H
    ;MOV CL,AL
    ;SUB CL,48
    
    ;IF(X<Y) 
    COMPARE:
        CMP BL,CL
        JLE PRINT
        CMP BL,CL
        JMP EXIT
    COMPAREN:
        CMP BH,BL
        JLE PRINTN
        CMP BH,CL
        INC BL
        MOV BH,1
        JMP COMPARE 
    PRINTN:
        
        LEA DX,STAR
        MOV AH,9 
        ;MOV DL,BH
        ;ADD DL,48
        ;MOV AH,2  
        INT 21H
        INC BH
        JMP COMPAREN
       
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
        
        JMP COMPAREN
        JMP COMPARE
       
    EXIT:
        MOV AH,1  
 MAIN ENDP 

END MAIN
