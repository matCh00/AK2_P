all: add sub

add: add.o
	ld add.o -o add

add.o: add.s
	as add.s -o add.o

clean:
	rm add.o add
	rm sub.o sub

sub: sub.o
	ld sub.o -o	sub

sub.o: sub.s
	as sub.s -o sub.o
