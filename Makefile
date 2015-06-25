CC = gcc
AR = ar rcv
RM = rm -f

CFLAGS = -ffunction-sections -O3
LDFLAGS = -Wl,--gc-sections

all: libmincrypt.a mkbootimg unpackbootimg

libmincrypt.a:
	make -C libmincrypt

mkbootimg: mkbootimg.o
	$(CC) -o $@ $^ -L. -lmincrypt $(LDFLAGS) -s

mkbootimg.o: mkbootimg.c
	$(CC) -o $@ $(CFLAGS) -c $< -I.

unpackbootimg: unpackbootimg.o
	$(CC) -o $@ $^ $(LDFLAGS) -static -s

unpackbootimg.o: unpackbootimg.c
	$(CC) -o $@ $(CFLAGS) -c $<

clean:
	$(RM) mkbootimg mkbootimg-static mkbootimg.o unpackbootimg unpackbootimg-static unpackbootimg.o
	$(RM) libmincrypt.a Makefile.~
	make -C libmincrypt clean
	
