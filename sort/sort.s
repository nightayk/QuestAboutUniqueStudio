	.file	"sort.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d "
	.text
	.globl	printArray
	.type	printArray, @function
printArray:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L2:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L3
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	printArray, .-printArray
	.globl	initArray
	.type	initArray, @function
initArray:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$9, (%rax)
	movq	-8(%rbp), %rax
	addq	$4, %rax
	movl	$6, (%rax)
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movl	$7, (%rax)
	movq	-8(%rbp), %rax
	addq	$12, %rax
	movl	$8, (%rax)
	movq	-8(%rbp), %rax
	addq	$16, %rax
	movl	$4, (%rax)
	movq	-8(%rbp), %rax
	addq	$20, %rax
	movl	$5, (%rax)
	movq	-8(%rbp), %rax
	addq	$24, %rax
	movl	$2, (%rax)
	movq	-8(%rbp), %rax
	addq	$28, %rax
	movl	$3, (%rax)
	movq	-8(%rbp), %rax
	addq	$32, %rax
	movl	$1, (%rax)
	movq	-8(%rbp), %rax
	addq	$36, %rax
	movl	$1, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	initArray, .-initArray
	.globl	bubbleSort
	.type	bubbleSort, @function
bubbleSort:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L6
.L10:
	movl	$0, -8(%rbp)
	jmp	.L7
