TITLE Assignment1    (Assignment1.asm)

; Author: Michael Payne
; Last Modified: 07/09/2019
; OSU email address: paynemi
; Course number/section: CS271
; Project Number: project1             Due Date:07/14/2019
; Description: This program will ask for two integers from the user.  It will then take the two integers and add,
; subtract (subtract the second integer from the first one), multiply, and divide (divide second integer from first one) them
; It then prints the results of each operation and says goodbye to the user.

INCLUDE Irvine32.inc

; (insert constant definitions here)

.data

intro_1			BYTE		"Hey, my name is Michael Payne.  Let's do some simple arithmetic.", 0		;
intro_2			BYTE		"Enter 2 numbers, and I'll show you the sum, difference, product, quotient, and remainder.", 0
question_1		BYTE		"Number 1:",0
question_2		BYTE		"Number 2:",0
addition		BYTE		" + ",0
subtraction		BYTE		" - ",0
division		BYTE		" / ",0
multi			BYTE		" * ",0
equals			BYTE		" = ",0
remainder		BYTE		" remainder ",0
farewell		BYTE		"Goodbye!",0

number_1		DWORD	?		; first number that user inputs
number_2		DWORD	?		; second number that user inputs
mathResult		DWORD	?		; result of whatever operation is done to two integers
remainderResult	DWORD	?		; remainder when first integer is divided by second integer


.code

main PROC

; (insert executable instructions here)

; (print intro message)

	call	intro_subroutine		; I used an intro subroutine like the one in your example program

; (get two numbers from user)

	mov edx, offset question_1			; offset of question_1 to edx
	call	WriteString					; print question_1
	call	ReadInt						; read integer in eax
	mov	number_1, eax					; move user input to number_1
	mov edx, offset question_2			; offset of question_2 to edx
	call	WriteString					; print question_2
	call	ReadInt						; read integer in eax
	mov	number_2, eax					; move user input to number_2

; (addition)

	mov		eax, number_1				; number_1 to eax so addition can be done
	add		eax, number_2				; add number_2 to eax (which has value of number_1)
	mov		mathResult, eax				; eax to mathResult
	mov		eax, number_1				; number_1 to eax
	call	WriteDec					; print number_1
	mov		edx, offset addition		; offset of addition to edx
	call	WriteString					; print addition
	mov		eax, number_2				; number_2 to eax
	call	WriteDec					; print number_2
	mov		edx, offset equals			; offset of equals to edx
	call	WriteString					; print equals
	mov		eax, mathResult				; mathResult to eax
	CALL	WriteDec					; print mathResult
	call	CrLf						; add line or break point

;(subtraction)

	mov		eax, number_1				; number_1 to eax
	sub		eax, number_2				; subtract number_2 from number_1
	mov		mathResult, eax				; result of subtraction to mathResult
	mov		eax, number_1				; all of this is identical to how results of addition were printed
	call	WriteDec
	mov		edx, offset subtraction
	call	WriteString
	mov		eax, number_2
	call	WriteDec
	mov		edx, offset equals
	call	WriteString
	mov		eax, mathResult
	CALL	WriteDec
	call	CrLf

;(multiplication)
	
	mov		eax, number_1				; number_1 to eax
	mov		ebx, number_2				; number_2 to ebx
	xor		edx,edx						; clearing edx since overflow of multiplication goes to edx
	mul		ebx							; multiplying number_1 by number_2
	mov		mathResult, eax				; result of multiplication to mathResult
	mov		eax, number_1				; All of this is identical to how addition and subtraction were printed out
	call	WriteDec
	mov		edx, offset multi
	call	WriteString
	mov		eax, number_2
	call	WriteDec
	mov		edx, offset equals
	call	WriteString
	mov		eax, mathResult
	CALL	WriteDec
	call	CrLf

;(division)
	
	mov		eax, number_1				; number_1 to eax
	mov		ebx, number_2				; number_2 to ebx
	xor		edx,edx						; clearing edx since remainder of division is stored there
	div		ebx							; dividing number_1 by number_2
	mov		mathResult, eax				; result of division to mathResult
	mov		remainderResult, edx		; remainder of division to remainderResult
	mov		eax, number_1				; I will mention differences of printing division where appropriate
	call	WriteDec
	mov		edx, offset division
	call	WriteString
	mov		eax, number_2
	call	WriteDec
	mov		edx, offset equals
	call	WriteString
	mov		eax, mathResult
	CALL	WriteDec
	mov		edx, offset remainder		; offset of remainder to edx
	call	WriteString					; printing remainder (the word)
	mov		eax, remainderResult		; remainderResult to eax
	call	WriteDec					; printing remainderResult (the actual remainder generated from division)
	call	CrLf			

;(saying goodbye)
	mov edx, offset farewell		; offset of farewell to edx
	call	WriteString				; printing farewell
	call	CrLf					; break point space whatever

	exit							; exit to operating system

main ENDP

; (insert additional procedures here)

; This subroutine prints a welcome message for the user
intro_subroutine        PROC
	mov		edx, OFFSET intro_1		; offset of intro_1 to edx
	call	WriteString				; print intro_1
	call	CrLf					; add new line
	mov		edx, OFFSET intro_2		; offset of intro_2 to edx
	call	WriteString				; print intro_2
	call	CrLf					; add new line

	ret								; return to main
intro_subroutine	ENDP

END main
