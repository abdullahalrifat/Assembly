.MODEL SMALL
.STACK 100H

.DATA 
 SM DB 'SMALLER$'
 GRT DB 'GREATER$'    
 LN DB 0Ah, 0Dh, '$' 
.CODE

 MAIN PROC 
    
    MOV AX, @DATA
    MOV DS,AX
    
    
    
    MOV AH,1
    INT 21H
    MOV BL,AL 
    SUB BL,48
    
    ;MOV AH,1
    ;INT 21H
    ;MOV CL,AL
    ;SUB CL,48
    
    ;IF(X<Y)
    CMP BL,5
    JL IF 
    JG ELSE
    JMP EXIT
    IF:    
        LEA DX,LN
        MOV AH,9  
        INT 21H
        
        LEA DX,SM
        MOV AH,9  
        INT 21H  
        JMP EXIT
        
    ELSE:    
        LEA DX,LN
        MOV AH,9  
        INT 21H
        
        LEA DX,GRT
        MOV AH,9  
        INT 21H
        JMP EXIT
    
    EXIT:
        MOV AH,1  
 MAIN ENDP 

END MAIN
