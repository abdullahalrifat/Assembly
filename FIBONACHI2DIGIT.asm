.MODEL SMALL
.STACK 100H

.DATA   
 TWO db 2  
 TEN db 10
  RANGE DB 'OUT OF RANGE$'
 LN DB 0Ah, 0Dh, '$' 
.CODE

 MAIN PROC 
    
    MOV AX, @DATA
    MOV DS,AX
    
    
   INPUT: 
        MOV AH,1
        INT 21H 
        SUB AL,48
        MOV CL,AL
        
        MOV AH,1
        INT 21H 
        SUB AL,48
        MOV BL,AL
        
        MOV AH,0
        MOV AL,CL
        MUL TEN
        ADD AL,BL 
        
        MOV CL,AL
        
        MOV BL,1
        MOV BH,0
        MOV CH,1
        
    CHECK:
        CMP CH,CL
        JLE PRINT
        CMP CH,CL
        JMP EXIT
    PRINT:
        LEA DX,LN
        MOV AH,9  
        INT 21H
        
        MOV DH,BH
        ADD BH,BL
        MOV BL,DH
        
        CMP BH,9
        JLE PRINTSINGLE
        CMP BH,99
        JLE PRINTMULT
        CMP BH,100
        JLE PRINTRANGE 
        
    PRINTSINGLE:
        MOV DL,BH
        ADD DL,48
        MOV AH,2
        INT 21H  
        
        INC CH
        JMP CHECK 
    PRINTMULT:
        
        MOV AH,0
        MOV AL,BH
        DIV ten
        MOV DL,AL
        MOV DH,AH
                    
        MOV DL,DL
        ADD DL,48        
        MOV AH,2           
        INT 21H            
        
        MOV DL,DH
        ADD DL,48        
        MOV AH,2           
        INT 21H  
              
        INC CH
        JMP CHECK 
    PRINTRANGE:
        LEA DX,LN
        MOV AH,9  
        INT 21H
        
        LEA DX,RANGE
        MOV AH,9  
        INT 21H 
        
        LEA DX,LN
        MOV AH,9  
        INT 21H 
        
        JE EXIT
    EXIT:
        ENDP  

END MAIN