NASM=nasm
NASM_OPTS=-f bin
BIN_DIR=bin
BOOT_LOADER=bootloader
SRC=$(wildcard *.asm)
BINARIES=$(BIN_DIR)/$(addsuffix .bin,$(basename $(SRC)))

.PHONY: all
all: $(BIN_DIR)/$(BOOT_LOADER).bin

$(BIN_DIR)/$(BOOT_LOADER).bin: $(SRC)
	@mkdir -p $(BIN_DIR)
	$(NASM) $(BOOT_LOADER).asm $(NASM_OPTS) -o $@

.PHONY: clean
clean:
	rm -f $(BIN_DIR)/*.bin
