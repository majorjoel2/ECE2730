/* begin assembly stub */

.globl classify
.type classify,@function
classify:
	/* prolog */
	pushl %ebp
	pushl %ebx
	movl %esp, %ebp
	
	/* put code here */
	
	return:
	/* epilog */
	movl %ebp, %esp
	popl %ebx
	popl %ebp
	ret
	
/* declare variables here */

/* end assembly stub */
