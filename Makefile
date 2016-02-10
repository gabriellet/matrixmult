LIBS =
CFLAGS = -g -Wall

.PHONY: default all clean

default: java clang gcc
all: clean default

.PHONY: java gcc clang
java: jmatrixmult
jmatrixmult: jmatrixmult.class
jmatrixmult.class: jmatrixmult.java
	javac jmatrixmult.java
gcc: gcccmatrixmult
gcccmatrixmult: gcccmatrixmult.o
	gcc $(CFLAGS) gcccmatrixmult.o -o gcccmatrixmult 
gcccmatrixmult.o: cmatrixmult.c
	gcc $(CFLAGS) -c cmatrixmult.c -o gcccmatrixmult.o
clang: clangcmatrixmult
clangcmatrixmult: clangcmatrixmult.o
	clang $(CFLAGS) clangcmatrixmult.o -o clangcmatrixmult 
clangcmatrixmult.o: cmatrixmult.c
	clang $(CFLAGS) -c cmatrixmult.c -o clangcmatrixmult.o

.PHONY: perf
perf: java cmatrixmult pmatrixmult.py perf10.sh
	./perf10.sh ./gcccmatrixmult
	./perf10.sh ./clangcmatrixmult
	./perf10.sh java jmatrixmult
	./perf10.sh python pmatrixmult.py
	./perf10.sh python3 p3matrixmult.py
clean:
	-rm -f *.o
	-rm -f gcccmatrixmult clangcmatrixmult jmatrixmult
	-rm -f *.class
