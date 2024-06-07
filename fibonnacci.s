# Fibonacci assembly program

  .global main
  .text
main:
  push %rbx # Save base register, need since we will use in this frame
  
  mov $90, %ecx # this represents the number of initial iterations
  xor %rax, %rax # clears rax register , rax=0 --> first fibo number
  xor %rbx, %rbx # clears rbx register
  inc %rbx       # rbx that represents next Fibonacci item is set to 1 = 1 + 0 

print:
  # We will need registers rax, rbx and rcx, however calling conventions state that 
  # printf may use registers rax and rcx so we need to save them first in the stack
  push %rax
  push %rcx
  mov $format, %rdi  # Calling conventions state rdi as first parameter
  mov %rax, %rsi     # Calling conventions state rsi as the second parameter
  xor %rax, %rax     # If we don't clean this printf will use and blow up

  call printf        # Call function since we have set the arguments

  # Now we need to restore the saved register values, 
  # we inverse the order since the stack is a LIFO
  pop %rcx
  pop %rax
  mov %rax, %rdx #Save rax temporarily, tmp=current
  add %rbx, %rax #Swap current=next
  add %rdx, %rbx # next=next-1+next
  dec %rcx  #decrement counter
  jnz print # if result from dec %rcx is not zero then jnz will jump into print, otherwise will continue

  # if we reach here then we ended the loop now we need to restore the %rbx register with the initial value
  pop %rbx

  mov $0, %rdi # Set 0 as exit code
  call exit # Call exit

  .data
format:
  .asciz "%20ld\n"      #.asciz is a assembler directive representing a null terminated string
