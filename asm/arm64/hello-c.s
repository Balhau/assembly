

.global main
.text 
main:                                   # This is called by C library's startup code
        # to be defined
message:
        .asciz "Hello, world\n"            # asciz puts a 0 byte at the end
