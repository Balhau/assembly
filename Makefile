ARCH?=x86

include defs/makefile-$(ARCH)

.PHONY: all \
	hello-one \
	hello-two \
	hello-three\
	fibonnacci \
	minmax \
	x86abi \
	profiling \
	mdir \
	clean


all: hello-one \
	hello-two \
	hello-three\
	fibonnacci \
	minmax \
	x86abi \
	profiling

mdir:
	@mkdir -p $(BIN)

hello-one: mdir
	$(CC) $(BASE_FLAGS) -c $(ASM_BASE)/hello.s -o $(BIN)/hello-one.o
	$(LINKER) $(BIN)/hello-one.o -o $(BIN)/hello-one

hello-two: mdir
	$(AS) $(ASM_BASE)/hello-c.s -o $(BIN)/hello-two.o
	$(CC) $(PIC_FLAGS) $(BASE_FLAGS) $(BIN)/hello-two.o -o $(BIN)/hello-two

hello-three: mdir
	$(CC) $(BASE_FLAGS) $(C_BASE)/hello.c -o $(BIN)/hello-three

fibonnacci: mdir
	$(AS) $(ASM_BASE)/fibonnacci.s -o $(BIN)/fibonnacci.o
	$(CC) $(PIC_FLAGS) $(BIN)/fibonnacci.o -o $(BIN)/fibonnacci

minmax: mdir
	$(AS) $(ASM_BASE)/minmax.s -o $(BIN)/minmax.o
	$(CC) -c $(C_BASE)/minmax.c $(INCLUDES) -o $(BIN)/minmax_main.o
	$(CC) -o $(BIN)/minmax $(BIN)/minmax_main.o $(BIN)/minmax.o -no-pie

x86abi: mdir
	$(AS) $(ASM_BASE)/x86abi.s -o $(BIN)/x86abi.o
	$(CC) -c $(C_BASE)/x86abi.c $(INCLUDES) -o $(BIN)/x86abi_main.o
	$(CC) -o $(BIN)/x86abi $(BIN)/x86abi_main.o $(BIN)/x86abi.o -no-pie

profiling: mdir
	$(CC) $(C_BASE)/profiling.c $(INCLUDES) -o $(BIN)/profiling

clean:
	@rm -rf $(BIN)
