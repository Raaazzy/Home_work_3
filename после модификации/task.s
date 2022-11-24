# rbp-8 - x
# rbp-40 - e
# rbp-8 - a
# rbp-16 - b
# rbp-24 - c
# rbp-8 - eps

	.file	"task.c"
	.intel_syntax noprefix
	.text
	.globl	function
	.type	function, @function
function:
	endbr64	
	push	rbp	
	mov	rbp, rsp	
	movsd	QWORD PTR -8[rbp], xmm0	# x, x
# ./task.c:6:     return x*x*x*x+2*x*x*x-x-1;
	movsd	xmm0, QWORD PTR -8[rbp]	# tmp92, x
	mulsd	xmm0, xmm0	
# ./task.c:6:     return x*x*x*x+2*x*x*x-x-1;
	mulsd	xmm0, QWORD PTR -8[rbp]	
# ./task.c:6:     return x*x*x*x+2*x*x*x-x-1;
	movapd	xmm1, xmm0	
	mulsd	xmm1, QWORD PTR -8[rbp]	
# ./task.c:6:     return x*x*x*x+2*x*x*x-x-1;
	movsd	xmm0, QWORD PTR -8[rbp]	# tmp93, x
	addsd	xmm0, xmm0	
# ./task.c:6:     return x*x*x*x+2*x*x*x-x-1;
	mulsd	xmm0, QWORD PTR -8[rbp]	
# ./task.c:6:     return x*x*x*x+2*x*x*x-x-1;
	mulsd	xmm0, QWORD PTR -8[rbp]	
# ./task.c:6:     return x*x*x*x+2*x*x*x-x-1;
	addsd	xmm0, xmm1	
# ./task.c:6:     return x*x*x*x+2*x*x*x-x-1;
	subsd	xmm0, QWORD PTR -8[rbp]	
# ./task.c:6:     return x*x*x*x+2*x*x*x-x-1;
	movsd	xmm1, QWORD PTR .LC0[rip]	# tmp94,
	subsd	xmm0, xmm1	
# ./task.c:7: }
	pop	rbp	
	ret	
	.size	function, .-function
	.globl	Task
	.type	Task, @function
Task:
	endbr64	
	push	rbp	
	mov	rbp, rsp	
	sub	rsp, 48	
	movsd	QWORD PTR -40[rbp], xmm0	# e, e
# ./task.c:10:     double a = 0;
	pxor	xmm0, xmm0	# tmp90
	movsd	QWORD PTR -8[rbp], xmm0	# a, tmp90
# ./task.c:11:     double b = 1;
	movsd	xmm0, QWORD PTR .LC0[rip]	# tmp91,
	movsd	QWORD PTR -16[rbp], xmm0	# b, tmp91
# ./task.c:13:     while (b - a > e) {
	jmp	.L4	
.L7:
# ./task.c:14:         c = (a + b) / 2;
	movsd	xmm0, QWORD PTR -8[rbp]	# tmp92, a
	addsd	xmm0, QWORD PTR -16[rbp]	# _1, b
# ./task.c:14:         c = (a + b) / 2;
	movsd	xmm1, QWORD PTR .LC2[rip]	# tmp94,
	divsd	xmm0, xmm1	# tmp93, tmp94
	movsd	QWORD PTR -24[rbp], xmm0	# c, tmp93
# ./task.c:15:         if (function(a) * function(b) < 0) {
	mov	rax, QWORD PTR -8[rbp]	# tmp95, a
	movq	xmm0, rax	#, tmp95
	call	function	
	movsd	QWORD PTR -48[rbp], xmm0	# %sfp,
# ./task.c:15:         if (function(a) * function(b) < 0) {
	mov	rax, QWORD PTR -16[rbp]	# tmp96, b
	movq	xmm0, rax	#, tmp96
	call	function	
