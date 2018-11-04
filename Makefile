BOOT=boot
KERNEL=kernel
BIN_DIR=bin
IMG=$(BIN_DIR)/disk.img
BOOT_IMG=$(BOOT)/bin/boot.img
KERNEL_IMG=$(KERNEL)/bin/kernel.img

MAKE_OPTS=--no-print-directory

QEMU=qemu-system-x86_64
QEMU_OPTS=-drive format=raw,file=$(IMG) 

.PHONY: all
all: $(BIN_DIR) $(BOOT) $(KERNEL) $(IMG)

$(IMG): $(BOOT_IMG) $(KERNEL_IMG)
	cat $^ > $(IMG)

.PHONY: $(BOOT)
$(BOOT):
	@$(MAKE) $(MAKE_OPTS) all -C $(BOOT)/

.PHONY: $(KERNEL)
$(KERNEL):
	@$(MAKE) $(MAKE_OPTS) all -C $(KERNEL)/

.PHONY: run
run: all
	$(QEMU) $(QEMU_OPTS)

$(BIN_DIR): 
	@mkdir -p $(BIN_DIR)

.PHONY: clean
clean:
	rm -rf bin/
	@$(MAKE) $(MAKE_OPTS) clean -C $(BOOT)/
	@$(MAKE) $(MAKE_OPTS) clean -C $(KERNEL)/
