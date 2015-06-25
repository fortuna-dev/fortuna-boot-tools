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

all: libmincrypt.a mkbootimg unpackbootimg

libmincrypt.a:
	make -C libmincrypt

mkbootimg$(EXE):mkbootimg.o
	$(CROSS_COMPILE)$(CC) -o $@ $^ -L. -lmincrypt

mkbootimg-static$(EXE):mkbootimg.o
	$(CROSS_COMPILE)$(CC) -o $@ $^ -L. -lmincrypt -static

mkbootimg: mkbootimg.o
	$(CC) -o $@ $^ -L. -lmincrypt $(LDFLAGS) -s

mkbootimg.o: mkbootimg.c
	$(CC) -o $@ $(CFLAGS) -c $< -I.

unpackbootimg: unpackbootimg.o
	$(CC) -o $@ $^ $(LDFLAGS) -static -s

unpackbootimg-static$(EXE):unpackbootimg.o
	$(CROSS_COMPILE)$(CC) -o $@ $^ -static

unpackbootimg.o: unpackbootimg.c
	$(CC) -o $@ $(CFLAGS) -c $<

clean:
	$(RM) mkbootimg mkbootimg-static mkbootimg.o unpackbootimg unpackbootimg-static unpackbootimg.o
	$(RM) libmincrypt.a Makefile.~
	make -C libmincrypt clean
	
