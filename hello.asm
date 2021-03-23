dosseg
.model small
.data
message db "Hello, I'm Nada!","$"
.code

main:
mov ax,@data
mov ds,ax
mov ah,9
mov dx,offset message
int 21h
mov ah,4ch
int 21h
end main