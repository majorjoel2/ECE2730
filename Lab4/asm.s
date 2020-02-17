/* begin assembly stub */

.globl AtoI
.type AtoI,@function
AtoI:
  /* prolog */
  pushl %ebp
  movl %esp, %ebp
  pushl %ebx
  pushl %esi
  pushl %edi

  /* put code here */
  movl $1, sign
  movl $0, %ebx

L00:
  cmpl $32, ascii(; %ebx, 4)
  jne L01
  cmpl $9, ascii(; %ebx, 4)
  jne L01
  addl $1, %ebx

L01:

return:
  /* epilog */
  popl %edi
  popl %esi
  popl %ebx
  movl %ebp, %esp
  popl %ebp
  ret

.comm ascii, 40

/* end assembly stub */
