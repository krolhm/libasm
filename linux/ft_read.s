%define		SYS_READ 0
%define		SYS_WRITE 1

segment		.text
global		ft_read
extern		__errno_location

;ft_read	(rdi, rsi, rdx)
ft_read:
	mov 	rax, SYS_READ
	syscall
    cmp     rax, 0
	jl		exit_error
	ret

exit_error:
	neg     rax
    mov     rdi, rax
    call	__errno_location
    mov		[rax], rdi
    mov		rax, -1
    ret