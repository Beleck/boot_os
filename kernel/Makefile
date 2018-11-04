KERNEL=kernel
BIN_DIR=bin

.PHONY: all
all: $(BIN_DIR) $(BIN_DIR)/$(KERNEL).img

$(BIN_DIR)/$(KERNEL).img:
	cp $(KERNEL) $@

$(BIN_DIR):
	@mkdir -p $(BIN_DIR)/

.PHONY: clean
clean:
	rm -rf $(BIN_DIR)/
