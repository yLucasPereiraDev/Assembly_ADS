.data
msg1: .asciiz "Digite um numero entre 100 e 999: "

msg2: .asciiz "\nCENTENA = "
msg3: .asciiz "\nDEZENA = "
msg4: .asciiz "\nUNIDADE = "

.text
main:

ler:
li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t0, $v0

#Se numero for menor que 100 -> pede novamente
li $t1, 100
blt $t0, $t1, ler

#Se numero for maior que 999 -> pede novamente
li $t1, 999
bgt $t0, $t1, ler

li $t1, 100
div $t0, $t1
mflo $t2            #Centena
mfhi $t3

li $t1, 10
div $t3, $t1
mflo $t4            #Dezena
mfhi $t5            #Unidade

li $v0, 4
la $a0, msg2
syscall

li $v0, 1
move $a0, $t2
syscall

li $v0, 4
la $a0, msg3
syscall

li $v0, 1
move $a0, $t4
syscall

li $v0, 4
la $a0, msg4
syscall

li $v0, 1
move $a0, $t5
syscall

li $v0, 10
syscall