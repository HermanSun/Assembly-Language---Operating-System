
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
PrintNumber1 db "decimal input value: %d", 10, "hexidecimal input value: %x", 10, 0
PrintNumber2 db "decimal calculation result: %d",10,"hexidecimal calculation result: %x",10,0
Number1 dd 23456789
Number2 dd 00000000

.code
start:

	xor edi, edi
	xor eax, eax
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx

	mov esi, offset Number1
	mov al, [esi+3]
	mov bl, [esi+2]
	mov cl, [esi+1]
	mov dl, [esi]
	
	add edi, eax
	shl ebx, 1
	ADD edi, ebx
	shl ecx, 2
	ADD edi, ecx
	shl edx, 3
	ADD edi, edx
	mov Number2, edi
	


	invoke crt_printf, addr PrintNumber1, Number1, Number1
	invoke crt_printf, addr PrintNumber2, Number2, Number2
	invoke ExitProcess, NULL


end start