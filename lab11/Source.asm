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
xor eax,eax; ��������� �������� eAx
xor ebx,ebx; ��������� �������� eBx
xor ecx,ecx; ��������� �������� eCx

mov cx, X; �������� �������� X � �������� cx 
mov bx, Y; �������� �������� Y � �������� bx 
mov ax, Z; �������� �������� Z � �������� ax 

shl ax, 3; ����� �������� Z �� 3 ���� �����
mul mult; ��������� Z' �� 5
sub ax, cx; ��������� X �� (Z'*5)
add ax, 1; ���������� 1 � (Z'*5-X)

or cx, bx; X or Y
add ax,cx; �������� (Z'*5-X+1) � (X or Y)
mov M, ax; �������� ���������� � M �� �������� ax
 
exit: 
Invoke ExitProcess, M 
End Start