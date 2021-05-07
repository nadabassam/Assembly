;Write an assembly program that determines if two strings are equal or not

Dosseg 
.model small 

.data 
msg1 db 'Hello','$' 
msg2 db 'Helloo','$' 
msg3 db 'Equal','$' 
msg4 db 'NotEqual','$' 

.code 
main:
 
mov ax,@data 
mov ds,ax 

mov si,0 
x: 
mov cl,[msg1+si] 
mov ch,[msg2+si] 
cmp cl,ch 
jne Exit1 

cmp cl,'$' 
je Exit2 

inc si 
jmp x 

Exit1: 
mov ah,9 
mov dx,offset msg4 
int 21h 
jmp exit 

Exit2: 
mov ah,9 
mov dx,offset msg3 
int 21h
 
exit: 
mov ah,4ch 
int 21h 

end main 