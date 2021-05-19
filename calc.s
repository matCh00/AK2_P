.data
round_cut: .short 0xC3F
round_up: .short 0x83F
round_down: .short 0x43F
round_nearest: .short 0x03F


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



.global power
power:
    # poczatek funkcji
    pushl %ebp
    movl %esp, %ebp

    # potegowanie - nie do koca dziala
    #fldl 16(%ebp)
    #frndint
    #fstcw (%eax)

    #fldl 8(%ebp)
    #jmp mul_l

    #mul_l:
    #fldl 8(%ebp)
    #fmulp
    #decl %eax
    #cmpl $0, %eax
    #jbe exi
    #jmp mul_l

    #exi:

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

    # rownanie kwadratowe
    #fld minusfour
    fldl 8(%ebp)
    fldl 24(%ebp)
    fmulp
    fmulp
    fldl 16(%ebp)
    fldl 16(%ebp)
    fmulp
    faddp
    ftst
    fstsw %ax
    sahf
    jb exit

    fsqrt


    exit:

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

    #koniec funkcji
    movl %ebp, %esp
    popl %ebp
    ret


round_u:
    fldcw round_up       # zaladowanie do slowa kontrolnego

    #koniec funkcji
    movl %ebp, %esp
    popl %ebp
    ret


round_d:
    fldcw round_down     # zaladowanie do slowa kontrolnego

    #koniec funkcji
    movl %ebp, %esp
    popl %ebp
    ret


round_n:
    fldcw round_nearest  # zaladowanie do slowa kontrolnego

    #koniec funkcji
    movl %ebp, %esp
    popl %ebp
    ret
