#include <balhau/timer.h>

int main() {
  int max_iter = 10000000;
  int acc = 0;
  double time;
  PROFILE(
      {
        for (int i = 0; i < max_iter; i++) {
          acc = acc + 2;
        }
      },
      time);

  printf("Time elapse: %f\n", time);
}
