%define SYS_READ 0
%define SYS_WRITE 1

segment .text
	global _ft_read

; ft_read (rdi, rsi, rdx)
_ft_read:
	mov 	rax, SYS_READ
	syscall
		jc exit_error
	jmp exit

exit_error:
	mov 	rax, -1
	ret

exit:
	ret