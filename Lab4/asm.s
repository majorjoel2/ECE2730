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
  movl $1, sign #sign = 1
  movl ascii, %ebx

#while loop
L00:
  #if ascii[0] == ' '
  cmpb $32, (%ebx)
  jne L01
  #ascii++
  addl $1, %ebx
  jmp L00
L01:
  #if ascii[0] == '\t'
  cmpb $9, (%ebx)
  jne L02
  #ascii++
  addl $1, %ebx
  jmp L00
#while loop end
L02:
  #if ascii[0] == '+'
  cmpb $43, (%ebx)
  jne L03
  #ascii++
  addl $1, %ebx
L03:
  #if ascii[0] == '-'
  cmpb $45, (%ebx)
  jne L04
  movl $-1, sign #sign = -1
  #ascii++
  addl $1, %ebx
L04:
  #intptr = 0
  movl intptr, %ecx
  movl $0, (%ecx)
  movl $0, i
  movl i, %edi
L05:
  #for for(i = 0; ascii[i] >= '0' && ascii[i] <= '9'; i++)
  cmpb $48, (%ebx, %edi, 1)
  js L06
  cmpb $57, (%ebx, %edi, 1)
  jns L06
  addl $1, %edi
  jmp L05
L06:
  #i-- multiplier = 1
  addl $-1, %edi
  movl $1, multiplier
L07:
  #for(; i>=0 ; i--)
  cmpl $0, %edi
  js L08
  #*intptr += multiplier * (ascii[i] - '0');
  movl $0, %eax
  movb (%ebx, %edi, 1), %al
  subl $48, %eax
  mull multiplier
  addl %eax, (%ecx)
  #multiplier *= 10;
  movl $10, %eax
  mull multiplier
  movl %eax, multiplier
  addl $-1 , %edi
  jmp L07

L08:
  #*intptr = *intptr * sign;
  movl (%ecx), %eax
  mull sign
  movl %eax, (%ecx)

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
