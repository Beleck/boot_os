%include 'header.asm'

bits 16
org 0x0000

;boot sector
incbin 'bin/bootloader.bin'

%include 'FS_info_sector.asm'

;5 reserved sectors
times 0x0200 * 0x6 - ($ - $$) db 0

;backup boot sector
incbin 'bin/bootloader.bin'

;reserved sectors
times BYTES_PER_SECTOR * RESERVED_SECTORS - ($ - $$) db 0

;File Allocation table
dd 0x0ffffff8
dd 0x0fffffff
dd 0x0ffffff8
