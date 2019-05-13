	[BITS 64]

	global strncmp

	section .text

strncmp:

	cmp rdi, 0
        je _end2
        cmp rsi, 0
        je _end2
	cmp dl, 0
        je _end2
	push rbp
	mov rbp, rsp

	xor rcx, rcx

_core:

	cmp dl, 0
	je _end
	mov r14b, byte[rdi + rcx]
	mov r15b, byte[rsi + rcx]
	dec dl
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
	sub r14b, r15b
	mov al, r14b
	mov rsp, rbp
	pop rbp

	ret

_end2:

	xor rax, rax
	ret
