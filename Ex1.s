.data
msg1: .asciiz "Digite a largura: "
msg2: .asciiz "Digite o comprimento: "
msg3: .asciiz "Area: "

.text
main:

li $v0, 4
la $a0, msg1
syscall

# ler largura
li $v0, 5
syscall
move $t0, $v0

li $v0, 4
la $a0, msg2
syscall

# ler comprimento
li $v0, 5
syscall
move $t1, $v0

# calcular
mul $t2, $t0, $t1

li $v0, 4
la $a0, msg3
syscall

li $v0, 1
move $a0, $t2
syscall

# código 10 do $v0 que encerra o programa
li $v0, 10
syscall