bits 16
org 0x7C00


start:
    cli
    mov si, msg
    mov ah, 0x0E
.loop lodsb
    or al, al
    jz halt
    int 0x10
    jmp .loop

halt: hlt

msg: db "Hello World!", 0

;fill 512 bytes with 0 and finish by magic numbers
times 510 - ($ - $$) db 0
dw 0xaa55
