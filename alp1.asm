print macro msg
    mov ah,09h
    lea dx,msg
    int 21h
endm

mydata segment
    cr equ 0dh
    lf equ 0ah
    msg1 db cr, lf, 'Enter text: ','$'
    buffer db 100, ?, 100 DUP(?)
mydata ends

mycode segment
        assume cs:mycode, ds:mydata
        start: 
               mov ax, mydata
               mov ds, ax 
               
               print msg1
               
               mov ah, 0ah
               mov dx, offset buffer
               int 21h
               mov bh, 00h
               mov bl, buffer[1]
               
               mov buffer[bx+2], '$'
               mov buffer[0],0dh
               mov buffer[1],0ah
               print buffer
         stop: 
               mov ax, 4c00h
               int 21h
mycode ends
end start
;****length is stored in 2nd byte***
;write a program to display length of the string

;read a character user 01h and display its corresponding  ascii value