NASM=nasm
NASM_OPTS=-f bin
BIN_DIR=bin
SRC=$(wildcard *.asm)
BINARIES=$(BIN_DIR)/$(addsuffix .bin,$(basename $(SRC)))

.PHONY: all
all: $(BINARIES)

$(BIN_DIR)/%.bin: %.asm
	$(NASM) $< $(NASM_OPTS) -o $@

.PHONY: clean
clean:
	rm -f $(BIN_DIR)/*.bin
