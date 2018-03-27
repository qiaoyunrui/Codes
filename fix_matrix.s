	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_fix_prod_ele
	.p2align	4, 0x90
_fix_prod_ele:                          ## @fix_prod_ele
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
	shlq	$6, %rdx
	addq	%rdx, %rdi
	addq	%rsi, %rdx
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	(%rdx,%rcx,4), %esi
	imull	(%rdi,%rcx,4), %esi
	addl	%esi, %eax
	incq	%rcx
	cmpq	$16, %rcx
	jne	LBB0_1
## BB#2:
                                        ## kill: %EAX<def> %EAX<kill> %RAX<kill>
	popq	%rbp
	retq
	.cfi_endproc


.subsections_via_symbols
