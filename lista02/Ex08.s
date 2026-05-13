.data
msg1: .asciiz "Digite o valor da compra (1000 a 9999): "
msg2: .asciiz "Digite o valor da parcela (100 a 500): "

msg3: .asciiz "Quantidade de parcelas: "

.text
main:

lerCompra:
li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t0, $v0       #Valor da compra

#Menor que 1000
li $t1, 1000
blt $t0, $t1, lerCompra

#Maior que 9999
li $t1, 9999
bgt $t0, $t1, lerCompra

lerParcela:
li $v0, 4
la $a0, msg2
syscall

li $v0, 5
syscall
move $t2, $v0       #Valor parcela

#Menor que 100
li $t1, 100
blt $t2, $t1, lerParcela

#Maior que 500
li $t1, 500
bgt $t2, $t1, lerParcela

div $t0, $t2
mflo $t3            #Quantidade base
mfhi $t4

#Se tiver resto -> +1 parcela
beq $t4, $zero, fimCalculo

addi $t3, $t3, 1

fimCalculo:
li $v0, 4
la $a0, msg3
syscall

li $v0, 1
move $a0, $t3
syscall

li $v0, 10
syscall