# Simple bootloader example for x86 systems that prints out a simple message

.code16     # We're dealing with 16-bit code
.org 0x7C00 # Inform the assembler of the starting location for this code

boot:
    mov $message, %si # Point SI register to message
    mov $0x0E, %ah    # Set AH register to the display character command

.loop:
    lodsb             # Load the character into the AL register, and increment SI
    cmp $0, %al       # Compare the AL register with a null byte
    je halt           # Jump to halt if null byte is found
    int $0x10         # Trigger video services interrupt
    jmp .loop         # Loop again

halt:
    hlt               # Halt the CPU

message:
    .asciz "Howdy!"   # Null-terminated message

# Mark the device as bootable
.fill 510-(.-boot), 1, 0 # Add any additional zeroes to make 510 bytes in total
.word 0xAA55            # Write the final 2 bytes as the magic number 0x55AA
