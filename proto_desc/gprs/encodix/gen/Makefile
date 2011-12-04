CFLAGS=-I/sunbeam/home/encodix/encodix/Common -I.

all: ed_c.o ed_c_known_ie.o CSN1DataTypes.o Downlink_RLC_MAC.o UserDefinedDataTypes.o

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $^

clean:
	rm -f *.o
