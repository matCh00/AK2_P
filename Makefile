all: add

add: add.o
	ld add.o -o add

add.o: add.s
	as add.s -o add.o

clean:
	rm add.o add
