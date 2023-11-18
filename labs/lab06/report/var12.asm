%include 'in_out.asm'

SECTION .data
stm: DB 'y = (8x - 6) / 2', 0
msg: DB 'Введите значение x: ', 0
res: DB 'Результат вычислений: ', 0

SECTION .bss
x: RESB 80

SECTION .text
GLOBAL _start
_start:

mov eax, stm
call sprintLF
mov eax, msg
call sprintLF

mov ecx, x
mov edx, 80
call sread

mov eax, x
call atoi

mov ebx, 8
mul ebx
sub eax, 6
xor edx, edx
mov ebx, 2
div ebx
mov edi, eax

mov eax, res
call sprint
mov eax, edi
call iprintLF

call quit
