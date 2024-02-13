.686 
.model flat,stdcall 
 
.stack 100h 
 
.data 
X dw -13;
Y dw 26;
Z dw 15;
M dw ?;
mult db 5;
 
.code 
ExitProcess PROTO STDCALL :DWORD 
Start: 
xor eax,eax; Обнуление регистра eAx
xor ebx,ebx; Обнуление регистра eBx
xor ecx,ecx; Обнуление регистра eCx

mov cx, X; Передача значения X в региситр cx 
mov bx, Y; Передача значения Y в региситр bx 
mov ax, Z; Передача значения Z в региситр ax 

shl ax, 3; Сдвиг значения Z на 3 бита влево
mul mult; Умножение Z' на 5
sub ax, cx; Вычитание X из (Z'*5)
add ax, 1; Добавление 1 к (Z'*5-X)

or cx, bx; X or Y
add ax,cx; Сложение (Z'*5-X+1) и (X or Y)
mov M, ax; Передача результата в M из регистра ax
 
exit: 
Invoke ExitProcess, M 
End Start