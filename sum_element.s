	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_sum_element
	.p2align	4, 0x90
_sum_element:                           ## @sum_element
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi0:
	.cfi_def_cfa_offset 16
Lcfi1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi2:
	.cfi_def_cfa_register %rbp
	imulq	$800, %rdi, %rax        ## imm = 0x320
	movq	_P@GOTPCREL(%rip), %rcx
	addq	%rax, %rcx
	addq	_Q@GOTPCREL(%rip), %rax
	movq	(%rax,%rsi,8), %rax
	addq	(%rcx,%rsi,8), %rax
	popq	%rbp
	retq
	.cfi_endproc

	.comm	_P,80000,4              ## @P
	.comm	_Q,80000,4              ## @Q

.subsections_via_symbols
