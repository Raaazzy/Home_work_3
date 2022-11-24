	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Input name of the output file: "
.LC1:
	.string	"%s"
.LC2:
	.string	"w"
	.align 8
.LC3:
	.string	"The name of the output file was entered incorrectly."
.LC4:
	.string	"%lf "
	.align 8
.LC7:
	.string	"The entered epsilon is not in range [0.00000001; 0.001]."
	.align 8
.LC8:
	.string	"Program execution time: %d ms\n"
.LC9:
	.string	"Result: %lf\n"
.LC10:
	.string	"r"
	.align 8
.LC11:
	.string	"The name of the data entry file was entered incorrectly."
.LC12:
	.string	"%lf"
	.align 8
.LC13:
	.string	"Please try entering you details again, but correctly."
	.text
	.globl	main
	.type	main, @function
main:
	endbr64	
	push	rbp	
	mov	rbp, rsp	
	sub	rsp, 96	
	mov	DWORD PTR -84[rbp], edi	# argc, argc
	mov	QWORD PTR -96[rbp], rsi	# argv, argv
# ./main.c:12:     if (argc == 1) {
	cmp	DWORD PTR -84[rbp], 1	# argc,
	jne	.L2	
# ./main.c:14:         printf("Input name of the output file: ");
	lea	rdi, .LC0[rip]	
	mov	eax, 0	
	call	printf@PLT	
# ./main.c:15:         scanf("%s", file_name);
	mov	rax, QWORD PTR -48[rbp]	# tmp104, file_name
	mov	rsi, rax	#, tmp104
	lea	rdi, .LC1[rip]	
	mov	eax, 0	
	call	__isoc99_scanf@PLT	
# ./main.c:16:         FILE *output_stream = fopen(file_name, "w");
	mov	rax, QWORD PTR -48[rbp]	# tmp105, file_name
	lea	rsi, .LC2[rip]	
	mov	rdi, rax	#, tmp105
	call	fopen@PLT	
	mov	QWORD PTR -56[rbp], rax	# output_stream, tmp106
# ./main.c:17:         if (output_stream == NULL) {
	cmp	QWORD PTR -56[rbp], 0	# output_stream,
	jne	.L3	
# ./main.c:18:             printf("The name of the output file was entered incorrectly.\n");
	lea	rdi, .LC3[rip]	
	call	puts@PLT	
# ./main.c:19:             return 0;
	mov	eax, 0	
	jmp	.L18	
.L3:
# ./main.c:21:         fprintf(output_stream, "%lf ", Task_random());
	mov	eax, 0	
	call	Task_random@PLT	
	mov	rax, QWORD PTR -56[rbp]	# tmp107, output_stream
	lea	rsi, .LC4[rip]	
	mov	rdi, rax	#, tmp107
	mov	eax, 1	
	call	fprintf@PLT	
# ./main.c:22:         fclose(output_stream);
	mov	rax, QWORD PTR -56[rbp]	# tmp108, output_stream
	mov	rdi, rax	#, tmp108
	call	fclose@PLT	
# ./main.c:23:         return 0;
	mov	eax, 0
	jmp	.L18	
.L2:
# ./main.c:26:     if (argc == 2) {
	cmp	DWORD PTR -84[rbp], 2	# argc,
	jne	.L5	
# ./main.c:27:         char* temp = NULL;
	mov	QWORD PTR -72[rbp], 0	# temp,
# ./main.c:28:         epsilon = strtod(argv[1], &temp);
	mov	rax, QWORD PTR -96[rbp]	# tmp109, argv
	add	rax, 8	
# ./main.c:28:         epsilon = strtod(argv[1], &temp);
	mov	rax, QWORD PTR [rax]	
	lea	rdx, -72[rbp]	# tmp110,
	mov	rsi, rdx	#, tmp110
	mov	rdi, rax	
	call	strtod@PLT	
	movq	rax, xmm0	
# ./main.c:28:         epsilon = strtod(argv[1], &temp);
	mov	QWORD PTR -64[rbp], rax	
# ./main.c:29:         if (epsilon > 0.001 || epsilon < 0.00000001) {
	movsd	xmm0, QWORD PTR -64[rbp]	# epsilon.0_5, epsilon
