include makefile.defs

.PHONY: all hello hello-c fibonnacci minmax clean


all: hello hello-c fibonnacci minmax

hello: 
	@mkdir -p $(BIN)
	$(CC) -c hello.s -o $(BIN)/hello.o
	$(LINKER) $(BIN)/hello.o -o $(BIN)/hello

hello-c:
	@mkdir -p $(BIN)
	$(AS) hello-c.s -o $(BIN)/hello-c.o
	$(CC) $(PIC_FLAGS) $(BIN)/hello-c.o -o $(BIN)/hello-c

fibonnacci:
	@mkdir -p $(BIN)
	$(AS) fibonnacci.s -o $(BIN)/fibonnacci.o
	$(CC) $(PIC_FLAGS) $(BIN)/fibonnacci.o -o $(BIN)/fibonnacci

minmax:
	@mkdir -p $(BIN)
	$(AS) minmax.s -o $(BIN)/minmax.o
	$(CC) -c minmax.c -o $(BIN)/main.o
	$(CC) -o $(BIN)/minmax $(BIN)/main.o $(BIN)/minmax.o -no-pie

clean:
	@rm -rf $(BIN)
