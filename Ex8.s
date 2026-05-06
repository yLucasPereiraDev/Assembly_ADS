.data
msg1: .asciiz "\nDigite um numero: "
msg2: .asciiz "\nResultado: "

.text
main:

li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t0, $v0 

blt $t0, $zero, negativo   # se < 0 = negativo

mul $t1, $t0, 2
j fim

negativo:
mul $t1, $t0, 3

fim:
li $v0, 4
la $a0, msg2
syscall

li $v0, 1
move $a0, $t1
syscall

li $v0, 10
syscall