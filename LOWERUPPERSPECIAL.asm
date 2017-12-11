.MODEL SMALL
.STACK 100H

.DATA  

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
    MOV AL,BL
    SUB AL,' '
    CMP AL,'/'-' '
    JLE SPECIALCHARACTER
    MOV AL,BL
    SUB AL,'A'
    CMP AL,'Z'-'A'
    JLE UPPERCASE 
    MOV AL,BL
    SUB AL,'a'
    CMP AL,'z'-'a'
    JLE LOWERCASE 
    
    JMP EXIT
    UPPERCASE:    
        LEA DX,LN
        MOV AH,9  
        INT 21H
        
        LEA DX,UPPER
        MOV AH,9  
        INT 21H
        
        LEA DX,LN
        MOV AH,9  
        INT 21H
          
        JMP INPUT
        
    LOWERCASE:    
        LEA DX,LN
        MOV AH,9  
        INT 21H
        
        LEA DX,LOWER
        MOV AH,9  
        INT 21H 
        
        LEA DX,LN
        MOV AH,9  
        INT 21H
        
        JMP INPUT
     SPECIALCHARACTER:    
        LEA DX,LN
        MOV AH,9  
        INT 21H
        
        LEA DX,SPECIAL
        MOV AH,9  
        INT 21H 
        
        LEA DX,LN
        MOV AH,9  
        INT 21H 
        JMP INPUT
    EXIT:
        MOV AH,1  
 MAIN ENDP 

END MAIN