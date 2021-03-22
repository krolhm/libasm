%define SYS_READ 0
%define SYS_WRITE 1

segment		.text
global		ft_write
extern		__errno_location

;ft_write (rdi, rsi, rdx)
ft_write:
	mov		rax, SYS_WRITE
    syscall					; call rax
	cmp		rax, 0
	jl		exit_error
	ret

exit_error:
	neg		rax
	mov		rdi, rax
    call	__errno_location
    mov 	[rax], rdi
    mov		rax, -1
    ret