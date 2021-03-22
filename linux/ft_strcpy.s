segment		.text
global		ft_strcpy
extern		ft_strlen

;ft_strcpy(dst, src)
ft_strcpy:
	push 	rdi				; top of the stack
	mov 	rdi, rsi
	call 	ft_strlen 		; result in rax
	mov 	rcx, rax
	pop 	rdi				; get rdi
	cld						; clear flag DF (security) DF = 0 = increment for rep, DF = 1 = decrement for rep
	mov 	rax, rdi
	rep 	movsb			; get string from rsi and set it to rdi at rep, rep incres automaticaly until rsi on movsb isn't 0 
	mov 	BYTE [rdi], 0	; test end
	jmp 	exit

exit:
	ret


;MEMO
;rax = registre general, accumulateur, contient la valeur de retour des fonctions
;rdi = 1er argument
;rsi = 2eme arg
;rcx = 4eme