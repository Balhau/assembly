

.global _start
.text 
_start:                                         # This is called by C library's startup code
        mov     $message, %rdi                  # First integer (or pointer) parameter in %rdi
        call    puts                            # puts(message)
        mov     $0, %rdi
        call    exit                             
message:
        .asciz "Hello, world\n"                 # asciz puts a 0 byte at the end
