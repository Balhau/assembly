  .global max # set max as export symbol
  .global min # set min as export symbol
  .text
max:
  mov %rdi, %rax # First argument sets the rax register
  cmp %rsi, %rax # is second argument higher than the first?
  cmovl %rsi, %rax # if so replace rax with the second argument
  cmp %rdx, %rax  # is the third bigger than the second?
  cmovl %rdx, %rax # if so set return value as the last one
  ret

min: 
  mov %rdi, %rax # First argument is assumed to be the lower one
  cmp %rax, %rsi # is the second lower?
  cmovl %rsi, %rax # if so the second is rax
  cmp %rax, %rdx # is the third one even lower?
  cmovl %rdx, %rax # set rax as rdx if is lower
  ret
