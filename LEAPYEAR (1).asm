.MODEL SMALL
.STACK 100H

.DATA   
 TWO db 2  
 TEN db 10
 FOUR db 4
 HUNDRED db 100 
 ;FOURHUNDRED db 400
 ;THOUSEND db 1000      
 LEAP DB 'LEAP YEAR$' 
 NOT_LEAP DB 'NOT LEAP YEAR$'
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
        MOV BH,AL
        
        MOV AH,1
        INT 21H 
        SUB AL,48
        MOV CL,AL
        
        MOV AH,1
        INT 21H 
        SUB AL,48
        MOV CH,AL
      
        MOV AH,0
        MOV AL,BH
        MUL HUNDRED
        MOV DH,AL
        ADD DL,DH
          
        MOV AH,0  
        MOV AL,CL
        MUL TEN
        MOV DH,AL
        ADD DL,DH
        
        ADD DL,CH 
        
        MOV BL,DL
        
    CHECK:
       
        MOV AL,BL
        DIV HUNDRED
        CMP AH,0
        ;JLE COMP400
        JLE COMP4
        JMP EXIT
    COMP400:
        MOV AL,BL
        DIV HUNDRED
         DIV FOUR
        CMP AH,0
        JLE PRINT
        CMP AH,0
        JLE PRINTNOT
    COMP4:
        MOV AL,BL
        DIV FOUR
        CMP AH,0
        JLE PRINT
        CMP AH,0
        JLE PRINTNOT
    PRINT:
        LEA DX,LN
        MOV AH,9  
        INT 21H
        
        LEA DX,LEAP
        MOV AH,9  
        INT 21H 
        
        LEA DX,LN
        MOV AH,9  
        INT 21H 
        
        JE EXIT 
    PRINTNOT:
        LEA DX,LN
        MOV AH,9  
        INT 21H
        
        LEA DX,NOT_LEAP
        MOV AH,9  
        INT 21H 
        
        LEA DX,LN
        MOV AH,9  
        INT 21H 
        
        JE EXIT    
    EXIT:
        ENDP  

END MAIN