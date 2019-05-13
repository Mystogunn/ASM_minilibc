[BITS 64]

	global strchr

	section .text

strchr:

	push rbp
	mov rbp, rsp

	push rdi

_core:

	cmp 	byte[rdi], sil
	je 	_find
	cmp 	byte[rdi], 0
	jz	_null
	inc	rdi
	jmp 	_core

_null:

	xor	rax, rax
	pop	rdi
	mov	rsp, rbp
	pop	rbp
	jmp	_end
	
_find:

	mov 	rax, rdi
	pop	rdi
	mov	rsp, rbp
	pop	rbp

_end:	

	ret
	
