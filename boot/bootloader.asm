bits 16 ;real mode is in 16 bits
org 0x7C00


start:
    cli

reset_cursor:
    mov ah, 0x02
    mov dh, 0
    mov dl, 0
    int 0x10

delete_screen:
    mov al, ' '
    mov ah, 0x0E
.erase int 0x10
    add bh, 1
    sub bh, 255
    jne .erase
    mov bh, 0
    add bl, 1
    sub bl, 3
    jne .erase

    mov ah, 0x02
    mov dh, 0
    mov dl, 0
    int 0x10

send_message:
    mov si, msg
    mov ah, 0x0E
.loop lodsb
    or al, al
    jz halt
    int 0x10
    jmp .loop

halt: hlt

msg: db "Next generation bootloader of the street say : welcome", 0

;fill 512 bytes with 0 and finish by magic numbers
times 510 - ($ - $$) db 0
dw 0xaa55
