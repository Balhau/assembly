/**
*
* In this c file we will explore the x86 convention calls.
* We create a set of function definitions and we will implement those in
* an assembly file called x86abi.s with the corresponding assembly code.
* This file aims to explore and understand the convention calling system.
*
* By convention call system we mean how the c code is able to call assembly code. This means exploring the different ways registers are selected to be used as function argument parameters and return values as well. The calling convention specifies which registers will be used for the arguments and for the return values for each of the different function types. 
* This is, obviously specific per architecture since different architectures have a different instruction set. It is also dependent on the compiler may use different calling conventions. 
* SYSTEM V amd abi
* The first six integer or pointer arguments are passed in registers: %rdi, %rsi, %rdx, %rcx, %r8, %r9.
*/

#include <stdio.h>

typedef struct MyStruct {
  int anInt;
  double aDouble;
  char aChar;
} MyStruct;

void doStuff(void);
void doubleMyInt(int);
void doubleMyIntArray(int[]);

int main(void){
  printf("Hello world\n");
  doStuff();
  doubleMyInt(2);
}
