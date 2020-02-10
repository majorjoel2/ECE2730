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

return:
  /* epilog */
  popl %edi
  popl %esi
  popl %ebx
  movl %ebp, %esp
  popl %ebp
  ret

/* end assembly stub */
