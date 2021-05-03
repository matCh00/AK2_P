all: calculator

calculator: calculator.c
	gcc -m32 -Wall calc.s calculator.c -o program

clean:
	rm program