.L9:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-8(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jle	.L8
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	-8(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	movl	-8(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	movl	%eax, (%rdx)
.L8:
	addl	$1, -8(%rbp)
.L7:
	movl	-28(%rbp), %eax
	subl	$1, %eax
	subl	-12(%rbp), %eax
	cmpl	%eax, -8(%rbp)
	jl	.L9
	addl	$1, -12(%rbp)
.L6:
	movl	-28(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -12(%rbp)
	jl	.L10
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	bubbleSort, .-bubbleSort
	.globl	insertSort
	.type	insertSort, @function
insertSort:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$1, -12(%rbp)
	jmp	.L12
.L16:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, -8(%rbp)
	jmp	.L13
.L15:
	movl	-8(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	subl	$1, -8(%rbp)
.L13:
	cmpl	$0, -8(%rbp)
	jle	.L14
	movl	-8(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L15
.L14:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	movl	%eax, (%rdx)
	addl	$1, -12(%rbp)
.L12:
	movl	-12(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L16
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	insertSort, .-insertSort
	.globl	percDown
	.type	percDown, @function
percDown:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	-28(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	jmp	.L18
.L23:
	movl	-28(%rbp), %eax
	addl	%eax, %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	movl	-32(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -8(%rbp)
	je	.L19
	movl	-8(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jle	.L19
	addl	$1, -8(%rbp)
.L19:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -4(%rbp)
	jge	.L24
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	movl	-8(%rbp), %eax
	movl	%eax, -28(%rbp)
.L18:
	movl	-28(%rbp), %eax
	addl	%eax, %eax
	addl	$1, %eax
	cmpl	%eax, -32(%rbp)
	jg	.L23
	jmp	.L22
.L24:
	nop
.L22:
	movl	-28(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	movl	%eax, (%rdx)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	percDown, .-percDown
	.globl	heapSort
	.type	heapSort, @function
heapSort:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -8(%rbp)
	jmp	.L26
.L27:
	movl	-28(%rbp), %edx
	movl	-8(%rbp), %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	percDown
	subl	$1, -8(%rbp)
.L26:
	cmpl	$0, -8(%rbp)
	jns	.L27
	movl	-28(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.L28
.L29:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	movl	%eax, (%rdx)
	movl	-8(%rbp), %edx
	movq	-24(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	percDown
	subl	$1, -8(%rbp)
.L28:
	cmpl	$0, -8(%rbp)
	jg	.L29
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	heapSort, .-heapSort
	.globl	merge
	.type	merge, @function
merge:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, -52(%rbp)
	movl	%ecx, -56(%rbp)
	movl	%r8d, -60(%rbp)
	movl	-52(%rbp), %eax
	movl	%eax, -20(%rbp)
	movl	-56(%rbp), %eax
	movl	%eax, -16(%rbp)
	movl	-56(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -8(%rbp)
	movl	-52(%rbp), %eax
	movl	%eax, -12(%rbp)
	movl	-60(%rbp), %eax
	subl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.L31
.L34:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jg	.L32
	movl	-20(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -20(%rbp)
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-12(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -12(%rbp)
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movl	(%rcx), %eax
	movl	%eax, (%rdx)
	jmp	.L31
.L32:
	movl	-16(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -16(%rbp)
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-12(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -12(%rbp)
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movl	(%rcx), %eax
	movl	%eax, (%rdx)
.L31:
	movl	-20(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jg	.L35
	movl	-16(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jle	.L34
	jmp	.L35
.L36:
	movl	-20(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -20(%rbp)
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-12(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -12(%rbp)
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movl	(%rcx), %eax
	movl	%eax, (%rdx)
.L35:
	movl	-20(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jle	.L36
	jmp	.L37
.L38:
	movl	-16(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -16(%rbp)
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-12(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -12(%rbp)
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movl	(%rcx), %eax
	movl	%eax, (%rdx)
.L37:
	movl	-16(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jle	.L38
	movl	$0, -20(%rbp)
	jmp	.L39
.L40:
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	-60(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	addl	$1, -20(%rbp)
	subl	$1, -60(%rbp)
.L39:
	movl	-20(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jl	.L40
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	merge, .-merge
	.globl	mSort
	.type	mSort, @function
mSort:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	%ecx, -40(%rbp)
	movl	-36(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jge	.L43
	movl	-36(%rbp), %edx
	movl	-40(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %ecx
	movl	-36(%rbp), %edx
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	mSort
	movl	-4(%rbp), %eax
	leal	1(%rax), %edi
	movl	-40(%rbp), %edx
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rax
	movl	%edx, %ecx
	movl	%edi, %edx
	movq	%rax, %rdi
	call	mSort
	movl	-4(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-40(%rbp), %edi
	movl	-36(%rbp), %edx
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rax
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	merge
.L43:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	mSort, .-mSort
	.section	.rodata
.LC1:
	.string	"\nmalloc error!"
	.text
	.globl	mergeSort
	.type	mergeSort, @function
mergeSort:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	-28(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L45
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L44
.L45:
	movl	-28(%rbp), %eax
	leal	-1(%rax), %edx
	movq	-8(%rbp), %rsi
	movq	-24(%rbp), %rax
	movl	%edx, %ecx
	movl	$0, %edx
	movq	%rax, %rdi
	call	mSort
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L44:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	mergeSort, .-mergeSort
	.globl	swap
	.type	swap, @function
swap:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movq	-32(%rbp), %rax
	movl	(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	movq	-32(%rbp), %rax
	movl	-4(%rbp), %edx
	movl	%edx, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	swap, .-swap
	.globl	median3
	.type	median3, @function
median3:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	-28(%rbp), %edx
	movl	-32(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -4(%rbp)
	movl	-28(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jle	.L49
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-28(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	swap
.L49:
	movl	-28(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-32(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jle	.L50
	movl	-32(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-28(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	swap
.L50:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-32(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jle	.L51
	movl	-32(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	swap
.L51:
	movl	-32(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	swap
	movl	-32(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	median3, .-median3
	.globl	qSort
	.type	qSort, @function
qSort:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movl	%edx, -48(%rbp)
	movl	-44(%rbp), %eax
	addl	$3, %eax
	cmpl	%eax, -48(%rbp)
	jl	.L54
	movl	-48(%rbp), %edx
	movl	-44(%rbp), %ecx
	movq	-40(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	median3
	movl	%eax, -4(%rbp)
	movl	-44(%rbp), %eax
	movl	%eax, -20(%rbp)
	movl	-48(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -16(%rbp)
	nop
.L55:
	addl	$1, -20(%rbp)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -4(%rbp)
	jg	.L55
.L56:
	subl	$1, -16(%rbp)
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L56
	movl	-20(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.L67
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rax, %rdx
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	swap
	jmp	.L55
.L67:
	nop
	movl	-48(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-40(%rbp), %rax
	addq	%rax, %rdx
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	swap
	movl	-20(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-44(%rbp), %ecx
	movq	-40(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	qSort
	movl	-20(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-48(%rbp), %edx
	movq	-40(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	qSort
	jmp	.L68
.L54:
	movl	-48(%rbp), %eax
	subl	-44(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	.L62
.L66:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -8(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, -16(%rbp)
	jmp	.L63
.L65:
	movl	-16(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	subl	$1, -16(%rbp)
.L63:
	movl	-16(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jle	.L64
	movl	-16(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	-4(%rax), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -8(%rbp)
	jl	.L65
.L64:
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rax, %rdx
	movl	-8(%rbp), %eax
	movl	%eax, (%rdx)
	addl	$1, -20(%rbp)
.L62:
	movl	-20(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jl	.L66
.L68:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	qSort, .-qSort
	.globl	quickSort
	.type	quickSort, @function
quickSort:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	-12(%rbp), %eax
	leal	-1(%rax), %edx
	movq	-8(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	qSort
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	quickSort, .-quickSort
	.globl	countSort
	.type	countSort, @function
countSort:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -72(%rbp)
	movl	%esi, -76(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$0, -48(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	movq	$0, -16(%rbp)
	movl	$0, -56(%rbp)
	jmp	.L71
.L72:
	movl	-56(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movl	-48(%rbp,%rdx,4), %edx
	addl	$1, %edx
	cltq
	movl	%edx, -48(%rbp,%rax,4)
	addl	$1, -56(%rbp)
.L71:
	movl	-56(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jl	.L72
	movl	$9, -52(%rbp)
	jmp	.L73
.L75:
	movl	-52(%rbp), %eax
	leal	-1(%rax), %edx
	movl	%edx, -52(%rbp)
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-72(%rbp), %rax
	addq	%rax, %rdx
	movl	-56(%rbp), %eax
	movl	%eax, (%rdx)
.L74:
	movl	-56(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	leal	-1(%rax), %ecx
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	movl	%ecx, -48(%rbp,%rdx,4)
	testl	%eax, %eax
	jg	.L75
.L73:
	subl	$1, -56(%rbp)
	cmpl	$0, -56(%rbp)
	jns	.L74
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L77
	call	__stack_chk_fail@PLT
.L77:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	countSort, .-countSort
	.globl	bucketSort
	.type	bucketSort, @function
bucketSort:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, -104(%rbp)
	movl	%esi, -108(%rbp)
	movq	%fs:40, %rbx
	movq	%rbx, -56(%rbp)
	xorl	%ebx, %ebx
	movq	%rsp, %rcx
	movq	%rcx, %r15
	movl	-108(%rbp), %esi
	movl	-108(%rbp), %ecx
	movl	%ecx, %edi
	shrl	$31, %edi
	addl	%edi, %ecx
	sarl	%ecx
	movl	%ecx, %edi
	movslq	%esi, %rcx
	subq	$1, %rcx
	movq	%rcx, -80(%rbp)
	movslq	%esi, %rcx
	movq	%rcx, -128(%rbp)
	movq	$0, -120(%rbp)
	movslq	%esi, %rcx
	salq	$2, %rcx
	movslq	%edi, %rbx
	subq	$1, %rbx
	movq	%rbx, -72(%rbp)
	movslq	%esi, %rbx
	movq	%rbx, %r12
	movl	$0, %r13d
	movslq	%edi, %rbx
	movq	%rbx, %rax
	movl	$0, %edx
	movq	%r13, %r14
	imulq	%rax, %r14
	movq	%rdx, %rbx
	imulq	%r12, %rbx
	addq	%r14, %rbx
	mulq	%r12
	addq	%rdx, %rbx
	movq	%rbx, %rdx
	movslq	%esi, %rax
	movq	%rax, %r10
	movl	$0, %r11d
	movslq	%edi, %rax
	movq	%rax, %r8
	movl	$0, %r9d
	movq	%r11, %rdx
	imulq	%r8, %rdx
	movq	%r9, %rax
	imulq	%r10, %rax
	leaq	(%rdx,%rax), %rbx
	movq	%r10, %rax
	mulq	%r8
	leaq	(%rbx,%rdx), %r8
	movq	%r8, %rdx
	movslq	%esi, %rdx
	movslq	%edi, %rax
	imulq	%rdx, %rax
	salq	$2, %rax
	leaq	3(%rax), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %ebx
	movl	$0, %edx
	divq	%rbx
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$3, %rax
	shrq	$2, %rax
	salq	$2, %rax
	movq	%rax, -64(%rbp)
	movl	$0, -92(%rbp)
	jmp	.L79
.L82:
	movl	$0, -96(%rbp)
	jmp	.L80
.L81:
	movq	%rcx, %rdi
	shrq	$2, %rdi
	movq	-64(%rbp), %rax
	movl	-96(%rbp), %edx
	movslq	%edx, %rsi
	movl	-92(%rbp), %edx
	movslq	%edx, %rdx
	imulq	%rdi, %rdx
	addq	%rsi, %rdx
	movl	$-1, (%rax,%rdx,4)
	addl	$1, -96(%rbp)
.L80:
	movl	-96(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jl	.L81
	addl	$1, -92(%rbp)
.L79:
	movl	-92(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jl	.L82
	movl	$0, -92(%rbp)
	jmp	.L83
.L85:
	movl	$-1, -96(%rbp)
	nop
.L84:
	movq	%rcx, %rdi
	shrq	$2, %rdi
	movl	-92(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-104(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, %r8d
	addl	$1, -96(%rbp)
	movq	-64(%rbp), %rax
	movl	-96(%rbp), %edx
	movslq	%edx, %rsi
	movslq	%r8d, %rdx
	imulq	%rdi, %rdx
	addq	%rsi, %rdx
	movl	(%rax,%rdx,4), %eax
	cmpl	$-1, %eax
	jne	.L84
	movl	-92(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-104(%rbp), %rax
	addq	%rax, %rdx
	movq	%rcx, %r8
	shrq	$2, %r8
	movl	-92(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rsi
	movq	-104(%rbp), %rax
	addq	%rsi, %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	shrl	$31, %esi
	addl	%esi, %eax
	sarl	%eax
	movl	%eax, %r9d
	movl	(%rdx), %edx
	movq	-64(%rbp), %rax
	movl	-96(%rbp), %esi
	movslq	%esi, %rdi
	movslq	%r9d, %rsi
	imulq	%r8, %rsi
	addq	%rdi, %rsi
	movl	%edx, (%rax,%rsi,4)
	addl	$1, -92(%rbp)
.L83:
	movl	-92(%rbp), %eax
	cmpl	-108(%rbp), %eax
	jl	.L85
	movl	$0, -92(%rbp)
	jmp	.L86
.L92:
	movl	$1, -96(%rbp)
	jmp	.L87
.L91:
	movq	%rcx, %rdi
	shrq	$2, %rdi
	movq	-64(%rbp), %rax
	movl	-96(%rbp), %edx
	movslq	%edx, %rsi
	movl	-92(%rbp), %edx
	movslq	%edx, %rdx
	imulq	%rdi, %rdx
	addq	%rsi, %rdx
	movl	(%rax,%rdx,4), %eax
	movl	%eax, -84(%rbp)
	movl	-96(%rbp), %eax
	movl	%eax, -88(%rbp)
	jmp	.L88
.L90:
	movq	%rcx, %rdi
	shrq	$2, %rdi
	movl	-88(%rbp), %eax
	leal	-1(%rax), %edx
	movq	%rcx, %r8
	shrq	$2, %r8
	movq	-64(%rbp), %rax
	movslq	%edx, %rsi
	movl	-92(%rbp), %edx
	movslq	%edx, %rdx
	imulq	%rdi, %rdx
	addq	%rsi, %rdx
	movl	(%rax,%rdx,4), %edx
	movq	-64(%rbp), %rax
	movl	-88(%rbp), %esi
	movslq	%esi, %rdi
	movl	-92(%rbp), %esi
	movslq	%esi, %rsi
	imulq	%r8, %rsi
	addq	%rdi, %rsi
	movl	%edx, (%rax,%rsi,4)
	subl	$1, -88(%rbp)
.L88:
	movq	%rcx, %rdi
	shrq	$2, %rdi
	movq	-64(%rbp), %rax
	movl	-88(%rbp), %edx
	movslq	%edx, %rsi
	movl	-92(%rbp), %edx
	movslq	%edx, %rdx
	imulq	%rdi, %rdx
	addq	%rsi, %rdx
	movl	(%rax,%rdx,4), %eax
	cmpl	$-1, %eax
	je	.L89
	movq	%rcx, %rdi
	shrq	$2, %rdi
	movl	-88(%rbp), %eax
	leal	-1(%rax), %edx
	movq	-64(%rbp), %rax
	movslq	%edx, %rsi
	movl	-92(%rbp), %edx
	movslq	%edx, %rdx
	imulq	%rdi, %rdx
	addq	%rsi, %rdx
	movl	(%rax,%rdx,4), %eax
	cmpl	%eax, -84(%rbp)
	jl	.L90
.L89:
	movq	%rcx, %rdi
	shrq	$2, %rdi
	movq	-64(%rbp), %rax
	movl	-88(%rbp), %edx
	movslq	%edx, %rsi
	movl	-92(%rbp), %edx
	movslq	%edx, %rdx
	imulq	%rdi, %rdx
	addq	%rdx, %rsi
	movl	-84(%rbp), %edx
	movl	%edx, (%rax,%rsi,4)
	addl	$1, -96(%rbp)
.L87:
	movq	%rcx, %rdi
	shrq	$2, %rdi
	movq	-64(%rbp), %rax
	movl	-96(%rbp), %edx
	movslq	%edx, %rsi
	movl	-92(%rbp), %edx
	movslq	%edx, %rdx
	imulq	%rdi, %rdx
	addq	%rsi, %rdx
	movl	(%rax,%rdx,4), %eax
	cmpl	$-1, %eax
	jne	.L91
	addl	$1, -92(%rbp)
.L86:
	movl	-108(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	cmpl	%eax, -92(%rbp)
	jl	.L92
	movl	$0, -92(%rbp)
	movl	$0, -88(%rbp)
	jmp	.L93
.L96:
	movl	$0, -96(%rbp)
	jmp	.L94
.L95:
	movq	%rcx, %r8
	shrq	$2, %r8
	movl	-88(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-104(%rbp), %rax
	addq	%rax, %rdx
	movq	-64(%rbp), %rax
	movl	-96(%rbp), %esi
	movslq	%esi, %rdi
	movl	-92(%rbp), %esi
	movslq	%esi, %rsi
	imulq	%r8, %rsi
	addq	%rdi, %rsi
	movl	(%rax,%rsi,4), %eax
	movl	%eax, (%rdx)
	addl	$1, -96(%rbp)
.L94:
	movq	%rcx, %rdi
	shrq	$2, %rdi
	movq	-64(%rbp), %rax
	movl	-96(%rbp), %edx
	movslq	%edx, %rsi
	movl	-92(%rbp), %edx
	movslq	%edx, %rdx
	imulq	%rdi, %rdx
	addq	%rsi, %rdx
	movl	(%rax,%rdx,4), %eax
	cmpl	$-1, %eax
	jne	.L95
	addl	$1, -92(%rbp)
.L93:
	movl	-108(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	cmpl	%eax, -92(%rbp)
	jl	.L96
	movq	%r15, %rsp
	nop
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L97
	call	__stack_chk_fail@PLT
.L97:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	bucketSort, .-bucketSort
	.section	.rodata
.LC2:
	.string	"\345\206\222\346\263\241\346\216\222\345\272\217\345\211\215:"
.LC3:
	.string	"\n\345\206\222\346\263\241\346\216\222\345\272\217\345\220\216:"
.LC4:
	.string	"\n\n\346\217\222\345\205\245\346\216\222\345\272\217\345\211\215:"
.LC5:
	.string	"\n\346\217\222\345\205\245\346\216\222\345\272\217\345\220\216:"
.LC6:
	.string	"\n\n\345\240\206\346\216\222\345\272\217\345\211\215:"
.LC7:
	.string	"\n\345\240\206\346\216\222\345\272\217\345\220\216:"
.LC8:
	.string	"\n\n\345\275\222\345\271\266\346\216\222\345\272\217\345\211\215:"
.LC9:
	.string	"\n\345\275\222\345\271\266\346\216\222\345\272\217\345\220\216:"
.LC10:
	.string	"\n\n\345\277\253\351\200\237\346\216\222\345\272\217\345\211\215:"
.LC11:
	.string	"\n\345\277\253\351\200\237\346\216\222\345\272\217\345\220\216:"
.LC12:
	.string	"\n\n\350\256\241\346\225\260\346\216\222\345\272\217\345\211\215:"
.LC13:
	.string	"\n\350\256\241\346\225\260\346\216\222\345\272\217\345\220\216:"
.LC14:
	.string	"\n\n\346\241\266\345\274\217\346\216\222\345\272\217\345\211\215:"
.LC15:
	.string	"\n\346\241\266\345\274\217\346\216\222\345\272\217\345\220\216:"
	.text
	.globl	main
	.type	main, @function
main:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$9, -48(%rbp)
	movl	$6, -44(%rbp)
	movl	$7, -40(%rbp)
	movl	$8, -36(%rbp)
	movl	$4, -32(%rbp)
	movl	$5, -28(%rbp)
	movl	$2, -24(%rbp)
	movl	$3, -20(%rbp)
	movl	$1, -16(%rbp)
	movl	$1, -12(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	initArray
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	printArray
	leaq	-48(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	bubbleSort
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	printArray
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	initArray
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	printArray
	leaq	-48(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	insertSort
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	printArray
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	initArray
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	printArray
	leaq	-48(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	heapSort
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	printArray
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	initArray
	leaq	.LC8(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	printArray
	leaq	-48(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	mergeSort
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	printArray
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	initArray
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	printArray
	leaq	-48(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	quickSort
	leaq	.LC11(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	printArray
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	initArray
	leaq	.LC12(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	printArray
	leaq	-48(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	countSort
	leaq	.LC13(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	printArray
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	initArray
	leaq	.LC14(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	printArray
	leaq	-48(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	bucketSort
	leaq	.LC15(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	printArray
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L100
	call	__stack_chk_fail@PLT
.L100:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
