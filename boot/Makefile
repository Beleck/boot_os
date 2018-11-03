NASM=nasm
NASM_OPTS=-f bin
BIN_DIR=bin
BOOT_LOADER=bootloader
BOOT_IMG=boot
SRC=$(wildcard *.asm)
BINARIES=$(BIN_DIR)/$(addsuffix .bin,$(basename $(SRC)))

.PHONY: all
all: $(BIN_DIR)/$(BOOT_IMG).img

$(BIN_DIR)/$(BOOT_LOADER).bin: $(SRC)
	@mkdir -p $(BIN_DIR)
	$(NASM) $(BOOT_LOADER).asm $(NASM_OPTS) -o $@

$(BIN_DIR)/$(BOOT_IMG).img: $(BIN_DIR)/$(BOOT_LOADER).bin
	$(NASM) $(BOOT_IMG).asm $(NASM_OPTS) -o $@

.PHONY: clean
clean:
	rm -f $(BIN_DIR)/*.bin
