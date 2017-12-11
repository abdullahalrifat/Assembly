.MODEL SMALL
.STACK 100H

.DATA
MSG1 DB 'HELLO WORLD!$' 

.CODE

 MAIN PROC
   MOV AX, @DATA
   MOV DS, AX      ; DS = data segment register   
   
   LEA DX, MSG1   ; LEA = Load Effective Address
   MOV AH, 9
   INT 21H 
      
 MAIN ENDP 

END MAIN

