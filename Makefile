all: calculator

calculator: calculator.c
	gcc -m32 calculator.c calc.s -g -o program

clean:
	rm program
