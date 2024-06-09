  .global doStuff
  .global doubleMyInt
  .global doubleMyIntArray
  .global addDoubles
  .global setNum
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

doubleMyIntArray:
  push %rbp
  mov %rsp, %rbp
  
  xor %rdx, %rdx
  cmp %rdx, %rsi
  je .loop_end_1

.loop_1:
  mov (%rdi,%rdx, 4), %ecx      # use 32 bit register instead of 8bytes because its int 32 bit num not 64 (rdi, rdx, 4) = rdi+(rdx*4)
  add %ecx, %ecx
  mov %ecx, (%rdi, %rdx, 4)
  inc %rdx
  cmp %rdx, %rsi
  jne .loop_1

.loop_end_1:
  pop %rbp
  ret


addDoubles:
  push %rbp
  mov %rsp, %rbp
  
  xor %rdx, %rdx
  cvtsi2sd %rdx, %xmm1    # this is mmx the assembly instruction that enable conversion of values stored in 64 bit registers into 128 bit xmm1 ones
  cmp %rdx, %rsi
  je .loop_end_2

.loop_2:
  movsd (%rdi, %rdx, 8), %xmm0
  addsd %xmm0, %xmm1
  inc %rdx
  cmp %rdx, %rsi
  jne .loop_2

.loop_end_2:
  movsd %xmm1, %xmm0
  pop %rbp;
  ret;

  # args (RDI, RSI, RDX, RCX, R8)
setNum:
  push %rbp
  mov %rsp, %rbp

  xor %rax, %rax
  mov %sil, 0x0(%rdi)
  lea 0x10(%rdi), %rax      # These offsets were found via gdb
  mov %dx, (%rax)
  lea 0x20(%rdi), %rax      # Found via gdb
  mov %ecx, (%rax)
  lea 0x40(%rdi), %rax      # Found via gdb
  mov %r8, (%rax)

  pop %rbp
  ret

.data
msg:
  .asciz "I'm doing stuff..."

num_pat:
  .asciz "Num doubled: %d\n"
