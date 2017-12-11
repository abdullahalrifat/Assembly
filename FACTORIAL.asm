.MODEL SMALL
.STACK 100H

.DATA   
       TEN db 10  \
       HUNDRED db 100
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
    MOV DL,1
    
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
        MOV AH,0
        MOV AL,BL
        MUL DL 
        MOV DL,AL
        INC BL
        ;LEA DX,VALUE
        ;MOV AH,9 
       
       
        JMP COMPARE
       
    EXIT:   
          
        
        
        MOV AH,0
        MOV AL,DL
        DIV HUNDRED
        MOV CL,AL
        MOV BL,AH
         
        MOV AH,0
        MOV AL,BL
        DIV TEN
        MOV DH,AH
        MOV BL,AL
                   
        MOV DL,CL
        ADD DL,48        ;CONVERTING DL HEXADECIMAL VALUE IN INT
        MOV AH,2            ;GETTING OUTPUT
        INT 21H             ;SYSTEM HALTING  
        
        MOV DL,BL
        ADD DL,48        ;CONVERTING DL HEXADECIMAL VALUE IN INT
        MOV AH,2            ;GETTING OUTPUT
        INT 21H     
        
        MOV DL,DH
        ADD DL,48        ;CONVERTING DL HEXADECIMAL VALUE IN INT
        MOV AH,2            ;GETTING OUTPUT
        INT 21H     
 MAIN ENDP 

END MAIN
