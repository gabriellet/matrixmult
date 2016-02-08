TARGET = cmatrixmult
LIBS =
CC = gcc
CFLAGS = -g -Wall

.PHONY: default all clean

default: $(TARGET)
all: clean default

.PHONY: java
java: jmatrixmult
jmatrixmult: jmatrixmult.class
jmatrixmult.class: jmatrixmult.java
	javac jmatrixmult.java

.PHONY: perf
perf: java cmatrixmult pmatrixmult.py perf10.sh
	./perf10.sh ./cmatrixmult
	./perf10.sh java jmatrixmult
	./perf10.sh python pmatrixmult.py

OBJECTS = $(patsubst %.c, %.o, $(wildcard *.c))
HEADERS = $(wildcard *.h)

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

.PRECIOUS: $(TARGET) $(OBJECTS)

$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -Wall $(LIBS) -o $@

clean:
	-rm -f *.o
	-rm -f $(TARGET)
	-rm -f *.class
