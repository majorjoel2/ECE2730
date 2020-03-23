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
	subl $8, %esp

	/* put code here */
	movl global_var, %ebx
	movl %ebx, -4(%ebp)
	cmpl $0, -4(%ebp)
	jne L00
	jmp return

L00:
	cmpl $1, -4(%ebp)
	jne L01
	jmp return

L01:
	movl -4(%ebp), %ebx
	subl $1, %ebx
	movl %ebx, global_var
	call Fib
	movl global_var, %ebx
	movl %ebx, -8(%ebp)
	movl -4(%ebp), %ebx
	subl $2, %ebx
	movl %ebx, global_var
	call Fib
	movl global_var, %ebx
	addl %ebx, -8(%ebp)
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
