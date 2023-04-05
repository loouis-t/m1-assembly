# M1 Assembly program

M1 macs don't use a traditional x86_64 architecture, but a custom ARM64 architecture. This is a simple program that prints "Hello, World!" to the console.

## Assembly notes

- ```syscall``` is the M1 equivalent of ```int 0x80``` on x86_64.  
- The syscall number for ```write``` is ```0x2000004```.
- The syscall number for ```exit``` is ```0x2000001```.

## Makefile notes

- ```nasm``` needs the ```-f macho64``` flag, which is the M1 equivalent of ```-f elf64``` on x86_64.
- ```ld``` needs the following flags :
  - ```-macosx_version_min 11.0```,
  - ```-L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib/```,
  - ```-lc```,
  - ```-e _start``` : entry point of the program.
  - ```-no_pie``` : disable [Position Independent Executable]('https://en.wikipedia.org/wiki/Position-independent_code').


## Usage

```
make
./exec
```