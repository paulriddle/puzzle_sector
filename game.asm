[org 0x7c00]  ; start writing code in the boot sector

mov ax, 0x0   ; set video mode
int 0x10      ; think of it as function call interruput(ax)

mov bx, HELLO_MSG
call print_string

mov bx, GOODBYE_MSG
call print_string

jmp $         ; jump forever

print_string:
  push bx
  mov ah, 0xe ; BIOS tele-type output, every call to
              ; int 0x10 will print char in ax
  loop:
    mov al, [bx]  ; load char
    test al, al
    jz break      ; break if al == 0
    int 0x10
    add bx, 1
    jmp loop
  break:
    pop bx
    ret

; Data, two null-terminated ASCII strings
HELLO_MSG:
  db 'Hello, World!', 0
GOODBYE_MSG:
  db 'Goodbye', 0

; Padding and magic number
times 510 - ($-$$) db 0
dw 0xaa55
