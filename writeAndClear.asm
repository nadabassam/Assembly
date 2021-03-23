dosseg
 .model small
 .data
 message1 db " This String won't be displayed " ,"$"
 message2 db " Hello displayed                         ","$"
 .code
  main:
  mov ax, @data
  mov ds, ax
  mov ah,9
  mov dx, offset message1
  int 21h   ;print This String won't be displayed
  mov ah,10
  mov al, Dh
  int 21h
  mov ah,9
  mov dx, offset message2
  int 21h ;print Hello displayed
  mov ah,4ch
  int 21h
  end main
