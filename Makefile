all: add sub mul div

add: add.o
	ld add.o -o add

add.o: add.s
	as add.s -o add.o

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
	rm add.o add
	rm sub.o sub
	rm mul.o mul
	rm div.o div
