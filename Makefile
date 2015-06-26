CC = gcc
AR = ar rcv
ifeq ($(windir),)
EXE =
RM = rm -f
else
EXE = .exe
RM = del
endif

CFLAGS = -ffunction-sections -O3
LDFLAGS = -Wl,--gc-sections

all: libmincrypt.a mkbootimg unpackbootimg mkbootfs

libmincrypt.a:
	make -C libmincrypt

mkbootfs$(EXE):mkbootfs.o
	$(CC) -o $@ $^ -L. $(LDFLAGS) -static -s

.c.o:
	$(CC) -o $@ $(CFLAGS) -c $< -I. -Werror

mkbootimg: mkbootimg.o
	$(CC) -o $@ $^ -L. -lmincrypt $(LDFLAGS) -s

mkbootimg-static$(EXE):mkbootimg.o
	$(CC) -o $@ $^ -L. -lmincrypt -static

mkbootimg.o: mkbootimg.c
	$(CC) -o $@ $(CFLAGS) -c $< -I.

unpackbootimg: unpackbootimg.o
	$(CC) -o $@ $^ $(LDFLAGS) -static -s

unpackbootimg-static$(EXE):unpackbootimg.o
	$(CC) -o $@ $^ -static

unpackbootimg.o: unpackbootimg.c
	$(CC) -o $@ $(CFLAGS) -c $<

clean:
	$(RM) mkbootimg mkbootimg-static mkbootimg.o unpackbootimg unpackbootimg-static unpackbootimg.o mkbootfs mkbootfs.o
	$(RM) libmincrypt.a Makefile.~
	make -C libmincrypt clean
