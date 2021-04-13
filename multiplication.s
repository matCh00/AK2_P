SYSEXIT32 = 1
SYSCALL32 = 0x80
SYSREAD = 3
SYSWRITE = 4
STDIN = 0
STDOUT = 1
EXIT_SUCCESS = 0


.section .data
msg1: .ascii "num1: "
msg1_len = . - msg1
msg2: .ascii "num2: "
msg2_len = . - msg2
msg3: .ascii "mul: "
msg3_len = . - msg3
endl: .byte 13, 10


.section .bss
num1: .space 8
num2: .space 8
res: .space 8


.section .text


.global _start


_start:
mov $SYSWRITE, %eax
mov $STDOUT, %ebx
mov $msg1, %ecx
mov $msg1_len, %edx
int $SYSCALL32

mov $SYSREAD, %eax
mov $STDIN, %ebx
mov $num1, %ecx
mov $5, %edx
int $SYSCALL32

mov $SYSWRITE, %eax
mov $STDOUT, %ebx
mov $msg2, %ecx
mov $msg2_len, %edx
int $SYSCALL32

mov $SYSREAD, %eax
mov $STDIN, %ebx
mov $num2, %ecx
mov $5, %edx
int $SYSCALL32


/* multiplication */
mov $0, %ebx /*iterator dużej pętli*/

mult_b:
cmpl $5, %ebx /*liczba cyfr num1*/
jz end_b
mov $0, %ecx
mov $0, %esi

mult_s:
mov $0, %edi
cmpl $5, %ecx /*liczba cyfr num2*/
jz end_s
mov num1(,%ebx,1), %eax
mov num2(,%ecx,1), %edx
mul %edx  /*założenie że 2 argument jest w eax*/
addl %ebx, %ecx
addl res(,%ecx,1), %eax

mov %eax, res(,%ecx,1)
incl %ecx
adcl res(,%ecx,1), %edx
adcl $0, %edi
adcl %esi, %edx
adcl $0, %edi
mov %edi, %esi
mov %edx, res(,%ecx,1)
sub %ebx, %ecx
jmp mult_s

end_s:
incl %ebx
jmp mult_b

end_b:

mov $SYSWRITE, %eax
mov $STDOUT, %ebx
mov $msg3, %ecx
mov $msg3_len, %edx
int $SYSCALL32

mov $SYSWRITE, %eax
mov $STDOUT, %ebx
mov $res, %ecx
mov $5, %edx
int $SYSCALL32

mov $SYSWRITE, %eax
mov $STDOUT, %ebx
mov $endl, %ecx
int $SYSCALL32

mov $SYSEXIT32, %eax
mov $EXIT_SUCCESS, %ebx
int $SYSCALL32