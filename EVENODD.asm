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
        
        MOV AH,1
        INT 21H 
        SUB AL,48
        MOV CL,AL
        
        MOV AH,0
        MOV AL,BL
        MUL TEN
        ADD AL,CL
    CHECK:
        MOV AH,0
        DIV TWO
        MOV CL,AL
        MOV BL,AH
          
        CMP BL,0
        JLE EVEN 
        CMP BL,1
        JLE ODD
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
    OUTPUT:                 
        MOV DL,CL
        ADD DL,48        
        MOV AH,2           
        INT 21H           
        
        MOV DL,BL
        ADD DL,48       
        MOV AH,2           
        INT 21H       
        
    EXIT:
        ENDP  

END MAIN