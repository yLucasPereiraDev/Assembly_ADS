.data
msg1: .asciiz "\nDigite a base maior: "
msg2: .asciiz "\nDigite a base menor: "
msg3: .asciiz "\nDigite a altura: "
msg4: .asciiz "\nArea do trapezio: "

.text
main:

# base maior
li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t0, $v0

# base menor
li $v0, 4
la $a0, msg2
syscall

li $v0, 5
syscall
move $t1, $v0

# altura
li $v0, 4
la $a0, msg3
syscall

li $v0, 5
syscall
move $t2, $v0

add $t3, $t0, $t1
mul $t3, $t3, $t2

li $t4, 2
div $t3, $t4
mflo $t5

li $v0, 4
la $a0, msg4
syscall

li $v0, 1
move $a0, $t5
syscall

li $v0, 10
syscall