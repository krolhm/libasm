%define SYS_READ 0
%define SYS_WRITE 1

segment .text
	global _ft_write

;ft_write (rdi, rsi, rdx)
_ft_write:
	mov r8, rdx				; save len in r8
	mov rax, SYS_WRITE
    syscall					; call rax
		jc exit_error
	jmp exit

exit_error:
	mov rax, -1
	ret

exit:
	mov rax, r8
	ret