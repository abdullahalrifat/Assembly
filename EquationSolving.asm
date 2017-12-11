                                              .MODEL SMALL
.STACK 100H
.DATA
    
.CODE
MAIN PROC
    
          
    ;DL = 2*BH-CH+DH EQUATION SOLVING
    
    ;INPUT FOR BH
    MOV AH ,1           ;GETTING INPUT IN AH
    INT 21H             ;SYSTEM HALTING FOR INPUT
    SUB AL,30H          ;CONVERT THE INT TO HEXADECIMAL
    MOV BH,AL           ;MOVING AH INTO BH
         
    ;INPUT FOR CH     
    MOV AH,1            ;GETTING INPUT IN AH
    INT 21H             ;SYSTEM HALTING FOR INPUT
    SUB AL,30H          ;CONVERT THE INT TO HEXADECIMAL
    MOV CH,AL           ;MOVING AL INTO CH
         
    ;INPUT FOR DH     
    MOV AH,1            ;GETTING INPUT IN AH
    INT 21H             ;SYSTEM HALTING FOR INPUT
    SUB AL,30H          ;CONVERT THE INT TO HEXADECIMAL
    MOV DH,AL           ;MOVING AL INTO DH
        
    
    MOV DL,0            ;ASSIGNING 0 TO THE SUM REGISTER
    
              
    ADD DL,BH           ;ADD BH 1 TIME
    ADD DL,BH           ;ADD BH 1 TIME
    SUB DL,CH           ;SUBTRACT CH FROM MULTIPLICATION OF BH FROM DL
    ADD DL,DH           ;ADDING DH WITH DL(TOTAL SUM) 
   
     
  
   
   
    ADD DL,30H          ;CONVERTING DL HEXADECIMAL VALUE IN INT
    MOV AH,2            ;GETTING OUTPUT
    INT 21H             ;SYSTEM HALTING  
    

   
   
  
   
   
     
    MAIN ENDP
END MAIN