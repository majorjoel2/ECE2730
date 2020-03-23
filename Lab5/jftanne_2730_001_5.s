/*
NAME    Joel Tanner
COURSE  ECE 2730
SECTION  001
DATE    03/23/2020
FILE    jftanne_2730_001_5.s
PURPOSE  This file will calculate the Fibonacci Sequence with a recursive
				 assembly function.
*/
/* begin assembly stub */

/* insert Fib function header here*/
.globl Fib
.type Fib,@function
Fib:
	/* prolog */
	pushl %ebx
	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp

	/* put code here */
	#local_var = global_var;
	movl global_var, %ebx
	movl %ebx, -4(%ebp)
	#if(local_var == 0) return;
	cmpl $0, -4(%ebp)
	jne L00
	jmp return

L00:
	#if(local_var == 1) return;
	cmpl $1, -4(%ebp)
	jne L01
	jmp return

L01:
	#global_var = local_var - 1;
	movl -4(%ebp), %ebx
	subl $1, %ebx
	movl %ebx, global_var
	#Fib();
	call Fib
	#temp_var = global_var;
	movl global_var, %ebx
	movl %ebx, -8(%ebp)
	#global_var = local_var - 2;
	movl -4(%ebp), %ebx
	subl $2, %ebx
	movl %ebx, global_var
	#Fib();
	call Fib
	#temp_var = temp_var + global_var;
	movl global_var, %ebx
	addl %ebx, -8(%ebp)
	#global_var = temp_var;
	movl -8(%ebp), %ebx
	movl %ebx, global_var


	return:
	/* epilog */
	addl $8, %esp
	movl %ebp, %esp
	popl %ebp
	popl %ebx

	ret
/* end assembly stub */
