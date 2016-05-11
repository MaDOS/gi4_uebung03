SECTION .data
x DW 3
ergebnis DW 0

SECTION .text
global main

main:
push ebp
mov ebp, esp

	push dword [x]
	mov eax, dword [esp]
	mov ebx, dword [esp]
	imul eax
	imul eax, 3
	imul ebx, 4
	add eax, ebx
	sub eax, 5
	mov dword [ergebnis], eax

mov esp, ebp
pop ebp

mov ebx, 0
mov eax, 1
int 0x80
