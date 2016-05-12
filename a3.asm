SECTION .data
x DD 4
ergebnis DD 0
koeffizient DD 33,2,7
msg DB "Ergebnis: %d", 10, 0

SECTION .text
global _start
extern printf

_start:
push ebp
mov ebp, esp

        mov ebx, koeffizient		; ebx = &koeffizient
	mov eax, [x]			; eax = x
	imul eax 			; x²
	imul eax, dword [ebx + 0 * 4] 	; eax *= ebx + 0 * 4 (ebx-base, 0-index, 4-scale)
	push eax 			; save eax=ax² on stack
	mov eax, [x]			; eax = x
	imul eax, dword [ebx + 1 * 4]	; eax *= ebx + 0 * 4 
	push  eax			; save eax = bx
	mov eax, dword [ebx + 2 * 4]	; eax = c
	add eax, dword [esp]		; eax += current stack value(= bx)
	add esp, 4			; stackpointer + 4 
	add eax, dword [esp] 		; eax += current stack value(= ax²)
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
