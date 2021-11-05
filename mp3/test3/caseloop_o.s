	.text
	.file	"caseloop_o.ll"
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
	pushq	%r14
	pushq	%rbx
	subq	$48, %rsp
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rdi, -40(%rbp)
	movl	$0, -24(%rbp)
	movl	$0, -20(%rbp)
	callq	A_new@PLT
	movq	%rax, -56(%rbp)
	callq	Q_new@PLT
	movq	%rax, -48(%rbp)
	movl	$0, -28(%rbp)
	jmp	.LBB1_1
	.p2align	4, 0x90
.LBB1_5:                                # %src_lte_mc.22.1
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$17, %esi
.LBB1_54:                               # %case.exit.1
                                        #   in Loop: Header=BB1_1 Depth=1
	callq	Int_init@PLT
	movq	%rbx, (%r14)
	movq	(%r14), %rax
	movl	8(%rax), %eax
	movl	%eax, -28(%rbp)
	incl	-24(%rbp)
.LBB1_1:                                # %loop.0
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$99, -24(%rbp)
	jg	.LBB1_55
# %bb.2:                                # %true.0
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	-48(%rbp), %rax
	testq	%rax, %rax
	je	.LBB1_118
# %bb.3:                                # %ok.0
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	(%rax), %rcx
	movl	(%rcx), %ecx
	movq	%rsp, %r14
	addq	$-16, %r14
	movq	%r14, %rsp
	cmpl	$22, %ecx
	jl	.LBB1_6
# %bb.4:                                # %src_gte_br.22.1
                                        #   in Loop: Header=BB1_1 Depth=1
	jle	.LBB1_5
.LBB1_6:                                # %br_exit.22.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$21, %ecx
	jl	.LBB1_9
# %bb.7:                                # %src_gte_br.21.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_8
.LBB1_9:                                # %br_exit.21.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$20, %ecx
	jl	.LBB1_12
# %bb.10:                               # %src_gte_br.20.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_11
.LBB1_12:                               # %br_exit.20.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$19, %ecx
	jl	.LBB1_15
# %bb.13:                               # %src_gte_br.19.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_14
.LBB1_15:                               # %br_exit.19.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$18, %ecx
	jl	.LBB1_18
# %bb.16:                               # %src_gte_br.18.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_17
.LBB1_18:                               # %br_exit.18.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$17, %ecx
	jl	.LBB1_21
# %bb.19:                               # %src_gte_br.17.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_20
.LBB1_21:                               # %br_exit.17.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$16, %ecx
	jl	.LBB1_24
# %bb.22:                               # %src_gte_br.16.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_23
.LBB1_24:                               # %br_exit.16.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$15, %ecx
	jl	.LBB1_27
# %bb.25:                               # %src_gte_br.15.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_26
.LBB1_27:                               # %br_exit.15.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$14, %ecx
	jl	.LBB1_30
# %bb.28:                               # %src_gte_br.14.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_29
.LBB1_30:                               # %br_exit.14.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$13, %ecx
	jl	.LBB1_33
# %bb.31:                               # %src_gte_br.13.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_32
.LBB1_33:                               # %br_exit.13.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$12, %ecx
	jl	.LBB1_36
# %bb.34:                               # %src_gte_br.12.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_35
.LBB1_36:                               # %br_exit.12.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$11, %ecx
	jl	.LBB1_39
# %bb.37:                               # %src_gte_br.11.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_38
.LBB1_39:                               # %br_exit.11.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$10, %ecx
	jl	.LBB1_42
# %bb.40:                               # %src_gte_br.10.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_41
.LBB1_42:                               # %br_exit.10.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$9, %ecx
	jl	.LBB1_45
# %bb.43:                               # %src_gte_br.9.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_44
.LBB1_45:                               # %br_exit.9.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$8, %ecx
	jl	.LBB1_48
# %bb.46:                               # %src_gte_br.8.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_47
.LBB1_48:                               # %br_exit.8.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$7, %ecx
	jl	.LBB1_51
# %bb.49:                               # %src_gte_br.7.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_50
.LBB1_51:                               # %br_exit.7.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$6, %ecx
	jl	.LBB1_118
