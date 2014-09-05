EXEC =		listener
SRC = 		listener.c generator.c audio_input.c kiss_fft.c -lm
CFLAGS =    -g3 -Wall -Wextra -Wcast-qual -Wcast-align
CFLAGS +=   -Winline -Wnested-externs
CFLAGS +=   -pedantic -std=c99
CFLAGS +=   -D_GNU_SOURCE
NOPROMPT =	-D NO_PROMPT=1
CC =		/usr/bin/gcc

.PHONY: default
default: $(EXEC)

.PHONY: all
all: $(EXEC) noprompt

$(EXEC): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $@

noprompt: $(SRC)
	$(CC) $(CFLAGS) $(NOPROMPT) $(SRC) -o $@

.PHONY: clean
clean:
	rm -f *.o $(EXEC) noprompt
