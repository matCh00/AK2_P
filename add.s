SYSEXIT32 = 1
SYSCALL32 = 0x80
SYSREAD = 3
SYSWRITE = 4
STDIN = 0
STDOUT = 1
EXIT_SUCCESS = 0

LENGTH = 200

.global _start


.data
echo: .space LENGTH
echo_len = . - echo
echo2: .space LENGTH
echo2_len = . - echo2


.text
msg: .ascii "enter a: "
msg_len = . - msg
msg2: .ascii "enter b: "
msg2_len = . - msg2
msg3: .ascii "a + b: "
msg3_len = . - msg3


_start:
/* pierwszy komunikat */
mov $SYSWRITE, %eax
mov $STDOUT, %ebx
mov $msg, %ecx
mov $msg_len, %edx
int $SYSCALL32

/* wpisz pierwszą liczbę */
mov $SYSREAD, %eax
mov $STDIN, %ebx
mov $echo, %ecx
mov $echo_len, %edx
int $SYSCALL32

/* drugi komunikat */
mov $SYSWRITE, %eax
mov $STDOUT, %ebx
mov $msg2, %ecx
mov $msg2_len, %edx
int $SYSCALL32

/* wpisz drugą liczbę */
mov $SYSREAD, %eax
mov $STDIN, %ebx
mov $echo2, %ecx
mov $echo2_len, %edx
int $SYSCALL32





/* końcowy komunikat */
mov $SYSWRITE, %eax
mov $STDOUT, %ebx
mov $msg3, %ecx
mov $msg3_len, %edx
int $SYSCALL32


/* koniec programu */
mov $SYSEXIT32, %eax
mov $EXIT_SUCCESS, %ebx
int $SYSCALL32
