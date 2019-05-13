	[BITS 64]

	global strcmp

	section .text

strcmp:

	cmp rdi, 0
	je _end2
	cmp rsi, 0
	je _end2
	push rbp
	mov rbp, rsp

	xor rcx, rcx

_core:

	mov r14b, byte[rdi + rcx]
	mov r15b, byte[rsi + rcx]
	cmp r14b, r15b
	je _check
	jne _end

_check:

	cmp r14b, 0
	je _end
	inc rcx
	jmp _core


_end:

	xor rax, rax
	cmp r14b, r15b
	jg  _sup
	jl  _inf
	je  _equal

_inf:

	mov rax, -1
	mov rsp, rbp
	pop rbp

	ret
	
_sup:

	mov rax, 1
	mov rsp, rbp
	pop rbp

	ret
	
_equal:

	xor rax, rax
	mov rsp, rbp
	pop rbp
	ret

_end2:

	xor rax, rax
	ret
