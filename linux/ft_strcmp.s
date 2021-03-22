segment		.text
global		ft_strcmp

ft_strcmp:
	mov 	rax, 0
	jmp		comp

comp:
	mov		al, BYTE [rdi]	; get the least significant byte in *rdi* where is stock the value of the char
	mov		bl, BYTE [rsi]	; get the least significant byte in *rsi* where is ...
	cmp		al, 0			; check if rdi
	je		exit
	cmp		bl, 0			; check if rsi
	je		exit
	cmp 	al, bl			; compare al and bl
	jne 	exit			; if diff 0 == string diff
	inc 	rdi				; increment the rdi pointer
	inc 	rsi
	jmp 	comp			; as long as identical

exit:
	movzx	rax, al
    movzx	rbx, bl
    sub		rax, rbx		; stock the difference of rax and rbx in rax
	ret						; return rax


;MEMO
;rax = registre general, accumulateur, contient la valeur de retour des fonctions
;rdi = 1er argument
;rsi = 2eme arg
;rcx = 4eme
;movzx = copy a register of inferior size in a bigger and fill the other bits with 0