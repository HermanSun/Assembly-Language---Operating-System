
.386
.model flat, stdcall
option casemap:none

include windows.inc
include kernel32.inc
include user32.inc

include msvcrt.inc
includelib msvcrt.lib

include masm32.inc
includelib masm32.lib


.data
i DD 50000
n DD 2
k DD 2
j DD 0

Message db "The answer is: %d", 10, 0
ScanFormat db "%d",0


.code
start: 


	MOV eax, i
	mov ebx, n
REPEATWHILE:
	CMP j, eax
	jnl ENDWHILE

	call SUB1
	inc ebx
	jmp REPEATWHILE
	

SUB1: mov ecx, k
REPEATFOR: 
	cmp ecx, ebx
	jnl ENDFOR
	
	push eax
	mov eax, ebx
	push ebx
	mov ebx, ecx
	xor edx, edx
	idiv ebx
	pop ebx
	pop eax
	cmp edx, 0
	je ENDFOR
	inc ecx
	jmp REPEATFOR
	
	
ENDFOR: 
	
	cmp ecx, ebx
	jne ELSEBLK2
	inc j
	jmp ENDOFIF2

ELSEBLK2:
	RET
ENDOFIF2:


	RET

	
ENDWHILE: sub ebx, 1




	MOV n, ebx
	invoke crt_printf, addr Message, n
	
	invoke ExitProcess, NULL


end start