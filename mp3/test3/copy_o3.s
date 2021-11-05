	.text
	.file	"copy_o3.ll"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	callq	Main_new@PLT
	movq	%rax, %rdi
	callq	Main_main@PLT
	xorl	%eax, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	Main_main                       # -- Begin function Main_main
	.p2align	4, 0x90
	.type	Main_main,@function
Main_main:                              # @Main_main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, -32(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -48(%rbp)
	callq	AA_new@PLT
	movq	%rax, -40(%rbp)
	testq	%rax, %rax
	je	.LBB1_21
# %bb.1:                                # %ok.0
	movq	(%rax), %rcx
	movl	(%rcx), %ecx
	movq	%rsp, %rbx
	addq	$-16, %rbx
	movq	%rbx, %rsp
	cmpl	$7, %ecx
	jl	.LBB1_5
# %bb.2:                                # %src_gte_br.7.0
	jle	.LBB1_3
.LBB1_5:                                # %br_exit.7.0
	testl	%ecx, %ecx
	js	.LBB1_21
# %bb.6:                                # %src_gte_br.0.0
	cmpl	$7, %ecx
	jg	.LBB1_21
# %bb.7:                                # %src_lte_mc.0.0
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	movq	-32(%rbp), %rdi
	testq	%rdi, %rdi
	je	.LBB1_21
# %bb.8:                                # %ok.2
	movq	(%rdi), %rax
	movq	String.1@GOTPCREL(%rip), %rsi
	callq	*48(%rax)
	movq	%rax, (%rbx)
	jmp	.LBB1_9
.LBB1_3:                                # %src_lte_mc.7.0
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	testq	%rax, %rax
	je	.LBB1_21
# %bb.4:                                # %ok.1
	movq	(%rax), %rcx
	movq	%rax, %rdi
	movl	$42, %esi
	callq	*48(%rcx)
	movl	%eax, %r14d
	callq	Int_new@PLT
	movq	%rax, %r15
	movq	%rax, %rdi
	movl	%r14d, %esi
	callq	Int_init@PLT
	movq	%r15, (%rbx)
.LBB1_9:                                # %case.exit.0
	movq	-40(%rbp), %rdi
	testq	%rdi, %rdi
	je	.LBB1_21
# %bb.10:                               # %ok.3
	movq	(%rdi), %rax
	callq	*40(%rax)
	movq	%rax, -48(%rbp)
	testq	%rax, %rax
	je	.LBB1_21
# %bb.11:                               # %ok.4
	movq	(%rax), %rcx
	movl	(%rcx), %ecx
	movq	%rsp, %rbx
	addq	$-16, %rbx
	movq	%rbx, %rsp
	cmpl	$7, %ecx
	jl	.LBB1_16
# %bb.12:                               # %src_gte_br.7.1
	jle	.LBB1_13
.LBB1_16:                               # %br_exit.7.1
	testl	%ecx, %ecx
	js	.LBB1_21
# %bb.17:                               # %src_gte_br.0.1
	cmpl	$7, %ecx
	jg	.LBB1_21
# %bb.18:                               # %src_lte_mc.0.1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	movq	-32(%rbp), %rdi
	testq	%rdi, %rdi
	je	.LBB1_21
# %bb.19:                               # %ok.7
	movq	(%rdi), %rax
	movq	String.2@GOTPCREL(%rip), %rsi
	callq	*48(%rax)
	jmp	.LBB1_20
.LBB1_13:                               # %src_lte_mc.7.1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	testq	%rax, %rax
	je	.LBB1_21
# %bb.14:                               # %ok.5
	movq	(%rax), %rcx
	movq	%rax, %rdi
	callq	*56(%rcx)
	movq	-32(%rbp), %rdi
	testq	%rdi, %rdi
	je	.LBB1_21
# %bb.15:                               # %ok.6
	movq	(%rdi), %rcx
	movl	%eax, %esi
	callq	*56(%rcx)
.LBB1_20:                               # %case.exit.1
	movq	%rax, (%rbx)
	movq	-32(%rbp), %rax
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB1_21:                               # %abort
	.cfi_def_cfa %rbp, 16
	callq	abort@PLT
