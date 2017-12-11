.MODEL SMALL
.STACK 100H

.DATA   
 
  ONE DB 'ONE$'
  TWO DB 'TWO$'
  THREE DB 'THREE$'
  FOUR DB 'FOUR$'
  FIVE DB 'FIVE$'
  SIX DB 'SIX$'
  SEVEN DB 'SEVEN$'
  EIGHT DB 'EIGHT$'
  NINE DB 'NINE$' 
  ELS DB 'GREATER THAN FOUR$'
 SM DB 'SMALLER$'
 GRT DB 'GREATER$'    
 LN DB 0Ah, 0Dh, '$' 
.CODE

 MAIN PROC 
    
    MOV AX, @DATA
    MOV DS,AX
    
    
   INPUT: 
    MOV AH,1
    INT 21H 
    SUB AL,48
   
    
    ;MOV AH,1
    ;INT 21H
    ;MOV CL,AL
    ;SUB CL,48
    
    ;IF(X<Y)
    CMP AL,1
    JE ONE_
    CMP AL,2
    JE TWO_
    CMP AL,3
    JE THREE_ 
    JMP EXIT
    ONE_:    
        LEA DX,LN
        MOV AH,9  
        INT 21H
        
        LEA DX,ONE
        MOV AH,9  
        INT 21H
        
        LEA DX,LN
        MOV AH,9  
        INT 21H
          
        JMP INPUT
        
    TWO_:    
        LEA DX,LN
        MOV AH,9  
        INT 21H
        
        LEA DX,TWO
        MOV AH,9  
        INT 21H 
        
        LEA DX,LN
        MOV AH,9  
        INT 21H
        
        JMP INPUT
     THREE_:    
        LEA DX,LN
        MOV AH,9  
        INT 21H
        
        LEA DX,THREE
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
