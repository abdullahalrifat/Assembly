.MODEL SMALL
.STACK 100H

.DATA   
 ten db 10
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
        MUL ten
        ADD AL,CL
    
    OUTPUT:      
        MOV AH,0
        DIV ten
        MOV CL,AL
        MOV BL,AH
         
  
                   
        MOV DL,CL
        ADD DL,48        ;CONVERTING DL HEXADECIMAL VALUE IN INT
        MOV AH,2            ;GETTING OUTPUT
        INT 21H             ;SYSTEM HALTING  
        
        MOV DL,BL
        ADD DL,48        ;CONVERTING DL HEXADECIMAL VALUE IN INT
        MOV AH,2            ;GETTING OUTPUT
        INT 21H       
        
    EXIT:
        ENDP  

END MAIN