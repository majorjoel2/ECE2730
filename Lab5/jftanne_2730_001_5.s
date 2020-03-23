/* insert program header here*/

/* begin assembly stub */

/* insert Fib function header here*/
.globl Fib
.type Fib,@function
Fib:
	/* prolog */
	pushl %ebx
	pushl %ebp
	movl %esp, %ebp
	subl $8, $esp

	/* put code here */
	movl global_var, -4(%ebp)
	cmpl $0, -4(%ebp)
	jne L00
	jmp return

L00:
	cmpl $1, -4(%ebp)
	jne L01
	jmp return

L01:
	movl -4(%ebp), %eax
	subl 1, %eax
	movl %eax, global_var



	return:
	/* epilog */

	ret
/* end assembly stub */