# ./main.c:29:         if (epsilon > 0.001 || epsilon < 0.00000001) {
	comisd	xmm0, QWORD PTR .LC5[rip]	# epsilon.0_5,
	ja	.L6	
# ./main.c:29:         if (epsilon > 0.001 || epsilon < 0.00000001) {
	movsd	xmm1, QWORD PTR -64[rbp]	# epsilon.1_6, epsilon
# ./main.c:29:         if (epsilon > 0.001 || epsilon < 0.00000001) {
	movsd	xmm0, QWORD PTR .LC6[rip]	# tmp111,
	comisd	xmm0, xmm1	# tmp111, epsilon.1_6
	jbe	.L19	
.L6:
# ./main.c:30:             printf("The entered epsilon is not in range [0.00000001; 0.001].\n");
	lea	rdi, .LC7[rip]	
	call	puts@PLT	
# ./main.c:31:             return 0;
	mov	eax, 0	
	jmp	.L18	
.L19:
# ./main.c:33:         time_t t_start = clock();
	call	clock@PLT	
	mov	QWORD PTR -32[rbp], rax	# t_start, tmp112
# ./main.c:34:         for (int i = 0; i < 25000000; ++i) {
	mov	DWORD PTR -4[rbp], 0	# i,
# ./main.c:34:         for (int i = 0; i < 25000000; ++i) {
	jmp	.L10	
.L11:
# ./main.c:35:             Task(epsilon);
	mov	rax, QWORD PTR -64[rbp]	# epsilon.2_7, epsilon
	movq	xmm0, rax	#, epsilon.2_7
	call	Task@PLT	
# ./main.c:34:         for (int i = 0; i < 25000000; ++i) {
	add	DWORD PTR -4[rbp], 1	# i,
.L10:
# ./main.c:34:         for (int i = 0; i < 25000000; ++i) {
	cmp	DWORD PTR -4[rbp], 24999999	# i,
	jle	.L11	
# ./main.c:37:         time_t t_end = clock();
	call	clock@PLT	
	mov	QWORD PTR -40[rbp], rax	# t_end, tmp113
# ./main.c:38:         printf("Program execution time: %d ms\n", (int) (difftime(t_end, t_start)) / 1000);
	mov	rdx, QWORD PTR -32[rbp]	# tmp114, t_start
	mov	rax, QWORD PTR -40[rbp]	# tmp115, t_end
	mov	rsi, rdx	#, tmp114
	mov	rdi, rax	#, tmp115
	call	difftime@PLT	
# ./main.c:38:         printf("Program execution time: %d ms\n", (int) (difftime(t_end, t_start)) / 1000);
	cvttsd2si	eax, xmm0	# _9, _8
# ./main.c:38:         printf("Program execution time: %d ms\n", (int) (difftime(t_end, t_start)) / 1000);
	movsx	rdx, eax	# tmp116, _9
	imul	rdx, rdx, 274877907	# tmp117, tmp116,
	shr	rdx, 32	# tmp118,
	sar	edx, 6	# tmp119,
	sar	eax, 31	# tmp120,
	sub	edx, eax	# tmp119, tmp120
	mov	eax, edx	# _10, tmp119
	mov	esi, eax	#, _10
	lea	rdi, .LC8[rip]	
	mov	eax, 0	
	call	printf@PLT	
# ./main.c:39:         printf("Result: %lf\n", Task(epsilon));
	mov	rax, QWORD PTR -64[rbp]	# epsilon.3_11, epsilon
	movq	xmm0, rax	#, epsilon.3_11
	call	Task@PLT	
	lea	rdi, .LC9[rip]	
	mov	eax, 1	
	call	printf@PLT	
# ./main.c:40:         return 0;
	mov	eax, 0	
	jmp	.L18	
.L5:
# ./main.c:43:     if (argc == 3) {
	cmp	DWORD PTR -84[rbp], 3	# argc,
	jne	.L12	
# ./main.c:44:         FILE *input_stream = fopen(argv[1], "r");
	mov	rax, QWORD PTR -96[rbp]	# tmp121, argv
	add	rax, 8	
# ./main.c:44:         FILE *input_stream = fopen(argv[1], "r");
	mov	rax, QWORD PTR [rax]	
	lea	rsi, .LC10[rip]	
	mov	rdi, rax	
	call	fopen@PLT	
	mov	QWORD PTR -16[rbp], rax	# input_stream, tmp122