# %bb.52:                               # %src_gte_br.6.1
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$22, %ecx
	jg	.LBB1_118
# %bb.53:                               # %src_lte_mc.6.1
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$1, %esi
	jmp	.LBB1_54
.LBB1_8:                                # %src_lte_mc.21.1
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$16, %esi
	jmp	.LBB1_54
.LBB1_11:                               # %src_lte_mc.20.1
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$15, %esi
	jmp	.LBB1_54
.LBB1_14:                               # %src_lte_mc.19.1
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$14, %esi
	jmp	.LBB1_54
.LBB1_17:                               # %src_lte_mc.18.1
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$13, %esi
	jmp	.LBB1_54
.LBB1_20:                               # %src_lte_mc.17.1
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$12, %esi
	jmp	.LBB1_54
.LBB1_23:                               # %src_lte_mc.16.1
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$11, %esi
	jmp	.LBB1_54
.LBB1_26:                               # %src_lte_mc.15.1
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$10, %esi
	jmp	.LBB1_54
.LBB1_29:                               # %src_lte_mc.14.1
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$9, %esi
	jmp	.LBB1_54
.LBB1_32:                               # %src_lte_mc.13.1
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$8, %esi
	jmp	.LBB1_54
.LBB1_35:                               # %src_lte_mc.12.1
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$7, %esi
	jmp	.LBB1_54
.LBB1_38:                               # %src_lte_mc.11.1
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$6, %esi
	jmp	.LBB1_54
.LBB1_41:                               # %src_lte_mc.10.1
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$5, %esi
	jmp	.LBB1_54
.LBB1_44:                               # %src_lte_mc.9.1
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$4, %esi
	jmp	.LBB1_54
.LBB1_47:                               # %src_lte_mc.8.1
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$3, %esi
	jmp	.LBB1_54
.LBB1_50:                               # %src_lte_mc.7.1
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$2, %esi
	jmp	.LBB1_54
.LBB1_55:                               # %false.0
	movq	%rsp, %rax
	addq	$-16, %rax
	movq	%rax, %rsp
	cmpl	$17, -28(%rbp)
	je	.LBB1_57
# %bb.56:                               # %true.2
	movl	-20(%rbp), %ecx
	incl	%ecx
	movl	%ecx, -20(%rbp)
	movl	%ecx, (%rax)
	jmp	.LBB1_58
.LBB1_57:                               # %false.2
	movl	$0, (%rax)
.LBB1_58:                               # %end.2
	movl	$0, -24(%rbp)
	jmp	.LBB1_59
	.p2align	4, 0x90
.LBB1_63:                               # %src_lte_mc.22.4
                                        #   in Loop: Header=BB1_59 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$17, %esi
.LBB1_112:                              # %case.exit.4
                                        #   in Loop: Header=BB1_59 Depth=1
	callq	Int_init@PLT
	movq	%rbx, (%r14)
	movq	(%r14), %rax
	movl	8(%rax), %eax
	movl	%eax, -28(%rbp)
	incl	-24(%rbp)
.LBB1_59:                               # %loop.3
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$9, -24(%rbp)
	jg	.LBB1_113
# %bb.60:                               # %true.3
                                        #   in Loop: Header=BB1_59 Depth=1
	movq	-56(%rbp), %rax
	testq	%rax, %rax
	je	.LBB1_118
# %bb.61:                               # %ok.1
                                        #   in Loop: Header=BB1_59 Depth=1
	movq	(%rax), %rcx
	movl	(%rcx), %ecx
	movq	%rsp, %r14
	addq	$-16, %r14
	movq	%r14, %rsp
	cmpl	$22, %ecx
	jl	.LBB1_64
# %bb.62:                               # %src_gte_br.22.4
                                        #   in Loop: Header=BB1_59 Depth=1
	jle	.LBB1_63
.LBB1_64:                               # %br_exit.22.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$21, %ecx
	jl	.LBB1_67
# %bb.65:                               # %src_gte_br.21.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_66
.LBB1_67:                               # %br_exit.21.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$20, %ecx
	jl	.LBB1_70
