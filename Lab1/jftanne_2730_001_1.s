/*
NAME    Joel Tanner
COURSE  ECE 2730
SECTION  001
DATE    01/27/2020
FILE    jftanne_2730_001.s
PURPOSE  This file will convert the ascii character into decimal values and sum
         the values and return them.
*/
/* begin assembly code */

.globl asum
.type asum,@function
asum:
	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp
	movl $0, -4(%ebp)
.L2:
	movl 8(%ebp),%eax
	cmpb $0,(%eax)
	jne .L4
	jmp .L3
.L4:
	movl 8(%ebp),%eax
	movsbl (%eax),%edx
	addl %edx, -4(%ebp)
	incl 8(%ebp)
	jmp .L2
.L3:
	movl -4(%ebp), %eax
	jmp .L1
.L1:
	movl %ebp, %esp
	popl %ebp
	ret

/* end assembly */
/* Do not forget the required blank line here! */
