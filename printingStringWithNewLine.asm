.MODEL SMALL
.STACK 100H

.DATA
MSG1 DB 'Name : Abdullah Al Rifat$'   
MSG2 DB 'ID: 011151151$' 
MSG3 DB 'Course Name : Assembly Programming Laboratory$' 
MSG4 DB 'Course ID : Fall 173 CSE 236$' 
MSG5 DB 'University : United International University$' 
MSG6 DB 'Birth Place : Dhaka!$' 

.CODE

 MAIN PROC
   MOV AX, @DATA
   MOV DS, AX      ; DS = data segment register   
   
   LEA DX, MSG1   ; LEA = Load Effective Address
   MOV AH, 9
   INT 21H    
          
   MOV AH, 2
   MOV DL, 0AH ;New line
   INT 21H
   MOV DL, 0DH ;Move cret
   INT 21H
   
   LEA DX, MSG2   ; LEA = Load Effective Address
   MOV AH, 9
   INT 21H 
   
   MOV AH, 2
   MOV DL, 0AH ;New line
   INT 21H
   MOV DL, 0DH ;Move cret
   INT 21H
   
   LEA DX, MSG3   ; LEA = Load Effective Address
   MOV AH, 9
   INT 21H 
   
   MOV AH, 2
   MOV DL, 0AH ;New line
   INT 21H
   MOV DL, 0DH ;Move cret
   INT 21H
   
   LEA DX, MSG4   ; LEA = Load Effective Address
   MOV AH, 9
   INT 21H 
   
   MOV AH, 2
   MOV DL, 0AH ;New line
   INT 21H
   MOV DL, 0DH ;Move cret
   INT 21H
   
   LEA DX, MSG5   ; LEA = Load Effective Address
   MOV AH, 9
   INT 21H 
   
   MOV AH, 2
   MOV DL, 0AH ;New line
   INT 21H
   MOV DL, 0DH ;Move cret
   INT 21H
   
   LEA DX, MSG6   ; LEA = Load Effective Address
   MOV AH, 9
   INT 21H 
      
 MAIN ENDP 

END MAIN


