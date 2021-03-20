segment .text
	global _ft_strdup
	extern _ft_strlen
	extern _ft_strcpy
	extern _malloc

;ft_strdup(const char rdi)
_ft_strdup:
	call	_ft_strlen		; get len
	add		rax, 1			; 1 for \0
	push	rdi				; save in stack
	mov		rdi, rax		; set len for malloc
	call	_malloc			; call malloc, return in rax
	pop		r9				; get rdi stocked on stack
	mov		rdi, rax		; set the string malloced in rax to rdi
	mov		rsi, r9			; get rdi stocked in r9 on rsi
	call	_ft_strcpy		; ft_strcpy (rdi, rsi)
	ret
