.MODEL SMALL
.STACK 100H

.DATA   
 
  VALUE DB 'HELLO$'    
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
        
    PRINT:
        LEA DX,LN
        MOV AH,9  
        INT 21H
        
        ;LEA DX,VALUE
        ;MOV AH,9 
        MOV DL,BL
        ADD DL,48
        MOV AH,2  
        INT 21H
        INC BL
        JMP COMPARE
       
    EXIT:
        MOV AH,1  
 MAIN ENDP 

END MAIN
