.data
msg1: .asciiz "Digite o salario atual: "
msg2: .asciiz "Novo salario: "

.text
main:

li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t0, $v0       #Salario atual

#Aumento = (salario * 25) / 100
li $t1, 25
mul $t2, $t0, $t1

li $t3, 100
div $t2, $t3
mflo $t4

#Novo salario
add $t5, $t0, $t4

li $v0, 4
la $a0, msg2
syscall

li $v0, 1
move $a0, $t5
syscall

li $v0, 10
syscall