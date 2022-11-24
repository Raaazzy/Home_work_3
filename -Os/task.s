	.file	"task.c"
	.intel_syntax noprefix
	.text
	.globl	function
	.type	function, @function
function:
.LFB24:
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
.LFE24:
	.size	function, .-function
	.globl	Task
	.type	Task, @function
Task:
.LFB25:
	.cfi_startproc
	endbr64
	xorps	xmm6, xmm6
	movsd	xmm5, QWORD PTR .LC0[rip]
	movapd	xmm7, xmm0
	movsd	xmm8, QWORD PTR .LC2[rip]
	movapd	xmm9, xmm6
.L3:
	movapd	xmm3, xmm6
.L4:
	movapd	xmm0, xmm5
	movapd	xmm6, xmm3
	subsd	xmm0, xmm3
	addsd	xmm3, xmm5
	mulsd	xmm3, xmm8
	comisd	xmm0, xmm7
	jbe	.L8
	movapd	xmm0, xmm6
	call	function
	movapd	xmm4, xmm0
	movapd	xmm0, xmm5
	call	function
	mulsd	xmm4, xmm0
	comisd	xmm9, xmm4
	ja	.L4
	movapd	xmm5, xmm3
	jmp	.L3
.L8:
	movapd	xmm0, xmm3
	ret
	.cfi_endproc
.LFE25:
	.size	Task, .-Task
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC6:
	.string	"Generated epsilon: %lf\n"
	.text
	.globl	Task_random
	.type	Task_random, @function
Task_random:
.LFB26:
	.cfi_startproc
	endbr64
	sub	rsp, 24
	.cfi_def_cfa_offset 32
	call	clock@PLT
	mov	rdi, rax
	call	srand@PLT
	call	rand@PLT
	lea	rsi, .LC6[rip]
	mov	edi, 1
	cvtsi2sd	xmm0, eax
	divsd	xmm0, QWORD PTR .LC3[rip]
	mov	al, 1
	mulsd	xmm0, QWORD PTR .LC4[rip]
	addsd	xmm0, QWORD PTR .LC5[rip]
	movsd	QWORD PTR 8[rsp], xmm0
	call	__printf_chk@PLT
	movsd	xmm0, QWORD PTR 8[rsp]
	add	rsp, 24
	.cfi_def_cfa_offset 8
	jmp	Task
	.cfi_endproc
.LFE26:
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
