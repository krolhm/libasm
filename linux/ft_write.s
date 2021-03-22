%define SYS_READ 0
%define SYS_WRITE 1

segment		.text
global		ft_write
extern		___error

;ft_write (rdi, rsi, rdx)
ft_write:
	mov		r8, rdx				; save len in r8
	mov		rax, SYS_WRITE
    syscall					; call rax
	jc		exit_error
	jmp		exit

exit_error:
	push	rax
    call	___error
    pop		rdx
    mov 	[rax], rdx
    mov		rax, -1
    ret

exit:
	mov		rax, r8
	ret