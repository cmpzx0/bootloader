[bits 16]
[org 0x7C00]

start:
    mov ah, 0x0E
    mov al, 'L'
    int 0x10 ; bios Interrupt

    mov al, 'o'
    int 0x10

    mov al, 'a'
    int 0x10

    mov al, 'd'
    int 0x10

    mov al, 'i'
    int 0x10

    call load_kernel

    jmp $


load_kernel:
    mov ah, 0x02
    mov al, 1
    mov ch, 0
    mov cl, 2
    mov dh, 0
    mov dl, 0x80
    lea bx, [kernel]
    int 0x10

    jmp 0x1000:0x0000

kernel:
    times 510 - ($ - $$) db 0
dw 0xAA55
