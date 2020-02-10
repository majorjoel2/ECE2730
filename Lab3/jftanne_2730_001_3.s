/*
NAME    Joel Tanner
COURSE  ECE 2730
SECTION  001
DATE    02/10/2020
FILE    jftanne_2730_001_3.s
PURPOSE  This file will classify triangles into invalid, scalene, isosceles, and
         equilateral. The file will check for zero size sides and that the sum
         of two sides is greater than the third.
         classify and classify2: https://pastebin.com/bDsekGyW
*/
/* begin assembly stub */

.globl classify
.type classify,@function
classify:
  /* prolog */
  pushl %ebp
  pushl %ebx
  movl %esp, %ebp

  /* put code here */
  # if ( i == 0 || j == 0 || k == 0)
  cmpl i, $0
  je L00
  cmpl j, $0
  je L00
  cmpl k, $0
  je L00
  jmp L01;

L00:
  movl $0, tri_type
  jmp return

L01:
  movl $0, match
  # if ( i == j) match += 1;
  movl i, %eax
  cmpl j, %eax
  jne L02
  addl $1, match

L02:
  # if ( i == k) match += 2;
  cmpl k, %eax
  jne L03
  addl $2, match

L03:
  # if ( j == k) match += 3;
  movl j, %eax
  cmpl k, %eax
  jne L04
  addl $3, match

L04:
  # if(match == 0)
  cmpl $0, match
  jne L08
  # if (( i+j) <= k || (j+k) <= i || (i+k) <= j)
  movl i, %eax
  addl j, %eax
  cmpl %eax, k
  jg L05
  movl $0, tri_type
  jmp return

L05:
  movl k, %eax
  addl j, %eax
  cmpl %eax, i
  jg L06
  movl $0, tri_type
  jmp return

L06:
  movl k, %eax
  addl i, %eax
  cmpl %eax, j
  jg L07
  movl $0, tri_type
  jmp return

L07:
  movl $3, tri_type
  jmp return

L08:
  # if(match == 6)
  cmpl $6, match
  jne L09
  movl $1, tri_type
  jmp return

L09:
  # if(match == 1)
  cmpl $1, match
  jne L10
  movl i, %eax
  addl j, %eax
  cmpl %eax, k
  jg L10
  movl $0, tri_type
  jmp return

L10:
  # if(match == 2)
  cmpl $2, match
  jne L11
  movl i, %eax
  addl k, %eax
  cmpl %eax, j
  jg L11
  movl $0, tri_type
  jmp return

L11:
  # if(match == 3)
  cmpl $3, match
  jne L12
  movl j, %eax
  addl k, %eax
  cmpl %eax, i
  jg L12
  movl $0, tri_type
  jmp return

L12:
  movl $2, tri_type
  jmp return

return:
  /* epilog */
  movl %ebp, %esp
  popl %ebx
  popl %ebp
  ret

/* declare variables here */
.comm match, 4

/* end assembly stub */
