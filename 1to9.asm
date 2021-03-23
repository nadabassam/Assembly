.MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT  DB  'The Numbers from 1 to 9 are : $'

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS 
     MOV DS, AX

     LEA DX, PROMPT               ; load and print PROMPT 
     MOV AH, 9
     INT 21H

     MOV CX, 10                 ; initialize CX

     MOV AH, 2                    ; set output function  
     MOV DL, 30h                  ; set DL with A

     @LOOP:                       ; loop start
       INT 21H                    ; print character

       INC DL                     ; increment DL to next ASCII character
       DEC CX                     ; decrement CX
 
     JNZ @LOOP                    ; jump to label @LOOP if CXis 0

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN
