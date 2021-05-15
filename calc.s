.data
result: .ascii "Wynik: %f\n\0"
div_zero_msg: .ascii "Dzielenie przez zero\n\0"
error_msg: .ascii "Blad\n\0"
scanf_temp: .ascii "%f %f %c %c"
scanf_temp2: .ascii "%c"
round_cut: .short 0xC3F
round_up: .short 0x83F
round_down: .short 0x43F
round_nearest: .short 0x03F

.bss
.lcomm input1, 32
.lcomm input2, 32
.lcomm input3, 8
.lcomm input4, 8
.lcomm input5, 8

.text

.globl calc
.type calc, @function

calc:
pushl %ebp       # preserve previous frame pointer
movl %esp, %ebp  # set new frame pointer for function
#subl $10, %esp    # make space on stack for local variable
jmp start


start:
pushl $input4
pushl $input3
pushl $input1
pushl $input2
pushl $scanf_temp
call scanf

movl $input3, %eax
mov (%eax), %bl
cmpb $'+', %bl
je addition
cmpb $'-', %bl
je subtraction
cmpb $'*', %bl
je multiplication
cmpb $'/', %bl
je division
jmp error


addition:
fld input1      # load a float
fld input2      # load a float
faddp           # add 2 floats
jmp round


subtraction:
fld input1      # load a float
fld input2      # load a float
fsubp           # subtract 2 floats
jmp round


multiplication:
fld input1      # load a float
fld input2      # load a float
fmulp           # multiply 2 floats
jmp round


division:
fld input1      # load a float
ftst            # compare to 0
fnstsw %ax      # store float without checking error condition
fwait           # wait for float
sahf            # store ah into flags
jpe error
ja second_part
jb second_part
jz zero

second_part:
fld input2      # load a float
fdivp           # divide 2 floats
jmp round


round:
movl $input4, %eax   # input4
mov (%eax), %bl
cmpb $'c', %bl
je round_c
cmpb $'u', %bl
je round_u
cmpb $'d', %bl
je round_d
cmpb $'n', %bl
je round_n
jmp error


round_c:
fldcw round_cut      # load float to control word
jmp save

round_u:
fldcw round_up       # load float to control word
jmp save

round_d:
fldcw round_down     # load float to control word
jmp save

round_n:
fldcw round_nearest  # load float to control word
jmp save


save:
fstpl (%esp)    # store the value
pushl $result # push result
call printf   # and print it
pushl $0
jmp checking


checking:
pushl $input5
pushl $scanf_temp2
call scanf
movl $input5, %eax
mov (%eax), %bl
cmpb $'x', %bl
je end
jmp start

zero:
pushl $div_zero_msg   # dividing by 0 msg
call printf
jmp end

error:
pushl $error_msg   # error msg
call printf
jmp end


end:             # end of function
movl %ebp, %esp  # delocate local variables
pop %ebp         # restore previous frame pointer
ret