# ./main.c:45:         if (input_stream == NULL) {
	cmp	QWORD PTR -16[rbp], 0	# input_stream,
	jne	.L13	
# ./main.c:46:             printf("The name of the data entry file was entered incorrectly.\n");
	lea	rdi, .LC11[rip]	
	call	puts@PLT	
# ./main.c:47:             return 0;
	mov	eax, 0	
	jmp	.L18	
.L13:
# ./main.c:49:         fscanf(input_stream, "%lf", &epsilon);
	lea	rdx, -64[rbp]	# tmp123,
	mov	rax, QWORD PTR -16[rbp]	# tmp124, input_stream
	lea	rsi, .LC12[rip]	
	mov	rdi, rax	#, tmp124
	mov	eax, 0	
	call	__isoc99_fscanf@PLT	
# ./main.c:50:         fclose(input_stream);
	mov	rax, QWORD PTR -16[rbp]	# tmp125, input_stream
	mov	rdi, rax	#, tmp125
	call	fclose@PLT	
# ./main.c:51:         if (epsilon > 0.001 || epsilon < 0.00000001) {
	movsd	xmm0, QWORD PTR -64[rbp]	# epsilon.4_15, epsilon
# ./main.c:51:         if (epsilon > 0.001 || epsilon < 0.00000001) {
	comisd	xmm0, QWORD PTR .LC5[rip]	# epsilon.4_15,
	ja	.L14	
# ./main.c:51:         if (epsilon > 0.001 || epsilon < 0.00000001) {
	movsd	xmm1, QWORD PTR -64[rbp]	# epsilon.5_16, epsilon
# ./main.c:51:         if (epsilon > 0.001 || epsilon < 0.00000001) {
	movsd	xmm0, QWORD PTR .LC6[rip]	# tmp126,
	comisd	xmm0, xmm1	# tmp126, epsilon.5_16
	jbe	.L20	
.L14:
# ./main.c:52:             printf("The entered epsilon is not in range [0.00000001; 0.001].\n");
	lea	rdi, .LC7[rip]	
	call	puts@PLT	
# ./main.c:53:             return 0;
	mov	eax, 0	
	jmp	.L18	
.L20:
# ./main.c:55:         FILE *output_stream = fopen(argv[2], "w");
	mov	rax, QWORD PTR -96[rbp]	# tmp127, argv
	add	rax, 16	
# ./main.c:55:         FILE *output_stream = fopen(argv[2], "w");
	mov	rax, QWORD PTR [rax]	
	lea	rsi, .LC2[rip]	
	mov	rdi, rax	
	call	fopen@PLT	
	mov	QWORD PTR -24[rbp], rax	# output_stream, tmp128
# ./main.c:56:         if (output_stream == NULL) {
	cmp	QWORD PTR -24[rbp], 0	# output_stream,
	jne	.L17	
# ./main.c:57:             printf("The name of the output file was entered incorrectly.\n");
	lea	rdi, .LC3[rip]	
	call	puts@PLT	
# ./main.c:58:             return 0;
	mov	eax, 0	
	jmp	.L18	
.L17:
# ./main.c:60:         fprintf(output_stream, "%lf ", Task(epsilon));
	mov	rax, QWORD PTR -64[rbp]	# epsilon.6_19, epsilon
	movq	xmm0, rax	#, epsilon.6_19
	call	Task@PLT	
	mov	rax, QWORD PTR -24[rbp]	# tmp129, output_stream
	lea	rsi, .LC4[rip]	
	mov	rdi, rax	#, tmp129
	mov	eax, 1	
	call	fprintf@PLT	
# ./main.c:61:         fclose(output_stream);
	mov	rax, QWORD PTR -24[rbp]	# tmp130, output_stream
	mov	rdi, rax	#, tmp130
	call	fclose@PLT	
# ./main.c:62:         return 0;
	mov	eax, 0	
	jmp	.L18	
.L12:
# ./main.c:64:     printf("Please try entering you details again, but correctly.\n");
	lea	rdi, .LC13[rip]	
	call	puts@PLT	
# ./main.c:65:     return 0;
	mov	eax, 0	
.L18:
# ./main.c:66: }
	leave	
	ret	
	.size	main, .-main
	.section	.rodata
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