# %bb.68:                               # %src_gte_br.20.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_69
.LBB1_70:                               # %br_exit.20.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$19, %ecx
	jl	.LBB1_73
# %bb.71:                               # %src_gte_br.19.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_72
.LBB1_73:                               # %br_exit.19.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$18, %ecx
	jl	.LBB1_76
# %bb.74:                               # %src_gte_br.18.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_75
.LBB1_76:                               # %br_exit.18.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$17, %ecx
	jl	.LBB1_79
# %bb.77:                               # %src_gte_br.17.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_78
.LBB1_79:                               # %br_exit.17.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$16, %ecx
	jl	.LBB1_82
# %bb.80:                               # %src_gte_br.16.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_81
.LBB1_82:                               # %br_exit.16.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$15, %ecx
	jl	.LBB1_85
# %bb.83:                               # %src_gte_br.15.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_84
.LBB1_85:                               # %br_exit.15.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$14, %ecx
	jl	.LBB1_88
# %bb.86:                               # %src_gte_br.14.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_87
.LBB1_88:                               # %br_exit.14.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$13, %ecx
	jl	.LBB1_91
# %bb.89:                               # %src_gte_br.13.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_90
.LBB1_91:                               # %br_exit.13.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$12, %ecx
	jl	.LBB1_94
# %bb.92:                               # %src_gte_br.12.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_93
.LBB1_94:                               # %br_exit.12.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$11, %ecx
	jl	.LBB1_97
# %bb.95:                               # %src_gte_br.11.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_96
.LBB1_97:                               # %br_exit.11.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$10, %ecx
	jl	.LBB1_100
# %bb.98:                               # %src_gte_br.10.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_99
.LBB1_100:                              # %br_exit.10.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$9, %ecx
	jl	.LBB1_103
# %bb.101:                              # %src_gte_br.9.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_102
.LBB1_103:                              # %br_exit.9.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$8, %ecx
	jl	.LBB1_106
# %bb.104:                              # %src_gte_br.8.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_105
.LBB1_106:                              # %br_exit.8.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$7, %ecx
	jl	.LBB1_109
# %bb.107:                              # %src_gte_br.7.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$22, %ecx
	jle	.LBB1_108
.LBB1_109:                              # %br_exit.7.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$6, %ecx
	jl	.LBB1_118
# %bb.110:                              # %src_gte_br.6.4
                                        #   in Loop: Header=BB1_59 Depth=1
	cmpl	$22, %ecx
	jg	.LBB1_118
# %bb.111:                              # %src_lte_mc.6.4
                                        #   in Loop: Header=BB1_59 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$1, %esi
	jmp	.LBB1_112
.LBB1_66:                               # %src_lte_mc.21.4
                                        #   in Loop: Header=BB1_59 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$16, %esi
	jmp	.LBB1_112
.LBB1_69:                               # %src_lte_mc.20.4
                                        #   in Loop: Header=BB1_59 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$15, %esi
	jmp	.LBB1_112
.LBB1_72:                               # %src_lte_mc.19.4
                                        #   in Loop: Header=BB1_59 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$14, %esi
	jmp	.LBB1_112
.LBB1_75:                               # %src_lte_mc.18.4
                                        #   in Loop: Header=BB1_59 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$13, %esi
	jmp	.LBB1_112
.LBB1_78:                               # %src_lte_mc.17.4
                                        #   in Loop: Header=BB1_59 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$12, %esi
	jmp	.LBB1_112
.LBB1_81:                               # %src_lte_mc.16.4
                                        #   in Loop: Header=BB1_59 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$11, %esi
	jmp	.LBB1_112
.LBB1_84:                               # %src_lte_mc.15.4
                                        #   in Loop: Header=BB1_59 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$10, %esi
	jmp	.LBB1_112
.LBB1_87:                               # %src_lte_mc.14.4
                                        #   in Loop: Header=BB1_59 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$9, %esi
	jmp	.LBB1_112
.LBB1_90:                               # %src_lte_mc.13.4
                                        #   in Loop: Header=BB1_59 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$8, %esi
	jmp	.LBB1_112
