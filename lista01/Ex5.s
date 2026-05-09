.data
msg0: .asciiz "\nDigite o valor do primeiro cateto: "
msg1: .asciiz "\nDigite o valor do segundo cateto: "
msg2: .asciiz "\nO valor da hipotenusa �: "
msg3: .asciiz "\nNao eh quadrado perfeito."

.text
main:

# cateto A
li $v0, 4
la $a0, msg0
syscall

li $v0, 5
syscall
move $t0, $v0

# cateto B
li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t1, $v0

mul $t2, $t0, $t0   
mul $t3, $t1, $t1   
add $t4, $t2, $t3

move $t5, $t4

loop:
    blez $t5, nao_encontrou   # Branch if Less than or Equal to Zero

    mul $t6, $t5, $t5        

    beq $t6, $t4, encontrou   # raiz exata

    addi $t5, $t5, -1         # diminui
    j loop

encontrou:
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 1
    move $a0, $t5
    syscall

    j fim

# se não tiver quadrado perfeito
nao_encontrou:
    li $v0, 4
    la $a0, msg3
    syscall

fim:
    li $v0, 10
    syscall