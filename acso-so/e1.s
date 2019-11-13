	.file	"e1.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$10, -4(%rbp)
	movl	$20, -8(%rbp)
	movl	$30, -12(%rbp)
	call	fork@PLT
	movl	%eax, -16(%rbp)
	cmpl	$0, -16(%rbp)
	jne	.L2
	addl	$1, -8(%rbp)
	call	fork@PLT
	movl	%eax, -20(%rbp)
	cmpl	$0, -20(%rbp)
	jne	.L3
	addl	$1, -12(%rbp)
	movl	$0, %edi
	call	exit@PLT
.L3:
	leaq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	wait@PLT
	movl	$0, %edi
	call	exit@PLT
.L2:
	addl	$1, -4(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	wait@PLT
	movl	$0, %edi
	call	exit@PLT
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
