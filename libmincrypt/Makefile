CC = gcc
AR = ar rc
ifeq ($(windir),)
RM = rm -f
CP = cp
else
RM = del
CP = copy /y
endif

CFLAGS = -ffunction-sections -O3
LIB = libmincrypt.a
LIB_OBJS = dsa_sig.o p256.o p256_ec.o p256_ecdsa.o rsa.o sha.o sha256.o
INC  = -I..

all:$(LIB)

clean:
	$(RM) $(LIB_OBJS) $(LIB)

$(LIB): $(LIB_OBJS)
	$(AR) $@ $^
	$(CP) $@ ..

%.o: %.c
	$(CC) -o $@ $(CFLAGS) -c $< $(INC)