# ./task.c:15:         if (function(a) * function(b) < 0) {
	movsd	xmm1, QWORD PTR -48[rbp]	
	mulsd	xmm1, xmm0	
# ./task.c:15:         if (function(a) * function(b) < 0) {
	pxor	xmm0, xmm0	# tmp97
	comisd	xmm0, xmm1	
	jbe	.L10	#,
# ./task.c:16:             a = c;
	movsd	xmm0, QWORD PTR -24[rbp]	# tmp98, c
	movsd	QWORD PTR -8[rbp], xmm0	# a, tmp98
	jmp	.L4	
.L10:
# ./task.c:18:             b = c;
	movsd	xmm0, QWORD PTR -24[rbp]	# tmp99, c
	movsd	QWORD PTR -16[rbp], xmm0	# b, tmp99
.L4:
# ./task.c:13:     while (b - a > e) {
	movsd	xmm0, QWORD PTR -16[rbp]	# tmp100, b
	subsd	xmm0, QWORD PTR -8[rbp]	
# ./task.c:13:     while (b - a > e) {
	comisd	xmm0, QWORD PTR -40[rbp]	
	ja	.L7	
# ./task.c:21:     return (a + b) / 2;
	movsd	xmm0, QWORD PTR -8[rbp]	# tmp101, a
	addsd	xmm0, QWORD PTR -16[rbp]	
# ./task.c:21:     return (a + b) / 2;
	movsd	xmm1, QWORD PTR .LC2[rip]	# tmp102,
	divsd	xmm0, xmm1	
# ./task.c:22: }
	leave	
	ret	
	.size	Task, .-Task
	.section	.rodata
.LC6:
	.string	"Generated epsilon: %lf\n"
	.text
	.globl	Task_random
	.type	Task_random, @function
Task_random:
	endbr64	
	push	rbp	
	mov	rbp, rsp	
	sub	rsp, 16	
# ./task.c:25:     srand(clock());
	call	clock@PLT	
# ./task.c:25:     srand(clock());
	mov	edi, eax	
	call	srand@PLT	
# ./task.c:26:     double eps = (double)(rand())/RAND_MAX*(0.001 - 0.00000001) + 0.00000001;
	call	rand@PLT	
# ./task.c:26:     double eps = (double)(rand())/RAND_MAX*(0.001 - 0.00000001) + 0.00000001;
	cvtsi2sd	xmm0, eax	
# ./task.c:26:     double eps = (double)(rand())/RAND_MAX*(0.001 - 0.00000001) + 0.00000001;
	movsd	xmm1, QWORD PTR .LC3[rip]	# tmp90,
	divsd	xmm0, xmm1	
	movapd	xmm1, xmm0	
# ./task.c:26:     double eps = (double)(rand())/RAND_MAX*(0.001 - 0.00000001) + 0.00000001;
	movsd	xmm0, QWORD PTR .LC4[rip]	# tmp91,
	mulsd	xmm1, xmm0	
# ./task.c:26:     double eps = (double)(rand())/RAND_MAX*(0.001 - 0.00000001) + 0.00000001;
	movsd	xmm0, QWORD PTR .LC5[rip]	# tmp93,
	addsd	xmm0, xmm1	
	movsd	QWORD PTR -8[rbp], xmm0	# eps, tmp92
# ./task.c:27:     printf("Generated epsilon: %lf\n", eps);
	mov	rax, QWORD PTR -8[rbp]	# tmp94, eps
	movq	xmm0, rax	#, tmp94
	lea	rdi, .LC6[rip]	
	mov	eax, 1	
	call	printf@PLT	
# ./task.c:28: 	return Task(eps);
	mov	rax, QWORD PTR -8[rbp]	# tmp95, eps
	movq	xmm0, rax	#, tmp95
	call	Task	
# ./task.c:29: }
	leave	
	ret	
	.size	Task_random, .-Task_random
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.align 8
.LC2:
	.long	0
	.long	1073741824
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
