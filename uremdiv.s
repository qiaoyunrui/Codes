	.file	"uremdiv.c"
	.text
	.globl	uremdiv
	.type	uremdiv, @function
uremdiv:
.LFB0:
	.cfi_startproc
	movq	%rdi, %rax
	movq	%rdx, %rdi
	movl	$0, %edx
	divq	%rsi
	movq	%rax, (%rdi)
	movq	%rdx, (%rcx)
	ret
	.cfi_endproc
.LFE0:
	.size	uremdiv, .-uremdiv
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