.Lfunc_end1:
	.size	Main_main, .Lfunc_end1-Main_main
	.cfi_endproc
                                        # -- End function
	.globl	Main_new                        # -- Begin function Main_new
	.p2align	4, 0x90
	.type	Main_new,@function
Main_new:                               # @Main_new
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	Main_vtable_prototype@GOTPCREL(%rip), %rbx
	movl	4(%rbx), %edi
	callq	malloc@PLT
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end2:
	.size	Main_new, .Lfunc_end2-Main_new
	.cfi_endproc
                                        # -- End function
	.globl	A_new                           # -- Begin function A_new
	.p2align	4, 0x90
	.type	A_new,@function
A_new:                                  # @A_new
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	A_vtable_prototype@GOTPCREL(%rip), %r14
	movl	4(%r14), %edi
	callq	malloc@PLT
	movq	%rax, %rbx
	movq	%r14, (%rax)
	movq	%rax, (%rsp)
	movl	$0, 8(%rax)
	movb	$0, 12(%rax)
	callq	String_new@PLT
	movq	%rax, 16(%rbx)
	movl	$0, 24(%rbx)
	movq	%rbx, %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end3:
	.size	A_new, .Lfunc_end3-A_new
	.cfi_endproc
                                        # -- End function
	.globl	AA_set                          # -- Begin function AA_set
	.p2align	4, 0x90
	.type	AA_set,@function
AA_set:                                 # @AA_set
	.cfi_startproc
# %bb.0:                                # %entry
	movl	%esi, %eax
	movq	%rdi, -8(%rsp)
	movl	%esi, -12(%rsp)
	movl	%esi, 32(%rdi)
	retq
.Lfunc_end4:
	.size	AA_set, .Lfunc_end4-AA_set
	.cfi_endproc
                                        # -- End function
	.globl	AA_get                          # -- Begin function AA_get
	.p2align	4, 0x90
	.type	AA_get,@function
AA_get:                                 # @AA_get
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	32(%rdi), %eax
	retq
.Lfunc_end5:
	.size	AA_get, .Lfunc_end5-AA_get
	.cfi_endproc
                                        # -- End function
	.globl	AA_new                          # -- Begin function AA_new
	.p2align	4, 0x90
	.type	AA_new,@function
AA_new:                                 # @AA_new
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	AA_vtable_prototype@GOTPCREL(%rip), %r14
	movl	4(%r14), %edi
	callq	malloc@PLT
	movq	%rax, %rbx
	movq	%r14, (%rax)
	movq	%rax, (%rsp)
	movl	$0, 8(%rax)
	movb	$0, 12(%rax)
	callq	String_new@PLT
	movq	%rax, 16(%rbx)
	movl	$0, 24(%rbx)
	movb	$0, 28(%rbx)
	movl	$0, 32(%rbx)
	movq	%rbx, %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end6:
	.size	AA_new, .Lfunc_end6-AA_new
	.cfi_endproc
                                        # -- End function
	.type	str.Object,@object              # @str.Object
	.section	.rodata,"a",@progbits
str.Object:
	.asciz	"Object"
	.size	str.Object, 7

	.type	Object_vtable_prototype,@object # @Object_vtable_prototype
	.globl	Object_vtable_prototype
	.p2align	4
Object_vtable_prototype:
	.long	0                               # 0x0
	.long	0+8
	.quad	str.Object
	.quad	Object_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.size	Object_vtable_prototype, 48

	.type	str.Int,@object                 # @str.Int
str.Int:
	.asciz	"Int"
	.size	str.Int, 4

	.type	Int_vtable_prototype,@object    # @Int_vtable_prototype
	.globl	Int_vtable_prototype
	.p2align	4
Int_vtable_prototype:
	.long	1                               # 0x1
	.long	0+16
	.quad	str.Int
	.quad	Int_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.size	Int_vtable_prototype, 48

	.type	str.Bool,@object                # @str.Bool
str.Bool:
	.asciz	"Bool"
	.size	str.Bool, 5

	.type	Bool_vtable_prototype,@object   # @Bool_vtable_prototype
	.globl	Bool_vtable_prototype
	.p2align	4
