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
msg3: .ascii "sum: "
msg3_len = . - msg3


.section .bss
.comm res, 5
.comm num1, 5
.comm num2, 5


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


mov (num1), %eax
sub $'0', %eax
mov (num2), %ebx
sub $'0', %ebx
add %ebx, %eax
add $'0', %eax
mov %eax, (res)


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


mov $SYSEXIT32, %eax
mov $EXIT_SUCCESS, %ebx
int $SYSCALL32
