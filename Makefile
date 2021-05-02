all: calculator


add: add.o
	ld -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -o add -lc add.o

add.o: add.s
	as --32 -o add.o add.s


calculator: calculator.c
	gcc -m32 calculator.c -o calculator




addition: addition.o
	ld addition.o -o addition

addition.o: addition.s
	as addition.s -o addition.o

subtraction: subtraction.o
	ld subtraction.o -o subtraction

subtraction.o: subtraction.s
	as subtraction.s -o subtraction.o

multiplication: multiplication.o
	ld multiplication.o -o multiplication

multiplication.o: multiplication.s
	as multiplication.s -o multiplication.o

sub: sub.o
	ld sub.o -o	sub

sub.o: sub.s
	as sub.s -o sub.o

mul: mul.o
	ld mul.o -o	mul

mul.o: mul.s
	as mul.s -o mul.o

div: div.o
	ld div.o -o	div

div.o: div.s
	as div.s -o div.o

clean:
	rm calculator
