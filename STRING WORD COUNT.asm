.MODEL SMALL
.STACK 100H

.DATA
 ten db 10
 LN DB 0Ah, 0Dh, '$'    
SPACE DB ' $'
TOTAL DB 'TOTAL NUMBER OF WORDS :$'

.CODE          

 MAIN PROC
   MOV AX, @DATA
   MOV DS, AX      ; DS = data segment register   
  
              
                      
    MOV BL,0
    MOV CL,0                
    MOV CH,0
                              
    COMPARE:  
            
           MOV AH,1
           INT 21H 
           SUB AL,48
           MOV DL,' ' 
           MOV BL,'.'
           SUB DL,48 
           SUB BL,48
           
           CMP AL,BL
           JE EXIT
           CMP AL,DL 
           JE  CNT 
           JMP CTT
        JMP EXIT
    CNT:     
      
           JMP INCTCM
    CTT:
        INC CL
        JMP INCCTT
    
    INCCTT:
            MOV AH,1
           INT 21H 
           SUB AL,48 
           MOV DL,' ' 
           MOV BL,'.'
           SUB DL,48 
           SUB BL,48
           
           CMP AL,BL
           JE EXIT
           CMP AL,DL
           JE  CNT
           JMP INCCTT 
             
    INCTCM:
      
           MOV AH,1
           INT 21H 
           SUB AL,48 
           MOV DL,' ' 
           MOV BL,'.'
           SUB DL,48 
           SUB BL,48
           
           CMP AL,BL
           JE EXIT
           CMP AL,DL
           JE  INCTCM
           JMP CTT 
  
    EXIT:
                 
                  
                  
        MOV AL,CL          
        MOV AH,0
        DIV ten
        MOV CL,AL
        MOV BL,AH
         
         
         LEA DX,LN
        MOV AH,9  
        INT 21H 
         
        LEA DX,TOTAL
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


