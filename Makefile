BOOT=boot
IMG=$(BOOT)/bin/bootloader.bin

MAKE_OPTS=--no-print-directory

QEMU=qemu-system-x86_64
QEMU_OPTS=-drive format=raw,file=$(IMG) 

.PHONY: all
all: boot

.PHONY: boot
boot:
	@$(MAKE) $(MAKE_OPTS) all -C boot/

.PHONY: run
run: all
	$(QEMU) $(QEMU_OPTS)

.PHONY: clean
clean:
	@$(MAKE) $(MAKE_OPTS) clean -C boot/
