[BITS 64]

	global memmove

	section .text

memmove:

	cmp	rdi, 0
        je 	_end2
        cmp 	rsi, 0
        je 	_end2
	push	rbp
	mov	rbp, rsp
	push	rdi
	xor	rcx, rcx
	
_core:

	cmp	dl, 0
	jz	_end
	cmp	byte[rsi + rcx], 0
	jz	_end
	mov	r15b, byte[rsi + rcx]
	mov	byte[rdi + rcx], r15b
	inc	rcx
	jmp	_core

_end:

	xor	rax, rax
	mov	rax, rdi
	pop	rdi
	mov	rsp, rbp
	pop	rbp

	ret

_end2:

	xor rax, rax
	ret
