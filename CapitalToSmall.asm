Dosseg 
.model small 

.data 
string db 'This is A message','$' 

.code 
main: 
mov ax,@data 
mov ds,ax 

;SI register must be used toto read char by char
mov si,0
mov ah,2 

lp:
mov dl,[string +si]

;Check if char => space
cmp dl,' '
je S

cmp dl,'a'                                           ;a = 61h, A = 41h so if dl < a .. may be upper case
jb X 

cmp dl,'z' 
ja unchanged 

;convert from Lower to upper
sub dl,20h                                          ;a = 61h >> 61h-20h = 41h = A
mov ah,2
int 21h                                                ;print the char after convert it to upper
;and 11011111
inc si
cmp si,17                                            ;the string contains 17 char
jne lp
jmp unchanged 


X: 

cmp dl,'A' 
jb unchanged                                    ;if al < 41 .. it is number || any symbols

cmp dl,'Z' 
ja unchanged 

;convert from upper to lower
add dl,20h                                       ;A = 41h >> 41h + 20h =   61h = a
mov ah,2
int 21h
;or dl,00100000
inc si
cmp si,17
jne lp
jmp unchanged 


S:
mov ah,2                                        
int 21h                                             ;print the space 
inc si 
cmp si,17
je unchanged
jmp lp                                              ;go to lp to continue

unchanged:                                  
mov ah,2 
mov al,dl 
int 21h 

mov ah,4ch 
int 21h 
end main