	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_absdiff_se
	.p2align	4, 0x90
_absdiff_se:                            ## @absdiff_se
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
	movq	%rdi, %rax
	subq	%rsi, %rax
	jge	LBB0_2
## BB#1:
	incq	_lt_cnt(%rip)
	subq	%rdi, %rsi
	movq	%rsi, %rax
	popq	%rbp
	retq
LBB0_2:
	incq	_ge_cnt(%rip)
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_lt_cnt                 ## @lt_cnt
.zerofill __DATA,__common,_lt_cnt,8,3
	.globl	_ge_cnt                 ## @ge_cnt
.zerofill __DATA,__common,_ge_cnt,8,3

.subsections_via_symbols
