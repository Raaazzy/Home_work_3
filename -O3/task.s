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
	pxor	xmm5, xmm5
	mov	edi, 1
	lea	rsi, .LC6[rip]
	cvtsi2sd	xmm5, eax
	divsd	xmm5, QWORD PTR .LC3[rip]
	mov	eax, 1
	mulsd	xmm5, QWORD PTR .LC4[rip]
	addsd	xmm5, QWORD PTR .LC5[rip]
	movapd	xmm0, xmm5
	movsd	QWORD PTR 8[rsp], xmm5
	call	__printf_chk@PLT
	pxor	xmm7, xmm7
	movsd	xmm6, QWORD PTR .LC0[rip]
	movsd	xmm5, QWORD PTR 8[rsp]
	movapd	xmm3, xmm7
	movapd	xmm2, xmm6
.L11:
	movapd	xmm0, xmm2
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L14:
	movapd	xmm1, xmm3
	movapd	xmm4, xmm3
	movapd	xmm8, xmm2
	mulsd	xmm1, xmm3
	addsd	xmm4, xmm3
	addsd	xmm8, xmm2
	mulsd	xmm4, xmm3
	mulsd	xmm8, xmm2
	mulsd	xmm1, xmm3
	mulsd	xmm4, xmm3
	mulsd	xmm8, xmm2
	mulsd	xmm1, xmm3
	addsd	xmm1, xmm4
	movapd	xmm4, xmm2
	mulsd	xmm4, xmm2
	subsd	xmm1, xmm3
	mulsd	xmm4, xmm2
	subsd	xmm1, xmm6
	mulsd	xmm4, xmm2
	addsd	xmm4, xmm8
	subsd	xmm4, xmm2
	subsd	xmm4, xmm6
	mulsd	xmm1, xmm4
	comisd	xmm7, xmm1
	ja	.L17
.L12:
	movapd	xmm1, xmm0
	movapd	xmm2, xmm0
	addsd	xmm0, xmm3
	subsd	xmm1, xmm3
	mulsd	xmm0, QWORD PTR .LC2[rip]
	comisd	xmm1, xmm5
	ja	.L14
	add	rsp, 24
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L17:
	.cfi_restore_state
	movapd	xmm3, xmm0
	jmp	.L11
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
