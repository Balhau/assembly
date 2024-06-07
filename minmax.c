#include <stdio.h>
#include <inttypes.h>

// Declare the functions that will be defined in the assembly
// file
int64_t max(int64_t, int64_t,int64_t);
int64_t min(int64_t, int64_t, int64_t);

int main(){
  printf("%ld\n", max(1, -4, 8));
  printf("%ld\n", min(1, -4, 8));
  return 0;
}
