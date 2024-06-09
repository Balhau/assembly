
.global _start
.text

_start:
  # write(1, message, message_len)
  mov $1, %rax
  mov $1, %rdi
  mov $message, %rsi
  mov message_len, %rdx
  syscall

  mov $60, %rax
  xor %rdi, %rdi
  syscall

.data
message:
  .ascii "Hello, world\n"
message_len:
  .word message_len-message
