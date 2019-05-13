	[BITS 64]

	global memset

	section .text

memset:

	push 	rbp
	mov	rbp, rsp
	push	rdi
	xor	rcx, rcx

_core:

	cmp 	dl, 0
	jz	_end
	cmp	byte[rdi + rcx], 0
	jz	_end
	mov	byte[rdi + rcx], sil
	inc 	rcx
	dec	dl
	jmp	_core

_end:	

	xor	rax, rax
	mov	rax, rdi
	pop	rdi
	mov	rsp, rbp
	pop	rbp

	ret
