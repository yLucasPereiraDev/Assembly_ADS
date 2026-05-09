.data
msg1: .asciiz "\nDigite o valor de A: "
msg2: .asciiz "\nDigite o valor de B: "
msg3: .asciiz "\nResultado (C): "

.text
main:

li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t0, $v0

li $v0, 4
la $a0, msg2
syscall

li $v0, 5
syscall
move $t1, $v0

beq $t0, $t1, soma

mul $t2, $t0, $t1
j fim

soma:
add $t2, $t0, $t1

fim:
li $v0, 4
la $a0, msg3
syscall

li $v0, 1
move $a0, $t2 
syscall

li $v0, 10
syscall