#include <stdio.h>
#include <stdlib.h>

// prototypy funkcji
double addition(double a, double b, int r);
double subtraction(double a, double b, int r);
double multiplication(double a, double b, int r);
double division(double a, double b, int r);
double square_root(double a, int r);
double sinus(double a, int r);
//double power(double a, double b, int r);

// zmienne
double a = 0.0f;
double b = 0.0f;
int r = 0;
double result = 0.0f;


int main() {

  printf("Projekt AK2 - Mateusz Chalik");

  int key = 0;


  while(1) {

      printf("\n\n");
      printf("Dostepne opcje:\n");
      printf("0. Wyjscie\n");
      printf("1. Dodawanie\n");
      printf("2. Odejmowanie\n");
      printf("3. Mnozenie\n");
      printf("4. Dzielenie\n");
      printf("5. Pierwiastek\n");
      printf("6. Sinus\n");
      printf("7. Cosinus\n");
      //printf("8. Potega\n");
      printf("Wybierz opcje: ");
      scanf("%i", &key);

      // wyjscie z petli
      if(key == 0)
        break;

      // wprowadzenie liczb
      printf("\n(Dla pierwiastka i sinusa rozpatrywane jest a)\nSposoby zaokraglania: 1-cut  2-up  3-down  4-nearest\n\n");
      printf("Wpisz a: ");
      scanf("%lf", &a);
      printf("Wpisz b: ");
      scanf("%lf", &b);
      printf("Zaokraglanie: ");
      scanf("%d", &r);



      switch(key) {

          case 1:
          {
              // niewlasciwe zaokraglanie
              if(r > 4) {
                printf("Nie ma takiej opcji zaokraglania\n");
                break;
              }

              result = addition(a, b, r);
              printf("Suma: %f\n", result);
              break;
          }

          case 2:
          {
              // niewlasciwe zaokraglanie
              if(r > 4) {
                printf("Nie ma takiej opcji zaokraglania\n");
                break;
              }

              result = subtraction(a, b, r);
              printf("Roznica: %f\n", result);
              break;
          }

          case 3:
          {
              // niewlasciwe zaokraglanie
              if(r > 4) {
                printf("Nie ma takiej opcji zaokraglania\n");
                break;
              }

              result = multiplication(a, b, r);
              printf("Iloczyn: %f\n", result);
              break;
          }

          case 4:
          {
              // niewlasciwe zaokraglanie
              if(r > 4) {
                printf("Nie ma takiej opcji zaokraglania\n");
                break;
              }

              if(b != 0)
              {
                  result = division(a, b, r);
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
              // niewlasciwe zaokraglanie
              if(r > 4) {
                printf("Nie ma takiej opcji zaokraglania\n");
                break;
              }

              if(a >= 0)
              {
                result = square_root(a, r);
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
              result = sinus(a, r);
              printf("Sinus: %f\n", result);
              break;
          }

          case 7:
          {
              result = 1 - sinus(a, r);
              printf("Cosinus: %f\n", result);
              break;
          }

          //case 8:
          //{
          //    result = power(a, b, r);
          //    printf("Potega: %f\n", result);
          //    break;
          //}

          default:
              printf("Nie ma takiej opcji\n");
              break;
      }
  }

  printf("\nKoniec\n");

  return 0;
}
