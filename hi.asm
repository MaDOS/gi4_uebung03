;simple hello world programm to get used to asm und syscalls

SECTION .data
msg db "Hi", 0
len equ $ - msg

SECTION .text
global main

main:
	mov edx, len
	mov ecx, msg
	mov ebx, 1
	mov eax, 4
	int 0x80
mov eax, 1
int 0x80

