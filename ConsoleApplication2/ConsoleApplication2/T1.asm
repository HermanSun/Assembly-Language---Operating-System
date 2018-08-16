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

MsgCaption db "CSCI 2510 Tutorial 1", 0
MsgBoxText db "Win32 Assembly is Great!", 0

PrintFormat db "String: %s, Int: %d", 10, 0
String db "Tutorial", 0
Number db 2

Message db "CSCI2510 Tutorial 2", 10, 0


.code
start:

	invoke crt_printf, addr PrintFormat, addr String, Number
	invoke StdOut, addr Message
	invoke MessageBox, NULL, addr MsgBoxText, addr MsgCaption, MB_OK
	invoke ExitProcess, NULL



end start
