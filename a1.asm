SECTION .data

SECTION .text

:main
	push 2
	mov eax, esp
	mov ebx, esp
	imul eax
	imul eax, 3
	imul ebx, 4
	add eax, ebx
	sub eax, 5
ret
