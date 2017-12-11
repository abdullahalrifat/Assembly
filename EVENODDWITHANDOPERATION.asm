.MODEL SMALL
.STACK 100H

.DATA   
 TWO db 2  
 TEN db 10
  EVEN_ DB 'EVEN$'
  ODD_ DB 'ODD$'
 LN DB 0Ah, 0Dh, '$' 
.CODE

 MAIN PROC 
    
    MOV AX, @DATA
    MOV DS,AX
    
    
   INPUT: 
        MOV AH,1
        INT 21H 
        SUB AL,48
        MOV BL,AL
        
    CHECK:
        AND AL,1
        
        CMP AL,0
        JE EVEN
        CMP AL,1
        JE ODD
        
    EVEN: 
        LEA DX,LN
        MOV AH,9  
        INT 21H
        
        LEA DX,EVEN_
        MOV AH,9  
        INT 21H 
        
        LEA DX,LN
        MOV AH,9  
        INT 21H 
        
        JE EXIT
    ODD:
        LEA DX,LN
        MOV AH,9  
        INT 21H
        
        LEA DX,ODD_
        MOV AH,9  
        INT 21H 
        
        LEA DX,LN
        MOV AH,9  
        INT 21H 
        JE EXIT
   
        
    EXIT:
        ENDP  

END MAIN