.LBB1_93:                               # %src_lte_mc.12.4
                                        #   in Loop: Header=BB1_59 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$7, %esi
	jmp	.LBB1_112
.LBB1_96:                               # %src_lte_mc.11.4
                                        #   in Loop: Header=BB1_59 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$6, %esi
	jmp	.LBB1_112
.LBB1_99:                               # %src_lte_mc.10.4
                                        #   in Loop: Header=BB1_59 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$5, %esi
	jmp	.LBB1_112
.LBB1_102:                              # %src_lte_mc.9.4
                                        #   in Loop: Header=BB1_59 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$4, %esi
	jmp	.LBB1_112
.LBB1_105:                              # %src_lte_mc.8.4
                                        #   in Loop: Header=BB1_59 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$3, %esi
	jmp	.LBB1_112
.LBB1_108:                              # %src_lte_mc.7.4
                                        #   in Loop: Header=BB1_59 Depth=1
	movq	%rsp, %rcx
	leaq	-16(%rcx), %rsp
	movq	%rax, -16(%rcx)
	callq	Int_new@PLT
	movq	%rax, %rbx
	movq	%rax, %rdi
	movl	$2, %esi
	jmp	.LBB1_112
.LBB1_113:                              # %false.3
	movq	%rsp, %rax
	addq	$-16, %rax
	movq	%rax, %rsp
	cmpl	$1, -28(%rbp)
	je	.LBB1_115
# %bb.114:                              # %true.5
	movl	-20(%rbp), %ecx
	incl	%ecx
	movl	%ecx, -20(%rbp)
	movl	%ecx, (%rax)
	jmp	.LBB1_116
.LBB1_115:                              # %false.5
	movl	$0, (%rax)
.LBB1_116:                              # %end.5
	movq	-40(%rbp), %rdi
	testq	%rdi, %rdi
	je	.LBB1_118
# %bb.117:                              # %ok.2
	movl	-20(%rbp), %esi
	movq	(%rdi), %rax
	callq	*56(%rax)
	movq	-40(%rbp), %rax
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.LBB1_118:                              # %abort
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
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	A_vtable_prototype@GOTPCREL(%rip), %rbx
	movl	4(%rbx), %edi
	callq	malloc@PLT
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end3:
	.size	A_new, .Lfunc_end3-A_new
	.cfi_endproc
                                        # -- End function
	.globl	B_new                           # -- Begin function B_new
	.p2align	4, 0x90
	.type	B_new,@function
B_new:                                  # @B_new
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	B_vtable_prototype@GOTPCREL(%rip), %rbx
	movl	4(%rbx), %edi
	callq	malloc@PLT
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end4:
	.size	B_new, .Lfunc_end4-B_new
	.cfi_endproc
                                        # -- End function
	.globl	C_new                           # -- Begin function C_new
	.p2align	4, 0x90
	.type	C_new,@function
C_new:                                  # @C_new
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	C_vtable_prototype@GOTPCREL(%rip), %rbx
	movl	4(%rbx), %edi
	callq	malloc@PLT
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end5:
	.size	C_new, .Lfunc_end5-C_new
	.cfi_endproc
                                        # -- End function
	.globl	D_new                           # -- Begin function D_new
	.p2align	4, 0x90
	.type	D_new,@function
D_new:                                  # @D_new
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	D_vtable_prototype@GOTPCREL(%rip), %rbx
	movl	4(%rbx), %edi
	callq	malloc@PLT
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end6:
	.size	D_new, .Lfunc_end6-D_new
	.cfi_endproc
                                        # -- End function
	.globl	E_new                           # -- Begin function E_new
	.p2align	4, 0x90
	.type	E_new,@function
E_new:                                  # @E_new
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	E_vtable_prototype@GOTPCREL(%rip), %rbx
	movl	4(%rbx), %edi
	callq	malloc@PLT
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end7:
	.size	E_new, .Lfunc_end7-E_new
	.cfi_endproc
                                        # -- End function
	.globl	F_new                           # -- Begin function F_new
	.p2align	4, 0x90
	.type	F_new,@function
