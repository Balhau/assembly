include makefile.defs

.PHONY: all hello hello-c clean


all: hello hello-c

hello: 
	@mkdir -p $(BIN)
	$(CC) -c hello.s -o $(BIN)/hello.o
	$(LINKER) $(BIN)/hello.o -o $(BIN)/hello

hello-c:
	@mkdir -p $(BIN)
	$(AS) hello-c.s -o $(BIN)/hello-c.o
	$(CC) -nostartfiles -no-pie $(BIN)/hello-c.o -o $(BIN)/hello-c

clean:
	@rm -rf $(BIN)
