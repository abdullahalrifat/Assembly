.MODEL SMALL
.STACK 100H

.DATA   
 TWO db 2  
 TEN db 10
 NINETYNINE db 99
 NINE db 9
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
        
        MOV CL,AL
        ADD BL,1
        MOV AL,BL
        MOV AH,0
        DIV TWO
        MOV AH,0
        MUL CL
        MOV AH,0
        SUB AL,1
        MUL AL
        ADD AL,1 
        CMP AL,NINE
        JLE OUTPUT1
        CMP AL,NINETYNINE
        JLE OUTPUT2
        JGE OUTPUT3
        ;ADD AL,1
        OUTPUT1:
            
             LEA DX,LN
        MOV AH,9  
        INT 21H
            
            MOV DL,AL
            ADD DL,48        ;CONVERTING DL HEXADECIMAL VALUE IN INT
            MOV AH,2            ;GETTING OUTPUT
            INT 21H 
            JMP EXIT
        OUTPUT2:
            MOV AH,0
            ;MOV BL,0
           ; MOV CL,0
            DIV TEN
            MOV CL,AL
            MOV BL,AH     ;1ST VAG SHESH
             
              LEA DX,LN
        MOV AH,9  
        INT 21H          
        
            MOV DL,CL
            ADD DL,48        ;CONVERTING DL HEXADECIMAL VALUE IN INT
            MOV AH,2            ;GETTING OUTPUT
            INT 21H 
                  
            MOV DL,BL
            ADD DL,48        ;CONVERTING DL HEXADECIMAL VALUE IN INT
            MOV AH,2            ;GETTING OUTPUT
            INT 21H
            JMP EXIT
        OUTPUT3:      
        MOV AH,0
        ;MOV BL,0
       ; MOV CL,0
        DIV TEN
        MOV CL,AL
        MOV BL,AH     ;1ST VAG SHESH
         
        MOV AL,CL
        DIV  TEN
        MOV CL,AH ; 2ND VAG SHESH
        MOV CH,AL ;VAG FOL
              
               LEA DX,LN
        MOV AH,9  
        INT 21H     
        MOV DL,AL
        ADD DL,48        ;CONVERTING DL HEXADECIMAL VALUE IN INT
        MOV AH,2            ;GETTING OUTPUT
        INT 21H             ;SYSTEM HALTING  
        
        MOV DL,AH
        ADD DL,48        ;CONVERTING DL HEXADECIMAL VALUE IN INT
        MOV AH,2            ;GETTING OUTPUT
        INT 21H 
              
        MOV DL,BL
        ADD DL,48        ;CONVERTING DL HEXADECIMAL VALUE IN INT
        MOV AH,2            ;GETTING OUTPUT
        INT 21H 
        JMP EXIT
    EXIT:
        ENDP  

END MAIN