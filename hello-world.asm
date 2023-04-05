section .data
  msg db 'Hello, world!', 0xa ; string to be printed 
  len equ $ - msg             ; length of the string

section .text 
  global _start               ; must be declared for linker (ld)

_start:                       ; tells linker entry point
  mov rax, 0x2000004          ; system call number (sys write)
  mov rdi, 1                  ; file descriptor (stdout)
  mov rsi, msg                ; message to write
  mov rdx, len                ; message length
  syscall                     ; call kernel (equivalent int 0x80)

  mov rax, 0x2000001          ; system call number (sys exit)
  xor rdi, rdi                ; 0 = exit status
  syscall                     ; call kernel (equivalent int 0x80)
