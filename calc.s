.data
round_cut: .short 0xC3F
round_up: .short 0x83F
round_down: .short 0x43F
round_nearest: .short 0x03F

one: .int 1
two: .int 2
n: .int 1
k: .int 2
b: .int 1
a: .float 2
wynik: .double 0
range: .float 0
halfRange: .float 0
currentValue: .float 0
functionValue: .float 0
finalValue: .float 0

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



.global integral
integral:
    # poczatek funkcji
    pushl %ebp
    movl %esp, %ebp
    push %ebx

    # integral
    finit
  	flds a
  	filds b
	  fsub %st, %st(1)
  	fxch %st(1)
	  fidiv k
  	fstps range
  	flds range
  	fidiv two
  	fstps halfRange
  	fstp %st(0)

  	flds a
  	flds halfRange
  	fadd %st(1), %st(0)
  	fstps a
  	fstp %st(0)
  	mov $0, %edi

    loop:
  	jmp value

    cont:
  	jmp function

    cont1:
	  flds functionValue
	  fmul range
  	flds finalValue
  	fadd %st(0), %st(1)
  	fxch %st(1)
  	fstps finalValue
  	fstp %st(0)
  	inc %edi
  	cmp k, %edi
	  jl loop
	  jmp koniec

    value:
  	mov %edi, n
  	filds n
  	flds range
  	fxch %st(1)
  	fmul %st(0), %st(1)
  	fstp %st(0)
  	flds a
  	fadd %st, %st(1)
  	fxch %st(1)
  	fstps currentValue
  	fstp %st(0)
  	jmp cont

    function:
  	filds two
  	flds currentValue
  	fmul %st(0), %st(0)
  	fsub %st(0), %st(1)
  	fxch %st(1)
  	fstps functionValue
  	fstp %st(0)
	  jmp cont1

    koniec:
	  flds finalValue

    # wybranie zaokraglenia
    cmpl $1, 24(%ebp)
    je round_c
    cmpl $2, 24(%ebp)
    je round_u
    cmpl $3, 24(%ebp)
    je round_d
    cmpl $4, 24(%ebp)
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
