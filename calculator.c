#include <stdio.h>

void calc();

int main() {

  printf("Projekt AK2 - Mateusz Chalik\n\n");

  printf("Podaj dwie liczby typu float, znak('+' '-' '*' '/') oraz sposob zaokraglania(c-cut, u-up, d-down, n-nearest): \n");

  char key;
  scanf("%c", &key);

  switch(key){
    case'1': calc(); break;
    case'2': calc(); break;
    case'3': calc(); break;
    case'4': calc(); break;
  }

  return 0;
}
