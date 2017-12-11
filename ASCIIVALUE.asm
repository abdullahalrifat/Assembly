.MODEL SMALL
.STACK 100H

.DATA  
  TEN DB 10
  LOWER DB 'LOWER CASE$'
 UPPER DB 'UPPER CASE$'
 SPECIAL DB 'SPECIAL$'    
 LN DB 0Ah, 0Dh, '$' 
.CODE

 MAIN PROC 
    
    MOV AX, @DATA
    MOV DS,AX
    
    
   INPUT: 
        MOV AH,1
        INT 21H 
        MOV BL,AL
        ;ADD BL,36
        
        LEA DX,LN
        MOV AH,9  
        INT 21H
        
        MOV AH,0
        MOV AL,BL
        DIV TEN
        
        MOV BL,AL
        MOV BH,AH
        
        mov AH,0
        MOV AL,BL
        DIV TEN
        MOV BL,AL
        MOV CL,AH
        
        MOV DL,BL
        ADD DL,48        ;CONVERTING DL HEXADECIMAL VALUE IN INT
        MOV AH,2            ;GETTING OUTPUT
        INT 21H 
        
        MOV DL,CL
        ADD DL,48        ;CONVERTING DL HEXADECIMAL VALUE IN INT
        MOV AH,2            ;GETTING OUTPUT
        INT 21H 
        
        MOV DL,BH
        ADD DL,48        ;CONVERTING DL HEXADECIMAL VALUE IN INT
        MOV AH,2            ;GETTING OUTPUT
        INT 21H 
        
        LEA DX,LN
        MOV AH,9  
        INT 21H
        JMP INPUT 
    EXIT:
        MOV AH,1  
 MAIN ENDP 

END MAIN