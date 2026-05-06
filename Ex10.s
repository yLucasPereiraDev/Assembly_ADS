.data
msg1: .asciiz "\nDigite o primeiro numero: "
msg2: .asciiz "\nDigite o segundo numero: "
msg3: .asciiz "\nResto da divisao: "

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

# se A < B, troca
blt $t0, $t1, troca
j continua

troca:
move $t2, $t0
move $t0, $t1
move $t1, $t2

continua:

div $t0, $t1
mflo $t3

mul $t4, $t3, $t1

sub $t5, $t0, $t4

li $v0, 4
la $a0, msg3
syscall

li $v0, 1
move $a0, $t5
syscall

li $v0, 10
syscall