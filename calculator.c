#include <stdio.h>

void calc();

int main() {

  printf("Podaj dwie liczby typu float, znak('+' '-' '*' '/') oraz sposob zaokraglania(c-cut, u-up, d-down, n-nearest): \n");

  calc();

  //Segmentation fault (core dumped) after function

  //printf("Koniec\n");

  return 0;
}