Bool_vtable_prototype:
	.long	2                               # 0x2
	.long	0+16
	.quad	str.Bool
	.quad	Bool_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.size	Bool_vtable_prototype, 48

	.type	str.String,@object              # @str.String
str.String:
	.asciz	"String"
	.size	str.String, 7

	.type	String_vtable_prototype,@object # @String_vtable_prototype
	.globl	String_vtable_prototype
	.p2align	4
String_vtable_prototype:
	.long	3                               # 0x3
	.long	(0+8)*2
	.quad	str.String
	.quad	String_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.quad	String_length
	.quad	String_concat
	.quad	String_substr
	.size	String_vtable_prototype, 72

	.type	str.IO,@object                  # @str.IO
str.IO:
	.asciz	"IO"
	.size	str.IO, 3

	.type	IO_vtable_prototype,@object     # @IO_vtable_prototype
	.globl	IO_vtable_prototype
	.p2align	4
IO_vtable_prototype:
	.long	4                               # 0x4
	.long	0+8
	.quad	str.IO
	.quad	IO_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.quad	IO_out_string
	.quad	IO_out_int
	.quad	IO_in_string
	.quad	IO_in_int
	.size	IO_vtable_prototype, 80

	.type	str.Main,@object                # @str.Main
str.Main:
	.asciz	"Main"
	.size	str.Main, 5

	.type	Main_vtable_prototype,@object   # @Main_vtable_prototype
	.globl	Main_vtable_prototype
	.p2align	4
Main_vtable_prototype:
	.long	5                               # 0x5
	.long	0+8
	.quad	str.Main
	.quad	Main_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.quad	IO_out_string
	.quad	IO_out_int
	.quad	IO_in_string
	.quad	IO_in_int
	.quad	Main_main
	.size	Main_vtable_prototype, 88

	.type	str.A,@object                   # @str.A
str.A:
	.asciz	"A"
	.size	str.A, 2

	.type	A_vtable_prototype,@object      # @A_vtable_prototype
	.globl	A_vtable_prototype
	.p2align	4
A_vtable_prototype:
	.long	6                               # 0x6
	.long	0+32
	.quad	str.A
	.quad	A_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.size	A_vtable_prototype, 48

	.type	str.AA,@object                  # @str.AA
str.AA:
	.asciz	"AA"
	.size	str.AA, 3

	.type	AA_vtable_prototype,@object     # @AA_vtable_prototype
	.globl	AA_vtable_prototype
	.p2align	4
AA_vtable_prototype:
	.long	7                               # 0x7
	.long	0+40
	.quad	str.AA
	.quad	AA_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.quad	AA_set
	.quad	AA_get
	.size	AA_vtable_prototype, 64

	.type	str.3,@object                   # @str.3
str.3:
	.asciz	"<basic class>"
	.size	str.3, 14

	.type	String.3,@object                # @String.3
	.globl	String.3
	.p2align	3
String.3:
	.quad	String_vtable_prototype
	.quad	str.3
	.size	String.3, 16

	.type	str.2,@object                   # @str.2
str.2:
	.asciz	"Error2\n"
	.size	str.2, 8

	.type	String.2,@object                # @String.2
	.globl	String.2
	.p2align	3
String.2:
	.quad	String_vtable_prototype
	.quad	str.2
	.size	String.2, 16

	.type	str.1,@object                   # @str.1
str.1:
	.asciz	"Error1\n"
	.size	str.1, 8

	.type	String.1,@object                # @String.1
	.globl	String.1
	.p2align	3
String.1:
	.quad	String_vtable_prototype
	.quad	str.1
	.size	String.1, 16

	.type	str.0,@object                   # @str.0
str.0:
	.asciz	"copy_o3.cl"
	.size	str.0, 11

	.type	String.0,@object                # @String.0
	.globl	String.0
	.p2align	3
String.0:
	.quad	String_vtable_prototype
	.quad	str.0
	.size	String.0, 16

	.section	".note.GNU-stack","",@progbits
