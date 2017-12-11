
                                                 .MODEL SMALL
.STACK 100H
.DATA
    
.CODE
MAIN PROC
    
   ;PRINT 2 LENGTH NUMBER       
   MOV AL,14
   SUB AL,30H
   
   MOV BL,10
   SUB BL,30H
   
   DIV BL
   
   MOV DL,AL
   MOV CL,AH
   ADD DL,30H
   MOV AH,2
   INT 21H
   
   MOV DL,CL
   ADD DL,30H
   MOV AH,2
   INT 21H

   
   
  
   
   
     
    MAIN ENDP
END MAIN