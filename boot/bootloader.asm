bits 16 ;real mode is in 16 bits
;org 0x7C00


start:
    mov ax, 0x7c0
    add ax, 0x20 ; bootloader size
    mov ss, ax
    mov sp, 4096

    mov ax, 0x7c0
    mov ds, ax

    call clear_screen
    call reset_cursor

    mov si, msg
    call print
    cli
    hlt

%include 'data.asm'
%include 'api.asm'

;fill 512 bytes with 0 and finish by magic numbers
times 510 - ($ - $$) db 0
dw 0xaa55
