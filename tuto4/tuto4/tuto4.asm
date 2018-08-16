.386					; target processor
.model flat, stdcall	; use the flat memory model. use standard calling conventions
option casemap:none		; case sensitive to avoid messing up function names

; include libraries
include windows.inc 
include kernel32.inc 
include user32.inc 

include msvcrt.inc
includelib msvcrt.lib


.data					; create a near data segment. local variables are declared after this directive

SINGLEBYTE	DB	0Ah					; B for  8-bit Byte
TWOBYTE		DW	1234h				; W for 16-bit Word
FOURBYTE	DD	11223344h			; D for 32-bit Double-word
EIGHTBYTE	DQ	123456789abcdef0h	; Q for 64-bit Quad-word

FIVEWORD	DW	1, 2, 3, 4, 5
SIXWORD		DW	6 DUP(5678h)		; use DUP to duplicate
NINEBYTE	DB	3 DUP(99h), 'W', 'X', 2 DUP(?), 'Y', 'Z'

FORMAT      DB	"MONEY = %d (base 10)", 10, 0
BYEBYE		DB	"Press <Enter> to close this window and terminate this program...", 0

PI			EQU	3.14159
MONEY       EQU 109700


.code					; indicates the start of a code segment.

start:

	; Addressing Mode Experiments
	
	; immediate
	mov eax, 258147					; decimal
	mov al, 11101111b				; binary
	mov eax, 0a34abcdfh				; hexadecimal
	mov eax, MONEY					; symbolic constant
	mov eax, offset FOURBYTE		; data address label
	;mov eax, FOURBYTE?
	
	; register
	xor esi, esi					; clear esi to zero, faster than "mov esi, 0"
	
	; direct address
	mov eax, [FOURBYTE]				; data address label
	mov eax, FOURBYTE				; brackets are optional, but we prefer writing the brackets for clarity

	; indirect address
	mov ebp, offset FIVEWORD
	mov esi, 1
	mov eax, [ebp]					; register indirect
	mov eax, [ebp + 1]				; base with displacement
	mov eax, [ebp + esi*4]			; base with index
	mov eax, [ebp + esi*4 + 1]		; base with index and displacement

	; Review: call functions
	invoke crt_printf, addr FORMAT, MONEY
	invoke crt_printf, addr BYEBYE
	invoke crt_getchar
	invoke ExitProcess, NULL

end start
