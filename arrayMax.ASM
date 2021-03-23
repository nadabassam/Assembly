dosseg
.model small

.data
arr db 0,1,2,3,4,5,6,7,8,9 ; define array of numbers 
max db ? ; no given value
len dw  $-arr; define word because it will be set in CX which is 32-bit register ; "$-" gets the length of the variable after it

.code
mov ax , @data
mov ds , ax

mov cx , len
mov si , CX ; for indexing element in array
dec si ; because it is index and should be 1 less than the length

mov al , [arr + Si] ; mov the last elemnent to al
mov max , al ;

lp:
dec si
mov al , [arr + Si]

cmp al , max ; gets the element at position (first element + CX)
ja above
loop lp
jmp exit

above:
mov max ,  al 
loop lp

exit:
mov ah , 2
mov dl , max
add dl,30h
int 21h

mov ah,4Ch
int 21h
end

