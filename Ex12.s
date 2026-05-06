.data
msg1: .asciiz "\nDigite a altura (cm): "
msg2: .asciiz "\nMenor altura: "
msg3: .asciiz "\nMaior altura: "

.text
main:

li $t0, 0        # i = 0

li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t1, $v0    # altura

move $t2, $t1    # menor
move $t3, $t1    # maior

addi $t0, $t0, 1

loop:
beq $t0, 15, fim

li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t1, $v0

# verificar menor
blt $t1, $t2, atualiza_menor

# verificar maior
bgt $t1, $t3, atualiza_maior

j continua

atualiza_menor:
move $t2, $t1
j continua

atualiza_maior:
move $t3, $t1

continua:
addi $t0, $t0, 1
j loop

fim:

li $v0, 4
la $a0, msg2
syscall

li $v0, 1
move $a0, $t2   # menor
syscall

li $v0, 4
la $a0, msg3
syscall

li $v0, 1
move $a0, $t3   # maior
syscall

li $v0, 10
syscall