F_new:                                  # @F_new
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	F_vtable_prototype@GOTPCREL(%rip), %rbx
	movl	4(%rbx), %edi
	callq	malloc@PLT
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end8:
	.size	F_new, .Lfunc_end8-F_new
	.cfi_endproc
                                        # -- End function
	.globl	G_new                           # -- Begin function G_new
	.p2align	4, 0x90
	.type	G_new,@function
G_new:                                  # @G_new
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	G_vtable_prototype@GOTPCREL(%rip), %rbx
	movl	4(%rbx), %edi
	callq	malloc@PLT
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end9:
	.size	G_new, .Lfunc_end9-G_new
	.cfi_endproc
                                        # -- End function
	.globl	H_new                           # -- Begin function H_new
	.p2align	4, 0x90
	.type	H_new,@function
H_new:                                  # @H_new
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	H_vtable_prototype@GOTPCREL(%rip), %rbx
	movl	4(%rbx), %edi
	callq	malloc@PLT
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end10:
	.size	H_new, .Lfunc_end10-H_new
	.cfi_endproc
                                        # -- End function
	.globl	I_new                           # -- Begin function I_new
	.p2align	4, 0x90
	.type	I_new,@function
I_new:                                  # @I_new
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	I_vtable_prototype@GOTPCREL(%rip), %rbx
	movl	4(%rbx), %edi
	callq	malloc@PLT
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end11:
	.size	I_new, .Lfunc_end11-I_new
	.cfi_endproc
                                        # -- End function
	.globl	J_new                           # -- Begin function J_new
	.p2align	4, 0x90
	.type	J_new,@function
J_new:                                  # @J_new
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	J_vtable_prototype@GOTPCREL(%rip), %rbx
	movl	4(%rbx), %edi
	callq	malloc@PLT
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end12:
	.size	J_new, .Lfunc_end12-J_new
	.cfi_endproc
                                        # -- End function
	.globl	K_new                           # -- Begin function K_new
	.p2align	4, 0x90
	.type	K_new,@function
K_new:                                  # @K_new
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	K_vtable_prototype@GOTPCREL(%rip), %rbx
	movl	4(%rbx), %edi
	callq	malloc@PLT
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end13:
	.size	K_new, .Lfunc_end13-K_new
	.cfi_endproc
                                        # -- End function
	.globl	L_new                           # -- Begin function L_new
	.p2align	4, 0x90
	.type	L_new,@function
L_new:                                  # @L_new
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	L_vtable_prototype@GOTPCREL(%rip), %rbx
	movl	4(%rbx), %edi
	callq	malloc@PLT
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end14:
	.size	L_new, .Lfunc_end14-L_new
	.cfi_endproc
                                        # -- End function
	.globl	M_new                           # -- Begin function M_new
	.p2align	4, 0x90
	.type	M_new,@function
M_new:                                  # @M_new
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	M_vtable_prototype@GOTPCREL(%rip), %rbx
	movl	4(%rbx), %edi
	callq	malloc@PLT
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end15:
	.size	M_new, .Lfunc_end15-M_new
	.cfi_endproc
                                        # -- End function
	.globl	N_new                           # -- Begin function N_new
	.p2align	4, 0x90
	.type	N_new,@function
N_new:                                  # @N_new
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	N_vtable_prototype@GOTPCREL(%rip), %rbx
	movl	4(%rbx), %edi
	callq	malloc@PLT
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end16:
	.size	N_new, .Lfunc_end16-N_new
	.cfi_endproc
                                        # -- End function
	.globl	O_new                           # -- Begin function O_new
	.p2align	4, 0x90
	.type	O_new,@function
O_new:                                  # @O_new
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	O_vtable_prototype@GOTPCREL(%rip), %rbx
	movl	4(%rbx), %edi
	callq	malloc@PLT
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end17:
	.size	O_new, .Lfunc_end17-O_new
	.cfi_endproc
                                        # -- End function
	.globl	P_new                           # -- Begin function P_new
	.p2align	4, 0x90
	.type	P_new,@function
