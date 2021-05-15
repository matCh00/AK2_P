#include <stdio.h>
#include <stdlib.h>

// prototypy funkcji
double addition(double a, double b);
double subtraction(double a, double b);
double multiplication(double a, double b);
double division(double a, double b);
double square_root(double a);
double sinus(double a);

// zmienne
double a = 0.0f;
double b = 0.0f;
double result = 0.0f;


int main() {

  printf("Projekt AK2 - Mateusz Chalik\n\n");

  int key = 0;


  while(true) {

      printf("\n");
      printf("Dostepne opcje:\n");
      printf("0. Wyjscie\n");
      printf("1. Dodawanie\n");
      printf("2. Odejmowanie\n");
      printf("3. Mnozenie\n");
      printf("4. Dzielenie\n");
      printf("5. Pierwiastek\n");
      printf("6. Sinus\n");
      printf("Wybierz opcje: ");
      scanf("%i", &key);

      // wyjscie z petli
      if(key == 0)
        break;

      // wprowadzenie liczb
      printf("(Dla pierwiastka i sinusa rozpatrywane jest a)\n");
      printf("Wpisz a: ");
      scanf("%lf", &a);
      printf("Wpisz b: ");
      scanf("%lf", &b);


      switch(key) {

          case 1:
          {
              result = addition(a, b);
              printf("Suma: %f\n", result);
              break;
          }

          case 2:
          {
              result = subtraction(a, b);
              printf("Roznica: %f\n", result);
              break;
          }

          case 3:
          {
              result = multiplication(a, b);
              printf("Iloczyn: %f\n", result);
              break;
          }

          case 4:
          {
              if(b != 0)
              {
                  result = division(a, b);
                  printf("Iloraz: %f\n", result);
              }
              else  // rozwiazany problem z dzieleniem przez 0
              {
                  printf("Nie mozna dzielic przez 0\n");
              }
              break;
          }

          case 5:
          {
              if(a >= 0)
              {
                result = square_root(a);
                printf("Pierwiastek: %f\n", result);
              }
              else  // rozwiazany problem z pierwiastkowaniem liczb ujemnych
              {
                printf("Nie istnieje pierwiastek kwadratowy z liczby ujemnej\n");
              }
              break;
          }

          case 6:
          {
              result = sinus(a);
              printf("Sinus: %f\n", result);
              break;
          }

          default:
              printf("Nie ma takiej opcji\n");
              break;
      }
  }

  printf("Koniec\n");

  return 0;
}
