  .global doStuff
  .global doubleMyInt
  .text

doStuff:
  push %rbp        # Save previous base pointer into the stack
  mov %rsp, %rbp   # Base pointer is now pointing to current stack pointer register

  mov $msg, %rdi
  call puts

  mov %rbp, %rsp  # Restore stack pointer register
  pop %rbp        # Moves base pointer to caller base pointer
  ret

doubleMyInt:
  push %rbp        # Save previous base pointer into the stack
  mov %rsp, %rbp   # Base pointer is now pointing to current stack pointer register
  
  # call printf("Num passed: %d\n",num)
  add %rdi, %rdi
  mov %rdi, %rsi
  mov $num_pat, %rdi
  call printf

  mov %rbp, %rsp  # Restore stack pointer register
  pop %rbp        # Moves base pointer to caller base pointer
  ret


.data
msg:
  .asciz "I'm doing stuff..."

num_pat:
  .asciz "Num doubled: %d\n"
