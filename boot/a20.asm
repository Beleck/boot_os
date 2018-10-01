; This module has two purposes
;   - Check if A20 bit is enabled
;   - Enable it if not
; functions don't conserve regs states

a20_routine:
    call check_a20
    cmp ax, 0
    jne .done
    call enable_a20
.done:
    ret

; we will set different values in 0x0:0x5000 and 0xffff:0x5010 (1MB between)
; then check if the two different values are set in memory
check_a20:
    xor ax, ax
    mov es, ax

    not ax
    mov ds, ax          

    mov di, 0x5000
    mov si, 0x5010

    ; keep values in stack
    mov al, byte [es:di]
    push ax
    mov al, byte [ds:si]
    push ax

    mov byte [es:di], 0x00
    mov byte [ds:si], 0xff
    
    cmp byte [es:di], 0xff
    
    pop ax
    mov byte [ds:si], al
    pop ax
    mov byte [es:di], al
    
    mov ax, 0
    je .done
    
    mov ax, 1
.done:
    ret

enable_a20:
    in al, 0x92
    test al, 2
    jnz .done
    or al, 2
    and al, 0xfe
    out 0x92, al
.done:
    ret 
