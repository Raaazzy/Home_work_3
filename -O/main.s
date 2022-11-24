	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Input name of the output file: "
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"%s"
.LC2:
	.string	"w"
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"The name of the output file was entered incorrectly."
	.section	.rodata.str1.1
.LC4:
	.string	"%lf "
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"The entered epsilon is not in range [0.00000001; 0.001]."
	.align 8
.LC8:
	.string	"Program execution time: %d ms\n"
	.section	.rodata.str1.1
.LC9:
	.string	"Result: %lf\n"
.LC10:
	.string	"r"
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"The name of the data entry file was entered incorrectly."
	.section	.rodata.str1.1
.LC12:
	.string	"%lf"
	.section	.rodata.str1.8
	.align 8
.LC13:
	.string	"Please try entering you details again, but correctly."
	.text
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	sub	rsp, 40
	.cfi_def_cfa_offset 64
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 24[rsp], rax
	xor	eax, eax
	cmp	edi, 1
	je	.L22
	mov	rbx, rsi
	cmp	edi, 2
	je	.L23
	cmp	edi, 3
	je	.L24
	lea	rdi, .LC13[rip]
	call	puts@PLT
.L4:
	mov	rax, QWORD PTR 24[rsp]
	xor	rax, QWORD PTR fs:40
	jne	.L25
	mov	eax, 0
	add	rsp, 40
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.L22:
	.cfi_restore_state
	lea	rsi, .LC0[rip]
	call	__printf_chk@PLT
	mov	ebx, 0
	mov	rsi, rbx
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	lea	rsi, .LC2[rip]
	mov	rdi, rbx
	call	fopen@PLT
	mov	rbx, rax
	test	rax, rax
	je	.L26
	mov	eax, 0
	call	Task_random@PLT
	lea	rdx, .LC4[rip]
	mov	esi, 1
	mov	rdi, rbx
	mov	eax, 1
	call	__fprintf_chk@PLT
	mov	rdi, rbx
	call	fclose@PLT
	jmp	.L4
.L26:
	lea	rdi, .LC3[rip]
	call	puts@PLT
	jmp	.L4
.L23:
	mov	QWORD PTR 16[rsp], 0
	lea	rsi, 16[rsp]
	mov	rdi, QWORD PTR 8[rbx]
	call	strtod@PLT
	movsd	QWORD PTR 8[rsp], xmm0
	comisd	xmm0, QWORD PTR .LC5[rip]
	ja	.L6
	movsd	xmm1, QWORD PTR .LC6[rip]
	comisd	xmm1, xmm0
	jbe	.L19
.L6:
	lea	rdi, .LC7[rip]
	call	puts@PLT
	jmp	.L4
.L19:
	call	clock@PLT
	mov	rbp, rax
	mov	ebx, 25000000
.L10:
	movsd	xmm0, QWORD PTR 8[rsp]
	call	Task@PLT
	sub	ebx, 1
	jne	.L10
	call	clock@PLT
	mov	rdi, rax
	mov	rsi, rbp
	call	difftime@PLT
	cvttsd2si	eax, xmm0
	mov	ecx, 1000
	cdq
	idiv	ecx
	mov	edx, eax
	lea	rsi, .LC8[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	movsd	xmm0, QWORD PTR 8[rsp]
	call	Task@PLT
	lea	rsi, .LC9[rip]
	mov	edi, 1
	mov	eax, 1
	call	__printf_chk@PLT
	jmp	.L4
.L24:
	mov	rdi, QWORD PTR 8[rsi]
	lea	rsi, .LC10[rip]
	call	fopen@PLT
	mov	rbp, rax
	test	rax, rax
	je	.L27
	lea	rdx, 8[rsp]
	lea	rsi, .LC12[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	rdi, rbp
	call	fclose@PLT
	movsd	xmm0, QWORD PTR 8[rsp]
	comisd	xmm0, QWORD PTR .LC5[rip]
	ja	.L13
	movsd	xmm1, QWORD PTR .LC6[rip]
	comisd	xmm1, xmm0
	jbe	.L20
.L13:
	lea	rdi, .LC7[rip]
	call	puts@PLT
	jmp	.L4
.L27:
	lea	rdi, .LC11[rip]
	call	puts@PLT
	jmp	.L4
.L20:
	mov	rdi, QWORD PTR 16[rbx]
	lea	rsi, .LC2[rip]
	call	fopen@PLT
	mov	rbx, rax
	test	rax, rax
	je	.L28
	movsd	xmm0, QWORD PTR 8[rsp]
	call	Task@PLT
	lea	rdx, .LC4[rip]
	mov	esi, 1
	mov	rdi, rbx
	mov	eax, 1
	call	__fprintf_chk@PLT
	mov	rdi, rbx
	call	fclose@PLT
	jmp	.L4
.L28:
	lea	rdi, .LC3[rip]
	call	puts@PLT
	jmp	.L4
.L25:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
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
