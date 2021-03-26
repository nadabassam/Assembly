;Exchange the content of the following variables Var1 dw 1000h Var2 dw 2000h	
	
	
    MODEL small
	
    .data
    message1 db "The value of var1: " , '$'
    message2 db "The value of var2: ", '$'
    line db "---------------------",0Ah,'$'
    var1 dw "N",0Ah,'$' ;var1 = N
    var2 dw "R",0Ah,'$' ;var2 = R
    ;var1 dw 1000h,0Ah,'$' ;var1 = >
    ;var2 dw 2000h,0Ah,'$' ;var2 = 
    
    
    .code
    mov ax,@data
    mov ds,ax
	
    mov ah,09h
    
    mov dx,offset message1   ;The value of var1:
    int 21h

    mov dx,offset var1   ;var1 = N 
    int 21h
    	
    mov dx,offset message2  ;The value of var2:
    int 21h
    
    mov dx,offset var2   ;var2 = R
    int 21h
    
    mov dx,offset line   
    int 21h
    
    xchg ax,var1            ;ax = var1 >> ax = N , var1 = " "
    xchg var2,ax            ;var2 = ax & ax = var2 >> var2 = N , ax = R
    xchg var1,ax            ;var1= ax & ax = var1 >> var1 = R, ax = " "
	
    mov dx,offset message1   ;The value of var1:
    int 21h
    
    mov dx,offset var1   ;var1 = R
    int 21h
    	
    mov dx,offset message2  ;The value of var2:
    int 21h
    
    mov dx,offset var2   ;var2 = N
    int 21h
    
     mov ah,4Ch
     mov al,0
     int 21h	
	
end 
