	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_fact_whlie
	.p2align	4, 0x90
_fact_whlie:                            ## @fact_whlie
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
	movl	$1, %eax
	cmpq	$2, %rdi
	jl	LBB0_2
	.p2align	4, 0x90
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	imulq	%rdi, %rax
	decq	%rdi
	cmpq	$1, %rdi
	jg	LBB0_1
LBB0_2:
	popq	%rbp
	retq
	.cfi_endproc


.subsections_via_symbols
