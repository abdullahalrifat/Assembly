.MODEL SMALL
.STACK 100H
.DATA
LN DB 0AH, 0DH,'$'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 1
    INT 21H
    SUB AL, 30H 
    MOV CH, AL 
    
    LEA DX, LN
    MOV AH, 9
    INT 21H
    
    MOV CL, 8
    
    L:
      
        SHL CH, 1
        JC ONE 
        MOV AH, 2
        MOV DL, 0
        ADD DL, 30H
        INT 21H
        JMP SKIP
    
        ONE:
            MOV AH, 2
            MOV DL, 1
            ADD DL, 30H
            INT 21H
        SKIP:
           
        DEC CL
        CMP CL, 0
        JNE L
    
        
    MAIN ENDP
END MAIN