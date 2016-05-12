SECTION .data
x DD 4
ergebnis DD 0
koeffizient DD 33,2,7
msg DB "Ergebnis: %d", 10, 0

SECTION .text
global _start
extern printf

_start: ;horner-schema: ax²+bx+c = c+x(b+x(a))
push ebp
mov ebp, esp

        mov ebx, koeffizient		; ebx = &koeffizient
	mov eax, dword [ebx + 0 * 4]	; eax = a
	imul eax, [x]			; eax *= x
	add eax, dword [ebx + 1 * 4]	; eax += b
	imul eax, [x]			; eax *= x
	add eax, dword [ebx + 2 * 4]	; eax += c

	mov dword [ergebnis], eax	; save eax in ergebnis(= c+bx+ax²)

	push dword [ergebnis]
	push msg
	call printf
	add esp, 8

mov esp, ebp
pop ebp

mov ebx, 0
mov eax, 1
int 0x80
