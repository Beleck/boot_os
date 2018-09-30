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

print:
    mov ah, 0x0E
.print_char: 
    lodsb
    cmp al, 0
    je .done
    int 0x10
    jmp .print_char
.done:
    ret

reset_cursor:
    mov ah, 0x02
    mov bh, 0
    mov dh, 0
    mov dl, 0
    int 0x10
    ret

clear_screen:
    call reset_cursor
    mov al, ' '
    mov ah, 0x0e
    mov bh, 0
    mov ch, 0
.erase:
    int 0x10
    add bh, 1
    cmp bh, 255
    jne .erase
    add ch, 1
    cmp ch, 4
    jne .erase
    ret

msg: db "Booting from boot_os...", 0

;fill 512 bytes with 0 and finish by magic numbers
times 510 - ($ - $$) db 0
dw 0xaa55
