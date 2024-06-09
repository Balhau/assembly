
.global _start
.text

_start:
 # to be  defined
.data
message:
  .ascii "Hello, world\n"
message_len:
  .word message_len-message
