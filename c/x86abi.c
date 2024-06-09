/**
 *
 * In this c file we will explore the x86 convention calls.
 * We create a set of function definitions and we will implement those in
 * an assembly file called x86abi.s with the corresponding assembly code.
 * This file aims to explore and understand the convention calling system.
 *
 * By convention call system we mean how the c code is able to call assembly
 * code. This means exploring the different ways registers are selected to be
 * used as function argument parameters and return values as well. The calling
 * convention specifies which registers will be used for the arguments and for
 * the return values for each of the different function types. This is,
 * obviously specific per architecture since different architectures have a
 * different instruction set. It is also dependent on the compiler may use
 * different calling conventions. SYSTEM V amd abi The first six integer or
 * pointer arguments are passed in registers: %rdi, %rsi, %rdx, %rcx, %r8, %r9.
 */

#include <stdio.h>

typedef struct Num {
  unsigned char num8;
  unsigned short num16;
  unsigned int num32;
  unsigned long num64;
} Num;

static void printListaInt(int lista[], int length) {
  for (int i = 0; i < length; i++) {
    printf("%d, ", lista[i]);
  }
}

static void printListaDouble(double lista[], int length) {
  for (int i = 0; i < length; i++) {
    printf("%f, ", lista[i]);
  }
}

static void printNum(Num *num) {
  printf("\nNum: %d, %u, %u, %lu\n", num->num8, num->num16, num->num32,
         num->num64);
}

// These are functions defined in x86abi.s
void doStuff(void);
void doubleMyInt(int);
void doubleMyIntArray(int[], int);
double addDoubles(double[], int);
void setNum(Num *, char, short, int, long);

int main(void) {
  int list_int[] = {1, 2, 3, 4};
  double list_double[] = {1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0};
  double sum = 0;
  printf("Hello world\n");
  doStuff();
  doubleMyInt(2);
  printf("\nBefore:\n");
  printListaInt(list_int, 4);
  doubleMyIntArray(list_int, 4);
  printf("\nAfter:\n");
  printListaInt(list_int, 4);
  printf("\nLista Doubles:\n");
  printListaDouble(list_double, 10);
  sum = addDoubles(list_double, 10);
  printf("\nSum of doubles: %f\n", sum);

  Num nums = {.num8 = 0xFF,
              .num16 = 0xFFFF,
              .num32 = 0xFFFFFFFF,
              .num64 = 0xFFFFFFFFFFFFFFFF};

  printf("Size of num: %lu", sizeof(nums));

  setNum(&nums, 0xa, 0x64, 0x3e8, 0x2540be400);

  printNum(&nums);
}
