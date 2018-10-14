bits 16 ;real mode is in 16 bits
org 0x0000

%include 'FAT32.asm'

start:
    cli
    mov ax, 0x7c0
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ax, 0x0000
    mov ss, ax
    mov sp, 0xffff

    call clear_screen
    call reset_cursor

    mov si, msg
    call print
    call a20_routine
    hlt

%include 'data.asm'
%include 'api.asm'
%include 'a20.asm'


;fill 512 bytes with 0 and finish by magic numbers
times 510 - ($ - $$) db 0
dw 0xaa55
