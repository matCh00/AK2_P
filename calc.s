.data
round_cut: .short 0xC3F
round_up: .short 0x83F
round_down: .short 0x43F
round_nearest: .short 0x03F


.bss
.comm counter, 8

.text


.global addition
addition:
    # poczatek funkcji
    pushl %ebp
    movl %esp, %ebp

    # dodawanie
    finit
    fldl 8(%ebp)
    fldl 16(%ebp)
    faddp  # dodawanie - wynik w st(0)

    # wybranie zaokraglenia
    cmpl $1, 24(%ebp)
    je round_c
    cmpl $2, 24(%ebp)
    je round_u
    cmpl $3, 24(%ebp)
    je round_d
    cmpl $4, 24(%ebp)
    je round_n



.global subtraction
subtraction:
    # poczatek funkcji
    pushl %ebp
    movl %esp, %ebp

    # odejmowanie
    finit
    fldl 16(%ebp)
    fldl 8(%ebp)
    fsubp  # odejmowanie - wynik w st(0)

    # wybranie zaokraglenia
    cmpl $1, 24(%ebp)
    je round_c
    cmpl $2, 24(%ebp)
    je round_u
    cmpl $3, 24(%ebp)
    je round_d
    cmpl $4, 24(%ebp)
    je round_n



.global multiplication
multiplication:
    # poczatek funkcji
    pushl %ebp
    movl %esp, %ebp

    # mnozenie
    finit
    fldl 8(%ebp)
    fldl 16(%ebp)
    fmulp  # mnozenie - wynik w st(0)

    # wybranie zaokraglenia
    cmpl $1, 24(%ebp)
    je round_c
    cmpl $2, 24(%ebp)
    je round_u
    cmpl $3, 24(%ebp)
    je round_d
    cmpl $4, 24(%ebp)
    je round_n



.global division
division:
    # poczatek funkcji
    pushl %ebp
    movl %esp, %ebp

    # dzielenie
    finit
    fldl 16(%ebp)
    fldl 8(%ebp)
    fdivp  # dzielenie - wynik w st(0)

    # wybranie zaokraglenia
    cmpl $1, 24(%ebp)
    je round_c
    cmpl $2, 24(%ebp)
    je round_u
    cmpl $3, 24(%ebp)
    je round_d
    cmpl $4, 24(%ebp)
    je round_n



.global square_root
square_root:
    # poczatek funkcji
    pushl %ebp
    movl %esp, %ebp

    # pierwiastek
    finit
    fldl 8(%ebp)
    fsqrt  # pierwiastek - wynik w st(0)

    # wybranie zaokraglenia
    cmpl $1, 16(%ebp)
    je round_c
    cmpl $2, 16(%ebp)
    je round_u
    cmpl $3, 16(%ebp)
    je round_d
    cmpl $4, 16(%ebp)
    je round_n



.global sinus
sinus:
    # poczatek funkcji
    pushl %ebp
    movl %esp, %ebp

    # sinus
    finit
    fldl 8(%ebp)
    fsin  # sinus - wynik w st(0)

    # wybranie zaokraglenia
    cmpl $1, 16(%ebp)
    je round_c
    cmpl $2, 16(%ebp)
    je round_u
    cmpl $3, 16(%ebp)
    je round_d
    cmpl $4, 16(%ebp)
    je round_n



.global cosinus
cosinus:
    # poczatek funkcji
    pushl %ebp
    movl %esp, %ebp

    # cosinus
    finit
    fldl 8(%ebp)
    fcos  # cosinus - wynik w st(0)

    # wybranie zaokraglenia
    cmpl $1, 16(%ebp)
    je round_c
    cmpl $2, 16(%ebp)
    je round_u
    cmpl $3, 16(%ebp)
    je round_d
    cmpl $4, 16(%ebp)
    je round_n



.global tangens
tangens:
    # poczatek funkcji
    pushl %ebp
    movl %esp, %ebp

    # tangens
    finit
    fldl 8(%ebp)
    fptan  # mnozenie - wynik w st(0)
    fstp %ST

    # wybranie zaokraglenia
    cmpl $1, 16(%ebp)
    je round_c
    cmpl $2, 16(%ebp)
    je round_u
    cmpl $3, 16(%ebp)
    je round_d
    cmpl $4, 16(%ebp)
    je round_n



.global cotangens
cotangens:
    # poczatek funkcji
    pushl %ebp
    movl %esp, %ebp

    # cotangens
    finit
    fldl 8(%ebp)
    fptan  # tangens - wynik w st(1) i 1 w st(0)
    fdivp  # podzielenie 1 przez tangens = cotangens

    # wybranie zaokraglenia
    cmpl $1, 16(%ebp)
    je round_c
    cmpl $2, 16(%ebp)
    je round_u
    cmpl $3, 16(%ebp)
    je round_d
    cmpl $4, 16(%ebp)
    je round_n



.global power
power:
    # poczatek funkcji
    pushl %ebp
    movl %esp, %ebp

    # potegowanie
    finit
    fldl 8(%ebp)
    fldl 8(%ebp)
    fldl 8(%ebp)
    fldl 16(%ebp)
    fistp counter  # zapisz st(0) w zmiennej counter
    subl $0x00, counter
    subl $0x01, counter

    lp:
    fmulp   # mnozenie - wynik w st(0)
    subl $0x01, counter  # dekrementacja licznika
    jz ext
    fldl 8(%ebp)
    jmp lp

    ext:

    # wybranie zaokraglenia
    cmpl $1, 24(%ebp)
    je round_c
    cmpl $2, 24(%ebp)
    je round_u
    cmpl $3, 24(%ebp)
    je round_d
    cmpl $4, 24(%ebp)
    je round_n


.global fibonacci
fibonacci:
    # poczatek funkcji
    push %ebp
    mov %esp, %ebp
    push %ebx

    # fibonacci
    cmpl $0, 8(%ebp)   # sprawdzenie czy to nie pierwszy wyraz cigu
    je zero_f

    cmpl $1, 8(%ebp)   # sprawdzenie czy to nie drugi wyraz cigu
    je one_f

    movl 8(%ebp), %edx
    dec %edx
    push %edx
    call fibonacci   # rekurencja
    pop %edx
    mov %eax, %ebx

    dec %edx
    push %edx
    call fibonacci   # rekurencja
    add $4, %esp
    add %ebx, %eax
    jmp exit_f

    # pierwsza liczba ciagu
    zero_f:
    mov $0, %eax
    jmp exit_f

    # druga liczba ciagu
    one_f:
    mov $1, %eax

    # koniec funkcji
    exit_f:
    pop %ebx
    pop %ebp
    ret




round_c:
    fldcw round_cut      # zaladowanie do slowa kontrolnego

    # koniec funkcji
    movl %ebp, %esp
    popl %ebp
    ret


round_u:
    fldcw round_up       # zaladowanie do slowa kontrolnego

    # koniec funkcji
    movl %ebp, %esp
    popl %ebp
    ret


round_d:
    fldcw round_down     # zaladowanie do slowa kontrolnego

    # koniec funkcji
    movl %ebp, %esp
    popl %ebp
    ret


round_n:
    fldcw round_nearest  # zaladowanie do slowa kontrolnego

    # koniec funkcji
    movl %ebp, %esp
    popl %ebp
    ret
