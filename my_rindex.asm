[BITS 64]

	global rindex

	section .text

rindex:

	push 	rbp
	mov 	rbp, rsp

	xor	rcx, rcx

_count:	

	cmp	byte[rdi + rcx], 0
	jz	_core
	inc	rcx
	jmp	_count
	
_core:
	
	cmp 	byte[rdi + rcx], sil
	je 	_find
	cmp 	rcx, 0
	jz	_null
	dec	rcx	
	jmp 	_core
	

_null:

	xor	rax, rax
	mov	rsp, rbp
	pop	rbp
	jmp	_end

_find:

	cmp	rcx, 0
	jz	_end_find
	inc	rdi
	dec	rcx
	jmp	_find
	
_end_find:

	mov 	rax, rdi
	mov	rsp, rbp
	pop	rbp

_end:	

	ret
	
