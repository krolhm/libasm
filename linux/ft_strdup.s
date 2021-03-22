segment		.text
global		ft_strdup
extern		ft_strlen
extern		ft_strcpy
extern		malloc

;ft_strdup(const char rdi)
ft_strdup:
	call	ft_strlen		; get len
	add		rax, 1			; 1 for \0
	push	rdi				; save in stack
	mov		rdi, rax		; set len for malloc
	call	malloc			; call malloc, return in rax
	pop		r9				; get rdi stocked on stack
	mov		rdi, rax		; set the string malloced in rax to rdi
	mov		rsi, r9			; get rdi stocked in r9 on rsi
	call	ft_strcpy		; ft_strcpy (rdi, rsi)
	ret
