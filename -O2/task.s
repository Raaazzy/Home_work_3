	.file	"task.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	function
	.type	function, @function
function:
.LFB39:
	.cfi_startproc
	endbr64
	movapd	xmm1, xmm0
	mulsd	xmm0, xmm0
	movapd	xmm2, xmm1
	addsd	xmm2, xmm1
	mulsd	xmm2, xmm1
	mulsd	xmm0, xmm1
	mulsd	xmm2, xmm1
	mulsd	xmm0, xmm1
	addsd	xmm0, xmm2
	subsd	xmm0, xmm1
	subsd	xmm0, QWORD PTR .LC0[rip]
	ret
	.cfi_endproc
.LFE39:
	.size	function, .-function
	.p2align 4
	.globl	Task
	.type	Task, @function
Task:
.LFB40:
	.cfi_startproc
	endbr64
	movsd	xmm5, QWORD PTR .LC0[rip]
	pxor	xmm8, xmm8
	movapd	xmm6, xmm0
	movsd	xmm7, QWORD PTR .LC2[rip]
	movapd	xmm3, xmm8
	movapd	xmm0, xmm5
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L7:
	movapd	xmm1, xmm4
	movapd	xmm2, xmm4
	movapd	xmm9, xmm3
	mulsd	xmm1, xmm4
	addsd	xmm2, xmm4
	addsd	xmm9, xmm3
	mulsd	xmm2, xmm4
	mulsd	xmm9, xmm3
	mulsd	xmm1, xmm4
	mulsd	xmm2, xmm4
	mulsd	xmm9, xmm3
	mulsd	xmm1, xmm4
	addsd	xmm1, xmm2
	movapd	xmm2, xmm3
	mulsd	xmm2, xmm3
	subsd	xmm1, xmm4
	mulsd	xmm2, xmm3
	subsd	xmm1, xmm5
	mulsd	xmm2, xmm3
	addsd	xmm2, xmm9
	subsd	xmm2, xmm3
	subsd	xmm2, xmm5
	mulsd	xmm1, xmm2
	comisd	xmm8, xmm1
	ja	.L9
.L5:
	movapd	xmm1, xmm0
	movapd	xmm4, xmm0
	addsd	xmm0, xmm3
	subsd	xmm1, xmm3
	mulsd	xmm0, xmm7
	comisd	xmm1, xmm6
	ja	.L7
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	movapd	xmm3, xmm0
	movapd	xmm0, xmm4
	jmp	.L5
	.cfi_endproc
.LFE40:
	.size	Task, .-Task
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC6:
	.string	"Generated epsilon: %lf\n"
	.text
	.p2align 4
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
	mov	edi, 1
	lea	rsi, .LC6[rip]
	cvtsi2sd	xmm0, eax
	divsd	xmm0, QWORD PTR .LC3[rip]
	mov	eax, 1
	mulsd	xmm0, QWORD PTR .LC4[rip]
	addsd	xmm0, QWORD PTR .LC5[rip]
	movsd	QWORD PTR 8[rsp], xmm0
	call	__printf_chk@PLT
	movsd	xmm0, QWORD PTR 8[rsp]
	add	rsp, 24
	.cfi_def_cfa_offset 8
	jmp	Task
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
