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
    fldl 8(%ebp)
    fldl 16(%ebp)
    faddp

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
    fldl 16(%ebp)
    fldl 8(%ebp)
    fsubp

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
    fldl 8(%ebp)
    fldl 16(%ebp)
    fmulp

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
    fldl 16(%ebp)
    fldl 8(%ebp)
    fdivp

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
    fldl 8(%ebp)
    fsqrt

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
    fldl 8(%ebp)
    fsin

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
    fldl 8(%ebp)
    fcos

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
    fldl 8(%ebp)
    fptan
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
    fldl 8(%ebp)
    fptan
    fdivp

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
    fldl 8(%ebp)
    fldl 8(%ebp)
    fldl 8(%ebp)
    fldl 16(%ebp)
    fistp counter
    subl $0x00, counter
    subl $0x01, counter

    lp:
    fmulp
    subl $0x01, counter
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



.global quadratic_equation
quadratic_equation:
    # poczatek funkcji
    pushl %ebp
    movl %esp, %ebp

    # proba wywolania istniejacych funkcji - niepowodzenie
    fldl 8(%ebp)
    fldl 16(%ebp)
    fldl 24(%ebp)
    call addition

    # wybranie zaokraglenia
    cmpl $1, 32(%ebp)
    je round_c
    cmpl $2, 32(%ebp)
    je round_u
    cmpl $3, 32(%ebp)
    je round_d
    cmpl $4, 32(%ebp)
    je round_n



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
