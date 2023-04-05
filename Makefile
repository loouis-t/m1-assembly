# Makefile

AS=nasm
ASFLAGS=-f macho64
LD=ld
LDFLAGS=-macosx_version_min 11.0 -L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib/ -lc -e _start -no_pie

all: exec

exec: hello-world.o
	$(LD) $(LDFLAGS) -o $@ $^

hello-world.o: hello-world.asm
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	rm -f *.o exec
