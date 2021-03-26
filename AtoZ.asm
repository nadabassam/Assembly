 .MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT  DB  'The Upper Case Letters from A to Z are : $'

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS 
     MOV DS, AX

     MOV DX, OFFSET PROMPT        ; load and print PROMPT 
     MOV AH, 9
     INT 21H

     MOV CX, 26                   ; initialize CX

     MOV AH, 02h                  ; set output function  
     MOV DL, 41h                  ; set DL with A

     L1:                          ; loop start
       INT 21H                    ; print character

       INC DL                     ; increment DL to next ASCII character
       DEC CX                     ; decrement CX
 
     JNZ L1                       ; jump to label if CX is 0

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
     
   MAIN ENDP
 END MAIN



OR without the String : 

DOSSEG
.MODEL SMALL
.CODE

MOV CX,26    ; counter 
MOV DL,41h   ; A
MOV AH,2 

LOOP: 
INT 21h

INC dl
DEC cx
JNZ LOOP

MOV ah,4ch
INT 21h
END
