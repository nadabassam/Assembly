DOSSEG
.MODEL SMALL

.DATA
String db 'This is A message','$' ;declare string

.CODE

MOV AX, @data
MOV DS, AX

MOV SI,0                   ;string address must be in SI register
MOV AH,2

lp:
MOV DL,[String +SI]       ;loop to turn around the string and put the current char address in DL
XOR DL, 00100000b         ;suppose char = A >> A =  01000001 to convert it using xor >> 01000001 xor 00100000 >> result = 01100001 = a :)
INT 21H                   ;this instruction print the char

INC SI                    ;we have 14 char, 3 spaces so SI = 17, when I convert the first char, I increment the SI value and continue..
CMP SI, 17                ;compare if SI = 17 ? end : jump
JNE lp                    ;if SI != 17 we return to the loop again, otherwise end

MOV AH, 4CH
INT 21H
END