P_new:                                  # @P_new
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	P_vtable_prototype@GOTPCREL(%rip), %rbx
	movl	4(%rbx), %edi
	callq	malloc@PLT
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end18:
	.size	P_new, .Lfunc_end18-P_new
	.cfi_endproc
                                        # -- End function
	.globl	Q_new                           # -- Begin function Q_new
	.p2align	4, 0x90
	.type	Q_new,@function
Q_new:                                  # @Q_new
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	Q_vtable_prototype@GOTPCREL(%rip), %rbx
	movl	4(%rbx), %edi
	callq	malloc@PLT
	movq	%rbx, (%rax)
	movq	%rax, 8(%rsp)
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end19:
	.size	Q_new, .Lfunc_end19-Q_new
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
	.long	0+8
	.quad	str.A
	.quad	A_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.size	A_vtable_prototype, 48

	.type	str.B,@object                   # @str.B
str.B:
	.asciz	"B"
	.size	str.B, 2

	.type	B_vtable_prototype,@object      # @B_vtable_prototype
	.globl	B_vtable_prototype
	.p2align	4
B_vtable_prototype:
	.long	7                               # 0x7
	.long	0+8
	.quad	str.B
	.quad	B_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.size	B_vtable_prototype, 48

	.type	str.C,@object                   # @str.C
str.C:
	.asciz	"C"
	.size	str.C, 2

	.type	C_vtable_prototype,@object      # @C_vtable_prototype
	.globl	C_vtable_prototype
	.p2align	4
C_vtable_prototype:
	.long	8                               # 0x8
	.long	0+8
	.quad	str.C
	.quad	C_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.size	C_vtable_prototype, 48

	.type	str.D,@object                   # @str.D
str.D:
	.asciz	"D"
	.size	str.D, 2

	.type	D_vtable_prototype,@object      # @D_vtable_prototype
	.globl	D_vtable_prototype
	.p2align	4
D_vtable_prototype:
	.long	9                               # 0x9
	.long	0+8
	.quad	str.D
	.quad	D_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.size	D_vtable_prototype, 48

	.type	str.E,@object                   # @str.E
str.E:
	.asciz	"E"
	.size	str.E, 2

	.type	E_vtable_prototype,@object      # @E_vtable_prototype
	.globl	E_vtable_prototype
	.p2align	4
E_vtable_prototype:
	.long	10                              # 0xa
	.long	0+8
	.quad	str.E
	.quad	E_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.size	E_vtable_prototype, 48

	.type	str.F,@object                   # @str.F
str.F:
	.asciz	"F"
	.size	str.F, 2

	.type	F_vtable_prototype,@object      # @F_vtable_prototype
	.globl	F_vtable_prototype
	.p2align	4
F_vtable_prototype:
	.long	11                              # 0xb
	.long	0+8
	.quad	str.F
	.quad	F_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.size	F_vtable_prototype, 48

	.type	str.G,@object                   # @str.G
str.G:
	.asciz	"G"
	.size	str.G, 2

	.type	G_vtable_prototype,@object      # @G_vtable_prototype
	.globl	G_vtable_prototype
	.p2align	4
G_vtable_prototype:
	.long	12                              # 0xc
	.long	0+8
	.quad	str.G
	.quad	G_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.size	G_vtable_prototype, 48

	.type	str.H,@object                   # @str.H
str.H:
	.asciz	"H"
	.size	str.H, 2

	.type	H_vtable_prototype,@object      # @H_vtable_prototype
	.globl	H_vtable_prototype
	.p2align	4
H_vtable_prototype:
	.long	13                              # 0xd
	.long	0+8
	.quad	str.H
	.quad	H_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.size	H_vtable_prototype, 48

	.type	str.I,@object                   # @str.I
str.I:
	.asciz	"I"
	.size	str.I, 2

	.type	I_vtable_prototype,@object      # @I_vtable_prototype
	.globl	I_vtable_prototype
	.p2align	4
I_vtable_prototype:
	.long	14                              # 0xe
	.long	0+8
	.quad	str.I
	.quad	I_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.size	I_vtable_prototype, 48

	.type	str.J,@object                   # @str.J
