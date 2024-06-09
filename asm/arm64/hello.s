.section .data
msg:
    .ascii "Hello, World!\n"   // The message to be written.
msg_len = . - msg              // Calculate the length of the message.

.section .text
.global _start

_start:
    // Set up the parameters for the write syscall.
    // x0: File descriptor (1 for stdout).
    // x1: Pointer to the buffer (msg).
    // x2: Number of bytes to write (msg_len).
    mov x0, #1                  // File descriptor 1 (stdout).
    ldr x1, =msg                // Pointer to the message.
    ldr x2, =msg_len            // Length of the message.

    // Set up the syscall number for write (64).
    mov x8, #64                 // Syscall number for write.

    // Make the syscall.
    svc #0                      // Invoke the syscall.

    // Exit the program.
    // x0: Exit code (0 for success).
    // x8: Syscall number for exit (93).
    mov x0, #0                  // Exit code 0.
    mov x8, #93                 // Syscall number for exit.

    // Make the syscall to exit.
    svc #0                      // Invoke the syscall.

