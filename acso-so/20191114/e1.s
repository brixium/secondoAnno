	.file	"e1.c"
	.text
	.section	.rodata
.LC0:
	.string	"I'm thread n.%d\n"
	.text
	.globl	tf
	.type	tf, @function
tf:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	tf, .-tf
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	-8(%rbp), %rax
	movl	$1, %ecx
	leaq	tf(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	leaq	-16(%rbp), %rax
	movl	$2, %ecx
	leaq	tf(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	movq	-8(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
