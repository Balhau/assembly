# boot.s - A simple 64-bit bootloader that prints "Hello, World!" in long mode

# Real mode setup
    .code16
    .org 0x7C00

start:
    cli                     # Disable interrupts
    cld                     # Clear direction flag

    # Setup the GDT
    lgdt gdt_descriptor
    mov $0x10, %ax          # Load the data segment selector
    mov %ax, %ds
    mov %ax, %es
    mov %ax, %fs
    mov %ax, %gs
    mov %ax, %ss

    # Enter protected mode
    mov %cr0, %eax
    or $0x1, %eax
    mov %eax, %cr0

    # Far jump to flush the prefetch queue and enter protected mode
    ljmp $0x08, $pm_start

.code32

pm_start:
    # Setup segments
    mov $0x10, %ax
    mov %ax, %ds
    mov %ax, %es
    mov %ax, %fs
    mov %ax, %gs
    mov %ax, %ss

    # Load the IDT (empty in this case)
    lidt idt_descriptor

    # Enable A20 line
    in $0x64, %al
    or $0x2, %al
    out %al, $0x64

    # Enter long mode
    mov $0xC0000080, %ecx
    rdmsr
    or $0x100, %eax
    wrmsr

    mov $0x20000000, %ecx
    rdmsr
    or $0x2, %eax
    wrmsr

    # Long mode far jump
    jmp $0x28, $lm_start

.code64

lm_start:
    mov $0x30, %ax
    mov %ax, %ds
    mov %ax, %es
    mov %ax, %fs
    mov %ax, %gs
    mov %ax, %ss

    mov $hello_msg, %rsi
    call print_string

hang:
    hlt
    jmp hang

print_string:
    lodsb
    test %al, %al
    jz done
    mov $0x0E, %ah
    int $0x10
    jmp print_string

done:
    ret

hello_msg:
    .asciz "Hello, World!"

# GDT definition
.align 8
gdt_start:
    .quad 0x0000000000000000  # Null segment
    .quad 0x00CF9A000000FFFF  # Code segment
    .quad 0x00CF92000000FFFF  # Data segment
    .quad 0x00209A0000000000  # Long mode code segment
    .quad 0x0000920000000000  # Long mode data segment

gdt_descriptor:
    .word gdt_end - gdt_start - 1
    .quad gdt_start

gdt_end:

idt_descriptor:
    .word 0
    .quad 0

# Boot sector signature
    .fill 510-((.-start) % 510), 1, 0
    .word 0xAA55
