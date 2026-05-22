	.file	"Temperatura__CP2.c"
	.section .rdata,"dr"
	.align 32
_catalogo:
	.long	1
	.ascii "Compacta  \342\200\223 LFP  40 kWh\0"
	.space 14
	.long	40
	.long	0
	.long	80
	.long	2
	.ascii "M\303\251dia     \342\200\223 NMC  60 kWh\0"
	.space 13
	.long	60
	.long	1
	.long	90
	.long	3
	.ascii "Grande    \342\200\223 NMC 100 kWh\0"
	.space 14
	.long	100
	.long	1
	.long	130
	.text
	.def	_ler_temperatura;	.scl	3;	.type	32;	.endef
_ler_temperatura:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	cmpl	$1, 8(%ebp)
	jne	L2
	flds	LC0
	jmp	L3
L2:
	flds	LC1
L3:
	fstps	-12(%ebp)
	cmpl	$1, 12(%ebp)
	jne	L4
	flds	-12(%ebp)
	flds	LC2
	faddp	%st, %st(1)
	fstps	-12(%ebp)
	jmp	L5
L4:
	flds	-12(%ebp)
	flds	LC2
	fsubrp	%st, %st(1)
	fstps	-12(%ebp)
L5:
	call	_rand
	movl	%eax, %ecx
	movl	$-1600085855, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%edx,%ecx), %eax
	sarl	$5, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$51, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -28(%ebp)
	fildl	-28(%ebp)
	flds	LC3
	fsubrp	%st, %st(1)
	flds	LC4
	fdivrp	%st, %st(1)
	fstps	-20(%ebp)
	flds	-12(%ebp)
	fadds	-20(%ebp)
	fstps	-16(%ebp)
	flds	LC4
	flds	-16(%ebp)
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L6
	flds	LC4
	fstps	-16(%ebp)
L6:
	flds	-16(%ebp)
	flds	LC5
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L8
	flds	LC5
	fstps	-16(%ebp)
L8:
	flds	-16(%ebp)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.section .rdata,"dr"
LC9:
	.ascii "#\0"
LC10:
	.ascii "-\0"
	.text
	.def	_imprimir_barra;	.scl	3;	.type	32;	.endef
_imprimir_barra:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	flds	8(%ebp)
	flds	LC7
	fdivrp	%st, %st(1)
	flds	LC8
	fmulp	%st, %st(1)
	fnstcw	-26(%ebp)
	movzwl	-26(%ebp), %eax
	movb	$12, %ah
	movw	%ax, -28(%ebp)
	fldcw	-28(%ebp)
	fistpl	-16(%ebp)
	fldcw	-26(%ebp)
	movl	$91, (%esp)
	call	_putchar
	movl	$0, -12(%ebp)
	jmp	L14
