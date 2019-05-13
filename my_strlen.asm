[BITS 64]
	
	global	strlen

	section	.text

strlen:
	push	rbp          		; save and clear out counter
	mov	rbp, rsp
	xor	rsi, rsi		; set value to 0

loop:

	cmp	byte[rdi + rsi], 0	; null byte yet?
	jz	test_null   		; yes, get out

	inc   	rsi			; increment char
	jmp   	loop   			; process again

test_null:

	xor	rax, rax		; set value to 0
	mov   	rax, rsi
	mov	rsp, rbp
	pop  	rbp
	ret                  		; get out
