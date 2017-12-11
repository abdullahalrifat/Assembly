.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AH ,1
    INT 21H
    SUB AL,30H
    MOV BH,AL
    
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV BL,AL
    
    XCHG BH,BL
    
    MOV DL,BH
    ADD DL,30H
    MOV AH,2
    INT 21H
     
    MOV DL,BL
    ADD DL,30H
    MOV AH,2
    INT 21H 
    MAIN ENDP
END MAIN