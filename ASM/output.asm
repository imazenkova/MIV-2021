.586
.model flat, stdcall
includelib libucrt.lib
includelib kernel32.lib
includelib ../MIV-2021/Debug/StaticLibrary.lib
ExitProcess PROTO :DWORD

EXTRN slen: proc
EXTRN strtobyte: proc
EXTRN BREAKL: proc
EXTRN OutputInt: proc
EXTRN OutputStr: proc
EXTRN OutputIntLn: proc
EXTRN OutputStrLn: proc

.stack 4096

.const
	L1 SDWORD 1
	L2 BYTE " ", 0
	L3 BYTE "Считаем до 10: ", 0
	L4 SDWORD 10
	L5 SDWORD 45
	L6 SDWORD 2
	L7 BYTE "45 четное? : ", 0
	L8 SDWORD 0
	L9 BYTE "правда", 0
	L10 BYTE "ложь", 0
	L11 SDWORD 5
	L12 BYTE "incr(5) = ", 0
	L13 BYTE "29", 0
	L14 BYTE "Строка 29 в число + 2: ", 0
	L15 BYTE "Длина строки: ", 0
	L16 SDWORD 86
	L17 BYTE "o126 = ", 0
	L18 SDWORD 3

.data
	buffer BYTE 256 dup(0)
	counti SDWORD 0
	incrres SDWORD 0
	maint SDWORD 0
	maini SDWORD 0
	mainstr DWORD ?
	mainnum SDWORD 0
	mainlen SDWORD 0
	mainocto SDWORD 0
	mainn SDWORD 0
	mainres SDWORD 0

.code

count PROC countn : SDWORD
	push L1
	pop counti
	mov eax, counti
	cmp eax, countn
	jl cycle0
	jmp cyclenext0
cycle0:
	push counti
	call OutputInt
	push offset L2
	call OutputStr
	push counti
	push L1
	pop eax
	pop ebx
	add eax, ebx
	push eax
	pop counti
	mov eax, counti
	cmp eax, countn
	jl cycle0
cyclenext0:
	push counti
	call OutputIntLn
	ret
count ENDP

incr PROC incrn : SDWORD
	push incrn
	push L1
	pop eax
	pop ebx
	add eax, ebx
	push eax
	pop incrres
	push incrres
	jmp local0
local0:
	pop eax
	ret
incr ENDP

main PROC
	push offset L3
	call OutputStrLn
	push L4
	call count
	push L5
	push L6
	pop ebx
	pop eax
	cdq
	idiv ebx
	push edx
	pop maint
	push offset L2
	call OutputStrLn
	push offset L7
	call OutputStr
	mov eax, maint
	cmp eax, L8
	jz m0
	jnz m1
	je m1
m0:
	push offset L9
	call OutputStrLn
	jmp e0
m1:
	push offset L10
	call OutputStrLn
e0:
	push offset L2
	call OutputStrLn
	push L11
	pop maini
	push maini
	pop edx
	push maini
	call incr
	push eax
	pop maini
	push offset L12
	call OutputStr
	push maini
	call OutputIntLn
	push offset L2
	call OutputStrLn
	push offset L13
	pop mainstr
	push offset L14
	call OutputStr
	push mainstr
	pop edx
	push mainstr
	call strtobyte
	push eax
	push L6
	pop eax
	pop ebx
	add eax, ebx
	push eax
	pop mainnum
	push mainnum
	call OutputIntLn
	push mainstr
	pop edx
	push mainstr
	call slen
	push eax
	pop mainlen
	push offset L15
	call OutputStr
	push mainlen
	call OutputIntLn
	push L16
	pop mainocto
	push offset L17
	call OutputStr
	push mainocto
	call OutputIntLn
	push L11
	pop mainn
	push L1
	push mainn
	pop eax
	pop ebx
	add eax, ebx
	push eax
	push L6
	pop ebx 
	pop eax 
	mov cl, bl
	shl eax, cl
	push eax
	push L18
	pop eax
	pop ebx
	mul ebx
	push eax
	push L6
	push L6
	pop ebx
	pop eax
	cdq
	idiv ebx
	push eax
	pop ebx 
	pop eax 
	mov cl, bl
	shr eax, cl
	push eax
	pop mainres
	push mainres
	call OutputIntLn
	call ExitProcess
main ENDP
end main