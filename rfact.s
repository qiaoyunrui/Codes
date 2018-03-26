	.file	"rfact.c"
	.text
	.globl	rfact
	.type	rfact, @function
rfact:
.LFB0:
	.cfi_startproc
	cmpq	$1, %rdi
	jle	.L3
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	leaq	-1(%rdi), %rdi
	call	rfact
	imulq	%rbx, %rax
	jmp	.L2
.L3:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	movl	$1, %eax
	ret
.L2:
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE0:
	.size	rfact, .-rfact
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
