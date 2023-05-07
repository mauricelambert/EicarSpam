global _start

section .text
    itoa:
        mov rax, r10
        mov rsi, filename+4
        mov byte [rsi], '0'             ; reset first digit to 0
        add rsi, 1
        mov byte [rsi], '0'             ; reset second digit to 0
        add rsi, 1
        mov byte [rsi], '0'             ; reset third (and last) digit to 0 (max value 300)
        mov rcx, 10                     ; divisiion by 10
._1:    xor rdx, rdx
        div rcx                         ; rax / rcx
        add dl, '0'                     ; remainder to ASCII digit
        mov byte [rsi], dl
        dec rsi                         ; postion -= 1
        test rax, rax                   ; if (rax != 0)
        jnz ._1                         ;     itoa._1()
        jmp endloop

    _start:
        mov rdi, eicarstring
._3:    mov al, byte [rdi]
        test al, al
        je ._2
        add al, 13
        mov byte [rdi], al
        add rdi, 1
        jmp ._3
._2:    mov r10, 300                    ; counter = 300
        push r10
    startloop:
        mov rax, 2                      ; 0x2 (2) == open
        mov rsi, 65                     ; second argument (mode): O_WRONLY (0o1) | O_CREAT (0o100) == 0o101 (65)
        mov rdi, filename               ; first argument (filename)
        xor rdx, rdx
        syscall
        mov r8, rax                     ; r8 = fd (file descriptor)
        mov rdx, 68                     ; third argument (data length to write) length(eicarstring) == 65
        mov rsi, eicarstring            ; second argument (pointer for data to write)
        mov rax, 1                      ; 0x1 (1) == write
        mov rdi, r8                     ; first argument: file descriptor
        syscall
        pop r10
        dec r10                         ; counter -= 1
        push r10
        jmp itoa
    endloop:
        test r10, r10                   ; if (counter != 0)
        jne startloop                   ;         startloop();

        mov rax, 3                      ; 0x3 (3) == close
        mov rdi, r8                     ; first argument: file descriptor
        syscall

        mov rax, 60                     ; 0x3c (60) == exit
        xor rdi, rdi                    ; exit code: 0
        syscall
        ret

section .data
    eicarstring db 75, 40, 66, 20, 67, 24, 51, 52, 67, 78, 39, 79, 67, 77, 75, 40, 39, 27, 67, 81, 28, 42, 54, 54, 28, 42, 112, 23, 56, 60, 54, 52, 69, 32, 70, 71, 52, 65, 55, 52, 69, 55, 32, 52, 65, 71, 60, 73, 60, 69, 72, 70, 32, 71, 56, 70, 71, 32, 57, 60, 63, 56, 20, 23, 59, 30, 59, 29, 0
    filename db 'file000.txt'
    len equ $-filename