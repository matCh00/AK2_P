.section .text


.global addition
addition:
    # prolog
    pushl %ebp
    movl %esp, %ebp

    # funkcja
    fldl 8(%ebp)
    fldl 16(%ebp)
    faddp

    #epilog
    movl %ebp, %esp
    popl %ebp
    ret


.global subtraction
subtraction:
    # prolog
    pushl %ebp
    movl %esp, %ebp

    # funkcja
    fldl 16(%ebp)
    fldl 8(%ebp)
    fsubp

    #epilog
    movl %ebp, %esp
    popl %ebp
    ret


.global multiplication
multiplication:
    # prolog
    pushl %ebp
    movl %esp, %ebp

    # funkcja
    fldl 8(%ebp)
    fldl 16(%ebp)
    fmulp

    #epilog
    movl %ebp, %esp
    popl %ebp
    ret


.global division
division:
    # prolog
    pushl %ebp
    movl %esp, %ebp

    # funkcja
    fldl 16(%ebp)
    fldl 8(%ebp)
    fdivp

    #epilog
    movl %ebp, %esp
    popl %ebp
    ret


.global square_root
square_root:
    # prolog
    pushl %ebp
    movl %esp, %ebp

    # funkcja
    fldl 8(%ebp)
    fsqrt

    #epilog
    movl %ebp, %esp
    popl %ebp
    ret


.global sinus
sinus:
    # prolog
    pushl %ebp
    movl %esp, %ebp

    # funkcja
    fldl 8(%ebp)
    fsin

    #epilog
    movl %ebp, %esp
    popl %ebp
    ret
