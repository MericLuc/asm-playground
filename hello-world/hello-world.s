; ************************************************************
;  Code section

section .text
    global _start

_start:

    mov rax, SYS_WRITE          ; write(
    mov rdi, STDOUT_FILENO      ;   STDOUT_FILENO,
    mov rsi, msg                ;   msg,
    mov rdx, msglen             ;   sizeof(msg)
    syscall                     ; );

    mov rax, SYS_EXIT           ; exit(
    mov rdi, EXIT_SUCCESS       ;   EXIT_SUCCESS
    syscall                     ; );

; ************************************************************
; Data section

section   .data

; ----------
; Constants 

EXIT_SUCCESS    equ      0    ; successful operation
SYS_WRITE       equ      1    ; call code for write
SYS_EXIT        equ     60    ; call code for terminate
STDOUT_FILENO   equ      1    ; fd for STDOUT_FILENO

; ----------
; Strings

msg: db "Hello world!",0x0A   ; "Hello world!\n"
msglen: equ $ - msg