str.J:
	.asciz	"J"
	.size	str.J, 2

	.type	J_vtable_prototype,@object      # @J_vtable_prototype
	.globl	J_vtable_prototype
	.p2align	4
J_vtable_prototype:
	.long	15                              # 0xf
	.long	0+8
	.quad	str.J
	.quad	J_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.size	J_vtable_prototype, 48

	.type	str.K,@object                   # @str.K
str.K:
	.asciz	"K"
	.size	str.K, 2

	.type	K_vtable_prototype,@object      # @K_vtable_prototype
	.globl	K_vtable_prototype
	.p2align	4
K_vtable_prototype:
	.long	16                              # 0x10
	.long	0+8
	.quad	str.K
	.quad	K_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.size	K_vtable_prototype, 48

	.type	str.L,@object                   # @str.L
str.L:
	.asciz	"L"
	.size	str.L, 2

	.type	L_vtable_prototype,@object      # @L_vtable_prototype
	.globl	L_vtable_prototype
	.p2align	4
L_vtable_prototype:
	.long	17                              # 0x11
	.long	0+8
	.quad	str.L
	.quad	L_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.size	L_vtable_prototype, 48

	.type	str.M,@object                   # @str.M
str.M:
	.asciz	"M"
	.size	str.M, 2

	.type	M_vtable_prototype,@object      # @M_vtable_prototype
	.globl	M_vtable_prototype
	.p2align	4
M_vtable_prototype:
	.long	18                              # 0x12
	.long	0+8
	.quad	str.M
	.quad	M_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.size	M_vtable_prototype, 48

	.type	str.N,@object                   # @str.N
str.N:
	.asciz	"N"
	.size	str.N, 2

	.type	N_vtable_prototype,@object      # @N_vtable_prototype
	.globl	N_vtable_prototype
	.p2align	4
N_vtable_prototype:
	.long	19                              # 0x13
	.long	0+8
	.quad	str.N
	.quad	N_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.size	N_vtable_prototype, 48

	.type	str.O,@object                   # @str.O
str.O:
	.asciz	"O"
	.size	str.O, 2

	.type	O_vtable_prototype,@object      # @O_vtable_prototype
	.globl	O_vtable_prototype
	.p2align	4
O_vtable_prototype:
	.long	20                              # 0x14
	.long	0+8
	.quad	str.O
	.quad	O_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.size	O_vtable_prototype, 48

	.type	str.P,@object                   # @str.P
str.P:
	.asciz	"P"
	.size	str.P, 2

	.type	P_vtable_prototype,@object      # @P_vtable_prototype
	.globl	P_vtable_prototype
	.p2align	4
P_vtable_prototype:
	.long	21                              # 0x15
	.long	0+8
	.quad	str.P
	.quad	P_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.size	P_vtable_prototype, 48

	.type	str.Q,@object                   # @str.Q
str.Q:
	.asciz	"Q"
	.size	str.Q, 2

	.type	Q_vtable_prototype,@object      # @Q_vtable_prototype
	.globl	Q_vtable_prototype
	.p2align	4
Q_vtable_prototype:
	.long	22                              # 0x16
	.long	0+8
	.quad	str.Q
	.quad	Q_new
	.quad	Object_abort
	.quad	Object_type_name
	.quad	Object_copy
	.size	Q_vtable_prototype, 48

	.type	str.1,@object                   # @str.1
str.1:
	.asciz	"<basic class>"
	.size	str.1, 14

	.type	String.1,@object                # @String.1
	.globl	String.1
	.p2align	3
String.1:
	.quad	String_vtable_prototype
	.quad	str.1
	.size	String.1, 16

	.type	str.0,@object                   # @str.0
str.0:
	.asciz	"caseloop_o.cl"
	.size	str.0, 14

	.type	String.0,@object                # @String.0
	.globl	String.0
	.p2align	3
String.0:
	.quad	String_vtable_prototype
	.quad	str.0
	.size	String.0, 16

	.section	".note.GNU-stack","",@progbits
