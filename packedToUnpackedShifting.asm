;PACKED TO UNPACKED BY SHIFTING

DATA SEGMENT   
                 
    PACKED    DB  12h,91h,34h,56h,78h,24h,35h,61h
    UNPACKED  DB  16 DUP(?)
    
DATA ENDS


CODE SEGMENT
   
    ASSUME  DS:DATA , CS:CODE
    
    START :
            MOV AX, DATA
            MOV DS, AX
            
            MOV CX,8
            MOV SI,0 
            MOV DI,0 
            
    NEXT:
            XOR AX,AX                   ;CLEARS ALL FLAGS
	        MOV AL,PACKED[SI]           
   	        INC SI
	        SHL AX,4
   	        SHR AL,4
	        MOV UNPACKED[DI], AH
	        INC DI
	        MOV UNPACKED[DI],AL
	        INC DI
            LOOP NEXT   
            
CODE ENDS  
    END START




