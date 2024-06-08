include makefile.defs

.PHONY: all \
	hello \
	hello-c \
	fibonnacci \
	minmax \
	x86abi \
	profiling \
	mdir \
	clean


all: hello \
	hello-c \
	fibonnacci \
	minmax \
	x86abi \
	profiling

mdir:
	@mkdir -p $(BIN)

hello: mdir
	$(CC) -c hello.s -o $(BIN)/hello.o
	$(LINKER) $(BIN)/hello.o -o $(BIN)/hello

hello-c: mdir
	$(AS) hello-c.s -o $(BIN)/hello-c.o
	$(CC) $(PIC_FLAGS) $(BIN)/hello-c.o -o $(BIN)/hello-c

fibonnacci: mdir
	$(AS) fibonnacci.s -o $(BIN)/fibonnacci.o
	$(CC) $(PIC_FLAGS) $(BIN)/fibonnacci.o -o $(BIN)/fibonnacci

minmax: mdir
	$(AS) minmax.s -o $(BIN)/minmax.o
	$(CC) -c minmax.c $(INCLUDES) -o $(BIN)/minmax_main.o
	$(CC) -o $(BIN)/minmax $(BIN)/minmax_main.o $(BIN)/minmax.o -no-pie

x86abi: mdir
	$(AS) x86abi.s -o $(BIN)/x86abi.o
	$(CC) -c x86abi.c $(INCLUDES) -o $(BIN)/x86abi_main.o
	$(CC) -o $(BIN)/x86abi $(BIN)/x86abi_main.o $(BIN)/x86abi.o -no-pie

profiling: mdir
	$(CC) profiling.c $(INCLUDES) -o $(BIN)/profiling

clean:
	@rm -rf $(BIN)
