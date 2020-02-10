/*
NAME    Joel Tanner
COURSE  ECE 2730
SECTION  001
DATE    02/02/2020
FILE    jftanne_2730_001_2.s
PURPOSE  This file will perform the calculations needed for the driver file.
				 dodiff will square all digits and the return 1+2-3
				 dosumprod will return the sum and product of all the digits
				 doremainder will return the remainder of the product divided by the sum
*/
/* begin assembly stub */

.globl dodiff
.type dodiff, @function
dodiff:
	/* prolog */
	pushl %ebp
	pushl %ebx
	movl %esp, %ebp

	/* put code here */
	# Squares all digits and then adds 1 and 2 together and subtracts 3
	movl $0, diff
	movl digit1, %eax
	mull %eax
	addl %eax, diff
	movl digit2, %eax
	mull %eax
	addl %eax, diff
	movl digit3, %eax
	mull %eax
	subl %eax, diff

	/* epilog */
	movl %ebp, %esp
	popl %ebx
	popl %ebp
	ret

.globl dosumprod
.type dosumprod, @function
dosumprod:
	/* prolog */
	pushl %ebp
	pushl %ebx
	movl %esp, %ebp

	/* put code here */
	# Sums all three digits
	movl digit1, %eax
	addl digit2, %eax
	addl digit3, %eax
	movl %eax, sum

	# Multiplies all digits together
	movl digit1, %eax
	mull digit2
	mull digit3
	movl %eax, product

	/* epilog */
	movl %ebp, %esp
	popl %ebx
	popl %ebp
	ret

.globl doremainder
.type doremainder, @function
doremainder:
	/* prolog */
	pushl %ebp
	pushl %ebx
	movl %esp, %ebp

	/* put code here */
	# Divides the product by the sum and returns the remainder
	movl $0, %edx
	movl product, %eax
	divl sum
	movl %edx, remainder

	/* epilog */
	movl %ebp, %esp
	popl %ebx
	popl %ebp
	ret

/* declare variables here */
.comm digit1, 4
.comm digit2, 4
.comm digit3, 4
.comm diff, 4
.comm sum, 4
.comm product, 4
.comm remainder, 4

/* end assembly stub */
/* Do not forget the required blank line here! */
