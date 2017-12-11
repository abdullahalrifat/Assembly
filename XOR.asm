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
        MOV CL,7   ;BIT COUNT  
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
        JE MIDDLE
        JMP LOOPS 
    SECOND:
        MOV DL,0   ;SUM
        MOV CL,7   ;BIT COUNT  
        JMP LOOPS2
    LOOPS2:
        MOV AH,1
        INT 21H 
        SUB AL,48
        MOV BH,AL
        SHL BH,CL
        ADD DL,BH 
        DEC CL
        CMP CL,-1
        JE PRINT
        JMP LOOPS2 
    MIDDLE:
        MOV BL,DL
        
        LEA DX,LN
        MOV AH,9  
        INT 21H
        
        JMP SECOND
    PRINT:
        MOV CL,DL
        
        LEA DX,LN
        MOV AH,9  
        INT 21H
        
        ;MOV DL,BL
        ;ADD DL,48
        ;MOV AH,2  
        ;INT 21H   
        
        ;LEA DX,LN
        ;MOV AH,9  
        ;INT 21H 
        
        ;MOV DL,CL
        ;ADD DL,48
        ;MOV AH,2  
        ;INT 21H   
        
        XOR CL,BL
        MOV CH,CL
        JE EXIT 
    
    EXIT:
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

END MAIN