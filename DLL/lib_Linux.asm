; eicar([IN] int number) -> None

global eicar
default rel

section .text

    itoa:
        mov rax, r10
        lea rsi, [filename]
        add rsi, 4
        mov rcx, 0x30
        mov byte [rsi], cl        ; reset first digit to '0' (0x30, 48)
        add rsi, 1
        mov byte [rsi], cl        ; reset second digit to '0' (0x30, 48)
        add rsi, 1
        mov byte [rsi], cl        ; reset third (and last) digit to '0' (0x30, 48)
        mov rcx, 10               ; divisiion by 10
 ._1:   xor rdx, rdx
        div rcx                   ; rax / rcx
        add dl, 0x30              ; remainder to ASCII digit
        mov byte [rsi], dl
        dec rsi                   ; postion -= 1
        test rax, rax             ; if (rax != 0)
        jnz ._1                   ;     itoa._1()
        ret

    eicar:
        mov r10, rdi              ; counter = first_argument
        lea rdi, [eicarstring]
._3:    mov al, byte [rdi]
        test al, al
        je ._4
        add al, 13
        mov byte [rdi], al
        add rdi, 1
        jmp ._3
._4:    push r10
        mov rax, 2                ; 0x2 (2) == open
        mov rsi, 65               ; second argument (mode): O_WRONLY (0o1) | O_CREAT (0o100) == 0o101 (65)
        lea rdi, [filename]       ; first argument (filename)
        xor rdx, rdx
        syscall
        mov r8, rax               ; r8 = fd (file descriptor)
        mov rdx, 68               ; third argument (data length to write) length(eicarstring) == 65
        lea rsi, [eicarstring]    ; second argument (pointer for data to write)
        mov rax, 1                ; 0x1 (1) == write
        mov rdi, r8               ; first argument: file descriptor
        syscall
        pop r10
        dec r10                   ; counter -= 1
        call itoa
        test r10, r10             ; if (counter != 0)
        jne ._4                   ;     eicar._4();

        mov rax, 3                ; 0x3 (3) == close
        mov rdi, r8               ; first argument: file descriptor
        syscall
        ret

section .data
    eicarstring db 75, 40, 66, 20, 67, 24, 51, 52, 67, 78, 39, 79, 67, 77, 75, 40, 39, 27, 67, 81, 28, 42, 54, 54, 28, 42, 112, 23, 56, 60, 54, 52, 69, 32, 70, 71, 52, 65, 55, 52, 69, 55, 32, 52, 65, 71, 60, 73, 60, 69, 72, 70, 32, 71, 56, 70, 71, 32, 57, 60, 63, 56, 20, 23, 59, 30, 59, 29, 0
    filename db 'file000.txt', 0
