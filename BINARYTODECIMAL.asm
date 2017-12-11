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
          
        MOV DL,0   ;SUM
        MOV CL,4 ;BIT COUNT  
        JMP LOOPS
       
    LOOPS:
        MOV AH,1
        INT 21H 
        SUB AL,48
        MOV BH,AL
        SHL BH,CL
        ADD DL,BH 
        DEC CL
        CMP CL,-1
        JE PRINT
        JMP LOOPS
    PRINT:
        MOV BL,DL
        LEA DX,LN
        MOV AH,9  
        INT 21H
        
        MOV DL,BL
        ADD DL,48
        MOV AH,2  
        INT 21H   
        
        LEA DX,LN
        MOV AH,9  
        INT 21H 
        
        JE EXIT 
    
    EXIT:
        ENDP  

END MAIN