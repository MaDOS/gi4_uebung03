SECTION .text
global main

main:
push ebp
mov ebp, esp

	push 2
	mov eax, [esp]
	mov ebx, [esp]
	imul eax
	imul eax, 3
	imul ebx, 4
	add eax, ebx
	sub eax, 5

mov esp, ebp
pop ebp

mov ebx, 0
mov eax, 1
int 0x80
