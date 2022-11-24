	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Input name of the output file: "
.LC1:
	.string	"%s"
.LC2:
	.string	"w"
.LC3:
	.string	"The name of the output file was entered incorrectly."
.LC4:
	.string	"%lf "
.LC7:
	.string	"The entered epsilon is not in range [0.00000001; 0.001]."
.LC8:
	.string	"Program execution time: %d ms\n"
.LC9:
	.string	"Result: %lf\n"
.LC10:
	.string	"r"
.LC11:
	.string	"The name of the data entry file was entered incorrectly."
.LC12:
	.string	"%lf"
.LC13:
	.string	"Please try entering you details again, but correctly."
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	endbr64
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	sub	rsp, 40
	.cfi_def_cfa_offset 64
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 24[rsp], rax
	xor	eax, eax
	cmp	edi, 1
	jne	.L2
	xor	ebp, ebp
	lea	rsi, .LC0[rip]
	call	__printf_chk@PLT
	mov	rsi, rbp
	lea	rdi, .LC1[rip]
	xor	eax, eax
	call	__isoc99_scanf@PLT
	mov	rdi, rbp
	lea	rsi, .LC2[rip]
	call	fopen@PLT
	mov	rbp, rax
	test	rax, rax
	jne	.L3
.L16:
	lea	rdi, .LC3[rip]
	jmp	.L26
.L3:
	xor	eax, eax
	call	Task_random@PLT
	jmp	.L25
.L2:
	mov	rbp, rsi
	cmp	edi, 2
	jne	.L5
	mov	rdi, QWORD PTR 8[rbp]
	lea	rsi, 16[rsp]
	mov	QWORD PTR 16[rsp], 0
	call	strtod@PLT
	comisd	xmm0, QWORD PTR .LC5[rip]
	movsd	QWORD PTR 8[rsp], xmm0
	ja	.L13
	movsd	xmm1, QWORD PTR .LC6[rip]
	comisd	xmm1, xmm0
	ja	.L13
	call	clock@PLT
	mov	r12d, 25000000
	mov	rbp, rax
.L10:
	movsd	xmm0, QWORD PTR 8[rsp]
	call	Task@PLT
	dec	r12d
	jne	.L10
	call	clock@PLT
	mov	rsi, rbp
	mov	rdi, rax
	call	difftime@PLT
	mov	ecx, 1000
	mov	edi, 1
	lea	rsi, .LC8[rip]
	cvttsd2si	eax, xmm0
	cdq
	idiv	ecx
	mov	edx, eax
	xor	eax, eax
	call	__printf_chk@PLT
	movsd	xmm0, QWORD PTR 8[rsp]
	call	Task@PLT
	lea	rsi, .LC9[rip]
	mov	edi, 1
	mov	al, 1
	call	__printf_chk@PLT
	jmp	.L4
.L5:
	cmp	edi, 3
	jne	.L11
	mov	rdi, QWORD PTR 8[rsi]
	lea	rsi, .LC10[rip]
	call	fopen@PLT
	lea	rdi, .LC11[rip]
	mov	r12, rax
	test	rax, rax
	je	.L26
	mov	rdi, rax
	lea	rdx, 8[rsp]
	lea	rsi, .LC12[rip]
	xor	eax, eax
	call	__isoc99_fscanf@PLT
	mov	rdi, r12
	call	fclose@PLT
	movsd	xmm0, QWORD PTR 8[rsp]
	comisd	xmm0, QWORD PTR .LC5[rip]
	ja	.L13
	movsd	xmm1, QWORD PTR .LC6[rip]
	comisd	xmm1, xmm0
	jbe	.L23
.L13:
	lea	rdi, .LC7[rip]
	jmp	.L26
.L23:
	mov	rdi, QWORD PTR 16[rbp]
	lea	rsi, .LC2[rip]
	call	fopen@PLT
	mov	rbp, rax
	test	rax, rax
	je	.L16
	movsd	xmm0, QWORD PTR 8[rsp]
	call	Task@PLT
.L25:
	mov	rdi, rbp
	lea	rdx, .LC4[rip]
	mov	esi, 1
	mov	al, 1
	call	__fprintf_chk@PLT
	mov	rdi, rbp
	call	fclose@PLT
	jmp	.L4
.L11:
	lea	rdi, .LC13[rip]
.L26:
	call	puts@PLT
.L4:
	mov	rax, QWORD PTR 24[rsp]
	xor	rax, QWORD PTR fs:40
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	add	rsp, 40
	.cfi_def_cfa_offset 24
	xor	eax, eax
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC5:
	.long	3539053052
	.long	1062232653
	.align 8
.LC6:
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
