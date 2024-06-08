#include <stdio.h>
#include <time.h>

/**
 * PROFILE is a macro define to help get time execution values for 
 * This macro expects a block_of_code entering as a first preprocessor argument and a second one which is the double variabale for which the elapsed time will be written.
 */
#define PROFILE(block_of_code, elapsed) \
  clock_t start, end;\
  start=clock();\
  block_of_code\
  end=clock();\
  elapsed=((double)(end-start))/CLOCKS_PER_SEC;

