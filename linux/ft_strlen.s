segment .text						; code
	global _ft_strlen

;ft_strlen(char *s)
_ft_strlen:
	mov 	rax, 0					; init rax
	jmp 	count

count:
	cmp 	BYTE [rdi + rax], 0 	; if arg0 + rax == 0:
	je 		exit
	inc	 	rax						; rax++
	jmp 	count

exit:
	ret

;MEMO
;rax = registre general, accumulateur, contient la valeur de retour des fonctions
;rdi = 1er argument