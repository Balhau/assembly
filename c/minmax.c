#include <stdio.h>
#include <inttypes.h>

// Declare the functions that will be defined in the assembly
// file
int64_t max(int64_t, int64_t,int64_t);
int64_t min(int64_t, int64_t, int64_t);

int main(){
  int acc=0;
  int max_iter=100000000;
  double elapsed;
  printf("%ld\n", max(1, -4, 8));
  printf("%ld\n", min(1, -4, 8));
  printf("TIme elapsed %f\n", elapsed);
  return 0;
}
