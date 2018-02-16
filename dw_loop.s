	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_dw_loop
	.p2align	4, 0x90
_dw_loop:                               ## @dw_loop
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
	leaq	(%rdi,%rdi), %rax
	notq	%rax
	leaq	1(%rdi), %rcx
	imulq	%rdi, %rcx
	cmpq	$-3, %rax
	movq	$-2, %rdx
	cmovgq	%rax, %rdx
	leaq	1(%rdx,%rdi,2), %rax
	imulq	%rdi, %rdi
	incq	%rdi
	imulq	%rax, %rdi
	leaq	1(%rcx,%rdi), %rax
	popq	%rbp
	retq
	.cfi_endproc


.subsections_via_symbols
