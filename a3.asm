SECTION .data
x DD 4
ergebnis DD 0
koeffizient DD 33,2,7

SECTION .text
global main
extern printf

main:
push ebp
mov ebp, esp

        mov ebx, dword [koeffizient]	; ebx = &koeffizient
	mov eax, x			; eax = x
	imul eax 			; x²
	imul eax, dword [ebx + 0 * 2] 	; eax *= ebx + 0 * 2 (ebx-base, 0-index, 2-scale)
	push eax 			; save eax=ax² on stack
	mov eax, x			; eax = x
	imul eax, dword [ebx + 1 * 2]	; eax *= ebx + 0 * 2 
	push  eax			; save eax = bx
	mov eax, dword [ebx + 2 * 2]	; eax = c
	add eax, dword [esp]		; eax += current stack value(= bx)
	dec esp				; decrement stackpointer
	add eax, dword [esp] 		; eax += current stack value(= ax²)
	mov dword [ergebnis], eax	; save eax in ergebnis(= c+bx+ax²)

	push eax
	call printf
	add esp, 4

mov esp, ebp
pop ebp

mov ebx, 0
mov eax, 1
int 0x80

