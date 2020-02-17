/* begin C driver */
#include <stdio.h>

void AtoI2();

char input[10];
int output;
char *ascii;
int *intptr;
int sign, multiplier, i;
int main(int argc, char **argv)
{
  printf("Enter a number: ");
  fgets(input, 10, stdin);
  ascii = input;
  intptr = &output;
  /* this is the function we will write in assembly */
  AtoI();
  printf("\nASCII is: %s\nInteger is: %d\n",input,output);
  return 0;
}
/* end C driver */
/* begin assignment specification */
void AtoI2()
{
  sign = 1; /* initialize sign to positive */
  /* skip over leading spaces and tabs */
  while (*ascii == ' ' || *ascii == '\t')
    ascii++;
  /* check for a plus or minus sign */
  if (*ascii == '+')
    ascii++; /* found a plus sign */
  else if (*ascii == '-')
  {
    sign = -1; /* found a minus sign */
    ascii++;
  }
  *intptr = 0; /* stores the value calculated below */
  /* skip to the ones place of the digit */
  //%edi incrememting register
  for(i = 0; ascii[i] >= '0' && ascii[i] <= '9'; i++);
  i--; /* back up to the ones place */
  multiplier = 1; /* set multiplier for ones place */
  for(; i>=0 ; i--)
  {
    *intptr += multiplier * (ascii[i] - '0');
    multiplier *= 10; /* inc multiplier by factor of 10 */
  }
  /* multiply in the sign */
  *intptr = *intptr * sign;
}
/* end assignment specification */
