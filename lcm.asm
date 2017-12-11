.MODEL SMALL
.STACK 100H

.DATA   
       TEN db 10  
       HUNDRED db 100
  VALUE DB 'HELLO$'    
 LN DB 0Ah, 0Dh, '$' 
.CODE

 MAIN PROC 
    
    MOV AX, @DATA
    MOV DS,AX
    
    
   INPUT: 
    MOV AH,1
    INT 21H
    MOV CL,AL 
    SUB CL,48
    
    MOV AH,1
    INT 21H
    MOV BL,AL 
    SUB BL,48
    
    MOV DL,1
    
    ;MOV AH,1
    ;INT 21H
    ;MOV CL,AL
    ;SUB CL,48
    
    ;IF(X<Y) 
    COMPARE:
    
        CMP BL,CL
        JLE PRINT
        CMP BL,CL
        JGE PRINT2
        JMP EXIT
        
    PRINT:
       MOV AL,CL
       MOV AH,0
       MUL BL
       MOV CH,AL
       MOV DH,CL
       MOV BH,CL
       JMP FOR 
    PRINT2: 
       MOV AL,BL  
       MOV AH,0
       MUL CL
       MOV CH,AL
       MOV DH,BL 
       MOV BH,BL
       JMP FOR 
    FOR:
        CMP BH,CH
        JLE RUN
        JMP EXIT
    RUN:   
         MOV AH,0
         MOV AL,DH
         DIV  CL
         MOV DL,AH
         CMP DL,0
         JNE LCM2
         MOV AH,0 
         MOV AL,DH
         DIV BL
         MOV DL,AH
         CMP DL,0
         JE LCM
         INC BH
         JMP FOR
    LCM2:
        INC BH
        JMP FOR 
    LCM:
        MOV DH,BH
        INC BH
        JMP FOR     
    EXIT:   
        
        MOV AL,DH
        MOV AH,0
        DIV TEN
        MOV CL,AH
        MOV DH,AL  
         
         
         
        MOV DL,DH
        ADD DL,48        ;CONVERTING DL HEXADECIMAL VALUE IN INT
        MOV AH,2            ;GETTING OUTPUT
        INT 21H   
          
        MOV DL,CL
        ADD DL,48        ;CONVERTING DL HEXADECIMAL VALUE IN INT
        MOV AH,2            ;GETTING OUTPUT
        INT 21H             ;SYSTEM HALTING 
       
       
 MAIN ENDP 

END MAIN
