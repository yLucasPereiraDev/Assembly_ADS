.data
msg1: .asciiz "\nDigite um numero entre (0-100) ou negativo para finalizar a seleção: "
msg2: .asciiz "\n[0-25]: "
msg3: .asciiz "\n[26-50]: "
msg4: .asciiz "\n[51-75]: "
msg5: .asciiz "\n[76-100]: "

.text
main:

li $t0, 0   # 0-25
li $t1, 0   # 26-50
li $t2, 0   # 51-75
li $t3, 0   # 76-100

loop:

li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t4, $v0

blt $t4, $zero, fim

blt $t4, 0, loop
bgt $t4, 100, loop

ble $t4, 25, faixa1
ble $t4, 50, faixa2
ble $t4, 75, faixa3
ble $t4, 100, faixa4

faixa1:
addi $t0, $t0, 1
j loop

faixa2:
addi $t1, $t1, 1
j loop

faixa3:
addi $t2, $t2, 1
j loop

faixa4:
addi $t3, $t3, 1
j loop

fim:

li $v0, 4
la $a0, msg2
syscall
li $v0, 1
move $a0, $t0
syscall

li $v0, 4
la $a0, msg3
syscall
li $v0, 1
move $a0, $t1
syscall

li $v0, 4
la $a0, msg4
syscall
li $v0, 1
move $a0, $t2
syscall

li $v0, 4
la $a0, msg5
syscall
li $v0, 1
move $a0, $t3
syscall

li $v0, 10
syscall