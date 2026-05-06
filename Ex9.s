.data
msg1: .asciiz "\nDigite o primeiro numero: "
msg2: .asciiz "\nDigite o segundo numero (nao pode ser 0): "
msg3: .asciiz "\nResultado da divisao: "

.text
main:

li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t0, $v0   

lerB:
li $v0, 4
la $a0, msg2
syscall

li $v0, 5
syscall
move $t1, $v0

beq $t1, $zero, lerB   # se B == 0, pede de novo

div $t0, $t1
mflo $t2

li $v0, 4
la $a0, msg3
syscall

li $v0, 1
move $a0, $t2
syscall

li $v0, 10
syscall