L17:
	movl	-12(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jge	L15
	movl	$LC9, %eax
	jmp	L16
L15:
	movl	$LC10, %eax
L16:
	movl	%eax, (%esp)
	call	_printf
	addl	$1, -12(%ebp)
L14:
	cmpl	$29, -12(%ebp)
	jle	L17
	movl	$93, (%esp)
	call	_putchar
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.section .rdata,"dr"
	.align 4
LC11:
	.ascii "------------------------------------------------------------\0"
	.text
	.def	_linha;	.scl	3;	.type	32;	.endef
_linha:
LFB28:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$LC11, (%esp)
	call	_puts
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 4
LC12:
	.ascii "\12============================================================\0"
	.align 4
LC13:
	.ascii "        SIMULADOR DE CARGA \342\200\224 VE\303\215CULO EL\303\211TRICO               \0"
	.align 4
LC14:
	.ascii "============================================================\12\0"
LC15:
	.ascii "\360\237\224\245 DIA QUENTE\0"
LC16:
	.ascii "\342\235\204\357\270\217 DIA FRIO\0"
	.align 4
LC17:
	.ascii "  CONDI\303\207\303\203O CLIM\303\201TICA DO DIA: %s\12\0"
	.align 4
LC18:
	.ascii "Deseja iniciar o processo de carga? (s/n): \0"
LC19:
	.ascii "%7s\0"
	.align 4
LC20:
	.ascii "\12Carga cancelada pelo operador. Sistema encerrado.\12\0"
LC21:
	.ascii "  BATERIAS DISPON\303\215VEIS\0"
LC22:
	.ascii "Tempo Normal\0"
LC23:
	.ascii "Carga R\303\241pida\0"
LC24:
	.ascii "kWh\0"
LC25:
	.ascii "Modelo\0"
LC26:
	.ascii "ID\0"
	.align 4
LC27:
	.ascii "  %-3s %-26s %-8s %-12s %-15s\12\0"
LC28:
	.ascii "SIM\0"
LC29:
	.ascii "N\303\203O\0"
	.align 4
LC30:
	.ascii "  [%d] %-26s %-8d %-12s %d min\12\0"
LC31:
	.ascii "Escolha a bateria (1-3): \0"
LC32:
	.ascii "%d\0"
	.align 4
LC33:
	.ascii "Op\303\247\303\243o inv\303\241lida. Encerrando.\0"
LC34:
	.ascii "  INICIANDO CARGA\0"
LC35:
	.ascii "  Bateria   : %s\12\0"
LC36:
	.ascii "  Capacidade: %d kWh\12\0"
LC37:
	.ascii "QUENTE\0"
LC38:
	.ascii "FRIO\0"
LC39:
	.ascii "  Clima     : %s\12\0"
LC40:
	.ascii "R\303\201PIDA (2\303\227 mais r\303\241pida)\0"
LC41:
	.ascii "NORMAL\0"
LC42:
	.ascii "  Modo ini. : %s\12\0"
LC43:
	.ascii "  Tempo est.: ~%d min\12\0"
	.align 4
LC44:
	.ascii "  Min  | Temperatura | Modo   | Progresso                          | %%\12\0"
	.align 4
LC47:
	.ascii "  *** ALERTA DE TEMPERATURA ***\0"
	.align 4
LC49:
	.ascii "  Sensor: %.1f \302\260C > %.0f \302\260C limite\12\0"
	.align 4
LC50:
	.ascii "  Modo de carga alterado: R\303\201PIDA \342\206\222 NORMAL\0"
LC51:
	.ascii "R\303\201PIDA\0"
	.align 4
LC52:
	.ascii "  %3d  | %7.1f \302\260C   | %-6s | \0"
LC53:
	.ascii " | %5.1f%%\12\0"
LC54:
	.ascii "  CARGA CONCLU\303\215DA\0"
LC55:
	.ascii "  Clima Geral: %s\12\0"
LC56:
	.ascii "  Tempo tot.: %d minutos\12\0"
LC57:
	.ascii "NORMAL (trocou por temp.)\0"
LC58:
	.ascii "  Modo final: %s\12\0"
	.align 4
LC59:
	.ascii "  Bateria 100%% carregada. Pronto para uso!\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB29:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x74,0x6
	.cfi_escape 0x10,0x6,0x2,0x75,0x7c
	.cfi_escape 0x10,0x3,0x2,0x75,0x78
	subl	$124, %esp
	call	___main
	movl	$65001, (%esp)
	call	_SetConsoleOutputCP@4
	subl	$4, %esp
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	call	_rand
	andl	$1, %eax
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	movl	%eax, -48(%ebp)
	movl	$LC12, (%esp)
	call	_puts
	movl	$LC13, (%esp)
	call	_puts
	movl	$LC14, (%esp)
	call	_puts
	cmpl	$1, -48(%ebp)
	jne	L20
	movl	$LC15, %eax
	jmp	L21
L20:
	movl	$LC16, %eax
L21:
	movl	%eax, 4(%esp)
	movl	$LC17, (%esp)
	call	_printf
	movl	$LC14, (%esp)
	call	_puts
	movl	$LC18, (%esp)
	call	_printf
	leal	-84(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC19, (%esp)
	call	_scanf
	movzbl	-84(%ebp), %eax
	cmpb	$115, %al
	je	L22
	movzbl	-84(%ebp), %eax
	cmpb	$83, %al
	je	L22
	movl	$LC20, (%esp)
	call	_puts
	movl	$0, %eax
	jmp	L53
L22:
	movl	$10, (%esp)
	call	_putchar
	call	_linha
	movl	$LC21, (%esp)
	call	_puts
	call	_linha
	movl	$LC22, 20(%esp)
	movl	$LC23, 16(%esp)
	movl	$LC24, 12(%esp)
	movl	$LC25, 8(%esp)
	movl	$LC26, 4(%esp)
	movl	$LC27, (%esp)
	call	_printf
	call	_linha
	movl	$0, -28(%ebp)
	jmp	L24
L27:
	movl	-28(%ebp), %eax
	imull	$56, %eax, %eax
	addl	$_catalogo, %eax
	movl	%eax, -52(%ebp)
	movl	-52(%ebp), %eax
	movl	52(%eax), %ecx
	movl	-52(%ebp), %eax
	movl	48(%eax), %eax
	testl	%eax, %eax
	je	L25
	movl	$LC28, %esi
	jmp	L26
L25:
	movl	$LC29, %esi
L26:
	movl	-52(%ebp), %eax
	movl	44(%eax), %edx
	movl	-52(%ebp), %eax
	leal	4(%eax), %ebx
	movl	-52(%ebp), %eax
	movl	(%eax), %eax
	movl	%ecx, 20(%esp)
	movl	%esi, 16(%esp)
	movl	%edx, 12(%esp)
	movl	%ebx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC30, (%esp)
	call	_printf
	addl	$1, -28(%ebp)
L24:
	cmpl	$2, -28(%ebp)
	jle	L27
	call	_linha
	movl	$LC31, (%esp)
	call	_printf
	leal	-88(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC32, (%esp)
	call	_scanf
	cmpl	$1, %eax
	jne	L28
	movl	-88(%ebp), %eax
	testl	%eax, %eax
	jle	L28
	movl	-88(%ebp), %eax
	cmpl	$3, %eax
	jle	L29
L28:
	movl	$LC33, (%esp)
	call	_puts
	movl	$1, %eax
	jmp	L53
L29:
	movl	-88(%ebp), %eax
	subl	$1, %eax
	imull	$56, %eax, %eax
	addl	$_catalogo, %eax
	movl	%eax, -56(%ebp)
	movl	-56(%ebp), %eax
	movl	48(%eax), %eax
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	movl	%eax, -32(%ebp)
	movl	-56(%ebp), %eax
	movl	52(%eax), %eax
	movl	%eax, -60(%ebp)
	fildl	-60(%ebp)
	flds	LC7
	fdivp	%st, %st(1)
	fstps	-64(%ebp)
	movl	-60(%ebp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -92(%ebp)
	fildl	-92(%ebp)
	flds	LC7
	fdivp	%st, %st(1)
	fstps	-68(%ebp)
	movl	$10, (%esp)
	call	_putchar
	call	_linha
	movl	$LC34, (%esp)
	call	_puts
	call	_linha
	movl	-56(%ebp), %eax
	addl	$4, %eax
	movl	%eax, 4(%esp)
	movl	$LC35, (%esp)
	call	_printf
	movl	-56(%ebp), %eax
	movl	44(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC36, (%esp)
	call	_printf
	cmpl	$1, -48(%ebp)
	jne	L30
	movl	$LC37, %eax
	jmp	L31
L30:
	movl	$LC38, %eax
L31:
	movl	%eax, 4(%esp)
	movl	$LC39, (%esp)
	call	_printf
	cmpl	$1, -32(%ebp)
	jne	L32
	movl	$LC40, %eax
	jmp	L33
L32:
	movl	$LC41, %eax
L33:
	movl	%eax, 4(%esp)
	movl	$LC42, (%esp)
	call	_printf
	cmpl	$1, -32(%ebp)
	jne	L34
	movl	-60(%ebp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	jmp	L35
L34:
	movl	-60(%ebp), %eax
L35:
	movl	%eax, 4(%esp)
	movl	$LC43, (%esp)
	call	_printf
	call	_linha
	movl	$LC44, (%esp)
	call	_printf
	call	_linha
	fldz
	fstps	-36(%ebp)
	movl	$0, -40(%ebp)
	movl	$0, -44(%ebp)
	jmp	L36
L46:
	movl	$500, (%esp)
	call	_Sleep@4
	subl	$4, %esp
	movl	-48(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	_ler_temperatura
	fstps	-92(%ebp)
	movl	-92(%ebp), %eax
	movl	%eax, -72(%ebp)
	cmpl	$1, -32(%ebp)
	jne	L37
	flds	-72(%ebp)
	flds	LC46
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L37
	cmpl	$0, -44(%ebp)
	jne	L39
	movl	$10, (%esp)
	call	_putchar
	movl	$LC47, (%esp)
	call	_puts
	flds	-72(%ebp)
	fldl	LC48
	fstpl	12(%esp)
	fstpl	4(%esp)
	movl	$LC49, (%esp)
	call	_printf
	movl	$LC50, (%esp)
	call	_puts
	movl	$10, (%esp)
	call	_putchar
	movl	$1, -44(%ebp)
L39:
	movl	$0, -32(%ebp)
L37:
	cmpl	$1, -32(%ebp)
	jne	L40
	flds	-68(%ebp)
	jmp	L41
L40:
	flds	-64(%ebp)
L41:
	fstps	-76(%ebp)
	flds	-36(%ebp)
	fadds	-76(%ebp)
	fstps	-36(%ebp)
	flds	-36(%ebp)
	flds	LC7
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L42
	flds	LC7
	fstps	-36(%ebp)
L42:
	addl	$1, -40(%ebp)
	cmpl	$1, -32(%ebp)
	jne	L44
	movl	$LC51, %eax
	jmp	L45
L44:
	movl	$LC41, %eax
L45:
	flds	-72(%ebp)
	movl	%eax, 16(%esp)
	fstpl	8(%esp)
	movl	-40(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC52, (%esp)
	call	_printf
	flds	-36(%ebp)
	fstps	(%esp)
	call	_imprimir_barra
	flds	-36(%ebp)
	fstpl	4(%esp)
	movl	$LC53, (%esp)
	call	_printf
L36:
	flds	LC7
	flds	-36(%ebp)
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	ja	L46
	movl	$10, (%esp)
	call	_putchar
	call	_linha
	movl	$LC54, (%esp)
	call	_puts
	call	_linha
	movl	-56(%ebp), %eax
	addl	$4, %eax
	movl	%eax, 4(%esp)
	movl	$LC35, (%esp)
	call	_printf
	cmpl	$1, -48(%ebp)
	jne	L47
	movl	$LC37, %eax
	jmp	L48
L47:
	movl	$LC38, %eax
L48:
	movl	%eax, 4(%esp)
	movl	$LC55, (%esp)
	call	_printf
	movl	-40(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC56, (%esp)
	call	_printf
	cmpl	$1, -32(%ebp)
	je	L49
	cmpl	$0, -44(%ebp)
	je	L50
	movl	$LC57, %eax
	jmp	L52
L50:
	movl	$LC41, %eax
	jmp	L52
L49:
	movl	$LC51, %eax
L52:
	movl	%eax, 4(%esp)
	movl	$LC58, (%esp)
	call	_printf
	call	_linha
	movl	$LC59, (%esp)
	call	_printf
	call	_linha
	movl	$10, (%esp)
	call	_putchar
	movl	$0, %eax
L53:
	leal	-12(%ebp), %esp
	popl	%ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE29:
	.section .rdata,"dr"
	.align 4
LC0:
	.long	1111228416
	.align 4
LC1:
	.long	1108082688
	.align 4
LC2:
	.long	1084227584
	.align 4
LC3:
	.long	1103626240
	.align 4
LC4:
	.long	1092616192
	.align 4
LC5:
	.long	1117126656
	.align 4
LC7:
	.long	1120403456
	.align 4
LC8:
	.long	1106247680
	.align 4
LC46:
	.long	1112014848
	.align 8
LC48:
	.long	0
	.long	1078525952
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_SetConsoleOutputCP@4;	.scl	2;	.type	32;	.endef
	.def	_time;	.scl	2;	.type	32;	.endef
	.def	_srand;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_Sleep@4;	.scl	2;	.type	32;	.endef
