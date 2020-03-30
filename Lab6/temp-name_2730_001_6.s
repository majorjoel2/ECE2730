/* put program header here */

/* begin assembly stub */

/* put function header here */

/* put assembler directives here */
.globl Factorial
.type Factorial,@function
Factorial:
	/* prolog */
	pushl %ebx
	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp

	/* put code here */
	cmpl $0, -4(%ebp)
	jne L01
	movl $1, %eax
	jmp return

L01:
	cmpl $1, -4(%ebp)
	jne L02
	movl $1, %eax
	jmp return

L02:
	#return n * Factorial(n-1);
	movl -4(%ebp), %ebx
	subl $1, %ebx
	#pass in n-1
	pushl %ebx
	call Factorial
	addl $4, %esp
	#function output in %eax
	movl -4(%ebp), %ebx
	mull %ebx

	return:

	/* epilog */
	movl %ebp, %esp
	popl %ebp
	popl %ebx
	ret

/* end assembly stub */
