.extern puts

.section .data
message:
        .asciz "Hello, world\n"

.section .text 
.global main
main:                                   // This is called by C library's startup code
        ldr x0, =message                  // Store message reference on x0 register
        bl puts                            // Jump execution into puts function

        mov x8, #93                       // Put 93, syscall number for exit on register x8
        mov x0, #0                        // Pass 0 as the value to return from exit syscall
        svc #0                            // Invoke syscall

