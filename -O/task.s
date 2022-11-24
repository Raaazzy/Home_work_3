	.file	"task.c"
	.intel_syntax noprefix
	.text
	.globl	function
	.type	function, @function
function:
.LFB39:
	.cfi_startproc
	endbr64
	movapd	xmm1, xmm0
	mulsd	xmm0, xmm0
	mulsd	xmm0, xmm1
	mulsd	xmm0, xmm1
	movapd	xmm2, xmm1
	addsd	xmm2, xmm1
	mulsd	xmm2, xmm1
	mulsd	xmm2, xmm1
	addsd	xmm0, xmm2
	subsd	xmm0, xmm1
	subsd	xmm0, QWORD PTR .LC0[rip]
	ret
	.cfi_endproc
.LFE39:
	.size	function, .-function
	.globl	Task
	.type	Task, @function
Task:
.LFB40:
	.cfi_startproc
	endbr64
	sub	rsp, 40
	.cfi_def_cfa_offset 48
	movsd	QWORD PTR 32[rsp], xmm0
	movsd	xmm7, QWORD PTR .LC0[rip]
	movsd	QWORD PTR 8[rsp], xmm7
	pxor	xmm7, xmm7
	movsd	QWORD PTR [rsp], xmm7
	jmp	.L4
.L5:
	movsd	xmm3, QWORD PTR [rsp]
	movapd	xmm0, xmm3
	addsd	xmm0, QWORD PTR 8[rsp]
	mulsd	xmm0, QWORD PTR .LC2[rip]
	movsd	QWORD PTR 24[rsp], xmm0
	movapd	xmm0, xmm3
	call	function
	movsd	QWORD PTR 16[rsp], xmm0
	movsd	xmm0, QWORD PTR 8[rsp]
	call	function
	mulsd	xmm0, QWORD PTR 16[rsp]
	pxor	xmm6, xmm6
	movapd	xmm1, xmm0
	cmpltsd	xmm1, xmm6
	movsd	xmm2, QWORD PTR 8[rsp]
	andpd	xmm2, xmm1
	movsd	xmm5, QWORD PTR 24[rsp]
	andnpd	xmm1, xmm5
	orpd	xmm1, xmm2
	movsd	QWORD PTR 8[rsp], xmm1
	cmpltsd	xmm0, xmm6
	andpd	xmm5, xmm0
	movsd	xmm3, QWORD PTR [rsp]
	andnpd	xmm0, xmm3
	orpd	xmm0, xmm5
	movsd	QWORD PTR [rsp], xmm0
.L4:
	movsd	xmm0, QWORD PTR 8[rsp]
	subsd	xmm0, QWORD PTR [rsp]
	comisd	xmm0, QWORD PTR 32[rsp]
	ja	.L5
	movsd	xmm0, QWORD PTR [rsp]
	addsd	xmm0, QWORD PTR 8[rsp]
	mulsd	xmm0, QWORD PTR .LC2[rip]
	add	rsp, 40
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE40:
	.size	Task, .-Task
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC6:
	.string	"Generated epsilon: %lf\n"
	.text
	.globl	Task_random
	.type	Task_random, @function
Task_random:
.LFB41:
	.cfi_startproc
	endbr64
	sub	rsp, 24
	.cfi_def_cfa_offset 32
	call	clock@PLT
	mov	rdi, rax
	call	srand@PLT
	call	rand@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	divsd	xmm0, QWORD PTR .LC3[rip]
	mulsd	xmm0, QWORD PTR .LC4[rip]
	addsd	xmm0, QWORD PTR .LC5[rip]
	movsd	QWORD PTR 8[rsp], xmm0
	lea	rsi, .LC6[rip]
	mov	edi, 1
	mov	eax, 1
	call	__printf_chk@PLT
	movsd	xmm0, QWORD PTR 8[rsp]
	call	Task
	add	rsp, 24
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE41:
	.size	Task_random, .-Task_random
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.align 8
.LC2:
	.long	0
	.long	1071644672
	.align 8
.LC3:
	.long	4290772992
	.long	1105199103
	.align 8
.LC4:
	.long	371865828
	.long	1062232643
	.align 8
.LC5:
	.long	3794832442
	.long	1044740494
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
