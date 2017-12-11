                                                           .MODEL SMALL
.STACK 100H
.DATA
    
.CODE
MAIN PROC
    
          
  
    MOV AH ,1           
    INT 21H             
    SUB AL,30H          
    MOV BH,AL          
         
     MOV AH ,1           
    INT 21H             
    SUB AL,30H          
    MOV CH,AL
   
     MOV AH ,1           
    INT 21H             
    SUB AL,30H          
    MOV DH,AL
    
    MOV DL,0
    ADD DL,BH
    ADD DL,BH
    ADD DL,BH
    ADD DL,BH
    ADD DL,BH
    ADD DL,BH
    ADD DL,BH
    
    MOV BL,0
    
    ADD BL,CH
    ADD BL,CH
    ADD BL,CH
    
    MOV CL,0
    
    ADD CL,AL
    ADD CL,AL
    
    
    
    ADD DL,CL
    SUB DL,BL
    
   
    
    MOV AL,DL
    ADD AL,48 
   
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