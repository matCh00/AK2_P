#include <stdio.h>
#include <stdlib.h>

// prototypy funkcji
double addition(double a, double b, int r);
double subtraction(double a, double b, int r);
double multiplication(double a, double b, int r);
double division(double a, double b, int r);
double square_root(double a, int r);
double sinus(double a, int r);
double cosinus(double a, int r);
double tangens(double a, int r);
double cotangens(double a, int r);
double power(double a, double b, int r);
double quadratic_equation(double a, double b, double c, int r);
unsigned long fibonacci(long n);

// zmienne
int r = 0;
double a = 0.0f;
double b = 0.0f;
double c = 0.0f;
double result = 0.0f;
long n = 0;
unsigned long result_f = 0;


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
      printf("8. Tangens\n");
      printf("9. Cotangens\n");
      printf("10. Potega\n");
      printf("11. Rownanie kwadratowe\n");
      printf("12. Ciag Fibonacciego\n");
      printf("Wybierz opcje: ");
      scanf("%i", &key);

      // wyjscie z petli
      if(key == 0)
        break;


      switch(key) {

          case 1:
          {
              printf("Wpisz a: ");
              scanf("%lf", &a);
              printf("Wpisz b: ");
              scanf("%lf", &b);
              printf("Zaokraglanie: 1-cut  2-up  3-down  4-nearest ");
              scanf("%d", &r);

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
              printf("Wpisz a: ");
              scanf("%lf", &a);
              printf("Wpisz b: ");
              scanf("%lf", &b);
              printf("Zaokraglanie: 1-cut  2-up  3-down  4-nearest ");
              scanf("%d", &r);

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
              printf("Wpisz a: ");
              scanf("%lf", &a);
              printf("Wpisz b: ");
              scanf("%lf", &b);
              printf("Zaokraglanie: 1-cut  2-up  3-down  4-nearest ");
              scanf("%d", &r);

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
              printf("Wpisz a: ");
              scanf("%lf", &a);
              printf("Wpisz b: ");
              scanf("%lf", &b);
              printf("Zaokraglanie: 1-cut  2-up  3-down  4-nearest ");
              scanf("%d", &r);

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
              printf("Wpisz a: ");
              scanf("%lf", &a);
              printf("Zaokraglanie: 1-cut  2-up  3-down  4-nearest ");
              scanf("%d", &r);

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
              printf("Wpisz a: (liczba a nie kat)");
              scanf("%lf", &a);
              printf("Zaokraglanie: 1-cut  2-up  3-down  4-nearest ");
              scanf("%d", &r);

              // niewlasciwe zaokraglanie
              if(r > 4) {
                printf("Nie ma takiej opcji zaokraglania\n");
                break;
              }

              result = sinus(a, r);
              printf("Sinus: %f\n", result);
              break;
          }

          case 7:
          {
              printf("Wpisz a: (liczba a nie kat)");
              scanf("%lf", &a);
              printf("Zaokraglanie: 1-cut  2-up  3-down  4-nearest ");
              scanf("%d", &r);

              // niewlasciwe zaokraglanie
              if(r > 4) {
                printf("Nie ma takiej opcji zaokraglania\n");
                break;
              }

              result = cosinus(a, r);
              printf("Cosinus: %f\n", result);
              break;
          }

          case 8:
          {
              printf("Wpisz a: (liczba a nie kat)");
              scanf("%lf", &a);
              printf("Zaokraglanie: 1-cut  2-up  3-down  4-nearest ");
              scanf("%d", &r);

              // niewlasciwe zaokraglanie
              if(r > 4) {
                printf("Nie ma takiej opcji zaokraglania\n");
                break;
              }

                result = tangens(a, r);
                printf("Tangens: %f\n", result);
                break;
          }

          case 9:
          {
              printf("Wpisz a: (liczba a nie kat)");
              scanf("%lf", &a);
              printf("Zaokraglanie: 1-cut  2-up  3-down  4-nearest ");
              scanf("%d", &r);

              // niewlasciwe zaokraglanie
              if(r > 4) {
                printf("Nie ma takiej opcji zaokraglania\n");
                break;
              }

              result = cotangens(a, r);
              printf("Cotangens: %f\n", result);
              break;
          }

          case 10:
          {
              printf("a^b\n");
              printf("Wpisz a: ");
              scanf("%lf", &a);
              printf("Wpisz b: (calkowite wieksze od 0)");
              scanf("%lf", &b);
              printf("Zaokraglanie: 1-cut  2-up  3-down  4-nearest ");
              scanf("%d", &r);

              // niewlasciwe zaokraglanie
              if(r > 4) {
                printf("Nie ma takiej opcji zaokraglania\n");
                break;
              }

              if(b == 0){
                result = 1;
              }

              if(b == 1){
                result = a;
              }

              if(b > 1){
                result = power(a, b, r);
              }

              printf("Potega: %f\n", result);
              break;
          }

          case 11:
          {
              printf("ax^2 + bx + c\n");
              printf("Wpisz a: ");
              scanf("%lf", &a);
              printf("Wpisz b: ");
              scanf("%lf", &b);
              printf("Wpisz c: ");
              scanf("%lf", &c);
              printf("Zaokraglanie: 1-cut  2-up  3-down  4-nearest ");
              scanf("%d", &r);

              // niewlasciwe zaokraglanie
              if(r > 4) {
                printf("Nie ma takiej opcji zaokraglania\n");
                break;
              }

              double result2 = 0.0f;
              double delta = power(b, 2, r) - multiplication(4, multiplication(a, c, r), r);

              if(delta < 0){
                printf("Brak rozwizazan");
                break;
              }

              if(delta == 0){
                result = -(division(b, multiplication(2, a, r), r));
                printf("Pierwiastek rownania kwadratowego: %f\n", result);
                break;
              }

              if(delta > 0){
                result = division((subtraction(-b, -square_root(delta, r), r)), multiplication(2, a, r), r);
                result2 = division((addition(-b, -square_root(delta, r), r)), multiplication(2, a, r), r);
                printf("Pierwiastki rownania kwadratowego: %f", result);
                printf(" %f\n", result2);
                break;
              }
          }

          case 12:
          {
              while (1) {
                  printf("Wpisz n: (zakoncz dla liczby ujemnej) ");
                  scanf("%lu", &n);

                  if (n < 0) {
                    break;
                  }

                  result_f = fibonacci(n);
                  printf("%lu wyraz ciagu = %lu\n", n, result_f);
              }
              break;
          }

          default:
              printf("Nie ma takiej opcji\n");
              break;
      }
  }

  printf("\nKoniec\n");

  return 0;
}
