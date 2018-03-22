	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_fact_for
	.p2align	4, 0x90
_fact_for:                              ## @fact_for
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
                                        ## implicit-def: %RCX
	.p2align	4, 0x90
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	imulq	%rcx, %rax
	addq	$2, %rcx
	cmpq	%rdi, %rcx
	jle	LBB0_1
## BB#2:
	popq	%rbp
	retq
	.cfi_endproc


.subsections_via_symbols
