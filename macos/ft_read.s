%define SYS_READ 0x2000003
%define SYS_WRITE 0x2000004

segment		.text
global		_ft_read
extern		___error

;ft_read	(rdi, rsi, rdx)
_ft_read:
	mov 	rax, SYS_READ
	syscall
	jc		exit_error
	ret

exit_error:
	push	rax
    call	___error
    pop		rdx
    mov		[rax], rdx
    mov		rax, -1
    ret