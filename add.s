
.global addition

addition:
fld input1      # load a float
fld input2      # load a float
faddp           # add 2 floats
jmp round
