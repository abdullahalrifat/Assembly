.MODEL SMALL
.STACK 100H

.DATA
 ten db 10
 LN DB 0Ah, 0Dh, '$'    
SPACE DB ' $'
TOTAL DB 'TOTAL NUMBER OF WORDS :$'
username DB 8 DUP('$')

      buff        db  126        ;MAX NUMBER OF CHARACTERS ALLOWED (25).
            db  ?         ;NUMBER OF CHARACTERS ENTERED BY USER.
            db  126 dup('$') ;CHARACTERS ENTERED BY USER.
.CODE          

 MAIN PROC
   MOV AX, @DATA
   MOV DS, AX      ; DS = data segment register   
  
           
            mov ah, 0Ah ;SERVICE TO CAPTURE STRING FROM KEYBOARD.
            mov dx, offset buff
            int 21h                 
                      
    MOV BL,0
    MOV CH,0                
    
                              
    COMPARE:   
         

            mov si, offset buff + 1 ;NUMBER OF CHARACTERS ENTERED.  
            mov cl, [ si ] ;MOVE LENGTH TO CL.
           
            MOV BH,0     ;CLEAR CH TO USE CX.    
            CMP BL,CL
            JE EXIT  
            
            add si, BX ;NOW SI POINTS TO CHR(13). 
            MOV DX,SI
            CMP DL,' '  
            INC BL  
            JE COMPARE
            JNE CNT
        JMP EXIT
    CNT:    
          INC CH
          mov si, offset buff + 1 ;NUMBER OF CHARACTERS ENTERED.  
          ;mov cl, [ si ] ;MOVE LENGTH TO CL.
         ; mov ch, 0      ;CLEAR CH TO USE CX. 
          MOV BH,0     ;CLEAR CH TO USE CX. 
          add si, BX ;NOW SI POINTS TO CHR(13).
          CMP SI,' ' 
          JNE COMPARE
          JE CNT 
           
        
    EXIT:
                 
                  
                  
        MOV AL,CL          
        MOV AH,0
        DIV ten
        MOV CL,AL
        MOV BL,AH
         
        LEA DX,LN
        MOV AH,9  
        INT 21H 
                   
        MOV DL,CL
        ADD DL,48        ;CONVERTING DL HEXADECIMAL VALUE IN INT
        MOV AH,2            ;GETTING OUTPUT
        INT 21H             ;SYSTEM HALTING  
        
        MOV DL,BL
        ADD DL,48        ;CONVERTING DL HEXADECIMAL VALUE IN INT
        MOV AH,2            ;GETTING OUTPUT    
        INT 21H 
        
          
        LEA DX,LN
        MOV AH,9  
        INT 21H                
           
            
            
END MAIN


