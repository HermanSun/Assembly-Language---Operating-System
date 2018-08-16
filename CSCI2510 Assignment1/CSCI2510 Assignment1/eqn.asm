.386
.model flat, stdcall
option casemap:none

include windows.inc
include kernel32.inc

include masm32.inc
includelib masm32.lib

.data
Message db "Name: SUN WUFAN",10,"SID: 1155047154", 10, "Major: IBBA",10,0
.code
start:
	invoke StdOut, addr Message
	invoke ExitProcess, NULL
end start
	
