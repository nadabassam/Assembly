Dosseg
.model small
.code
mov cx,5
  
LO:  mov dl, 41h
     mov ah, 2
     int 21h
     dec cx
     jnz LO 
     mov ah, 4ch
     int 21h
End
